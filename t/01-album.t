#!perl

use Test::More;

use WWW::Vimeo::Simple::Album;

my $album = WWW::Vimeo::Simple::Album->new;
can_ok $album, qw(info videos);

done_testing;
