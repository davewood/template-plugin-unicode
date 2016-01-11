package Template::Plugin::Unicode;

use strict;
use warnings;
use base qw/Template::Plugin/;

# ABSTRACT: unicode chars via codepoint

=head1 SYNOPSIS
    use Template;
    my $tt = Template->new;
    my $template = '[% USE Unicode %][% Unicode.codepoint2char('0x263A') %]';
    my $smiley;
    $tt->process( \$template, {}, \$smiley )
        or die $tt->error();
    say $smiley;

=head1 DESCRIPTION
    Insert characters into your text via unicode codepoint.

=cut

sub codepoint2char {
    my ($self, $input) = @_;
    return chr(hex($input));
}

1;
