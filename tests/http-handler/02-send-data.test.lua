it("Send data to http_handler", function()
    local http_handler =  require('src/usr/lib/lua/pull/http-handler')
    
    local endpoints = {}
    endpoints[0] = { 
        filePath = './tests/mocks/sum-endpoint',
        name = 'sum-endpoint'
    }
    
    http_handler.loadEndpoints(endpoints)

    local result = http_handler.req({
        section = 'sum-endpoint', data = { a = 5, b = 4}
    })
    assert.is.falsy(result.error)
    assert.is.equal(result.data, 9)
end)