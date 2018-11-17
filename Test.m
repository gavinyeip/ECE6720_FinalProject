test = TranslateSBML('Ptest2.xml',0,0);
[Species, rateLaws] = GetRateLawsFromReactions(test);
[parameters, values] = GetGlobalParameters(test);


for jj = 1:length(parameters)
    if isequal(parameters(jj), 'kr_f')
        kr_f = values(ii);
        elseif isequal(parameters(jj), 'kr_r')
        kr_r = values(ii);
        elseif isequal(parameters(jj), 'ka_f')
        ka_f = values(ii);
        elseif isequal(parameters(jj), 'ka_r')
        ka_r = values(ii);
        elseif isequal(parameters(jj), 'ko_f')
        ko_f = values(ii);
        elseif isequal(parameters(jj), 'ko_r')
        ko_r = values(ii);
        elseif isequal(parameters(jj), 'kao_f')
        kao_f = values(ii);
        elseif isequal(parameters(jj), 'kao_r')
        kao_r = values(ii);
        elseif isequal(parameters(jj), 'nc')
        nc = values(ii);
        elseif isequal(parameters(jj), 'nr')
        nr = values(ii);
        elseif isequal(parameters(jj), 'ko')
        ko = values(ii);
        elseif isequal(parameters(jj), 'kb')
        kb = values(ii);
        elseif isequal(parameters(jj), 'ng')
        ng = values(ii);
        elseif isequal(parameters(jj), 'np')
        np = values(ii);
        elseif isequal(parameters(jj), 'ka')
        ka = values(ii);
        elseif isequal(parameters(jj), 'kd')
        kd = values(ii);
    end
end

P2 = 2;
P3 = 2;
syms CI CII
dCI = - (kd*CI) + 10 * (P2*(kb*(ko_f/ko_r)*nr+ka*(kao_f/kao_r)*nr*power(ka_f/ka_r*CII,nc))/(1+ko_f/ko_r*nr+kao_f/kao_r*nr*power(ka_f/ka_r*CII,nc)));
dCII = - (kd*CII) + 10 * (P3*ko*(ko_f/ko_r)*nr/(1+ko_f/ko_r*nr+power(kr_f/kr_r*CI,nc)));

[X, Y] = meshgrid(0:1:10,0:1:10); 
G = subs(dCI, [CI CII], {X,Y});
G1 = subs(dCII, [CI CII], {X,Y});
quiver(X,Y,G,G1);

