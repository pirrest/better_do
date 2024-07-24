// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags_for_task.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tagsForTaskHash() => r'df57f5f56977754c06643619825c83568b213ccd';

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

/// See also [tagsForTask].
@ProviderFor(tagsForTask)
const tagsForTaskProvider = TagsForTaskFamily();

/// See also [tagsForTask].
class TagsForTaskFamily extends Family<List<Tag>> {
  /// See also [tagsForTask].
  const TagsForTaskFamily();

  /// See also [tagsForTask].
  TagsForTaskProvider call({
    required int taskId,
  }) {
    return TagsForTaskProvider(
      taskId: taskId,
    );
  }

  @override
  TagsForTaskProvider getProviderOverride(
    covariant TagsForTaskProvider provider,
  ) {
    return call(
      taskId: provider.taskId,
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
  String? get name => r'tagsForTaskProvider';
}

/// See also [tagsForTask].
class TagsForTaskProvider extends AutoDisposeProvider<List<Tag>> {
  /// See also [tagsForTask].
  TagsForTaskProvider({
    required int taskId,
  }) : this._internal(
          (ref) => tagsForTask(
            ref as TagsForTaskRef,
            taskId: taskId,
          ),
          from: tagsForTaskProvider,
          name: r'tagsForTaskProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tagsForTaskHash,
          dependencies: TagsForTaskFamily._dependencies,
          allTransitiveDependencies:
              TagsForTaskFamily._allTransitiveDependencies,
          taskId: taskId,
        );

  TagsForTaskProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.taskId,
  }) : super.internal();

  final int taskId;

  @override
  Override overrideWith(
    List<Tag> Function(TagsForTaskRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TagsForTaskProvider._internal(
        (ref) => create(ref as TagsForTaskRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        taskId: taskId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<Tag>> createElement() {
    return _TagsForTaskProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TagsForTaskProvider && other.taskId == taskId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, taskId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TagsForTaskRef on AutoDisposeProviderRef<List<Tag>> {
  /// The parameter `taskId` of this provider.
  int get taskId;
}

class _TagsForTaskProviderElement extends AutoDisposeProviderElement<List<Tag>>
    with TagsForTaskRef {
  _TagsForTaskProviderElement(super.provider);

  @override
  int get taskId => (origin as TagsForTaskProvider).taskId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
