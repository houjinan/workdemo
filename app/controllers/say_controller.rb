class SayController < ApplicationController
	skip_before_filter :authorize
	layout "welcome"
  def hello
  end

  def goodbye
  end

  def say
  end
end
