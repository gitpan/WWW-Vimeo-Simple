package WWW::Vimeo::Simple::User;
{
  $WWW::Vimeo::Simple::User::VERSION = '0.11';
}

use JSON;
use Any::Moose;
use HTTP::Tiny;

use WWW::Vimeo::Simple;
use WWW::Vimeo::Simple::Video;
use WWW::Vimeo::Simple::Album;
use WWW::Vimeo::Simple::Channel;
use WWW::Vimeo::Simple::Group;

use warnings;
use strict;

=head1 NAME

WWW::Vimeo::Simple::User - User requests for the Vimeo Simple API

=head1 VERSION

version 0.11

=head1 SYNOPSIS

This module is a full object-oriented implementation of the Vimeo Simple
API. The specifications are available at L<http://vimeo.com/api/docs/simple-api>.

User requests implementation.

    use feature 'say';
    use WWW::Vimeo::Simple::User;

    # create a new user object
    my $user = WWW::Vimeo::Simple::User -> new(display_name => $user);

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

=head1 METHODS

=head2 new( id => $user_id, display_name => $user_name )

Create a WWW::Vimeo::Simple::User object using the given user ID or
name.

An User object has the following attributes:

=over 4

=item * id

User ID

=cut

has 'id' => (
	is  => 'rw',
	isa => 'Int',
);

=item * display_name

User name

=cut

has 'display_name' => (
	is  => 'rw',
	isa => 'Str',
);

=item * created_on

Date the user signed up

=cut

has 'created_on' => (
	is  => 'rw',
	isa => 'Str',
);

=item * is_staff

Is this user a staff member?

=cut

has 'is_staff' => (
	is  => 'rw',
	isa => 'Bool',
);

=item * is_plus

Is this user a Vimeo Plus member?

=cut

has 'is_plus' => (
	is  => 'rw',
	isa => 'Bool',
);

=item * location

The location of the user

=cut

has 'location' => (
	is  => 'rw',
	isa => 'Str',
);

=item * url

User supplied url

=cut

has 'url' => (
	is  => 'rw',
	isa => 'Str',
);

=item * bio

The bio information from the user profile

=cut

has 'bio' => (
	is  => 'rw',
	isa => 'Str',
);

=item * profile_url

URL to the user profile

=cut

has 'profile_url' => (
	is  => 'rw',
	isa => 'Str',
);

=item * videos_url

URL to the video list for this user

=cut

has 'videos_url' => (
	is  => 'rw',
	isa => 'Str',
);

=item * total_videos_uploaded

Total # of videos uploaded

=cut

has 'total_videos_uploaded' => (
	is  => 'rw',
	isa => 'Int',
);

=item * total_videos_appears_in

Total # of videos user appears in

=cut

has 'total_videos_appears_in' => (
	is  => 'rw',
	isa => 'Int',
);

=item * total_videos_liked

Total # of videos liked by user

=cut

has 'total_videos_liked' => (
	is  => 'rw',
	isa => 'Int',
);

=item * total_contacts

Total # of contacts

=cut

has 'total_contacts' => (
	is  => 'rw',
	isa => 'Int',
);

=item * total_albums

Total # of albums

=cut

has 'total_albums' => (
	is  => 'rw',
	isa => 'Int',
);

=item * total_channels

Total # of channels moderated by user

=cut

has 'total_channels' => (
	is  => 'rw',
	isa => 'Int',
);

=item * portrait_small

Small user portrait (30px)

=cut

has 'portrait_small' => (
	is  => 'rw',
	isa => 'Str',
);

=item * portrait_medium

Medium user portrait (100px)

=cut

has 'portrait_medium' => (
	is  => 'rw',
	isa => 'Str',
);

=item * portrait_large

Large user portrait (300px)

=back

=head2 info

Fetch video info for the specified user.

=cut

has 'portrait_large' => (
	is  => 'rw',
	isa => 'Str',
);

sub info {
	my $self = shift;
	my $http = HTTP::Tiny -> new();
	my $url  = _make_url($self, 'info');

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	for my $key ( keys %$json_text ) {
		if (defined $json_text -> {$key}) {
			$self -> {$key} = $json_text -> {$key};
		}
	}
}

=head2 videos( $page )

Fetch videos created by user, page optional (default 1). This method
returns an array reference of L<WWW::Vimeo::Simple::Video> objects.

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

=head2 likes( $page )

Fetch videos the user likes, page optional (default 1). This method
returns an array reference of L<WWW::Vimeo::Simple::Video> objects.

=cut

sub likes {
	my ($self, $page) = @_;
	my $http = HTTP::Tiny -> new();
	my $url  = _make_url($self, 'likes', $page);

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	my @videos;
	foreach my $video ( @$json_text ) {
		push @videos, WWW::Vimeo::Simple::Video -> new($video);
	}

	return \@videos;
}

=head2 appears_in( $page )

Fetch videos that the user appears in, page optional (default 1).  This
method returns an array reference of L<WWW::Vimeo::Simple::Video> objects.

=cut

sub appears_in {
	my ($self, $page) = @_;
	my $http = HTTP::Tiny -> new();
	my $url  = _make_url($self, 'appears_in', $page);

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	my @videos;
	foreach my $video ( @$json_text ) {
		push @videos, WWW::Vimeo::Simple::Video -> new($video);
	}

	return \@videos;
}

=head2 all_videos( $page )

Fetch videos that the user appears in and created, page optional (default 1).
This method returns an array reference of L<WWW::Vimeo::Simple::Video> objects.

=cut

sub all_videos {
	my ($self, $page) = @_;
	my $http = HTTP::Tiny -> new();
	my $url  = _make_url($self, 'all_videos', $page);

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	my @videos;
	foreach my $video ( @$json_text ) {
		push @videos, WWW::Vimeo::Simple::Video -> new($video);
	}

	return \@videos;
}

=head2 subscriptions( $page )

Fetch videos the user is subscribed to, page optional (default 1). This
method returns an array reference of L<WWW::Vimeo::Simple::Video> objects.

=cut

sub subscriptions {
	my ($self, $page) = @_;
	my $http = HTTP::Tiny -> new();
	my $url  = _make_url($self, 'subscriptions', $page);

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	my @videos;
	foreach my $video ( @$json_text ) {
		push @videos, WWW::Vimeo::Simple::Video -> new($video);
	}

	return \@videos;
}

=head2 albums( $page )

Fetch albums the user has created, page optional (default 1). This method
returns an array reference of L<WWW::Vimeo::Simple::Album> objects.

=cut

sub albums {
	my ($self, $page) = @_;
	my $http = HTTP::Tiny -> new();
	my $url  = _make_url($self, 'albums', $page);

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	my @albums;
	foreach my $album ( @$json_text ) {
		push @albums, WWW::Vimeo::Simple::Album -> new($album);
	}

	return \@albums;
}

=head2 channels( $page )

Fetch channels the user has created and subscribed to, page optional (default 1).
This method returns an array reference of L<WWW::Vimeo::Simple::Channel> objects.

=cut

sub channels {
	my ($self, $page) = @_;
	my $http = HTTP::Tiny -> new();
	my $url  = _make_url($self, 'channels', $page);

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	my @channels;
	foreach my $channel ( @$json_text ) {
		push @channels, WWW::Vimeo::Simple::Channel -> new($channel);
	}

	return \@channels;
}

=head2 groups( $page )

Fetch groups the user has created and joined, page optional (default 1).
This method returns an array reference of L<WWW::Vimeo::Simple::Group> objects.

=cut

sub groups {
	my ($self, $page) = @_;
	my $http = HTTP::Tiny -> new();
	my $url  = _make_url($self, 'groups', $page);

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	my @groups;
	foreach my $group ( @$json_text ) {
		push @groups, WWW::Vimeo::Simple::Group -> new($group);
	}

	return \@groups;
}

=head2 contacts_videos( $page )

Fetch videos that the user's contacts created, page optional (default 1).
This method returns an array reference of L<WWW::Vimeo::Simple::Video> objects.

=cut

sub contacts_videos {
	my ($self, $page) = @_;
	my $http = HTTP::Tiny -> new();
	my $url  = _make_url($self, 'contacts_videos', $page);

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	my @videos;
	foreach my $video ( @$json_text ) {
		push @videos, WWW::Vimeo::Simple::Video -> new($video);
	}

	return \@videos;
}

=head2 contacts_like( $page )

Fetch videos that the user's contacts like, page optional (default 1). This
method returns an array reference of L<WWW::Vimeo::Simple::Video> objects.

=cut

sub contacts_like {
	my ($self, $page) = @_;
	my $http = HTTP::Tiny -> new();
	my $url  = _make_url($self, 'contacts_like', $page);

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

	my $user = defined $self -> {'id'} ? $self -> {'id'} : $self -> {'display_name'};

	return "$api_url/$user/$request.$api_format?page=$page";
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

no Any::Moose;

__PACKAGE__ -> meta -> make_immutable;

1; # End of WWW::Vimeo::Simple::User
