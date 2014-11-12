require "rubygems"
require "json"
require 'net/http'

# Read JSON from a file, iterate over objects
file = open("../JSON/cards.json")
json = file.read

parsed = JSON.parse(json)

parsed.each do |shop|
  p shop["image"]
  
  # http://wow.zamimg.com/images/hearthstone/cards/enus/animated/NEW1_010_premium.gif
  # Net::HTTP.start("wow.zamimg.com") { |http|
  #   filename = shop["image"]+"_premium.gif";
  #   url = "/images/hearthstone/cards/enus/animated/"+filename
  #   resp = http.get(url)
  #   open('../card-images/gold/'+filename, "wb") { |file|
  #     file.write(resp.body)
  #    }
  #   puts "Downloaded: " + url
  # }
  
  # http://wow.zamimg.com/images/hearthstone/cards/enus/original/CS2_188.png
  # Net::HTTP.start("wow.zamimg.com") { |http|
  #   filename = shop["image"]+".png";
  #   url = "/images/hearthstone/cards/enus/original/"+filename
  #   resp = http.get(url)
  #   open('../card-images/original/'+filename, "wb") { |file|
  #     file.write(resp.body)
  #    }
  #   puts "Downloaded: " + url
  # }

  # http://wowimg.zamimg.com/hearthhead/sounds/VO_EX1_067_Play_01.mp3
  Net::HTTP.start("wowimg.zamimg.com") { |http|
    filename = "VO_"+shop["image"]+"_Play_01.mp3";
    url = "/hearthhead/sounds/"+filename
    resp = http.get(url)
    open('../sounds/'+filename, "wb") { |file|
      file.write(resp.body)
     }
    puts "Downloaded: " + url
  }
  
  # http://wowimg.zamimg.com/hearthhead/sounds/VO_EX1_067_Attack_02.mp3
  Net::HTTP.start("wowimg.zamimg.com") { |http|
    filename = "VO_"+shop["image"]+"_Attack_02.mp3";
    url = "/hearthhead/sounds/"+filename
    resp = http.get(url)
    open('../sounds/'+filename, "wb") { |file|
      file.write(resp.body)
     }
    puts "Downloaded: " + url
  }
  
  # http://wowimg.zamimg.com/hearthhead/sounds/VO_EX1_067_Death_03.mp3
  Net::HTTP.start("wowimg.zamimg.com") { |http|
    filename = "VO_"+shop["image"]+"_Death_03.mp3";
    url = "/hearthhead/sounds/"+filename
    resp = http.get(url)
    open('../sounds/'+filename, "wb") { |file|
      file.write(resp.body)
     }
    puts "Downloaded: " + url
  }
  
end