return {
  on_setup = function(server)
    server.setup({
      settings = {
        python = {
          -- pythonPath = "pvpython",
          pythonPath = "/usr/bin/python",
        }
      }
    })
  end,
}
