alias MyFarm.Accounts.Farmer
alias MyFarm.Farms.Farm
alias MyFarm.Repo

alias MyFarm.Accounts.Farmer
%Farmer{name: "Joel"} |> Repo.insert!()
%Farm{name: "Joel's Farm", owner: "Joel"} |> Repo.insert!()
