
use strict;
use warnings;

use 5.008009;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Perl bindings for Reg.ru API v2",
  "AUTHOR" => "Polina Shubina <shubina\@reg.ru>, Anton Gerasimov <a.gerasimov\@reg.ru>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Regru-API",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Regru::API",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Class::Load" => 0,
    "Data::Dumper" => 0,
    "JSON" => 0,
    "LWP::Protocol::https" => 0,
    "LWP::UserAgent" => 0,
    "Moo" => 0,
    "Moose" => 0,
    "Try::Tiny" => 0,
    "namespace::autoclean" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "File::Spec" => 0,
    "File::Temp" => 0,
    "HTTP::Date" => "6.02",
    "HTTP::Response" => "6.04",
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Net::Ping" => "2.38",
    "Test::Fatal" => "0.010",
    "Test::More" => "0.98",
    "Test::Pod" => "1.22",
    "Test::Warnings" => "0.010",
    "URI" => "1.60"
  },
  "VERSION" => "0.042",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



