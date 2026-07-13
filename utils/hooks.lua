---@diagnostic disable: duplicate-set-field, lowercase-global
--Creates the flags
--Basically used the one from Paperback
local BackApply_to_run_ref = Back.apply_to_run
function Back.apply_to_run(arg_56_0)
  BackApply_to_run_ref(arg_56_0)
  G.GAME.pool_flags.alphabet_noodles_can_spawn = true
  G.GAME.pool_flags.alphabet_soup_can_spawn = false
  --^used for alphabet noodles being used to add alphabet soup to the pool
end