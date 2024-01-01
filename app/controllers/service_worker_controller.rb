class ServiceWorkerController < ApplicationController
  protect_from_forgery except: :service_worker

  def service_worker
    respond_to do |format|
      format.js {
        render template: "service_worker/service-worker",
        layout: false
      }
    end
  end

  def manifest;end
end
