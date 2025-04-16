class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def github
    return head :ok unless request.headers["X-GitHub-Event"] == "workflow_run"

    data = JSON.parse(request.body.read)
    run = data["workflow_run"]

    branch = run["head_branch"]
    return head :ok unless branch == "main"

    if %w[queued in_progress completed].include?(run["status"])
      ActionCable.server.broadcast("ci", {
        repo: data["repository"]["full_name"],
        branch: run["head_branch"],
        commit: run["head_commit"]["message"],
        url: run["html_url"],
        status: run["status"],
        conclusion: run["conclusion"],
        created_at: run["created_at"],
        updated_at: run["updated_at"],
      })
    end

    head :ok
  end
end
