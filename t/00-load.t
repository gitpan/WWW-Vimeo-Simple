#!perl -T

use Test::More tests => 7;

BEGIN {
    use_ok( 'WWW::Vimeo::Simple' ) || print "Bail out!
";
    use_ok( 'WWW::Vimeo::Simple::Activity' ) || print "Bail out!
";
    use_ok( 'WWW::Vimeo::Simple::Album' ) || print "Bail out!
";
    use_ok( 'WWW::Vimeo::Simple::Channel' ) || print "Bail out!
";
    use_ok( 'WWW::Vimeo::Simple::Group' ) || print "Bail out!
";
    use_ok( 'WWW::Vimeo::Simple::User' ) || print "Bail out!
";
    use_ok( 'WWW::Vimeo::Simple::Video' ) || print "Bail out!
";
}

diag( "Testing WWW::Vimeo::Simple $WWW::Vimeo::Simple::VERSION, Perl $], $^X" );
