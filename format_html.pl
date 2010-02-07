#!/usr/bin/env perl

$pattern = '<img src=["\']([^\'"]+\.png)["\'](?: ?/?)>';

while (<>) {
  if (/$pattern/o) {
    $png = $1;
    $dimen = `identify $png`;
    $dimen =~ / (\d+)x(\d+) /;
    $w = $1;
    $h = $2;
    $svg = $png;
    $svg =~ s/\.png$/.svg/;
    $replacement = "<embed src='$svg' width='$w' height='$h' />"
      . "<noembed><img src='$png' /></noembed>";
    s/$pattern/$replacement/;
  }
  s/^(\s*\.other-link-)png/\1svg/;
  print;
}
