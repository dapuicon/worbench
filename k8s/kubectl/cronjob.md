# CronJob

Stop / pause Cronjob

```bash
kubectl patch cronjobs <job-name> -p '{"spec" : {"suspend" : true }}'
```

