// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_tasks.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredTasksHash() => r'88a93f66e3b174cb9857a71ea8464228390ecce4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [filteredTasks].
@ProviderFor(filteredTasks)
const filteredTasksProvider = FilteredTasksFamily();

/// See also [filteredTasks].
class FilteredTasksFamily extends Family<List<Task>> {
  /// See also [filteredTasks].
  const FilteredTasksFamily();

  /// See also [filteredTasks].
  FilteredTasksProvider call({
    required TaskFilter filter,
  }) {
    return FilteredTasksProvider(
      filter: filter,
    );
  }

  @override
  FilteredTasksProvider getProviderOverride(
    covariant FilteredTasksProvider provider,
  ) {
    return call(
      filter: provider.filter,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'filteredTasksProvider';
}

/// See also [filteredTasks].
class FilteredTasksProvider extends AutoDisposeProvider<List<Task>> {
  /// See also [filteredTasks].
  FilteredTasksProvider({
    required TaskFilter filter,
  }) : this._internal(
          (ref) => filteredTasks(
            ref as FilteredTasksRef,
            filter: filter,
          ),
          from: filteredTasksProvider,
          name: r'filteredTasksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredTasksHash,
          dependencies: FilteredTasksFamily._dependencies,
          allTransitiveDependencies:
              FilteredTasksFamily._allTransitiveDependencies,
          filter: filter,
        );

  FilteredTasksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final TaskFilter filter;

  @override
  Override overrideWith(
    List<Task> Function(FilteredTasksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilteredTasksProvider._internal(
        (ref) => create(ref as FilteredTasksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filter: filter,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<Task>> createElement() {
    return _FilteredTasksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredTasksProvider && other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FilteredTasksRef on AutoDisposeProviderRef<List<Task>> {
  /// The parameter `filter` of this provider.
  TaskFilter get filter;
}

class _FilteredTasksProviderElement
    extends AutoDisposeProviderElement<List<Task>> with FilteredTasksRef {
  _FilteredTasksProviderElement(super.provider);

  @override
  TaskFilter get filter => (origin as FilteredTasksProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
