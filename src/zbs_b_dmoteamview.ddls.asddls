@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Team View'
define view entity ZBS_B_DMOTeamView
  as select from zbs_dmo_team
{
      @EndUserText.label: 'User ID'
      @EndUserText.quickInfo: 'User ID'
      @UI.lineItem: [{ label: 'User ID' }]
  key user_id         as UserIdentification,
      @EndUserText.label: 'Name'
      player_name     as PlayerFullName,
      @EndUserText.label: 'E-Mail'
      player_email    as EMailAddress,
      @EndUserText.label: 'Position'
      player_position as PlayerPosition,
      @EndUserText.label: 'ELO Score'
      score           as ELOScore,
      @EndUserText.label: 'Team'
      team            as TeamName,
      @EndUserText.label: 'Leader'
      team_leader     as TeamLeader
}
