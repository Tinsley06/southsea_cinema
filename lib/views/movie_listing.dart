import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/repositories/movie_repositories.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String _orderFeedback = '';

  void addToOrder() {
    setState(() {
      _orderFeedback =
          '$_ticketQuantity ${_ticketQuantity == 1 ? 'ticket' : 'tickets'} added to your order.';
    });
  }

  @override
  Widget build(BuildContext context) {
    final MovieRepository movieRepository = MovieRepository();
    final List<Movie> movies = movieRepository.getMovies();

    return Scaffold(
       appBar: AppBar(
        title: const Text("Films", style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
       body: ListView.builder(
         padding: EdgeInsetsGeometry.all(50),
         itemCount: movies.length,
         itemBuilder: (context, index) {
           return MovieCard(
             movie: movies[index],
           );
         },
       ),
     );
   }
 }

//             movie: movie,
//             ),
//             const Text(
//               "Fast & Furious is an action-packed film following street racer Brian O'Conner as he becomes involved with an undercover investigation.",
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Color.fromARGB(255, 255, 0, 0),
//                 height: 1.5,
//               ),
//             ),
//             const SizedBox(height: 24),
//             Row(
//               children: [
//                 const Text(
//                   'Tickets:',
//                   style: TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 DropdownMenu<int>(
//                   initialSelection: 1,
//                   onSelected: (int? value) {
//                     if (value != null) {
//                       setState(() {
//                         _ticketQuantity = value;
//                       });
//                     }
//                   },
//                   dropdownMenuEntries: const [
//                     DropdownMenuEntry(value: 1, label: '1'),
//                     DropdownMenuEntry(value: 2, label: '2'),
//                     DropdownMenuEntry(value: 3, label: '3'),
//                     DropdownMenuEntry(value: 4, label: '4'),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: _addToOrder,
//               child: const Text('Add to order'),
//             ),
//             const SizedBox(height: 12),
//             if (_orderFeedback.isNotEmpty)
//               Text(
//                 _orderFeedback,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.white,              ),
//             );
//           ],
//         ),
//       ),
//     );
//    }
//  }
