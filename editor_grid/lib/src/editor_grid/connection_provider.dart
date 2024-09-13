import 'package:flutter/material.dart';

class ConnectionProvider extends InheritedWidget {
  final List<LinkPair> connections;

  const ConnectionProvider({
    super.key,
    required super.child,
    required this.connections,
  });

  static ConnectionProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ConnectionProvider>();
  }

  @override
  bool updateShouldNotify(ConnectionProvider oldWidget) {
    return connections != oldWidget.connections;
  }

  void addConnection(LinkPair connection) {
    connections.add(connection);
  }

  List<LinkPair> get validConnections => connections
      .where(
        (c) =>
            c.startId != c.endId && c.startId.isNotEmpty && c.endId.isNotEmpty,
      )
      .toList();

  List<LinkPair> getConnectionsFromId(String id) =>
      validConnections.where((element) => element.startId == id).toList();

  List<LinkPair> getConnectionsToId(String id) =>
      validConnections.where((element) => element.endId == id).toList();
}

class LinkPair {
  final String startId;
  final String endId;
  final String operation;
  final String? description;
  final Color? color;

  LinkPair({
    required this.startId,
    required this.endId,
    required this.operation,
    this.description,
    this.color,
  });
}
