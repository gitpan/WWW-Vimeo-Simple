package WWW::Vimeo::Simple;
{
  $WWW::Vimeo::Simple::VERSION = '0.14';
}

use strict;
use warnings;

=head1 NAME

WWW::Vimeo::Simple - (DEPRECATED) Object-oriented Vimeo Simple API interface.

=head1 VERSION

version 0.14

=head1 SYNOPSIS

This module is a full object-oriented implementation of the Vimeo Simple
API. The specifications are available at L<http://vimeo.com/api/docs/simple-api>.

B<Note>: WWW::Vimeo::Simple is now deprecated and pretty much unmaintained. Get
in touch if you want to maintain this.

=cut

our $API_URL     = "http://vimeo.com/api/v2";
our $API_FORMAT  = "json";

=head1 AUTHOR

Alessandro Ghedini <alexbio@cpan.org>

=head1 LICENSE AND COPYRIGHT

Copyright 2011 Alessandro Ghedini.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

1; # End of WWW::Vimeo::Simple
