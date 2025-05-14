                         TRACE: {
  "steps": [
    {
      "join_preparation": {
        "select#": 1,
        "steps": [
          {
            "IN_uses_bisection": true
          },
          {
            "expanded_query": "/* select#1 */ select artist.id AS id,artist.name AS name,artist.stage_name AS stage_name,avg((case when (criteria.category = 'artist performance') then review.score end)) AS avg_artist_performance,avg((case when (criteria.category = 'overall impression') then review.score end)) AS avg_overall_impression from ((((artist FORCE INDEX (PRIMARY) join artist_performance FORCE INDEX (fk_artist_id_idx) on((artist.id = artist_performance.artist_id))) join performance FORCE INDEX (PRIMARY) on((artist_performance.performance_id = performance.id))) join review FORCE INDEX (fk_performance_id) on((review.performance_id = performance.id))) join criteria FORCE INDEX (PRIMARY) on((criteria.id = review.criteria_id))) where (criteria.category in ('artist performance','overall impression')) group by artist.id,artist.name,artist.stage_name order by avg_artist_performance desc,avg_overall_impression desc"
          },
          {
            "transformations_to_nested_joins": {
              "transformations": [
                "JOIN_condition_to_WHERE",
                "parenthesis_removal"
              ],
              "expanded_query": "/* select#1 */ select artist.id AS id,artist.name AS name,artist.stage_name AS stage_name,avg((case when (criteria.category = 'artist performance') then review.score end)) AS avg_artist_performance,avg((case when (criteria.category = 'overall impression') then review.score end)) AS avg_overall_impression from artist FORCE INDEX (PRIMARY) join artist_performance FORCE INDEX (fk_artist_id_idx) join performance FORCE INDEX (PRIMARY) join review FORCE INDEX (fk_performance_id) join criteria FORCE INDEX (PRIMARY) where ((criteria.category in ('artist performance','overall impression')) and (criteria.id = review.criteria_id) and (review.performance_id = performance.id) and (artist_performance.performance_id = performance.id) and (artist.id = artist_performance.artist_id)) group by artist.id,artist.name,artist.stage_name order by avg_artist_performance desc,avg_overall_impression desc"
            }
          }
        ]
      }
    },
    {
      "join_optimization": {
        "select#": 1,
        "steps": [
          {
            "condition_processing": {
              "condition": "WHERE",
              "original_condition": "((criteria.category in ('artist performance','overall impression')) and (criteria.id = review.criteria_id) and (review.performance_id = performance.id) and (artist_performance.performance_id = performance.id) and (artist.id = artist_performance.artist_id))",
              "steps": [
                {
                  "transformation": "equality_propagation",
                  "resulting_condition": "((criteria.category in ('artist performance','overall impression')) and multiple equal(criteria.id, review.criteria_id) and multiple equal(review.performance_id, performance.id, artist_performance.performance_id) and multiple equal(artist.id, artist_performance.artist_id))"
                },
                {
                  "transformation": "constant_propagation",
                  "resulting_condition": "((criteria.category in ('artist performance','overall impression')) and multiple equal(criteria.id, review.criteria_id) and multiple equal(review.performance_id, performance.id, artist_performance.performance_id) and multiple equal(artist.id, artist_performance.artist_id))"
                },
                {
                  "transformation": "trivial_condition_removal",
                  "resulting_condition": "((criteria.category in ('artist performance','overall impression')) and multiple equal(criteria.id, review.criteria_id) and multiple equal(review.performance_id, performance.id, artist_performance.performance_id) and multiple equal(artist.id, artist_performance.artist_id))"
                }
              ]
            }
          },
          {
            "substitute_generated_columns": {
            }
          },
          {
            "table_dependencies": [
              {
                "table": "artist FORCE INDEX (PRIMARY)",
                "row_may_be_null": false,
                "map_bit": 0,
                "depends_on_map_bits": [
                ]
              },
              {
                "table": "artist_performance FORCE INDEX (fk_artist_id_idx)",
                "row_may_be_null": false,
                "map_bit": 1,
                "depends_on_map_bits": [
                ]
              },
              {
                "table": "performance FORCE INDEX (PRIMARY)",
                "row_may_be_null": false,
                "map_bit": 2,
                "depends_on_map_bits": [
                ]
              },
              {
                "table": "review FORCE INDEX (fk_performance_id)",
                "row_may_be_null": false,
                "map_bit": 3,
                "depends_on_map_bits": [
                ]
              },
              {
                "table": "criteria FORCE INDEX (PRIMARY)",
                "row_may_be_null": false,
                "map_bit": 4,
                "depends_on_map_bits": [
                ]
              }
            ]
          },
          {
            "ref_optimizer_key_uses": [
              {
                "table": "artist FORCE INDEX (PRIMARY)",
                "field": "id",
                "equals": "artist_performance.artist_id",
                "null_rejecting": false
              },
              {
                "table": "artist_performance FORCE INDEX (fk_artist_id_idx)",
                "field": "artist_id",
                "equals": "artist.id",
                "null_rejecting": false
              },
              {
                "table": "artist_performance FORCE INDEX (fk_artist_id_idx)",
                "field": "performance_id",
                "equals": "review.performance_id",
                "null_rejecting": false
              },
              {
                "table": "artist_performance FORCE INDEX (fk_artist_id_idx)",
                "field": "performance_id",
                "equals": "performance.id",
                "null_rejecting": false
              },
              {
                "table": "performance FORCE INDEX (PRIMARY)",
                "field": "id",
                "equals": "review.performance_id",
                "null_rejecting": false
              },
              {
                "table": "performance FORCE INDEX (PRIMARY)",
                "field": "id",
                "equals": "artist_performance.performance_id",
                "null_rejecting": false
              },
              {
                "table": "review FORCE INDEX (fk_performance_id)",
                "field": "performance_id",
                "equals": "performance.id",
                "null_rejecting": false
              },
              {
                "table": "review FORCE INDEX (fk_performance_id)",
                "field": "performance_id",
                "equals": "artist_performance.performance_id",
                "null_rejecting": false
              },
              {
                "table": "criteria FORCE INDEX (PRIMARY)",
                "field": "id",
                "equals": "review.criteria_id",
                "null_rejecting": false
              }
            ]
          },
          {
            "rows_estimation": [
              {
                "table": "artist FORCE INDEX (PRIMARY)",
                "table_scan": {
                  "rows": 200,
                  "cost": 4
                }
              },
              {
                "table": "artist_performance FORCE INDEX (fk_artist_id_idx)",
                "table_scan": {
                  "rows": 8449,
                  "cost": 19
                }
              },
              {
                "table": "performance FORCE INDEX (PRIMARY)",
                "table_scan": {
                  "rows": 900,
                  "cost": 5
                }
              },
              {
                "table": "review FORCE INDEX (fk_performance_id)",
                "table_scan": {
                  "rows": 239552,
                  "cost": 609
                }
              },
              {
                "table": "criteria FORCE INDEX (PRIMARY)",
                "table_scan": {
                  "rows": 5,
                  "cost": 1
                }
              }
            ]
          },
          {
            "considered_execution_plans": [
              {
                "plan_prefix": [
                ],
                "table": "criteria FORCE INDEX (PRIMARY)",
                "best_access_path": {
                  "considered_access_paths": [
                    {
                      "access_type": "ref",
                      "index": "PRIMARY",
                      "usable": false,
                      "chosen": false
                    },
                    {
                      "rows_to_scan": 5,
                      "access_type": "scan",
                      "resulting_rows": 2,
                      "cost": 7,
                      "chosen": true
                    }
                  ]
                },
                "condition_filtering_pct": 100,
                "rows_for_plan": 2,
                "cost_for_plan": 7,
                "rest_of_plan": [
                  {
                    "plan_prefix": [
                      "criteria FORCE INDEX (PRIMARY)"
                    ],
                    "table": "artist FORCE INDEX (PRIMARY)",
                    "best_access_path": {
                      "considered_access_paths": [
                        {
                          "access_type": "ref",
                          "index": "PRIMARY",
                          "usable": false,
                          "chosen": false
                        },
                        {
                          "rows_to_scan": 200,
                          "access_type": "scan",
                          "using_join_cache": true,
                          "buffers_needed": 1,
                          "resulting_rows": 200,
                          "cost": 281.13,
                          "chosen": true
                        }
                      ]
                    },
                    "condition_filtering_pct": 100,
                    "rows_for_plan": 400,
                    "cost_for_plan": 288.13,
                    "rest_of_plan": [
                      {
                        "plan_prefix": [
                          "criteria FORCE INDEX (PRIMARY)",
                          "artist FORCE INDEX (PRIMARY)"
                        ],
                        "table": "performance FORCE INDEX (PRIMARY)",
                        "best_access_path": {
                          "considered_access_paths": [
                            {
                              "access_type": "ref",
                              "index": "PRIMARY",
                              "usable": false,
                              "chosen": false
                            },
                            {
                              "rows_to_scan": 900,
                              "access_type": "scan",
                              "using_join_cache": true,
                              "buffers_needed": 1,
                              "resulting_rows": 900,
                              "cost": 73521,
                              "chosen": true
                            }
                          ]
                        },
                        "condition_filtering_pct": 100,
                        "rows_for_plan": 360000,
                        "cost_for_plan": 73809,
                        "rest_of_plan": [
                          {
                            "plan_prefix": [
                              "criteria FORCE INDEX (PRIMARY)",
                              "artist FORCE INDEX (PRIMARY)",
                              "performance FORCE INDEX (PRIMARY)"
                            ],
                            "table": "artist_performance FORCE INDEX (fk_artist_id_idx)",
                            "best_access_path": {
                              "considered_access_paths": [
                                {
                                  "access_type": "ref",
                                  "index": "fk_artist_id_idx",
                                  "rows": 1,
                                  "cost": 432000,
                                  "chosen": true
                                },
                                {
                                  "access_type": "scan",
                                  "chosen": false,
                                  "cause": "covering_index_better_than_full_scan"
                                }
                              ]
                            },
                            "condition_filtering_pct": 100,
                            "rows_for_plan": 360000,
                            "cost_for_plan": 505809,
                            "rest_of_plan": [
                              {
                                "plan_prefix": [
                                  "criteria FORCE INDEX (PRIMARY)",
                                  "artist FORCE INDEX (PRIMARY)",
                                  "performance FORCE INDEX (PRIMARY)",
                                  "artist_performance FORCE INDEX (fk_artist_id_idx)"
                                ],
                                "table": "review FORCE INDEX (fk_performance_id)",
                                "best_access_path": {
                                  "considered_access_paths": [
                                    {
                                      "access_type": "ref",
                                      "index": "fk_performance_id",
                                      "rows": 266.17,
                                      "cost": 1.15e8,
                                      "chosen": true
                                    },
                                    {
                                      "access_type": "scan",
                                      "chosen": false,
                                      "cause": "force_index"
                                    }
                                  ]
                                },
                                "added_to_eq_ref_extension": false
                              },
                              {
                                "plan_prefix": [
                                  "criteria FORCE INDEX (PRIMARY)",
                                  "artist FORCE INDEX (PRIMARY)",
MISSING_BYTES_BEYOND_MAX_MEM_SIZE: 225735
          INSUFFICIENT_PRIVILEGES: 0
          
1 row in set (0.00 sec)
