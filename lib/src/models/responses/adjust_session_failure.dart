/// Contains details about a failed session tracking attempt.
///
/// Delivered to [AdjustConfig.sessionFailureCallback] when a session could
/// not be sent to Adjust servers. Check [willRetry] to determine whether the
/// SDK will attempt to resend the session automatically.
class AdjustSessionFailure {
  /// A human-readable description of the failure reason.
  final String? message;

  /// The timestamp of the failed tracking attempt.
  final String? timestamp;

  /// The Adjust device identifier (ADID) of the device for this session.
  final String? adid;

  /// The raw JSON response body from the Adjust server, if any was received.
  final String? jsonResponse;

  /// Whether the SDK will automatically retry sending this session.
  ///
  /// When `true`, the SDK has queued the session for a later retry. When
  /// `false`, the session has been dropped and will not be retried.
  final bool? willRetry;

  /// Creates an [AdjustSessionFailure] with the provided fields.
  AdjustSessionFailure({
    this.message,
    this.timestamp,
    this.adid,
    this.jsonResponse,
    this.willRetry,
  });

  /// Creates an [AdjustSessionFailure] from a raw map received from the native
  /// SDK.
  factory AdjustSessionFailure.fromMap(dynamic map) {
    try {
      return AdjustSessionFailure(
        message: map['message'],
        timestamp: map['timestamp'],
        adid: map['adid'],
        jsonResponse: map['jsonResponse'],
        willRetry: map['willRetry']?.toString().toLowerCase() == 'true',
      );
    } catch (e) {
      throw Exception(
          '[AdjustFlutter]: Failed to create AdjustSessionFailure object from given map object. Details: ' +
              e.toString());
    }
  }
}
