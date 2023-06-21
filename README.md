## Install

These plugins are used to add custom metrics, which can be sent with Telegraf to an influx db. These metrics are usually displayed later with Grafana.

There are currently 3 plugins:

- **telegraf_pfifgw.php**: Collects additional information about network cards, including gateway, packet loss and ping.
- **telegraf_temperature.sh**: Collects system and CPU temperatures.
- **telegraf_pinger_ploss.sh**: Allows collecting the ping in ms and packet loss in percentage, of some hosts that can be configured within it.

Plugins can be added on pfSense using the "Filer" package. 

Files created must have permissions **0755**

Next, the advanced configuration of Telegraf, again on pfSense, must be modified by importing the previously created files with the correct path.


```
  [[inputs.exec]]
    commands = [
      "/usr/local/bin/telegraf_pfifgw.php",
      "sh /usr/local/bin/telegraf_temperature.sh",
      "sh /usr/local/bin/telegraf_pinger_loss.sh"
  ]
  data_format = "influx"
  ```
  
## Grafana Dashboard

- **grafana-dashboard.json**: This is my personal grafana dashboard, you can download it and import into yours.
