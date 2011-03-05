use Test::More tests => 1;

use strict;
use WWW::Vimeo::Simple::Album;

my $album = WWW::Vimeo::Simple::Album->new;

can_ok($album, qw(info videos));
