#!/usr/bin/perl

use feature 'say';
use WWW::Vimeo::Simple::User;

# create a new user object
my $user = WWW::Vimeo::Simple::User -> new(display_name => $user_id);

# retrieve user's information
$user -> info;

# print user's information
say $user -> display_name;
say $user -> bio;
say $user -> url;

# retrieve user's videos
my $videos = $user -> videos;

foreach my $video (@$videos) {
	say $video -> title;
	say $video -> description;
	say $video -> url;
}

# retrieve user's albums
my $albums = $user -> albums;

foreach my $album (@$albums) {
	say $album -> title;
	say $album -> description;
	say $album -> url;
}
