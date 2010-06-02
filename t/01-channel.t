use Test::More tests => 1;

use strict;
use WWW::Vimeo::Simple;

my $vimeo = WWW::Vimeo::Simple->new;

my $channel = WWW::Vimeo::Simple->channel;

can_ok($channel, qw(info videos data));
