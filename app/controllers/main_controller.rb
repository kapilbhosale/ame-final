class MainController < ApplicationController
	skip_before_action :verify_authenticity_token, :only => [:analyze]

	def index
	end	

	def analyze
		puts 'inside analyze'
		@params = params

		@branches = Cutoff.uniq.pluck(:branch_name)
		@universities = CollegeUniversity.uniq.pluck(:university)
		@caste = Cutoff.uniq.pluck(:cast)

		if params.size <=2 
			@cutoffs = Cutoff.where.not(rank_closed: 0, cast: 'AI').order(:marks_closed => :desc).limit(100)
		else

			rank = params[:inputRank].to_i
			rank_min = params[:below].to_i
			rank_max = params[:above].to_i
			str_caste = params[:selectedCaste]
			branch = params[:BranchesSelected]
			university = params[:UniversitiesSelected]



			str_caste_arr = []

			unless str_caste == 'AI' || str_caste.start_with?('PH')
				str_caste = str_caste[0...(str_caste.length-1)]
				str_caste_arr << "#{str_caste}O"
				str_caste_arr << "#{str_caste}H"
			else
				str_caste_arr = "#{str_caste}"
			end

			@cutoffs = Cutoff.where("rank_closed >= ? and rank_closed <= ? and cast IN (?) and branch_name IN (?) and university IN (?)",
				(rank - rank_min), (rank + rank_max), str_caste_arr, branch, university)
		end

	end

	def filter

	end

end
