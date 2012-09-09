#!perl

use Test::More;

use WWW::Vimeo::Simple::User;

my $user = WWW::Vimeo::Simple::User->new;
can_ok $user, qw(info videos likes appears_in all_videos subscriptions albums channels groups contacts_videos contacts_like);

done_testing;
