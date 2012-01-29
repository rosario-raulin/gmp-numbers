module: gmp-integer

define macro with-integer
  { with-integer (?var-name:variable = ?init-value:expression) ?:body end }
    => {
	let ?var-name :: <gmp-integer> = make-integer(?init-value);
	block ()
	  ?body
	cleanup
	  destroy-integer(?var-name)  
	end
       }
end macro with-integer;
