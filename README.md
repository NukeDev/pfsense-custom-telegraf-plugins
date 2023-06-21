## Telegraf additional config to include plugins

```
  [[inputs.exec]]
    commands = [
      "/usr/local/bin/telegraf_pfifgw.php",
      "sh /usr/local/bin/telegraf_temperature.sh",
      "sh /usr/local/bin/telegraf_pinger_loss.sh"
  ]
  data_format = "influx"
  ```
  
*Remeber to save the plugins with **0755** permissions.*
