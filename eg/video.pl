#!/usr/bin/perl

use feature 'say';
use WWW::Vimeo::Simple::Video;

# create a new video object
my $video = WWW::Vimeo::Simple::Video -> new(id => $video_id);

# retrieve video's information
$video -> info;

# print video's information
say $video -> title;
say $video -> description;
say $video -> url;
