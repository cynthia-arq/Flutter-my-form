class Session {
  final String sessionId;
  final String duration;
  final String nextSession;
  final String sessionEndTime;
  final String sessionTime;
  final String userBooked;

  Session(this.sessionId,
      this.duration,
      this.nextSession,
      this.sessionEndTime,
      this.sessionTime,
      this.userBooked);

  Session.fromJSON(Map<String, dynamic> json)
      : sessionId = json["sessionid"],
        duration  = json["duration"],
        nextSession = json["next_session"],
        sessionEndTime = json["session_end_time"],
        sessionTime = json["session_time"],
        userBooked = json["user_booked"];
}
