module SalesHelper
    def active_sale?
        #moved to sale.rb as class def
        # Sale.where("sales.starts_on <= ? AND sales.ends_on >= ?", 
        #     Date.current, Date.current).any? 
        
        #.any? checks if there is any logs
        #.where("") is an SQL statement query
        # ? representats a variable that we pass in --> Date.current
        
        Sale.active.any?
        
        #Sale.active.for_city('Toronto').above(5).any?
        #for_city('Toronto').above(5) checks for sales in Toronto above 5%
        #.above (5%).any? .any echeck query for any records
    end
end