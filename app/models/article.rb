# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
end
