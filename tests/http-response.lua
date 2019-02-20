require 'busted.runner'()

describe("Test http handler", function()
	
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

	it("Unknown endpoint", function()
		local http_handler =  require('src/usr/lib/lua/pull/http-handler')

		http_handler.loadEndpoints({})

		local result = http_handler.req({
			section = 'wrong-endoint', data = {}
		})
		assert.is_true(result.error)
	end)
end)