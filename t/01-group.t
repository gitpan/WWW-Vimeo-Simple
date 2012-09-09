#!perl

use Test::More;

use WWW::Vimeo::Simple::Group;

my $group = WWW::Vimeo::Simple::Group->new;
can_ok $group, qw(info videos users);

done_testing;
