package WWW::Vimeo::Simple::User;

use WWW::Vimeo::Simple;

use strict;

=head1 NAME

WWW::Vimeo::Simple::User - Object-oriented Vimeo Simple API interface. User requests.

=head1 VERSION

Version 0.04

=cut

our $VERSION = '0.04';


=head1 SYNOPSIS

This module is a full object-oriented implementation of the Vimeo Simple
API. The specifications are available at L<http://vimeo.com/api/docs/simple-api>.

User requests implementation.

    use WWW::Vimeo::Simple;

    my $foo = WWW::Vimeo::Simple->new();

    my $user  = $foo->user( $username );

    $user->info;
    print $user->data->{'id'};
    
    $user->videos;
    foreach $video(@{$user->data}) {
	    print $video->;
    }

=head1 METHODS

=head2 new( $user_name )

Create a WWW::Vimeo::Simple::User object

=cut

sub new {
	my ($class, $user_name) = @_;
 
	my $self = bless({user_name => $user_name}, $class);

	return $self;
}

=head2 info

Fetch user info for the specified user

=cut

sub info {
	my $self = shift;
	my $url  = make_url($self, 'info');

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 videos( $page )

Fetch videos created by user, page optional (default 1)

=cut

sub videos {
	my ($self, $page) = @_;
	my $url  = make_url($self, 'videos', $page);

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 likes( $page )

Fetch videos the user likes, page optional (default 1)

=cut

sub likes {
	my ($self, $page) = @_;
	my $url  = make_url($self, 'likes', $page);

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 appears_in( $page )

Fetch videos that the user appears in, page optional (default 1)

=cut

sub appears_in {
	my ($self, $page) = @_;
	my $url  = make_url($self, 'appears_in', $page);

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 all_videos( $page )

Fetch videos that the user appears in and created, page optional (default 1)

=cut

sub all_videos {
	my ($self, $page) = @_;
	my $url  = make_url($self, 'all_videos', $page);

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 subscriptions( $page )

Fetch videos the user is subscribed to, page optional (default 1)

=cut

sub subscriptions {
	my ($self, $page) = @_;
	my $url  = make_url($self, 'subscriptions', $page);

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 albums( $page )

Fetch albums the user has created, page optional (default 1)

=cut

sub albums {
	my ($self, $page) = @_;
	my $url  = make_url($self, 'albums', $page);

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 channels( $page )

Fetch channels the user has created and subscribed to, page optional (default 1)

=cut

sub channels {
	my ($self, $page) = @_;
	my $url  = make_url($self, 'channels', $page);

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 groups( $page )

Fetch groups the user has created and joined, page optional (default 1)

=cut

sub groups {
	my ($self, $page) = @_;
	my $url  = make_url($self, 'groups', $page);

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 contacts_videos( $page )

Fetch videos that the user's contacts created, page optional (default 1)

=cut

sub contacts_videos {
	my ($self, $page) = @_;
	my $url  = make_url($self, 'contacts_videos', $page);

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 contacts_like( $page )

Fetch videos that the user's contacts like, page optional (default 1)

=cut

sub contacts_like {
	my ($self, $page) = @_;
	my $url  = make_url($self, 'contecys_like', $page);

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 make_url( $request )

Build a Vimeo Simple API url

=cut

sub make_url {
	my ($self, $request, $page) = @_;

	$page = defined $page ? $page : 1;

	my $api_url    = $WWW::Vimeo::Simple::API_URL;
	my $api_format = $WWW::Vimeo::Simple::API_FORMAT;

	return "$api_url/".$self -> {'user'}."/$request.$api_format?page=$page";
}

=head2 data

Return fetched data

=cut

sub data {
	my $self = shift;

	return $self -> {'data'};
}

=head1 USER INFO DATA

	id			User ID
	display_name 		User name
	created_on 		Date the user signed up
	is_staff 		Is this user a staff member?
	is_plus 		Is this user a Vimeo Plus member?
	location 		The location of the user
	url 			User supplied url
	bio 			The bio information from the user profile
	profile_url 		URL to the user profile
	videos_url 		URL to the video list for this user
	total_videos_uploaded 	Total # of videos uploaded
	total_videos_appears_in Total # of videos user appears in
	total_videos_liked  	Total # of videos liked by user
	total_contacts 		Total # of contacts
	total_albums 		Total # of albums
	total_channels 		Total # of channels moderated by user
	portrait_small 		Small user portrait (30px)
	portrait_medium 	Medium user portrait (100px)
	portrait_large 		Large user portrait (300px)

=head1 AUTHOR

Alessandro Ghedini, C<< <alexbio at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-www-vimeo-simple at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW-Vimeo-Simple>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WWW::Vimeo::Simple::User

You can also look for information at:

=over 4

=item * TwitShell homepage

L<http://alexlog.co.cc/projects/www-vimeo-simple>

=item * Git repository

L<http://github.com/AlexBio/WWW-Vimeo-Simple>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=WWW-Vimeo-Simple>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/WWW-Vimeo-Simple>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/WWW-Vimeo-Simple>

=item * Search CPAN

L<http://search.cpan.org/dist/WWW-Vimeo-Simple/>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2010 Alessandro Ghedini.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of WWW::Vimeo::Simple::User
