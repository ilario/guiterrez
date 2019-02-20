
endpoint = {}

function endpoint.req(req)
    return { data = req.data.a + req.data.b }
end

return endpoint;