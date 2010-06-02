use Test::More tests => 1;

use strict;
use WWW::Vimeo::Simple;

my $vimeo = WWW::Vimeo::Simple->new;

my $video = WWW::Vimeo::Simple->video;

can_ok($video, qw(info data));
