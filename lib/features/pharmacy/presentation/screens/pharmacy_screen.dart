import 'package:flutter/material.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({super.key});

  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';

  final List<String> _categories = [
    'All',
    'Pain Relief',
    'Vitamins',
    'Antibiotics',
    'Heart Health',
    'Diabetes',
    'Skincare',
  ];

  final List<Map<String, dynamic>> _medications = [
    {
      'name': 'Paracetamol 500mg',
      'category': 'Pain Relief',
      'price': 12.50,
      'image': 'assets/med1.jpg',
      'description': 'Effective pain reliever and fever reducer',
      'inStock': true,
      'prescription': false,
    },
    {
      'name': 'Vitamin D3 1000 IU',
      'category': 'Vitamins',
      'price': 25.00,
      'image': 'assets/med2.jpg',
      'description': 'Essential vitamin for bone health',
      'inStock': true,
      'prescription': false,
    },
    {
      'name': 'Amoxicillin 250mg',
      'category': 'Antibiotics',
      'price': 35.00,
      'image': 'assets/med3.jpg',
      'description': 'Antibiotic for bacterial infections',
      'inStock': true,
      'prescription': true,
    },
    {
      'name': 'Metformin 500mg',
      'category': 'Diabetes',
      'price': 28.00,
      'image': 'assets/med4.jpg',
      'description': 'Diabetes medication for blood sugar control',
      'inStock': false,
      'prescription': true,
    },
    {
      'name': 'Moisturizing Cream',
      'category': 'Skincare',
      'price': 18.00,
      'image': 'assets/med5.jpg',
      'description': 'Gentle moisturizer for sensitive skin',
      'inStock': true,
      'prescription': false,
    },
  ];

  List<Map<String, dynamic>> get _filteredMedications {
    return _medications.where((med) {
      final matchesCategory =
          _selectedCategory == 'All' || med['category'] == _selectedCategory;
      final matchesSearch = med['name'].toLowerCase().contains(
        _searchController.text.toLowerCase(),
      );
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'E-Pharmacy',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFF9800),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // TODO: Navigate to cart
              _showCartDialog(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildCategoryFilter(),
          Expanded(child: _buildMedicationGrid()),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showUploadPrescriptionDialog(context);
        },
        backgroundColor: const Color(0xFFFF9800),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.upload_file),
        label: const Text('Upload Prescription'),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFFFF9800),
      child: TextField(
        controller: _searchController,
        onChanged: (value) => setState(() {}),
        decoration: InputDecoration(
          hintText: 'Search medications...',
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = category == _selectedCategory;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selectedCategory = category;
                });
              },
              backgroundColor: Colors.white,
              selectedColor: const Color(0xFFFF9800),
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMedicationGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: _filteredMedications.length,
      itemBuilder: (context, index) {
        final medication = _filteredMedications[index];
        return _buildMedicationCard(medication);
      },
    );
  }

  Widget _buildMedicationCard(Map<String, dynamic> medication) {
    return GestureDetector(
      onTap: () {
        _showMedicationDetails(context, medication);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: const Icon(
                  Icons.medication,
                  size: 60,
                  color: Color(0xFFFF9800),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medication['name'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${medication['price'].toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF9800),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        if (medication['prescription'])
                          const Icon(
                            Icons.receipt,
                            size: 12,
                            color: Colors.red,
                          ),
                        if (medication['prescription'])
                          const SizedBox(width: 4),
                        if (medication['prescription'])
                          const Text(
                            'Rx',
                            style: TextStyle(fontSize: 10, color: Colors.red),
                          ),
                        const Spacer(),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: medication['inStock']
                                ? Colors.green
                                : Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          medication['inStock'] ? 'In Stock' : 'Out of Stock',
                          style: TextStyle(
                            fontSize: 10,
                            color: medication['inStock']
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMedicationDetails(
    BuildContext context,
    Map<String, dynamic> medication,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.medication,
                    size: 40,
                    color: Color(0xFFFF9800),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        medication['name'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        medication['category'],
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${medication['price'].toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF9800),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Description',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              medication['description'],
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 20),
            if (medication['prescription']) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.warning, color: Colors.red, size: 20),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Prescription required. Please upload a valid prescription.',
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: medication['inStock']
                    ? () {
                        Navigator.pop(context);
                        _addToCart(medication);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF9800),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  medication['inStock'] ? 'Add to Cart' : 'Out of Stock',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Shopping Cart'),
          content: const Text(
            'Your cart is empty. Add some medications to continue.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showUploadPrescriptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Upload Prescription'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Take a photo or upload an image of your prescription.'),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 40,
                        color: Color(0xFFFF9800),
                      ),
                      Text('Camera'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.photo_library,
                        size: 40,
                        color: Color(0xFFFF9800),
                      ),
                      Text('Gallery'),
                    ],
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Prescription uploaded successfully!'),
                  ),
                );
              },
              child: const Text('Upload'),
            ),
          ],
        );
      },
    );
  }

  void _addToCart(Map<String, dynamic> medication) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${medication['name']} added to cart'),
        action: SnackBarAction(
          label: 'View Cart',
          onPressed: () {
            _showCartDialog(context);
          },
        ),
      ),
    );
  }
}
