import 'package:flutter/material.dart';

class BookingController {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final durationController = TextEditingController();

    DateTime? selectedDate;
    int totalPrice = 0;

    void calculateTotal(int pricePerDay, VoidCallback onUpdate) {
        int duration = int.tryParse(durationController.text) ?? 0;
        totalPrice = duration * pricePerDay;
        onUpdate();
    }

    Future<void> selectDate(BuildContext context, VoidCallback onUpdate) async {
        final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2030),
        );
        if (picked != null) {
            selectedDate = picked;
            onUpdate();
        }
    }

    void dispose() {
        nameController.dispose();
        durationController.dispose();
    }
}