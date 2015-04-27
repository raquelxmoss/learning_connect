module RatingsHelper

  def find_tutor_rate_learner(course)
    course.ratings.find_by(rating_type:"tutor_rate_learner")
  end

  def find_learner_rate_tutor(course)
    course.ratings.find_by(rating_type:"learner_rate_tutor")
  end
end
