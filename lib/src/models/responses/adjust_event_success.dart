/// Contains metadata about a successfully tracked event.
///
/// Delivered to [AdjustConfig.eventSuccessCallback] after each event is
/// successfully sent to Adjust servers.
class AdjustEventSuccess {
  /// A human-readable status message from the Adjust server.
  final String? message;

  /// The server-side timestamp of when the event was tracked.
  final String? timestamp;

  /// The Adjust device identifier (ADID) of the device that triggered this
  /// event.
  final String? adid;

  /// The event token of the tracked event.
  final String? eventToken;

  /// The callback ID that was set on the [AdjustEvent] via
  /// [AdjustEvent.callbackId].
  final String? callbackId;

  /// The raw JSON response body from the Adjust server.
  final String? jsonResponse;

  /// Creates an [AdjustEventSuccess] with the provided fields.
  AdjustEventSuccess({
    this.message,
    this.timestamp,
    this.adid,
    this.eventToken,
    this.callbackId,
    this.jsonResponse,
  });

  /// Creates an [AdjustEventSuccess] from a raw map received from the native
  /// SDK.
  factory AdjustEventSuccess.fromMap(dynamic map) {
    try {
      return AdjustEventSuccess(
        message: map['message'],
        timestamp: map['timestamp'],
        adid: map['adid'],
        eventToken: map['eventToken'],
        callbackId: map['callbackId'],
        jsonResponse: map['jsonResponse'],
      );
    } catch (e) {
      throw Exception(
          '[AdjustFlutter]: Failed to create AdjustEventSuccess object from given map object. Details: ' +
              e.toString());
    }
  }
}
