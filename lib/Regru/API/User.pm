package Regru::API::User;

# ABSTRACT: REG.API v2 "user" category

use strict;
use warnings;
use Moo;
use namespace::autoclean;

our $VERSION = '0.004'; # VERSION
our $AUTHORITY = 'cpan:IMAGO'; # AUTHORITY

with 'Regru::API::Role::Client';

has '+namespace' => (
    default => sub { 'user' },
);

sub available_methods {[qw(
    nop
    create
    get_statistics
    get_balance
    refill_balance
)]}

__PACKAGE__->namespace_methods;
__PACKAGE__->meta->make_immutable;

1; # End of Regru::API::User

__END__

=pod

=encoding utf-8

=head1 NAME

Regru::API::User - REG.API v2 "user" category

=head1 VERSION

version 0.004

=head1 DESCRIPTION

REG.API user category... (to be described)

=head1 ATTRIBUTES

=head2 namespace

...

=head1 REG.API METHODS

=head2 nop

...

=head2 create

...

=head2 get_statistics

...

=head2 get_balance

...

=head2 refill_balance

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
