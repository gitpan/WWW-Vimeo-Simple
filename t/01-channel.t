use Test::More tests => 1;

use strict;
use WWW::Vimeo::Simple::Channel;

my $channel = WWW::Vimeo::Simple::Channel->new;

can_ok($channel, qw(info videos));
