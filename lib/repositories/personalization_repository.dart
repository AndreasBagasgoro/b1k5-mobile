import '../core/services/api_services.dart';
import '../models/personalization.dart';

class PersonalizationRepository {
  final ApiService _apiService;

  PersonalizationRepository(this._apiService);

  /// Retrieves the personalization configuration for a given user/customer ID.
  Future<Personalization> getPersonalization(String customerId) async {
    final response = await _apiService.getPersonalization(customerId);
    final data = response['data'] as Map<String, dynamic>? ?? {};
    return Personalization.fromJson(data);
  }
}
