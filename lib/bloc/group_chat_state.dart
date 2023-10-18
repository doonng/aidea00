part of 'group_chat_bloc.dart';

@immutable
sealed class GroupChatState {}

final class GroupChatInitial extends GroupChatState {}

class GroupChatLoaded extends GroupChatState {
  final ChatGroup group;
  final Map<String, MessageState> states;

  GroupChatLoaded({required this.group, required this.states});
}

class GroupChatMessagesLoaded extends GroupChatState {
  final List<GroupMessage> messages;

  bool get hasWaitTasks =>
      messages.any((element) => element.status == groupMessageStatusWaiting);

  GroupChatMessagesLoaded({required this.messages});
}
