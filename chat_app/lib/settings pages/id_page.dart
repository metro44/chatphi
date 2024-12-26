import 'package:flutter/material.dart';

class IDPage extends StatelessWidget {
  const IDPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'ID',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            IDInputRow(
              label: 'Type',
              hint: 'National ID Card',
              onChanged: (value) {
                // Handle type input
              },
            ),
            const SizedBox(height: 16),
            IDInputRow(
              label: 'ID Expiry Date',
              hint: '10-12-2028',
              onChanged: (value) {
                // Handle expiry date input
              },
            ),
            const SizedBox(height: 16),
            IDInputRow(
              label: 'ID Number',
              hint: '1231234232323',
              onChanged: (value) {
                // Handle ID number input
              },
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class IDInputRow extends StatefulWidget {
  final String label;
  final String hint;
  final Function(String) onChanged;

  const IDInputRow({
    required this.label,
    required this.hint,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<IDInputRow> createState() => _IDInputRowState();
}

class _IDInputRowState extends State<IDInputRow> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 67,
      padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
      ),
      child: Row(
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: TextFormField(
              controller: _controller,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
              ),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: _controller.text.isEmpty ? widget.hint : null,
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: (value) {
                setState(() {
                  widget.onChanged(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
