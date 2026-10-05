import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String _orderFeedback = '';

  void _addToOrder() {
    setState(() {
      _orderFeedback =
          '$_ticketQuantity ${_ticketQuantity == 1 ? 'ticket' : 'tickets'} added to your order.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "The Fast and the Furious (2001)",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Fast & Furious is an action-packed film following street racer Brian O'Conner as he becomes involved with an undercover investigation.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Text(
                  'Tickets:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 16),
                DropdownMenu<int>(
                  initialSelection: 1,
                  onSelected: (int? value) {
                    if (value != null) {
                      setState(() {
                        _ticketQuantity = value;
                      });
                    }
                  },
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 1, label: '1'),
                    DropdownMenuEntry(value: 2, label: '2'),
                    DropdownMenuEntry(value: 3, label: '3'),
                    DropdownMenuEntry(value: 4, label: '4'),
                    DropdownMenuEntry(value: 5, label: '5'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _addToOrder,
              child: const Text('Add to order'),
            ),
            const SizedBox(height: 12),
            if (_orderFeedback.isNotEmpty)
              Text(
                _orderFeedback,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
