class Author < ApplicationRecord
	has_and_belongs_to_many :books

	def name
		if self.lastname.to_s == ""
			return self.firstname.to_s
		else
			return self.firstname.to_s+" "+self.lastname.to_s
		end
	end
	def namelast
		if self.lastname.to_s == ""
			return self.firstname.to_s
		else
			return self.lastname.to_s+", "+self.firstname.to_s
		end
	end
end