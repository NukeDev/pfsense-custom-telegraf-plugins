## Install

These plugins are used to add custom metrics, which can be sent with Telegraf to an influx db. These metrics are usually displayed later with Grafana.

There are currently 3 plugins:

- **telegraf_pfifgw.php**: Collects additional information about network cards, including gateway, packet loss and ping.
- **telegraf_temperature.sh**: Collects system and CPU temperatures.
- **telegraf_pinger_ploss.sh**: Allows collecting the ping in ms and packet loss in percentage, of some hosts that can be configured within it.
- **telegraf_old_gateways.py (for pfSense < 2.4.5)**: Collects additional information gateway, rtt, rttsd and loss.
- **telegraf_new_gateways.py (for pfSense >= 2.4.5)**: Collects additional information gateway, rtt, rttsd and loss.

Plugins can be added on pfSense using the "Filer" package.

Files created must have permissions **0755**

Next, the advanced configuration of Telegraf, again on pfSense, must be modified by importing the previously created files with the correct path.

# Additional configuration for Telegraf

### pfSense < 2.4.5

```
[[inputs.exec]]
commands = [
  "/usr/local/libexec/telegraf/telegraf_old_gateways.py",
  "/usr/local/bin/telegraf_pfifgw.php",
  "sh /usr/local/bin/telegraf_temperature.sh",
  "sh /usr/local/bin/telegraf_pinger_ploss.sh"
]
timeout = "10s"
data_format = "influx"
```

### pfSense >= 2.4.5

```
[[inputs.exec]]
commands = [
  "/usr/local/libexec/telegraf/telegraf_new_gateways.py",
  "/usr/local/bin/telegraf_pfifgw.php",
  "sh /usr/local/bin/telegraf_temperature.sh",
  "sh /usr/local/bin/telegraf_pinger_ploss.sh"
]
timeout = "10s"
data_format = "influx"
```

## Grafana Dashboard

- **grafana-dashboard.json**: This is my personal grafana dashboard, you can download it and import into yours.
