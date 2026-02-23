/// Contains details about a failed event tracking attempt.
///
/// Delivered to [AdjustConfig.eventFailureCallback] when an event could not
/// be sent to Adjust servers. Check [willRetry] to determine whether the SDK
/// will attempt to resend the event automatically.
class AdjustEventFailure {
  /// A human-readable description of the failure reason.
  final String? message;

  /// The timestamp of the failed tracking attempt.
  final String? timestamp;

  /// The Adjust device identifier (ADID) of the device that triggered this
  /// event.
  final String? adid;

  /// The event token of the event that failed to be tracked.
  final String? eventToken;

  /// The callback ID that was set on the [AdjustEvent] via
  /// [AdjustEvent.callbackId].
  final String? callbackId;

  /// The raw JSON response body from the Adjust server, if any was received.
  final String? jsonResponse;

  /// Whether the SDK will automatically retry sending this event.
  ///
  /// When `true`, the SDK has queued the event for a later retry. When
  /// `false`, the event has been dropped and will not be retried.
  final bool? willRetry;

  /// Creates an [AdjustEventFailure] with the provided fields.
  AdjustEventFailure({
    this.message,
    this.timestamp,
    this.adid,
    this.eventToken,
    this.callbackId,
    this.jsonResponse,
    this.willRetry,
  });

  /// Creates an [AdjustEventFailure] from a raw map received from the native
  /// SDK.
  factory AdjustEventFailure.fromMap(dynamic map) {
    try {
      return AdjustEventFailure(
        message: map['message'],
        timestamp: map['timestamp'],
        adid: map['adid'],
        eventToken: map['eventToken'],
        callbackId: map['callbackId'],
        jsonResponse: map['jsonResponse'],
        willRetry: map['willRetry']?.toString().toLowerCase() == 'true',
      );
    } catch (e) {
      throw Exception(
          '[AdjustFlutter]: Failed to create AdjustEventFailure object from given map object. Details: ' +
              e.toString());
    }
  }
}
