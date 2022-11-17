alias MyFarm.Farms.Farm
alias MyFarm.Repo

%Farm{name: "Joel's Farm", owner: "Joel"} |> Repo.insert!()
