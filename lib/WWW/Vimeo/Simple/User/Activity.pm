package WWW::Vimeo::Simple::User::Activity;
BEGIN {
  $WWW::Vimeo::Simple::User::Activity::VERSION = '0.06';
}

use Carp;
use JSON;
use Moose;
use HTTP::Tiny;

use WWW::Vimeo::Simple;

use warnings;
use strict;

=head1 NAME

WWW::Vimeo::Simple::User::Activity - Activity object

=head1 VERSION

version 0.06

=head1 METHODS

=head2 new( user_name => $user_name, user_id => $user_id )

Create a WWW::Vimeo::Simple::Activity object using the given user ID or
name.

An Activity object has the following attributes:

=over 4

=item * type

User ID

=cut

has 'type' => (
	is  => 'rw',
	isa => 'Str',
);

=item * date

User ID

=cut

has 'date' => (
	is  => 'rw',
	isa => 'Str',
);

=item * user_id

User ID

=cut

has 'user_id' => (
	is  => 'rw',
	isa => 'Int',
);

=item * user_name

User name

=cut

has 'user_name' => (
	is  => 'rw',
	isa => 'Str',
);

=item * user_url

User name

=cut

has 'user_url' => (
	is  => 'rw',
	isa => 'Str',
);

=item * user_portrait_small

User name

=cut

has 'user_portrait_small' => (
	is  => 'rw',
	isa => 'Str',
);

=item * user_portrait_medium

User name

=cut

has 'user_portrait_medium' => (
	is  => 'rw',
	isa => 'Str',
);

=item * user_portrait_large

User name

=cut

has 'user_portrait_large' => (
	is  => 'rw',
	isa => 'Str',
);

=item * subject_id

User name

=cut

has 'subject_id' => (
	is  => 'rw',
	isa => 'Int',
);

=item * subject_name

User name

=cut

has 'subject_name' => (
	is  => 'rw',
	isa => 'Str',
);

=item * subject_url

User name

=cut

has 'subject_url' => (
	is  => 'rw',
	isa => 'Str',
);

=item * subject_portrait_small

User name

=cut

has 'subject_portrait_small' => (
	is  => 'rw',
	isa => 'Str',
);

=item * subject_portrait_medium

User name

=cut

has 'subject_portrait_medium' => (
	is  => 'rw',
	isa => 'Str',
);

=item * subject_portrait_large

User name

=cut

has 'subject_portrait_large' => (
	is  => 'rw',
	isa => 'Str',
);

=item * video_id

User name

=cut

has 'video_id' => (
	is  => 'rw',
	isa => 'Int',
);

=item * video_title

User name

=cut

has 'video_title' => (
	is  => 'rw',
	isa => 'Str',
);

=item * video_description

User name

=cut

has 'video_description' => (
	is  => 'rw',
	isa => 'Str',
);

=item * video_url

User name

=cut

has 'video_url' => (
	is  => 'rw',
	isa => 'Str',
);

=item * video_thumbnail_small

User name

=cut

has 'video_thumbnail_small' => (
	is  => 'rw',
	isa => 'Str',
);

=item * video_thumbnail_medium

User name

=cut

has 'video_thumbnail_medium' => (
	is  => 'rw',
	isa => 'Str',
);

=item * video_thumbnail_large

User name

=cut

has 'video_thumbnail_large' => (
	is  => 'rw',
	isa => 'Str',
);

=item * video_stats_number_of_likes

User name

=cut

has 'video_stats_number_of_likes' => (
	is  => 'rw',
	isa => 'Int',
);

=item * video_stats_number_of_plays

User name

=cut

has 'video_stats_number_of_plays' => (
	is  => 'rw',
	isa => 'Int',
);

=item * video_stats_number_of_comments

User name

=cut

has 'video_stats_number_of_comments' => (
	is  => 'rw',
	isa => 'Int',
);

=item * video_tags

User name

=cut

has 'video_tags' => (
	is  => 'rw',
	isa => 'Str',
);

=item * action_tags

User name

=cut

has 'action_tags' => (
	is  => 'rw',
	isa => 'Str',
);

=back

=head1 AUTHOR

Alessandro Ghedini, C<< <alexbio at cpan.org> >>

=head1 LICENSE AND COPYRIGHT

Copyright 2010 Alessandro Ghedini.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

1; # End of WWW::Vimeo::Simple::User::Activity