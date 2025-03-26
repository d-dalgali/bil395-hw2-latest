with Ada.Text_IO;              use Ada.Text_IO;
with Ada.Float_Text_IO;        use Ada.Float_Text_IO;
with Ada.Strings.Unbounded;    use Ada.Strings.Unbounded;
with Ada.Strings.Fixed;        use Ada.Strings.Fixed;

procedure Calculator is
   Input  : String (1 .. 100);
   Last   : Natural;
   Line   : Unbounded_String;
begin
   Put_Line("Basit ADA Hesap Makinesi. Çıkmak için Ctrl+C.");

   loop
      Put("> ");
      Get_Line(Input, Last);
      Line := To_Unbounded_String(Input(1 .. Last));

      declare
         Result : Float;
         Expr   : String := To_String(Line);
         Op_Pos : Natural;
      begin
         if Index(Expr, "+") /= 0 then
            Op_Pos := Index(Expr, "+");
            declare
               Left  : Float := Float'Value(Expr(1 .. Op_Pos - 1));
               Right : Float := Float'Value(Expr(Op_Pos + 1 .. Expr'Last));
            begin
               Result := Left + Right;
            end;

         elsif Index(Expr, "-") /= 0 then
            Op_Pos := Index(Expr, "-");
            declare
               Left  : Float := Float'Value(Expr(1 .. Op_Pos - 1));
               Right : Float := Float'Value(Expr(Op_Pos + 1 .. Expr'Last));
            begin
               Result := Left - Right;
            end;

         elsif Index(Expr, "*") /= 0 then
            Op_Pos := Index(Expr, "*");
            declare
               Left  : Float := Float'Value(Expr(1 .. Op_Pos - 1));
               Right : Float := Float'Value(Expr(Op_Pos + 1 .. Expr'Last));
            begin
               Result := Left * Right;
            end;

         elsif Index(Expr, "/") /= 0 then
            Op_Pos := Index(Expr, "/");
            declare
               Left  : Float := Float'Value(Expr(1 .. Op_Pos - 1));
               Right : Float := Float'Value(Expr(Op_Pos + 1 .. Expr'Last));
            begin
               if Right = 0.0 then
                  raise Constraint_Error with "Sıfıra bölme hatası!";
               else
                  Result := Left / Right;
               end if;
            end;

         else
            -- Sadece sayı ise
            Result := Float'Value(Expr);
         end if;

         Put("Sonuç: ");
         Put(Result, Fore => 1, Aft => 2, Exp => 0);
         New_Line;

      exception
         when Constraint_Error =>
            Put_Line("Hata: Geçersiz ifade!");
      end;
   end loop;
end Calculator;
