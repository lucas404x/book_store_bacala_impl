import '../models/book_model.dart';

const _kSynopsis = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae libero eu ipsum cursus egestas in at purus. Mauris tortor tortor, tincidunt ut nisi sit amet, cursus pretium turpis. Curabitur interdum, nisi at condimentum hendrerit, sapien lacus congue nisi, id eleifend tellus nisi nec nibh. Cras blandit hendrerit nulla quis vehicula. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus tincidunt pulvinar lobortis. Duis condimentum leo ut neque gravida ultrices. Curabitur placerat felis ultrices, accumsan libero laoreet, vestibulum ex. Vivamus tempus nisl quis nunc bibendum, at tincidunt est mollis. Sed libero arcu, hendrerit at nulla vitae, sagittis tincidunt urna. Vivamus non sollicitudin felis. Integer sem metus, mattis et lacus et, accumsan dapibus nunc. Nulla facilisi. Integer id vehicula sapien.';

const kBooks = <BookModel>[
  BookModel(
    title: 'Ther Melian: Disocrd',
    author: 'Shienny M.S',
    image: 'assets/images/1.jpg',
    synopsis: _kSynopsis,
    rate: 4.8,
    pages: 340,
    totalReadTimes: 4200,
    read: false,
  ),
  BookModel(
    title: 'The Poppy War',
    author: 'R.F Kuang',
    image: 'assets/images/2.jpg',
    synopsis: _kSynopsis,
    rate: 4.5,
    pages: 124,
    totalReadTimes: 1234,
    read: true,
  ),
  BookModel(
    title: 'The Glass Magical',
    author: 'Charlie F.M',
    image: 'assets/images/3.jpg',
    synopsis: _kSynopsis,
    rate: 4.0,
    pages: 340,
    totalReadTimes: 1324,
    read: true,
  ),
  BookModel(
    title: 'Pergi',
    author: 'Tere Liye',
    image: 'assets/images/4.jpg',
    synopsis: _kSynopsis,
    rate: 2.4,
    pages: 149,
    totalReadTimes: 24,
    read: true,
  ),
];
