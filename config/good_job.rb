Rails.application.configure do
  config.good_job.execution_mode = :external
  config.good_job.enable_cron = true
  config.good_job.cron = {
    order_create: {
      cron: '0 * * * 5', # NOTE: 毎週金曜日の0時に実行
      class: 'OrderCreateJob'
    },
  }
end
