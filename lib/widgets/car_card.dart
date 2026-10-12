import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
    final String name;
    final String price;
    final String imageUrl;

    const CarCard({
        super.key,
        required this.name,
        required this.price,
        required this.imageUrl,
    });

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                    ),
                ],
            ),
            child: Row(
                children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
                        child: Image.network(
                            imageUrl,
                            width: 120,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                                return Container(
                                    width: 120,
                                    height: 100,
                                    color: Colors.grey[300],
                                    child: const Icon(Icons.directions_car,
                                        color: Colors.grey,
                                        size: 50,
                                    ),
                                );
                            },
                        ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(
                                    name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                    '$price / hari',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[700],
                                    ),
                                ),
                                const SizedBox(height: 8),
                                ElevatedButton(
                                    onPressed: () {

                                    },
                                    child: const Text('Detail'),
                                ),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }
}