#!/usr/bin/perl

use feature 'say';
use WWW::Vimeo::Simple::Group;

# create a new group object
my $group = WWW::Vimeo::Simple::Group -> new(id => $group_id);

# retrieve group's information
$group -> info;

# print group's information
say $group -> name;
say $group -> description;
say $group -> url;

# retrieve group's videos
my $videos = $group -> videos;

foreach my $video (@$videos) {
	say $video -> title;
	say $video -> description;
	say $video -> url;
}

# retrieve group's users
my $users = $group -> users;

foreach my $user (@$users) {
	say $user -> display_name;
	say $user -> bio;
	say $user -> url;
}
