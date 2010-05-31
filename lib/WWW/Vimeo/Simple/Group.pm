package WWW::Vimeo::Simple::Group;

use WWW::Vimeo::Simple;

use strict;

=head1 NAME

WWW::Vimeo::Simple::Group - Object-oriented Vimeo Simple API interface. Group requests.

=head1 VERSION

Version 0.03

=cut

our $VERSION = '0.03';

=head1 SYNOPSIS

This module is a full object-oriented implementation of the Vimeo Simple
API. The specifications are available at L<http://vimeo.com/api/docs/simple-api>.

Group requests implementation.

    use WWW::Vimeo::Simple::Group;

    my $foo = WWW::Vimeo::Simple::Group->new();

    my $group = $foo->group( $group_name );

    $channel->users;
    
    foreach (@{$channel->data}) {
	    print $_ -> {'display_name'};
    }

=head1 METHODS

=head2 new( $group_name )

Create a WWW::Vimeo::Simple::Group object

=cut

sub new {
	my ($class, $group_name) = @_;
 
	my $self = bless({group_name => $group_name}, $class);

	return $self;
}

=head2 info

Fetch group info for the specified group

=cut

sub info {
	my $self = shift;
	my $url  = make_url($self, 'info');

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 videos( $page )

Fetch videos in that group, page optional (default 1)

=cut

sub videos {
	my ($self, $page) = @_;
	my $url  = make_url($self, 'videos', $page);

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 users( $page )

Fetch users in that group, page optional (default 1)

=cut

sub users {
	my ($self, $page) = @_;
	my $url  = make_url($self, 'users', $page);

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

	return "$api_url/group/".$self -> {'group_name'}."/$request.$api_format?page=$page";
}

=head2 data

Return fetched data

=cut

sub data {
	my $self = shift;

	return $self -> {'data'};
}

=head1 GROUP INFO DATA

	id 			Group ID
	name 			Group name
	description 		Group description
	url 			URL for the group page
	logo 			Group logo (header)
	thumbnail 		Thumbnail
	created_on 		Date the group was created
	creator_id 		User ID of the group creator
	creator_display_name 	Name of the User who created the group
	creator_url 		The URL to the group creator's profile
	total_members 		Total # of users joined
	total_videos 		Total # of videos posted to the group
	total_files 		Total # of files uploaded to the group
	total_forum_topics 	Total # of forum topics
	total_events 		Total # of events
	total_upcoming_events 	Total # of upcoming events

=head1 AUTHOR

Alessandro Ghedini, C<< <alexbio at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-www-vimeo-simple at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW-Vimeo-Simple>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WWW::Vimeo::Simple::Group

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

1; # End of WWW::Vimeo::Simple::Group
