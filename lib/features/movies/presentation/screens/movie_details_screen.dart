import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_detail.dart';
import '../providers/movie_providers.dart';
import '../widgets/error_widget.dart';

class MovieDetailsScreen extends ConsumerStatefulWidget {
  final Movie movie;

  const MovieDetailsScreen({
    super.key,
    required this.movie,
  });

  @override
  ConsumerState<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends ConsumerState<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
    // Load movie details when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(movieDetailsProvider(widget.movie.id).notifier).getMovieDetails(widget.movie.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App bar with movie backdrop
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Backdrop image
                  widget.movie.backdropPath != null
                      ? CachedNetworkImage(
                          imageUrl: widget.movie.fullBackdropPath,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: Colors.grey[800],
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: Colors.grey[800],
                            child: const Icon(
                              Icons.movie,
                              size: 100,
                              color: Colors.white54,
                            ),
                          ),
                        )
                      : Container(
                          color: Colors.grey[800],
                          child: const Icon(
                            Icons.movie,
                            size: 100,
                            color: Colors.white54,
                          ),
                        ),
                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues( alpha: 0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          // Movie details content
          SliverToBoxAdapter(
            child: Consumer(
              builder: (context, ref, child) {
                final movieDetailsState = ref.watch(movieDetailsProvider(widget.movie.id));

                return movieDetailsState.when(
                  data: (movieDetail) => _buildMovieDetailsContent(movieDetail),
                  loading: () => const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (error, stackTrace) => Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: MovieErrorWidget(
                      message: error.toString(),
                      code: null,
                      onRetry: () =>
                          ref.read(movieDetailsProvider(widget.movie.id).notifier).getMovieDetails(widget.movie.id),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieDetailsContent(MovieDetail movieDetail) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Overview
          if (movieDetail.safeOverview.isNotEmpty) ...[
            const Text(
              'Overview',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              movieDetail.safeOverview,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
          ],

          // Genres
          if (movieDetail.safeGenres.isNotEmpty) ...[
            const Text(
              'Genres',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: movieDetail.safeGenres.map((genre) {
                return Chip(
                  label: Text(genre.name),
                  backgroundColor: Theme.of(context).primaryColor.withValues( alpha:0.1),
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
          ],

          // Additional details
          const Text(
            'Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Details grid
          _buildDetailsGrid(movieDetail),

          // Production companies
          if (movieDetail.safeProductionCompanies.isNotEmpty) ...[
            const Text(
              'Production Companies',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ...movieDetail.safeProductionCompanies.map((company) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    if (company.logoPath != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: CachedNetworkImage(
                            imageUrl: 'https://image.tmdb.org/t/p/w200${company.logoPath}',
                            fit: BoxFit.contain,
                            placeholder: (context, url) => Container(
                              color: Colors.grey[300],
                              child: const Icon(Icons.business),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.grey[300],
                              child: const Icon(Icons.business),
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            company.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (company.originCountry != null)
                            Text(
                              company.originCountry!,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailsGrid(MovieDetail movieDetail) {
    final details = <MapEntry<String, String>>[];

    if (movieDetail.safeRuntime > 0) {
      details.add(MapEntry('Runtime', '${movieDetail.safeRuntime} min'));
    }
    if (movieDetail.safeBudget > 0) {
      details.add(MapEntry('Budget', '\$${(movieDetail.safeBudget / 1000000).toStringAsFixed(1)}M'));
    }
    if (movieDetail.safeRevenue > 0) {
      details.add(MapEntry('Revenue', '\$${(movieDetail.safeRevenue / 1000000).toStringAsFixed(1)}M'));
    }
    if (movieDetail.safeStatus.isNotEmpty) {
      details.add(MapEntry('Status', movieDetail.safeStatus));
    }
    if (movieDetail.safeOriginalLanguage.isNotEmpty) {
      details.add(MapEntry('Original Language', movieDetail.safeOriginalLanguage.toUpperCase()));
    }
    if (movieDetail.safePopularity > 0) {
      details.add(MapEntry('Popularity', movieDetail.safePopularity.toStringAsFixed(1)));
    }

    if (details.isEmpty) return const SizedBox.shrink();

    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 4,
      ),
      itemCount: details.length,
      itemBuilder: (context, index) {
        final detail = details[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              detail.key,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              detail.value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      },
    );
  }

}
