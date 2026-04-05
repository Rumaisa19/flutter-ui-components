import '../models/product.dart';
import '../models/news_item.dart';

const List<Product> mockProducts = [
  Product(
    id: '1',
    title: 'Fundamentals of Algorithms',
    category: 'Computer Science Dept.',
    price: 45.00,
    imageUrl: 'https://images.unsplash.com/photo-1544383835-bda2bc66a55d?w=400',
    condition: 'Like New',
    isNew: true,
  ),
  Product(
    id: '2',
    title: 'MacBook Pro 14" M1',
    category: 'Tech & Gadgets',
    price: 850.00,
    imageUrl: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400',
    condition: 'Used',
  ),
  Product(
    id: '3',
    title: 'Modern Sociology Vol. 1',
    category: 'Social Sciences',
    price: 25.00,
    imageUrl: 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=400',
    condition: 'Annotated',
  ),
  Product(
    id: '4',
    title: 'Mechanical Keyboard',
    category: 'Accessories',
    price: 95.00,
    imageUrl: 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=400',
    condition: 'Wireless',
  ),
  Product(
    id: '5',
    title: 'Smartwatch Series 6',
    category: 'Wearables',
    price: 120.00,
    imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400',
    condition: 'Unboxed',
  ),
  Product(
    id: '6',
    title: 'Graphing Calculator',
    category: 'Math Tools',
    price: 15.00,
    imageUrl: 'https://images.unsplash.com/photo-1564466809058-bf4114d55352?w=400',
    condition: 'Essential',
  ),
];

const List<NewsItem> mockNews = [
  NewsItem(
    id: '1',
    title: 'New Research Grant Awarded to Engineering Faculty',
    category: 'Academic',
    description:
        'The \$2.4M grant will fund sustainable energy initiatives across the campus for the next 3 years.',
    imageUrl: 'https://images.unsplash.com/photo-1562774053-701939374585?w=800',
    isFeatured: true,
  ),
  NewsItem(
    id: '2',
    title: 'Registration for Fall Semester Now Open',
    category: 'Administrative',
    description: 'Check your enrollment window in the portal.',
    imageUrl: 'https://images.unsplash.com/photo-1580582932707-520aed937b7b?w=400',
  ),
  NewsItem(
    id: '3',
    title: 'Annual Career Fair — Spring 2026',
    category: 'Events',
    description: 'Prepare your digital portfolio for next Tuesday.',
    imageUrl: 'https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=400',
  ),
  NewsItem(
    id: '4',
    title: 'AI & Ethics Workshop',
    category: 'Workshop',
    description: 'Join the philosophy and tech departments this Friday.',
    imageUrl: 'https://images.unsplash.com/photo-1677442135703-1787eea5ce01?w=400',
  ),
];

const List<String> filterChips = [
  'All Items',
  'Textbooks',
  'Laptops',
  'Accessories',
  'Wearables',
];

const List<String> departments = [
  'Computer Science & Engineering',
  'Electrical Engineering',
  'Mechanical Engineering',
  'Business Administration',
  'Social Sciences',
  'Mathematics',
];
