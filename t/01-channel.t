#!perl

use Test::More;

use WWW::Vimeo::Simple::Channel;

my $channel = WWW::Vimeo::Simple::Channel->new;
can_ok $channel, qw(info videos);

done_testing;
