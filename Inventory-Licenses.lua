local Keys = {"nUL1IoLQWo","65sAPy9nS6","oQdFzxdSx0","xFxIg6E13l","p4VotepRbN","0ZhrRPuEVW","hIbykH1gU4","PUXeKm5Tpe","KrTDwQ5Ifn","COssTx4ww8","qGFexGJWHY","C0A9cz6ko9"}

if table.find(Keys, SettingsModule.License) then
    print('Licença Ativada!')
else
    warn('Licença não encontrada!')
end
