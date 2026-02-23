/// Contains metadata about a successfully tracked session.
///
/// Delivered to [AdjustConfig.sessionSuccessCallback] after each session is
/// successfully sent to Adjust servers.
class AdjustSessionSuccess {
  /// A human-readable status message from the Adjust server.
  final String? message;

  /// The server-side timestamp of when the session was tracked.
  final String? timestamp;

  /// The Adjust device identifier (ADID) of the device for this session.
  final String? adid;

  /// The raw JSON response body from the Adjust server.
  final String? jsonResponse;

  /// Creates an [AdjustSessionSuccess] with the provided fields.
  AdjustSessionSuccess({
    this.message,
    this.timestamp,
    this.adid,
    this.jsonResponse,
  });

  /// Creates an [AdjustSessionSuccess] from a raw map received from the native
  /// SDK.
  factory AdjustSessionSuccess.fromMap(dynamic map) {
    try {
      return AdjustSessionSuccess(
        message: map['message'],
        timestamp: map['timestamp'],
        adid: map['adid'],
        jsonResponse: map['jsonResponse'],
      );
    } catch (e) {
      throw Exception(
          '[AdjustFlutter]: Failed to create AdjustSessionSuccess object from given map object. Details: ' +
              e.toString());
    }
  }
}
