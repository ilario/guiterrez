it("Unknown endpoint", function()
    local http_handler =  require('src/usr/lib/lua/pull/http-handler')

    http_handler.loadEndpoints({})

    local result = http_handler.req({
        section = 'wrong-endoint', data = {}
    })
    assert.is_true(result.error)
end)