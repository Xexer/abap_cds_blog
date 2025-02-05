@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Hierarchy Node'
define hierarchy ZBS_I_DMOTeamViewHR
  as parent child hierarchy(
    source ZBS_I_DMOTeamView
    child to parent association _Leader
    start where
      TeamLeader is initial
    siblings order by
      UserIdentification
  )
{
  key UserIdentification,
  TeamLeader,
  $node.hierarchy_is_cycle    as NodeCycle,
  $node.hierarchy_is_orphan   as NodeOrphan,
  $node.hierarchy_level       as NodeLevel,
  $node.hierarchy_parent_rank as NodeParentRank,
  $node.hierarchy_rank        as NodeRank,
  $node.hierarchy_tree_size   as NodeTreeSize,
  $node.node_id               as NodeID,
  $node.parent_id             as NodeParentID

}
