package WWW::Vimeo::Simple::Channel;
{
  $WWW::Vimeo::Simple::Channel::VERSION = '0.09';
}

use JSON;
use Any::Moose;
use HTTP::Tiny;

use WWW::Vimeo::Simple;
use WWW::Vimeo::Simple::Video;

use warnings;
use strict;

=head1 NAME

WWW::Vimeo::Simple::Channel - Channel requests for the Vimeo Simple API

=head1 VERSION

version 0.09

=head1 SYNOPSIS

This module is a full object-oriented implementation of the Vimeo Simple
API. The specifications are available at L<http://vimeo.com/api/docs/simple-api>.

Channel requests implementation.

    use feature 'say';
    use WWW::Vimeo::Simple::Channel;

    my $channel_id = 'staffpicks';

    # create a new channel object
    my $channel = WWW::Vimeo::Simple::Channel -> new(name => $channel_id);

    # retrieve channel's information
    $channel -> info;

    # print channel's information
    say $channel -> name;
    say $channel -> description;
    say $channel -> url;

    # retrieve channel's videos
    my $videos = $channel -> videos;

    foreach my $video (@$videos) {
      say $video -> title;
      say $video -> description;
      say $video -> url;

=head1 METHODS

=head2 new( name => $channel_name, id => $id )

Create a WWW::Vimeo::Simple::Channel object using the given channel ID or
name.

A Channel object has the following attributes:

=over

=item * id

Channel ID

=cut

has 'id' => (
	is  => 'rw',
	isa => 'Int',
);

=item * name

Channel name

=cut

has 'name' => (
	is  => 'rw',
	isa => 'Str',
);

=item * description

Channel description

=cut

has 'description' => (
	is  => 'rw',
	isa => 'Str',
);

=item * logo

Channel logo (header)

=cut

has 'logo' => (
	is  => 'rw',
	isa => 'Str',
);

=item * url

URL for the channel page

=cut

has 'url' => (
	is  => 'rw',
	isa => 'Str',
);

=item * rss

RSS feed for the channel's videos

=cut

has 'rss' => (
	is  => 'rw',
	isa => 'Str',
);

=item * created_on

Date the channel was created

=cut

has 'created_on' => (
	is  => 'rw',
	isa => 'Str',
);

=item * creator_id

User ID of the channel creator

=cut

has 'creator_id' => (
	is  => 'rw',
	isa => 'Int',
);

=item * creator_display_name

Name of the User who created the channel

=cut

has 'creator_display_name' => (
	is  => 'rw',
	isa => 'Str',
);

=item * creator_url

The URL to the channel creator's profile

=cut

has 'creator_url' => (
	is  => 'rw',
	isa => 'Str',
);

=item * total_videos

Total # of videos posted in the channel

=cut

has 'total_videos' => (
	is  => 'rw',
	isa => 'Int',
);

=item * total_subscribers

Total # of users subscribed

=cut

has 'total_subscribers' => (
	is  => 'rw',
	isa => 'Int',
);

=back

=head2 info

Fetch channel info for the specified channel.

=cut

sub info {
	my $self = shift;
	my $http = HTTP::Tiny -> new();
	my $url = _make_url($self, 'info');

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	for my $key ( keys %$json_text ) {
		if (defined $json_text -> {$key}) {
			$self -> {$key} = $json_text -> {$key};
		}
	}
}

=head2 videos( $page )

Fetch videos in that channel, page optional (default 1). This method returns
an array reference of L<WWW::Vimeo::Simple::Video> objects.

=cut

sub videos {
	my ($self, $page) = @_;
	my $http = HTTP::Tiny -> new();
	my $url  = _make_url($self, 'videos', $page);

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	my @videos;
	foreach my $video ( @$json_text ) {
		push @videos, WWW::Vimeo::Simple::Video -> new($video);
	}

	return \@videos;
}

=head1 INTERNAL SUBROUTINES

=head2 _make_url( $request )

Build a Vimeo Simple API url

=cut

sub _make_url {
	my ($self, $request, $page) = @_;

	$page = defined $page ? $page : 1;

	my $api_url    = $WWW::Vimeo::Simple::API_URL;
	my $api_format = $WWW::Vimeo::Simple::API_FORMAT;

	my $channel = defined $self -> {'id'} ? $self -> {'id'} : $self -> {'name'};

	return "$api_url/channel/$channel/$request.$api_format?page=$page";
}

=head1 AUTHOR

Alessandro Ghedini <alexbio@cpan.org>

=head1 LICENSE AND COPYRIGHT

Copyright 2011 Alessandro Ghedini.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

1; # End of WWW::Vimeo::Simple::Channel
