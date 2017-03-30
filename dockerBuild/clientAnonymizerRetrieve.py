import requests, json, urllib

url = "https://raw.githubusercontent.com/CTMM-TraIT/trait_ctp/master/configurations/site_configurations/ctpClient.json"
headerData = {
    'Accept': 'application/json'
}
ctpClientResult = requests.get(url, headers=headerData)
ctpClientString = ctpClientResult.content.replace('\n', ' ')
ctpClientString = ctpClientString.replace('\t', '')
ctpClientString = ctpClientString.replace('\'', '"')
ctpClients = json.loads(ctpClientString)

baseLocation = "https://raw.githubusercontent.com/CTMM-TraIT/trait_ctp/master/configurations/site_configurations/"

for instance in ctpClients['anonymizers']:
    fileName = instance["name"]
    fileLocation = instance["location"]
    fullUrl = baseLocation + fileLocation
    urllib.urlretrieve(fullUrl, fileName)