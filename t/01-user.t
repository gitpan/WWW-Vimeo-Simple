use Test::More tests => 1;

use strict;
use WWW::Vimeo::Simple;

my $vimeo = WWW::Vimeo::Simple->new;

my $user = WWW::Vimeo::Simple->user;

can_ok($user, qw(info videos likes appears_in all_videos subscriptions albums channels groups contacts_videos contacts_like data));
