return {
  'dense-analysis/ale',
  config = function()
    vim.g.ale_linters = {
      xml = { 'xmllint' }
    }

    -- Otras configuraciones de ALE
  end
}
