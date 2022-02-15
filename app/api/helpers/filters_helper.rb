# frozen_string_literal: true

module FiltersHelper
  extend Grape::API::Helpers

  params :filters do
    optional :all,
             type: Boolean,
             desc: 'Вывести все дела (включая завершенные)'
  end
end
