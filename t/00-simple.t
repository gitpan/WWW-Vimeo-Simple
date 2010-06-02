use Test::More tests => 1;

use strict;
use WWW::Vimeo::Simple;

my $vimeo = WWW::Vimeo::Simple->new;

can_ok($vimeo, qw(user activity video album channel group));
