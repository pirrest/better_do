// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_for_tag.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tasksForTagHash() => r'9f2428ec0febe7f6cd47ed0f6c7f14a6a387d25e';

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

/// See also [tasksForTag].
@ProviderFor(tasksForTag)
const tasksForTagProvider = TasksForTagFamily();

/// See also [tasksForTag].
class TasksForTagFamily extends Family<List<Task>> {
  /// See also [tasksForTag].
  const TasksForTagFamily();

  /// See also [tasksForTag].
  TasksForTagProvider call({
    required Tag tag,
  }) {
    return TasksForTagProvider(
      tag: tag,
    );
  }

  @override
  TasksForTagProvider getProviderOverride(
    covariant TasksForTagProvider provider,
  ) {
    return call(
      tag: provider.tag,
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
  String? get name => r'tasksForTagProvider';
}

/// See also [tasksForTag].
class TasksForTagProvider extends AutoDisposeProvider<List<Task>> {
  /// See also [tasksForTag].
  TasksForTagProvider({
    required Tag tag,
  }) : this._internal(
          (ref) => tasksForTag(
            ref as TasksForTagRef,
            tag: tag,
          ),
          from: tasksForTagProvider,
          name: r'tasksForTagProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tasksForTagHash,
          dependencies: TasksForTagFamily._dependencies,
          allTransitiveDependencies:
              TasksForTagFamily._allTransitiveDependencies,
          tag: tag,
        );

  TasksForTagProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tag,
  }) : super.internal();

  final Tag tag;

  @override
  Override overrideWith(
    List<Task> Function(TasksForTagRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TasksForTagProvider._internal(
        (ref) => create(ref as TasksForTagRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tag: tag,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<Task>> createElement() {
    return _TasksForTagProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TasksForTagProvider && other.tag == tag;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tag.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TasksForTagRef on AutoDisposeProviderRef<List<Task>> {
  /// The parameter `tag` of this provider.
  Tag get tag;
}

class _TasksForTagProviderElement extends AutoDisposeProviderElement<List<Task>>
    with TasksForTagRef {
  _TasksForTagProviderElement(super.provider);

  @override
  Tag get tag => (origin as TasksForTagProvider).tag;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
