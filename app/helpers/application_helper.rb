module ApplicationHelper
  def time_in_relative_words(time)
    time > DateTime.now ? distance_of_time_in_words_to_now(time) + ' from now' : time_ago_in_words(time) + ' ago'
  end
end
