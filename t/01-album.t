use Test::More tests => 1;

use strict;
use WWW::Vimeo::Simple;

my $vimeo = WWW::Vimeo::Simple->new;

my $album = WWW::Vimeo::Simple->album;

can_ok($album, qw(info videos data));
