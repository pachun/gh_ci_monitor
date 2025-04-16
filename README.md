# Github Actions CI Monitor

A GitHub Actions CI Monitoring app to keep your projects and their builds top of mind. (Written in rails).

![CI Monitor](https://raw.githubusercontent.com/pachun/gh_ci_monitor/main/assets/ci-monitor-screenshot.png)

## Usage

```bash
git clone https://github.com/pachun/gh_ci_monitor.git
cd gh_ci_monitor
heroku create my-ci-monitor
git push heroku main
```

Then:

```
heroku open
```

Copy the url. It'll be something like `https://my-ci-monitor-123.herokuapp.com`

Append `/webhook` to get: `https://my-ci-monitor-123.herokuapp.com/webhook`

Go to your GitHub project's homepage:

Settings → Webhooks → Add webhook

1. Set the payload URL to your version of the `https://my-ci-monitor-123.herokuapp.com/webhook` url from earlier
1. Set content type to `application/json`
1. Under "Which events would you like to trigger this webhook?" check the box for "Let me select individual events" and only check "Workflow runs"

You can use the same URL for multiple projects. The screen will show repo statuses in vertical columns.

[MIT License](/LICENSE)
