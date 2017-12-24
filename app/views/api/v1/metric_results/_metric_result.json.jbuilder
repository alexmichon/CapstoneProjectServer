json.id metric_result.id
json.metric_goal metric_result.metric_goal, partial: 'api/v1/metric_goals/metric_goal', as: :metric_goal
json.exercise_result_id metric_result.exercise_result_id
json.metric_id metric_result.metric_id
json.metric_name metric_result.metric.name
json.actual metric_result.actual
json.expected metric_result.expected