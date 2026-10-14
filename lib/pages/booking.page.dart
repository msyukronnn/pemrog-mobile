import 'package:flutter/material.dart';
import '../controllers/booking_controller.dart';

class BookingPage extends StatefulWidget {
    final String carName;
    final int pricePerDay;

    const BookingPage({
        super.key,
        required this.carName,
        required this.pricePerDay,
    });

    @override
    State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
    final BookingController _controller = BookingController();

    @override
    void dispose() {
        _controller.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text('Sewa ${widget.carName}')),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                    key: _controller.formKey,
                    child: ListView(
                        children: [
                            TextFormField(
                                controller: _controller.nameController,
                                decoration: const InputDecoration(
                                    labelText: 'Nama Penyewa',
                                    border: OutlineInputBorder(),
                                ),
                                validator: (val) =>
                                (val == null || val.trim().isEmpty) ? 'Nama tidak boleh kosong' : null,
                            ),
                            const SizedBox(height: 16),
                            ListTile(
                                tileColor: Colors.grey[200],
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                title: Text(
                                    _controller.selectedDate == null
                                        ? 'Pilih Tanggal Sewa'
                                        : 'Tanggal: ${_controller.selectedDate!.day}/${_controller.selectedDate!.month}/${_controller.selectedDate!.year}',
                                ),
                                trailing: const Icon(Icons.calendar_today),
                                onTap: () => _controller.selectDate(context, () => setState(() {})),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                                controller: _controller.durationController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    labelText: 'Durasi Sewa (Hari)',
                                    border: OutlineInputBorder(),
                                ),
                                onChanged: (_) => _controller.calculateTotal(
                                    widget.pricePerDay,
                                    () => setState(() {}),
                                ),
                                validator: (val) {
                                    if (val == null || val.isEmpty) return 'Durasi tidak boleh kosong';
                                    if (int.tryParse(val) == null || int.parse(val) <= 0 ) {
                                        return 'Masukkan durasi yang valid!';
                                    }
                                    return null;
                                },
                            ),
                            const SizedBox(height: 16),
                            Text(
                                'Total Harga: Rp ${_controller.totalPrice}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent,
                                ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                                onPressed: () {
                                    if (_controller.selectedDate == null) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('Pilih tanggal sewa terlebih dahulu!')),
                                        );
                                        return;
                                    }
                                    if (_controller.formKey.currentState!.validate()) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    'Pemesanan Berhasil!\nNama: ${_controller.nameController.text}\nTotal: Rp${_controller.totalPrice}',
                                                ),
                                            ),
                                        );
                                    }
                                },
                                child: const Text('Konfirmasi Pemesanan'),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}