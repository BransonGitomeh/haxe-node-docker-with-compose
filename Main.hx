class Main {
	static function main() {
		trace(Sys.environment()["PORT"]);
		var PORT = if(Sys.getEnv("PORT") != null) Std.parseInt(Sys.environment()["PORT"]) else 8000;
		
		// Configure our HTTP server to respond with Hello World to all requests.
		var server = js.node.Http.createServer(function(request, response) {
			// router here
			response.writeHead(200, {"Content-Type": "text/plain"});
			response.end("Hello World\n");
		});

		// Listen on port 8000, IP defaults to 127.0.0.1
		server.listen(PORT);

		// Put a console.log on the terminal
		trace("Server running at 127.0.0.1:" + PORT);
	}
}
