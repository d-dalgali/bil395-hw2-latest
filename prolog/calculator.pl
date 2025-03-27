% Aritmetik işlemler
evaluate(X + Y, R) :- evaluate(X, RX), evaluate(Y, RY), R is RX + RY.
evaluate(X - Y, R) :- evaluate(X, RX), evaluate(Y, RY), R is RX - RY.
evaluate(X * Y, R) :- evaluate(X, RX), evaluate(Y, RY), R is RX * RY.
evaluate(X / Y, R) :- evaluate(X, RX), evaluate(Y, RY), 
                      (RY =:= 0 -> write('Hata: Sıfıra bölme hatası!'), nl, fail ; R is RX / RY).

% Sayı kontrolü
evaluate(X, X) :- number(X).

% Değişken tanımı varsa, çağır
evaluate(Var, R) :- atom(Var), current_predicate(Var/1), Goal =.. [Var, R], call(Goal).
