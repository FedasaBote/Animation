class PageModel {
  final int rating;
  final String description;
  final String imagepath;
  final int totalRating;
  final String title;

  const PageModel(
      {required this.rating,
      required this.description,
      required this.imagepath,
      required this.totalRating,
      required this.title});
}

const pages = [
  PageModel(
      rating: 4,
      description:
          'Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome.',
      imagepath: 'assets/images/one.jpg',
      totalRating: 2000,
      title: "Yosemite National Park"),
  PageModel(
    rating: 4,
    description:
        'The Golden Gate Bridge is a suspension bridge spanning the Golden Gate, the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean.',
    imagepath: 'assets/images/two.jpg',
    totalRating: 2000,
    title: 'Golden Gate Bridge',
  ),
  PageModel(
    rating: 4,
    description:
        "Sedona is regularly described as one of America's most beautiful places. Nowhere else will you find a landscape as dramatically colorful.",
    imagepath: 'assets/images/three.jpg',
    totalRating: 2000,
    title: 'Sedona',
  ),
  PageModel(
    rating: 4,
    description:
        "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak.",
    imagepath: 'assets/images/four.jpg',
    totalRating: 2000,
    title: 'Savannah',
  ),
];
