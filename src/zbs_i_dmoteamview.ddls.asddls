@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Team'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBS_I_DMOTeamView
  as select from ZBS_B_DMOTeamView
  association of many to one ZBS_I_DMOTeamView as _Leader on _Leader.UserIdentification = $projection.TeamLeader
{
  key UserIdentification,
      PlayerFullName,
      EMailAddress,
      PlayerPosition,
      ELOScore,
      TeamName,
      TeamLeader,
      _Leader
}
