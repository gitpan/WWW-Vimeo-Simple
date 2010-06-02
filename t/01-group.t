use Test::More tests => 1;

use strict;
use WWW::Vimeo::Simple;

my $vimeo = WWW::Vimeo::Simple->new;

my $group = WWW::Vimeo::Simple->group;

can_ok($group, qw(info videos users data));
