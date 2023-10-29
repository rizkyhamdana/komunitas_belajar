import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:komunitas_belajar/data/model/list_class.dart';
import 'package:komunitas_belajar/data/model/member.dart';

@immutable
class CommunityEventUploadState extends Equatable {
  const CommunityEventUploadState();
  @override
  List<Object> get props => [];
}

class CommunityEventUploadInitial extends CommunityEventUploadState {}

class CommunityEventUploadLoading extends CommunityEventUploadState {}

class CommunityEventUploadLoaded extends CommunityEventUploadState {}

class CommunityEventUploadError extends CommunityEventUploadState {
  final String error;
  const CommunityEventUploadError({required this.error});
}

class MemberLoaded extends CommunityEventUploadState {
  final List<Member> listMember;
  const MemberLoaded({required this.listMember});
}

class ListClassLoaded extends CommunityEventUploadState {
  final List<ListClass> listClass;
  const ListClassLoaded({required this.listClass});
}
