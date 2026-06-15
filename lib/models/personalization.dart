class Personalization {
  final String customerId;
  final HomepageConfig homepage;

  Personalization({
    required this.customerId,
    required this.homepage,
  });

  factory Personalization.fromJson(Map<String, dynamic> json) {
    return Personalization(
      customerId: json['customer_id'] ?? '',
      homepage: HomepageConfig.fromJson(json['homepage'] ?? {}),
    );
  }
}

class HomepageConfig {
  final String primaryFeature;
  final SegmentInfo? segment;
  final List<QuickAction> quickActions;
  final List<RecommendedSection> recommendedSections;

  HomepageConfig({
    required this.primaryFeature,
    this.segment,
    required this.quickActions,
    required this.recommendedSections,
  });

  factory HomepageConfig.fromJson(Map<String, dynamic> json) {
    return HomepageConfig(
      primaryFeature: json['primary_feature'] ?? '',
      segment: json['segment'] != null && (json['segment'] as Map).isNotEmpty
          ? SegmentInfo.fromJson(json['segment'])
          : null,
      quickActions: (json['quick_actions'] as List<dynamic>?)
              ?.map((e) => QuickAction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      recommendedSections: (json['recommended_sections'] as List<dynamic>?)
              ?.map((e) => RecommendedSection.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class SegmentInfo {
  final int id;
  final String name;
  final double confidence;

  SegmentInfo({
    required this.id,
    required this.name,
    required this.confidence,
  });

  factory SegmentInfo.fromJson(Map<String, dynamic> json) {
    return SegmentInfo(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      confidence: (json['confidence'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class QuickAction {
  final String feature;
  final int usageCount;
  final String lastUsedAt;

  QuickAction({
    required this.feature,
    required this.usageCount,
    required this.lastUsedAt,
  });

  factory QuickAction.fromJson(Map<String, dynamic> json) {
    return QuickAction(
      feature: json['feature'] ?? '',
      usageCount: json['usage_count'] ?? 0,
      lastUsedAt: json['last_used_at'] ?? '',
    );
  }
}

class RecommendedSection {
  final int id;
  final String feature;
  final String reason;
  final int priority;

  RecommendedSection({
    required this.id,
    required this.feature,
    required this.reason,
    required this.priority,
  });

  factory RecommendedSection.fromJson(Map<String, dynamic> json) {
    return RecommendedSection(
      id: json['id'] ?? 0,
      feature: json['feature'] ?? '',
      reason: json['reason'] ?? '',
      priority: json['priority'] ?? 0,
    );
  }
}
