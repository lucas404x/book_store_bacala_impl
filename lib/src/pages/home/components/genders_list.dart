import 'package:flutter/material.dart';

import '../../../core/enums/gender_enum.dart';

class GendersList extends StatefulWidget {
  const GendersList({super.key});

  @override
  State<GendersList> createState() => _GendersListState();
}

class _GendersListState extends State<GendersList> {
  late Gender _selectedGender;

  @override
  void initState() {
    _selectedGender = Gender.values.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 24.0),
          ...Gender.values
            .map(
              (gender) => _GenderTile(
                gender: gender,
                isSelected: gender == _selectedGender,
                onTap: () => setState(() => _selectedGender = gender),
              ),
            )
            .expand((element) => [element, const SizedBox(width: 16.0)])
            .toList()
        ],
      ),
    );
  }
}

class _GenderTile extends StatelessWidget {
  final Gender gender;
  final bool isSelected;
  final void Function()? onTap;

  const _GenderTile({
    required this.gender,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          border: !isSelected ? Border.all(color: Colors.grey, strokeAlign: StrokeAlign.outside, width: 1.5) : null,
          borderRadius: BorderRadius.circular(6.0),
          color: isSelected ? Theme.of(context).colorScheme.secondary : null,
          boxShadow: isSelected ? [
            BoxShadow(
              offset: const Offset(5, 25),
              color: Colors.black.withOpacity(.13),
              blurRadius: 25,
              spreadRadius: 1,
            )
          ] : null
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Text(
              gender.description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                color: isSelected ? Colors.white : Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
