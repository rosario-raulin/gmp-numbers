module: gmp-test

define function factorial (n) => (n!)
  local method factorial (n, result) => (n!)
	  if (zero?(n))
	    result
	  else
	    factorial(n - 1, result * n)
	  end if
	end method factorial;
  
  factorial(n, 1)
end function factorial;

define function main (args :: <vector>) => ()
  if (args.size > 0)
    format-out("%=\n", factorial(make-integer(args[0])));
  end if;

  with-integer(a = "-25")
    with-integer(b = 5)
      format-out("%=\n", a);
      format-out("%=\n", b);
      format-out("%=\n", a + b);
      format-out("%=\n", a - b);
      format-out("%=\n", a * b);
      format-out("%=\n", abs(a));
      format-out("%=\n", a < b);
      format-out("%=\n", a >= b);
    end with-integer;
  end with-integer;
end function main;

main(application-arguments());
