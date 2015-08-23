module Presenters
  module Helper
    def present(*args, &block)
      Helper.present(*args, &block)
    end

    def present_each(instances, class_type = nil, &block)
      instances.each do |instance|
        present(instance, class_type, &block)
      end
    end

    def presenters(instances, class_type = nil)
      instances.map do |instance|
        present(instance)
      end
    end

    def self.present(instance, class_type = nil, &block)
      class_type = class_type || Object.const_get("#{instance.class}Presenter")
      presenter = class_type.new(instance)
      yield(presenter) if block_given?
      return presenter
    end
  end
end
