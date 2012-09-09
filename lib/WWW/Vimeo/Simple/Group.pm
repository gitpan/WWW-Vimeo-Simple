package WWW::Vimeo::Simple::Group;
{
  $WWW::Vimeo::Simple::Group::VERSION = '0.14';
}

use strict;
use warnings;

use JSON;
use Any::Moose;
use HTTP::Tiny;

use WWW::Vimeo::Simple;
use WWW::Vimeo::Simple::Video;
use WWW::Vimeo::Simple::User;

=head1 NAME

WWW::Vimeo::Simple::Group - Group requests for the Vimeo Simple API

=head1 VERSION

version 0.14

=head1 SYNOPSIS

This module is a full object-oriented implementation of the Vimeo Simple
API. The specifications are available at L<http://vimeo.com/api/docs/simple-api>.

Group requests implementation.

    use feature 'say';
    use WWW::Vimeo::Simple::Group;

    my $group_id = 69571;

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

=head1 METHODS

=head2 new( id => $group_id )

Create a WWW::Vimeo::Simple::Group object using the given group ID.

A Group object has the following attributes:

=over 4

=item * id

Group ID

=cut

has 'id' => (
	is  => 'rw',
	isa => 'Int',
);

=item * name

Group name

=cut

has 'name' => (
	is  => 'rw',
	isa => 'Str',
);

=item * description

Group description

=cut

has 'description' => (
	is  => 'rw',
	isa => 'Str',
);

=item * logo

Group logo (header)

=cut

has 'logo' => (
	is  => 'rw',
	isa => 'Str',
);

=item * url

URL for the group page

=cut

has 'url' => (
	is  => 'rw',
	isa => 'Str',
);

=item * created_on

Date the group was created

=cut

has 'created_on' => (
	is  => 'rw',
	isa => 'Str',
);

=item * creator_id

User ID of the group creator

=cut

has 'creator_id' => (
	is  => 'rw',
	isa => 'Int',
);

=item * creator_display_name

Name of the User who created the group

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

=item * total_members

Total # of users joined

=cut

has 'total_members' => (
	is  => 'rw',
	isa => 'Int',
);

=item * total_videos

Total # of videos posted to the group

=cut

has 'total_videos' => (
	is  => 'rw',
	isa => 'Int',
);

=item * total_files

Total # of files uploaded to the group

=cut

has 'total_files' => (
	is  => 'rw',
	isa => 'Int',
);

=item * total_forum_topics

Total # of forum topics

=cut

has 'total_forum_topics' => (
	is  => 'rw',
	isa => 'Int',
);

=item * total_events

Total # of events

=cut

has 'total_events' => (
	is  => 'rw',
	isa => 'Int',
);

=item * total_upcoming_events

Total # of upcoming events

=cut

has 'total_upcoming_events' => (
	is  => 'rw',
	isa => 'Int',
);

=back

=head2 info

Fetch album info for the specified group.

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

Fetch videos in that group, page optional (default 1). This method returns
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

=head2 users( $page )

Fetch users in that group, page optional (default 1)

=cut

sub users {
	my ($self, $page) = @_;
	my $http = HTTP::Tiny -> new();
	my $url  = _make_url($self, 'users', $page);

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	my @users;
	foreach my $user ( @$json_text ) {
		push @users, WWW::Vimeo::Simple::User -> new($user);
	}

	return \@users;
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

	return "$api_url/group/".$self -> {'id'}."/$request.$api_format?page=$page";
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

1; # End of WWW::Vimeo::Simple::Group
