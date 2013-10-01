package Regru::API::Service;

# ABSTRACT: REG.API v2 "service" category

use strict;
use warnings;
use Moo;
use namespace::autoclean;

our $VERSION = '0.003'; # VERSION
our $AUTHORITY = 'cpan:IMAGO'; # AUTHORITY

with 'Regru::API::Role::Client';

has '+namespace' => (
    default => sub { 'service' },
);

sub available_methods {[qw(
    nop
    get_prices
    get_servtype_details
    create
    delete
    get_info
    get_list
    get_folders
    get_details
    service_get_details
    get_dedicated_server_list
    update
    renew
    get_bills
    set_autorenew_flag
    suspend
    resume
    get_depreciated_period
    upgrade partcontrol_grant
    partcontrol_revoke
    resend_mail
)]}

__PACKAGE__->namespace_methods;
__PACKAGE__->meta->make_immutable;

1; # End of Regru::API::Service

__END__

=pod

=encoding utf-8

=head1 NAME

Regru::API::Service - REG.API v2 "service" category

=head1 VERSION

version 0.003

=head1 DESCRIPTION

REG.API service category... (to be described)

=head1 ATTRIBUTES

=head2 namespace

...

=head1 METHODS

=head2 nop

...

=head2 get_prices

...

=head2 get_servtype_details

...

=head2 create

...

=head2 delete

...

=head2 get_info

...

=head2 get_list

...

=head2 get_folders

...

=head2 get_details

...

=head2 service_get_details

...

=head2 get_dedicated_server_list

...

=head2 update

...

=head2 renew

...

=head2 get_bills

...

=head2 set_autorenew_flag

...

=head2 suspend

...

=head2 resume

...

=head2 get_depreciated_period

...

=head2 upgrade partcontrol_grant

...

=head2 partcontrol_revoke

...

=head2 resend_mail

...

=head1 SEE ALSO

L<Regru::API>

L<Regru::API::Role::Client>

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
