using JSON3 
#test API
fldr = raw"C:\Users\bernhard.koenig\runs\detect\predict13\crops\person"
fi = joinpath(fldr, "20240906.jpg")
@assert isfile(fi)

cmd = `curl -X 'POST' https://api.brickognize.com/predict/figs/ -H 'accept: application/json' -H 'Content-Type: multipart/form-data' -F "query_image=@$fi;type=image/jpeg"`
rs = read(cmd,String) 
#rs = run(cmd)
js = JSON3.read(rs)

js.items[1]