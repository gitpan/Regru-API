
BEGIN {
  unless ($ENV{RELEASE_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for release candidate testing');
  }
}

use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::NoTabs 0.04

use Test::More 0.88;
use Test::NoTabs;

my @files = (
    'lib/Regru/API.pm',
    'lib/Regru/API/Bill.pm',
    'lib/Regru/API/Domain.pm',
    'lib/Regru/API/Folder.pm',
    'lib/Regru/API/Response.pm',
    'lib/Regru/API/Role/Client.pm',
    'lib/Regru/API/Role/Loggable.pm',
    'lib/Regru/API/Role/Namespace.pm',
    'lib/Regru/API/Role/Serializer.pm',
    'lib/Regru/API/Role/UserAgent.pm',
    'lib/Regru/API/Service.pm',
    'lib/Regru/API/User.pm',
    'lib/Regru/API/Zone.pm'
);

notabs_ok($_) foreach @files;
done_testing;
