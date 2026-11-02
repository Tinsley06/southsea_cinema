import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return [
      Movie(
        title: 'Fast and Furious',
        id: 'fast_and_furious',
        synopsis: 'An action-packed film about street racing and heists.',
        age_rating: 'PG 13',
        screening_time: '10:00 AM',
        ticket_price: '9.99',
        poster_image_path: 'assets/images/fast_and_furious.jpg',
      ),
      Movie(
        title: 'Ali G Indahouse',
        id: 'ali_g_indahouse',
        synopsis: 'A retro comedy film, set in the 2000s.',
        age_rating: 'PG 13',
        screening_time: '11 AM',
        ticket_price: '9.99',
        poster_image_path: 'assets/images/ali_g.jpg',
      ),
    ];
  }
}
