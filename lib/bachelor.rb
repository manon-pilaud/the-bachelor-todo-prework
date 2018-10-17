require 'pry'

def get_first_name_of_season_winner(data, season)
  data[season].each do |contestant|
    if contestant["status"] == "Winner"
      return contestant["name"].split.first
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season, contestant|
    contestant.each do |person|
      person.each do |key,info|
        if info == occupation
          return person["name"]
        end
      end
    end
  end
end


def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season, contestant|
    contestant.each do |person|
      person.each do |key,info|
        if info == hometown
          counter += 1
        end
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  data.each do |season, contestant|
    contestant.each do |person|
      person.each do |key,info|
        if info == hometown
          return person["occupation"]
        end
      end
    end
  end
end


def get_average_age_for_season(data, season)
  ages = []
  data.each do |season_a, contestant|
      if season_a == season
        contestant.each do |person|
          person.each do |key,info|
            if key == "age"
              ages << info.to_i

            end
          end
        end
      end
    end
  ages = ages.inject{ |sum, el| sum + el }.to_f / ages.size
  ages.round
end

#{"season 30": [

#    "name":      "Beth Smalls",
#    "age":       "26",
#    "hometown":  "Great Falls, Virginia",
  #  "occupation":"Nanny/Freelance Journalist",
#    "status":    "Winner"
#  },
