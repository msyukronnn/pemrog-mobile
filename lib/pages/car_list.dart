import 'package:flutter/material.dart';
import '../widgets/car_card.dart';

class CarList extends StatelessWidget {
    const CarList({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Daftar Mobil Rental'),
                backgroundColor: Colors.blueAccent,
            ),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                    children: const [
                        CarCard(
                            name: 'Avanza Veloz',
                            price: 'Rp350.000',
                            imageUrl: 'https://images.unsplash.com/photo-1549399542-7e3f8b79c341?w=500',
                        ),
                        CarCard(
                            name: 'Innova Reborn',
                            price: 'Rp500.000',
                            imageUrl: 'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=500',
                        ),
                        CarCard(
                            name: 'New Ertiga',
                            price: 'Rp350.000',
                            imageUrl: 'https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=500',
                        ),
                    ],
                ),
            ),
        );
    }
}