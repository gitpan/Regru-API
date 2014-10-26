package Regru::API::Response;

# ABSTRACT: REG.API v2 response wrapper

use strict;
use warnings;
use Moo;
use Try::Tiny;
use Carp ();
use namespace::autoclean;

our $VERSION = '0.003'; # VERSION
our $AUTHORITY = 'cpan:IMAGO'; # AUTHORITY

with 'Regru::API::Role::Serializer';

has error_code      => ( is => 'rw' );
has error_text      => ( is => 'rw' );
has error_params    => ( is => 'rw' );
has is_success      => ( is => 'rw' );
has is_service_fail => ( is => 'rw' );

has answer => (
    is      => 'rw',
    default => sub { +{} }
);

has response => (
    is      => 'rw',
    trigger => 1,
);

sub _trigger_response {
    my ($self, $response) = @_;

    if ($response) {
        try {
            die 'Invalid response' unless ref $response eq 'HTTP::Response';

            $self->is_service_fail($response->code == 200 ? 0 : 1);

            if ($self->is_service_fail) {
                # Stop processing response
                $self->is_success(0);
                die 'Service failed: ' . ($response->decoded_content || $response->content);
            }

            my $decoded = $self->serializer->decode($response->decoded_content || $response->content);
            $self->is_success($decoded->{result} && $decoded->{result} eq 'success');

            if ($self->is_success) {
                $self->answer($decoded->{answer});
            }
            else {
                foreach my $attr (qw/error_code error_text error_params/) {
                    $self->$attr($decoded->{$attr});
                }
            }
        }
        catch {
            Carp::carp 'Error: ' . $_;
            $self->error_code('API_FAIL');
            $self->error_text('API response error');
        };
    }
}

sub get {
    my ($self, $attr) = @_;

    return $self->answer->{$attr};
}

1; # End of Regru::API::Response

__END__

=pod

=encoding utf-8

=head1 NAME

Regru::API::Response - REG.API v2 response wrapper

=head1 VERSION

version 0.003

=head1 ATTRIBUTES

=head2 is_service_fail

Flag to show whether or not the most last answer from the API service has not been finished with code I<HTTP 200>.

    $resp = $client->bill->nop(bill_id => 123213);

    if ($resp->is_success) {
        print "It works!";
    }
    elsif ($resp->is_service_fail) {
        print "Reg.ru API is gone :(";
    }
    else {
        print "Error code: ". $resp->error_code;
    }

=head2 is_success

Flag to show whether or not the most last API request has been successful.

See example for L<#is_service_fail>.

=head2 response

Contains a L<HTTP::Response> object for the most last API request.

    if ($resp->is_service_fail) {
        print "HTTP code: " . $resp->response->code;
    }

=head2 answer

Contains decoded answer for the most last successful API request.

    if ($resp->is_success) {
        print Dumper($resp->answer);
    }

This is useful for debugging;

=head2 error_code

Contains error code for the most last API request if it has not been successful.

Full list error codes list is available at
L<REG.API Common error codes|https://www.reg.com/support/help/API-version2#std_error_codes>.

=head2 error_text

Contains common error text for the most last API request if it has not been successful.

Default language is B<enlish>. Language can be changed by passing option C<lang> to the
L<Regru::API> constructor.

=head2 error_params

Contains additional parameters included into the common error text.

    $error_params = $resp->error_params;
    print "Details: " . $error_params->{error_detail};

=head1 METHODS

=head2 get

Gets a value from stored in answer.

    $resp = $client->user->get_statistics;
    print "Account balance: " . $resp->get("balance_total");

=head1 SEE ALSO

L<Regru::API>

L<Regru::API::Role::Serializer>

L<HTTP::Response>

L<REG.API Common error codes|https://www.reg.com/support/help/API-version2#std_error_codes>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
https://github.com/regru/regru-api-perl/issues

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHORS

=over 4

=item *

Polina Shubina <shubina@reg.ru>

=item *

Anton Gerasimov <a.gerasimov@reg.ru>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by REG.RU LLC.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
