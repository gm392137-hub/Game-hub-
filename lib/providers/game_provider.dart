import 'package:flutter/material.dart';
import '../models/game_model.dart';

class GameProvider extends ChangeNotifier {
  List<Game> _games = [];
  List<Game> _filteredGames = [];
  String _selectedCategory = 'All';
  String _searchQuery = '';

  List<Game> get games => _filteredGames.isEmpty ? _games : _filteredGames;
  String get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;

  List<String> get categories => ['All', 'Action', 'Puzzle', 'Adventure', 'Strategy', 'RPG'];

  GameProvider() {
    loadGames();
  }

  void loadGames() {
    _games = [
      Game(
        id: 1,
        title: 'Shadow Quest',
        description: 'An epic adventure game with stunning graphics and challenging quests.',
        category: 'Action',
        rating: 4.8,
        imageUrl: 'https://via.placeholder.com/300x400?text=Shadow+Quest',
        price: 4.99,
        downloads: 5000000,
        developer: 'Epic Games Studio',
        version: '2.5.1',
        releaseDate: '2023-01-15',
        size: '250 MB',
      ),
      Game(
        id: 2,
        title: 'Puzzle Master',
        description: 'Brain-teasing puzzle game with 1000+ levels.',
        category: 'Puzzle',
        rating: 4.6,
        imageUrl: 'https://via.placeholder.com/300x400?text=Puzzle+Master',
        price: 2.99,
        downloads: 3000000,
        developer: 'Puzzle Studios',
        version: '1.8.0',
        releaseDate: '2022-06-20',
        size: '120 MB',
      ),
      Game(
        id: 3,
        title: 'Dragon Slayer',
        description: 'Fight dragons and explore magical kingdoms.',
        category: 'RPG',
        rating: 4.9,
        imageUrl: 'https://via.placeholder.com/300x400?text=Dragon+Slayer',
        price: 6.99,
        downloads: 2500000,
        developer: 'Fantasy Games Inc',
        version: '3.0.0',
        releaseDate: '2023-03-10',
        size: '350 MB',
      ),
      Game(
        id: 4,
        title: 'Street Racing',
        description: 'High-speed racing action with real cars.',
        category: 'Action',
        rating: 4.5,
        imageUrl: 'https://via.placeholder.com/300x400?text=Street+Racing',
        price: 3.99,
        downloads: 4000000,
        developer: 'Speed Games',
        version: '2.1.0',
        releaseDate: '2023-02-14',
        size: '280 MB',
      ),
      Game(
        id: 5,
        title: 'Chess Master Pro',
        description: 'Play chess against AI with different difficulty levels.',
        category: 'Strategy',
        rating: 4.7,
        imageUrl: 'https://via.placeholder.com/300x400?text=Chess+Master',
        price: 1.99,
        downloads: 1500000,
        developer: 'Strategy World',
        version: '1.5.2',
        releaseDate: '2022-11-05',
        size: '50 MB',
      ),
      Game(
        id: 6,
        title: 'Lost Island Adventure',
        description: 'Explore mysterious islands and solve ancient puzzles.',
        category: 'Adventure',
        rating: 4.4,
        imageUrl: 'https://via.placeholder.com/300x400?text=Lost+Island',
        price: 5.99,
        downloads: 2000000,
        developer: 'Adventure Co',
        version: '1.3.0',
        releaseDate: '2023-04-22',
        size: '200 MB',
      ),
    ];
    notifyListeners();
  }

  void filterByCategory(String category) {
    _selectedCategory = category;
    _applyFilters();
  }

  void searchGames(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void _applyFilters() {
    _filteredGames = _games.where((game) {
      bool categoryMatch = _selectedCategory == 'All' || game.category == _selectedCategory;
      bool searchMatch = _searchQuery.isEmpty ||
          game.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          game.description.toLowerCase().contains(_searchQuery.toLowerCase());
      return categoryMatch && searchMatch;
    }).toList();
    notifyListeners();
  }
}
