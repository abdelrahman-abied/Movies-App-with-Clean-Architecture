import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/theme_extansions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/movie_providers.dart';
import '../state/movie_state.dart';
import '../widgets/error_widget.dart';
import '../widgets/movie_card.dart';
import 'movie_details_screen.dart';

class MovieListScreen extends ConsumerStatefulWidget {
  const MovieListScreen({super.key});

  @override
  ConsumerState<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends ConsumerState<MovieListScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);

    // Load initial data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(popularMoviesProvider.notifier).getPopularMovies(refresh: true);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (_tabController.index == 0) {
      ref.read(popularMoviesProvider.notifier).getPopularMovies(refresh: true);
    } else {
      ref.read(topRatedMoviesProvider.notifier).getTopRatedMovies(refresh: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Popular Movies'),
            Tab(text: 'Top Rated Movies'),
          ],
        ),
        leading: Consumer(builder: (context, ref, child) {
          return IconButton(
            icon: Icon(
              Icons.contrast,
              color: Theme.of(context).colorTheme.iconColor,
            ),
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
          );
        }),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Navigate to search screen
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMovieList(popularMoviesProvider),
          _buildMovieList(topRatedMoviesProvider),
        ],
      ),
    );
  }

  Widget _buildMovieList(StateNotifierProvider<dynamic, MovieState> provider) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(provider);
        return _buildMovieListContent(state, provider);
      },
    );
  }

  Widget _buildMovieListContent(MovieState state, StateNotifierProvider<dynamic, MovieState> provider) {
    if (state is MovieInitial) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is MovieLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is MovieError) {
      return MovieErrorWidget(
        message: state.message,
        code: state.code,
        onRetry: () => _retry(provider),
      );
    } else if (state is MovieEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.movie,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            const Text(
              'No movies found',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      );
    } else if (state is MovieLoaded) {
      return RefreshIndicator(
        onRefresh: () => _refresh(provider),
        child: GridView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: state.movies.length + (state.hasReachedMax ? 0 : 1),
          itemBuilder: (context, index) {
            if (index == state.movies.length) {
              // Load more indicator
              _loadMore(provider, state.currentPage + 1);
              return const Center(child: CircularProgressIndicator());
            }

            final movie = state.movies[index];
            return MovieCard(
              movie: movie,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MovieDetailsScreen(movie: movie),
                  ),
                );
              },
            );
          },
        ),
      );
    }

    return const SizedBox.shrink();
  }

  void _retry(StateNotifierProvider<dynamic, MovieState> provider) {
    if (provider == popularMoviesProvider) {
      ref.read(popularMoviesProvider.notifier).getPopularMovies(refresh: true);
    } else if (provider == topRatedMoviesProvider) {
      ref.read(topRatedMoviesProvider.notifier).getTopRatedMovies(refresh: true);
    }
  }

  Future<void> _refresh(StateNotifierProvider<dynamic, MovieState> provider) async {
    if (provider == popularMoviesProvider) {
      await ref.read(popularMoviesProvider.notifier).getPopularMovies(refresh: true);
    } else if (provider == topRatedMoviesProvider) {
      await ref.read(topRatedMoviesProvider.notifier).getTopRatedMovies(refresh: true);
    }
  }

  void _loadMore(StateNotifierProvider<dynamic, MovieState> provider, int page) {
    if (provider == popularMoviesProvider) {
      ref.read(popularMoviesProvider.notifier).getPopularMovies(page: page);
    } else if (provider == topRatedMoviesProvider) {
      ref.read(topRatedMoviesProvider.notifier).getTopRatedMovies(page: page);
    }
  }
}
