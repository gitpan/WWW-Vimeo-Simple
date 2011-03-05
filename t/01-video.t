use Test::More tests => 1;

use strict;
use WWW::Vimeo::Simple::Video;

my $video = WWW::Vimeo::Simple::Video->new;

can_ok($video, qw(info));
