module Clearbit
  module Enrichment extend self
    autoload :Company, 'clearbit/enrichment/company'
    autoload :Person, 'clearbit/enrichment/person'
    autoload :PersonCompany, 'clearbit/enrichment/person_company'

    def find(values)
      if domain = values[:domain]
        result = Company.find(values)

        if result.pending?
          Pending.new
        else
          PersonCompany.new(company: result)
        end
      else
        PersonCompany.find(values)
      end
    end
  end
end