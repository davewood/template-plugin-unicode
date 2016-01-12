package Template::Plugin::Unicode;

use strict;
use warnings;
use base qw/Template::Plugin/;

# ABSTRACT: insert characters via unicode codepoints.

=head1 SYNOPSIS

    use Template;
    my $tt = Template->new;
    my $template = '[% USE Unicode %][% Unicode.codepoint2char('0x263A') %]';
    my $smiley;
    $tt->process( \$template, {}, \$smiley )
        or die $tt->error();
    say $smiley;

=head1 DESCRIPTION

Insert characters via unicode codepoints.

=head1 SEE ALSO

Another way of inserting characters via unicode codepoints is by
adding a sub ref to the \%vars hashref passed to process().

    my $u    = sub { chr(hex($_[0])) };
    my $text = '[% u('0x263a') %]';
    process(\$text, { u => sub {} }, $output);

=cut

sub codepoint2char {
    my ($self, $input) = @_;
    return chr(hex($input));
}

1;
