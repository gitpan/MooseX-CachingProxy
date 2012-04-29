
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Send LWP requests through a caching proxy server",
  "AUTHOR" => "Eric Johnson <cpan at iijo dot org>",
  "BUILD_REQUIRES" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "LWP::UserAgent" => 0,
    "MooseX::Test::Role" => 0,
    "Test::HTTP::Server" => 0,
    "Test::More" => 0,
    "Test::Most" => 0,
    "base" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "MooseX-CachingProxy",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "MooseX::CachingProxy",
  "PREREQ_PM" => {
    "LWP::Protocol::PSGI" => 0,
    "Moose::Role" => 0,
    "MooseX::Types::Path::Class" => 0,
    "Plack::App::Proxy" => 0,
    "Plack::Builder" => 0,
    "Plack::Middleware::Cache" => 0
  },
  "VERSION" => "0.001",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


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



