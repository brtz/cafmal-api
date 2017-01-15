# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# teams and users

t_admins = Team.create(name: 'Admins')
u_admin = User.create(email: 'admin@example.com', password: 'cafmal', firstname: 'Otto', lastname: 'ottO', role: :admin, team: t_admins)

t_users = Team.create(name: 'Testusers')
u_lead = User.create(email: 'lead@example.com', password: 'foobar', firstname: 'Lead', lastname: 'McLead', role: :lead, team: t_users)
u_user = User.create(email: 'testuser@example.com', password: 'foobarbaz', firstname: 'Peter', lastname: 'Lustig', role: :user, team: t_users)

t_workers = Team.create(name: 'Workers')
u_worker = User.create(email: 'worker@example.com', password: 'barfoo', firstname: 'Hard', lastname: 'Worker', role: :worker, team: t_workers)

t_alerters = Team.create(name: 'Alerters')
u_alerter = User.create(email: 'alerter@example.com', password: 'barfoo', firstname: 'Fast', lastname: 'Alerter', role: :alerter, team: t_alerters)

# datesources
d1 = Datasource.create(sourcetype: 'elasticsearch', address: 'elasticsearch', port: 9200, protocol: 'http://', name: 'my_es')
d2 = Datasource.create(sourcetype: 'influxdb', address: 'influxdb', port: 8086, protocol: 'http://', name: 'my_influxdb', username: 'admin', password: 'blub')

# checks
c_es = Check.create(
  category: 'system',
  name: 'syslog_events',
  condition_query: '{ "query": { "bool": { "must": { "wildcard": { "type": "syslog" } }, "filter": { "range" : { "@timestamp" : { "gte" : "now-5m", "lt" : "now" } } } } } }',
  condition_operator: 'greaterThanOrEqual',
  condition_aggregator: 'elasticsearch_count',
  condition_value: 35.0,
  severity: 'warning',
  interval: 60,
  team: t_users,
  datasource: d1,
  documentation_url: 'http://www.google.de'
)
c_i1 = Check.create(
  category: 'system',
  name: 'count_swap_above_0',
  condition_query: 'SELECT percentile("used", 95) FROM "swap" WHERE time > now() - 5m AND "used" > 0 GROUP BY "host"',
  condition_operator: 'greaterThan',
  condition_aggregator: 'influxdb_count',
  condition_value: 0.0,
  index: 'telegraf',
  severity: 'critical',
  interval: 60,
  team: t_users,
  datasource: d2,
  documentation_url: 'http://www.google.de'
)
c_i2 = Check.create(
  category: 'system',
  name: 'cpu_idle_below_90%_all',
  condition_query: 'SELECT percentile("usage_idle", 95) FROM "cpu" WHERE "cpu" = \'cpu-total\' AND time > now() - 5m GROUP BY "host"',
  condition_operator: 'lowerThanOrEqual',
  condition_aggregator: 'influxdb_basic_all',
  condition_value: 90.0,
  index: 'telegraf',
  severity: 'critical',
  interval: 60,
  team: t_users,
  datasource: d2,
  documentation_url: 'http://www.google.de'
)
c_i3 = Check.create(
  category: 'system',
  name: 'cpu_idle_below_90%_distinct',
  condition_query: 'SELECT percentile("usage_idle", 95) FROM "cpu" WHERE "cpu" = \'cpu-total\' AND time > now() - 5m GROUP BY "host"',
  condition_operator: 'lowerThan',
  condition_aggregator: 'influxdb_basic_distinct',
  condition_value: 90.0,
  index: 'telegraf',
  severity: 'warning',
  interval: 60,
  team: t_users,
  datasource: d2,
  documentation_url: 'http://www.google.de'
)
c_i4 = Check.create(
  category: 'system',
  name: 'mem_below_10%_distinct',
  condition_query: 'SELECT percentile("available_percent", 95) FROM "mem" WHERE time > now() - 5m GROUP BY "host"',
  condition_operator: 'lowerThan',
  condition_aggregator: 'influxdb_basic_distinct',
  condition_value: 10.0,
  index: 'telegraf',
  severity: 'critical',
  interval: 60,
  team: t_users,
  datasource: d2,
  documentation_url: 'http://www.google.de'
)
c_i5 = Check.create(
  category: 'application',
  name: 'api_response_above_200ms_distinct',
  condition_query: 'SELECT percentile("response_time", 95) FROM "http_response" WHERE time > now() - 5m GROUP BY "host", "server"',
  condition_operator: 'greaterThan',
  condition_aggregator: 'influxdb_basic_distinct',
  condition_value: 0.200,
  index: 'telegraf',
  severity: 'critical',
  interval: 60,
  team: t_users,
  datasource: d2,
  documentation_url: 'http://www.google.de'
)

# alerts
a_1 = Alert.create(
  alert_method: 'webhook',
  alert_target: 'https://lurkerden.no-ip.org',
  cooldown: 10,
  pattern: 'system.*',
  minimum_severity: 'critical',
  is_enabled: true,
  is_silenced: false,
  team: t_users
)
