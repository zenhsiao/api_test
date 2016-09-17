namespace :dev do
	task :ubike => :environment do
		url="http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=ddb80380-f1b3-4f8e-8016-7ed9cba571d5"
		json_string=RestClient.get(url)
		data = JSON.parse(json_string)	
    
    data["result"]["results"].each do |u|
      puts u["sarea"]
      puts u["sna"] 

    end   

	end

	task :missingstuff => :environment do
		url="http://od.moi.gov.tw/api/v1/rest/datastore/A01010000C-000700-015"
		json_string=RestClient.get(url)
		data = JSON.parse(json_string)	
    
    data["result"]["records"].each do |u|
        existing=Missingstuff.find_by_item_no(u["OP_AC_RCNO"])
    	if existing
         existing.update(:date=>u["OP_PU_DATE"],:place=>u["OP_PU_PLACE"],:content=>u["OP_AN_CONTENT"])
    	else
        Missingstuff.create(:item_no=>u["OP_AC_RCNO"],:date=>u["OP_PU_DATE"],:place=>u["OP_PU_PLACE"],:content=>u["OP_AN_CONTENT"])
      end

    end


          		
	end
end