package Regru::API::Zone;

# ABSTRACT: REG.API v2 "zone" category

use strict;
use warnings;
use Moo;
use namespace::autoclean;

our $VERSION = '0.003'; # VERSION
our $AUTHORITY = 'cpan:IMAGO'; # AUTHORITY

with 'Regru::API::Role::Client';

has '+namespace' => (
    default => sub { 'zone' },
);

sub available_methods {[qw(
    nop
    add_alias
    add_aaaa
    add_cname
    add_mx
    add_ns
    add_txt
    add_srv
    get_resource_records
    update_records
    update_soa
    tune_forwarding
    clear_forwarding
    tune_parking
    clear_parking
    remove_record
    clear
)]}

__PACKAGE__->namespace_methods;
__PACKAGE__->meta->make_immutable;

1; # End of Regru::API::Zone

__END__

=pod

=encoding utf-8

=head1 NAME

Regru::API::Zone - REG.API v2 "zone" category

=head1 VERSION

version 0.003

=head1 DESCRIPTION

REG.API zone category... (to be described)

=head1 ATTRIBUTES

=head2 namespace

...

=head1 METHODS

=head2 nop

...

=head2 add_alias

...

=head2 add_aaaa

...

=head2 add_cname

...

=head2 add_mx

...

=head2 add_ns

...

=head2 add_txt

...

=head2 add_srv

...

=head2 get_resource_records

...

=head2 update_records

...

=head2 update_soa

...

=head2 tune_forwarding

...

=head2 clear_forwarding

...

=head2 tune_parking

...

=head2 clear_parking

...

=head2 remove_record

...

=head2 clear

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
