require("markview").setup({
  injections = {
    languages = {
      markdown = {
        --- This disables other
        --- injected queries!
        overwrite = true,
        query = [[
                    (section
                        (atx_headng) @injections.mkv.fold
                        (#set! @fold))
                ]]
      }
    }
  }
});
