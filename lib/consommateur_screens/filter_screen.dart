import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  final double initialMinPrice;
  final double initialMaxPrice;
  final double initialMinDistance;
  final double initialMaxDistance;

  FilterScreen({
    this.initialMinPrice = 0,
    this.initialMaxPrice = 100,
    this.initialMinDistance = 0,
    this.initialMaxDistance = 50,
  });

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double _minPrice = 0;
  double _maxPrice = 100;
  double _minDistance = 0;
  double _maxDistance = 50;

  @override
  void initState() {
    super.initState();
    _minPrice = widget.initialMinPrice;
    _maxPrice = widget.initialMaxPrice;
    _minDistance = widget.initialMinDistance;
    _maxDistance = widget.initialMaxDistance;
  }

  void _applyFilters() {
    Navigator.pop(context, {
      'minPrice': _minPrice,
      'maxPrice': _maxPrice,
      'minDistance': _minDistance,
      'maxDistance': _maxDistance,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context, null);
          },
        ),
        title: Text('Filtrer', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price Range',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RangeSlider(
              activeColor: Color.fromRGBO(152, 203, 81, 1),
              inactiveColor: Colors.green.shade100,
              min: 0,
              max: 100,
              divisions: 20,
              values: RangeValues(_minPrice, _maxPrice),
              onChanged: (RangeValues values) {
                setState(() {
                  _minPrice = values.start;
                  _maxPrice = values.end;
                });
              },
              labels: RangeLabels(
                '\$${_minPrice.toStringAsFixed(0)}',
                '\$${_maxPrice.toStringAsFixed(0)}',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '\$${_minPrice.toStringAsFixed(0)} - \$${_maxPrice.toStringAsFixed(0)}',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Distance Range',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RangeSlider(
              activeColor: Color.fromRGBO(152, 203, 81, 1),
              inactiveColor: Colors.green.shade100,
              min: 0,
              max: 50,
              divisions: 10,
              values: RangeValues(_minDistance, _maxDistance),
              onChanged: (RangeValues values) {
                setState(() {
                  _minDistance = values.start;
                  _maxDistance = values.end;
                });
              },
              labels: RangeLabels(
                '${_minDistance.toStringAsFixed(0)} km',
                '${_maxDistance.toStringAsFixed(0)} km',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '${_minDistance.toStringAsFixed(0)} km - ${_maxDistance.toStringAsFixed(0)} km',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _applyFilters,
                child: Text(
                  'Apply',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(152, 203, 81, 1),
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
