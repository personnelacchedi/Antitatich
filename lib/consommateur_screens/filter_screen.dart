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
  bool _filterByCuisine = false;
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
        title: Text('Filtrer'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context, null);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price Range'),
            RangeSlider(
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
            SizedBox(height: 20),
            Text('Distance Range'),
            RangeSlider(
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _applyFilters,
              child: Text('Apply Filters'),
            ),
          ],
        ),
      ),
    );
  }
}
