enum Gender {
  fantasy('Fantasy'),
  romance('Romance'),
  mistery('Mistery'),
  adventure('Adventure'),
  action('Action'),
  comedy('Comedy');

  const Gender(this.description);

  final String description;
}