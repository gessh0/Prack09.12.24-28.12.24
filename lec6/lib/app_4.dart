import 'package:flutter/material.dart';

class Book {
  final String title;
  final String author;

  Book(this.title, this.author);
}

class App4 extends StatefulWidget {
  const App4({super.key});

  @override
  State<App4> createState() => _App4State();
}

class _App4State extends State<App4> {
  final BookRouterDelegate _routerDelegate = BookRouterDelegate();
  final BookRouterInformationParser _routerInformationParser =
      BookRouterInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Список книг',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routerInformationParser,
    );
  }
}

class BookRouterInformationParser extends RouteInformationParser<BookRoutePath> {
  @override
  Future<BookRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = routeInformation.uri;

    if (uri.pathSegments.isEmpty) {
      return BookRoutePath.home();
    }
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] == 'book') {
        var remaining = uri.pathSegments[1];
        var id = int.tryParse(remaining);
        if (id == null) return BookRoutePath.unknown();
        return BookRoutePath.details(id);
      }
    }

    return BookRoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(BookRoutePath configuration) {
    if (configuration.isUnknown) {
      return RouteInformation(uri: Uri.parse('/404'));
    }
    if (configuration.isHomePage) {
      return RouteInformation(uri: Uri.parse('/'));
    }
    if (configuration.isDetailsPage) {
      return RouteInformation(uri: Uri.parse('/book/${configuration.id}'));
    }

    return RouteInformation();
  }
}

class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  Book? _selectedBook;
  bool show404 = false;

  List<Book> books = [
    Book('Так сложно любить отаку. Том 1', 'Фудзита'),
    Book('Так сложно любить отаку. Том 2', 'Фудзита'),
    Book('Так сложно любить отаку. Том 3', 'Фудзита'),
  ];

  BookRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  BookRoutePath get currentConfiguration {
    if (show404) {
      return BookRoutePath.unknown();
    }
    return _selectedBook == null
        ? BookRoutePath.home()
        : BookRoutePath.details(books.indexOf(_selectedBook!));
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('BooksListPage'),
          child: BooksListScreen(
            books: books,
            onTapped: _handleBookTapped,
          ),
        ),
        if (show404)
          const MaterialPage(
            key: ValueKey('UnknownPage'),
            child: UnknownScreen(),
          )
        else if (_selectedBook != null)
          MaterialPage(
            key: ValueKey('BookDetailsPage'),
            child: BookDetailsPage(book: _selectedBook!),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _selectedBook = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(BookRoutePath configuration) async {
    if (configuration.isUnknown) {
      _selectedBook = null;
      show404 = true;
      return;
    }

    if (configuration.isDetailsPage) {
      if (configuration.id! < 0 || configuration.id! > books.length - 1) {
        show404 = true;
        return;
      }

      _selectedBook = books[configuration.id!];
    } else {
      _selectedBook = null;
    }

    show404 = false;
  }

  void _handleBookTapped(Book book) {
    if (book.title == 'unknown') {
      show404 = true;
    } else {
      _selectedBook = book;
    }
    notifyListeners();
  }
}

class BookDetailsPage extends StatelessWidget {
  final Book book;

  const BookDetailsPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Center(
        child: Text(book.author),
      ),
    );
  }
}

class BookRoutePath {
  final int? id;
  final bool isUnknown;

  BookRoutePath.home()
      : id = null,
        isUnknown = false;

  BookRoutePath.details(this.id)
      : isUnknown = false;

  BookRoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHomePage => id == null && !isUnknown;
  bool get isDetailsPage => id != null && !isUnknown;
}

class BooksListScreen extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;

  const BooksListScreen({
    super.key,
    required this.books,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          for (var book in books)
            ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () => onTapped(book),
            ),
          ListTile(
            title: const Text('unknown'),
            subtitle: const Text('author'),
            onTap: () => onTapped(Book('unknown', 'author')),
          )
        ],
      ),
    );
  }
}

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404 Not Found'),
      ),
      body: const Center(
        child: Text('Page not found'),
      ),
    );
  }
}
