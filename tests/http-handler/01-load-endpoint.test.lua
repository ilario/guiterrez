
it("Load endpoints", function()
    local http_handler =  require('src/usr/lib/lua/pull/http-handler')
    
    local endpoints = {}
    endpoints[0] = { 
        filePath = '/usr/lib/lua/pull/endpoints/bat-hosts',
        name = 'bat-hosts'
    }
    http_handler.loadEndpoints(endpoints)
    local result = http_handler.endpoints
    assert.are.same(result[0].name, 'bat-hosts')
end)