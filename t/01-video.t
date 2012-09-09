#!perl

use Test::More;

use WWW::Vimeo::Simple::Video;

my $video = WWW::Vimeo::Simple::Video->new;
can_ok $video, qw(info);

done_testing;
