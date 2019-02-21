#!/usr/bin/lua

http_handler = {
	endpoints = {}
}

function http_handler.loadEndpoints(endpoints) 
	if endpoints and endpoints ~= nil then
		http_handler.endpoints = endpoints
	end
end

function http_handler.req(request)
	local handler = nil
	local name = request.section:gsub("[\.\\/]", '')
	for _, endpoint in pairs(http_handler.endpoints) do
		if name == endpoint.name then
			handler = require(endpoint.filePath)
			return handler.req(request)
		end
	end
	if handler == nil then
		return { error = true }
	end
end

return http_handler