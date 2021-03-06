class collectd::plugins::varnish (
  $modules,
  $filter_metrics = false,
  $filter_metric_rules = {},
  $plugin_template = 'collectd/plugins/varnish/10-varnish.conf.erb',
  $package_name = 'collectd-varnish',
  $package_ensure = present,
  $package_required = ($::osfamily == 'RedHat')
) {
  validate_hash($modules)
  Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }

  collectd::plugins::plugin_common { 'varnish':
    modules             => $modules,
    filter_metrics      => $filter_metrics,
    filter_metric_rules => $filter_metric_rules,
    package_name        => $package_name,
    package_ensure      => $package_ensure,
    package_required    => $package_required,
    plugin_file_name    => '10-varnish.conf',
    plugin_template     => $plugin_template,
  }
}
