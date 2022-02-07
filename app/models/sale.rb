class Sale < ActiveRecord::Base

    def finished? #? --> means its boolean (returns true or false)
        # if self.ends_on < Date.current --> same as below
        ends_on < Date.current
    end
    def upcoming?
        # if self.starts_on > Date.current self.starts_on here is same as starts_on
        starts_on > Date.current
    end
    def active?
        !upcoming? && !finished? #if not upcoming and not finished then it must be active
    end

    #ActiveRecord Scope creation to query Sales from DB to be used in sales_helper.rb
    def self.active 
        where("sales.starts_on <= ? AND sales.ends_on >= ?", 
            Date.current, Date.current)
    end
end
