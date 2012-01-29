module: gmp-integer

define class <gmp-integer> (<number>)
  slot number :: <mpz-type>,
    init-keyword: number:, init-value: make(<mpz-type>);
  slot base :: <integer>,
    init-keyword: base:, init-value: 10;
end class <gmp-integer>;

define generic make-integer (init-value, #key base) => (integer);
  
define method make-integer
    (init-value :: <string>, #key base :: <integer> = 10) => (integer)
  let num :: <mpz-type> = make(<mpz-type>);
  mpz-init-set-str(num, init-value, base);
  make(<gmp-integer>, number: num, base: base);
end method make-integer;

define method make-integer
    (init-value :: <integer>, #key base :: <integer> = 10) => (integer)
  let num :: <mpz-type> = make(<mpz-type>);
  mpz-init-set-si(num, init-value);
  make(<gmp-integer>, number: num, base: base);
end method make-integer;

define function destroy-integer (integer :: <gmp-integer>) => ()
  destroy(number(integer));
end function destroy-integer;

define method as
    (class == <string>, integer :: <gmp-integer>) => (s :: <string>)
  mpz-get-str(null-pointer(<C-string>), base(integer), number(integer))
end method as;

define method print-object (integer :: <gmp-integer>, stream :: <stream>) => ()
  format(stream, "%s", as(<string>, integer));
end method print-object;

define function gmp-integer-arithmetic
    (op :: <function>, op1, op2, #key base = 10) => (res :: <gmp-integer>)
  let res = make(<mpz-type>);
  op(res, op1, op2);
  make(<gmp-integer>, number: res, base: base);
end function gmp-integer-arithmetic;

define method \+
    (a :: <gmp-integer>, b :: <gmp-integer>) => (sum :: <gmp-integer>)
  gmp-integer-arithmetic(mpz-add, number(a), number(b), base: base(a))
end method \+;

define method \+
    (a :: <gmp-integer>, b :: <unsigned-integer>) => (sum :: <gmp-integer>)
  gmp-integer-arithmetic(mpz-add-ui, number(a), b, base: base(a))
end method \+;

define method \+
    (a :: <unsigned-integer>, b :: <gmp-integer>) => (sum :: <gmp-integer>)
  b + a
end method \+;

define method \-
    (a :: <gmp-integer>, b :: <gmp-integer>) => (diff :: <gmp-integer>)
  gmp-integer-arithmetic(mpz-sub, number(a), number(b), base: base(a))
end method \-;

define method \-
    (a :: <gmp-integer>, b :: <unsigned-integer>) => (diff :: <gmp-integer>)
  gmp-integer-arithmetic(mpz-sub-ui, number(a), b, base: base(a))
end method \-;

define method \-
    (a :: <unsigned-integer>, b :: <gmp-integer>) => (diff :: <gmp-integer>)
  gmp-integer-arithmetic(mpz-ui-sub, a, number(b), base: base(b))
end method \-;

define method \*
    (a :: <gmp-integer>, b :: <gmp-integer>) => (product :: <gmp-integer>)
  gmp-integer-arithmetic(mpz-mul, number(a), number(b), base: base(a))
end method \*;

define method \*
    (a :: <gmp-integer>, b :: <integer>) => (product :: <gmp-integer>)
  gmp-integer-arithmetic(mpz-mul-si, number(a), b, base: base(a))
end method \*;

define method \*
    (a :: <integer>, b :: <gmp-integer>) => (product :: <gmp-integer>)
  b * a
end method \*;

define method \*
    (a :: <gmp-integer>, b :: <unsigned-integer>) => (product :: <gmp-integer>)
  gmp-integer-arithmetic(mpz-mul-ui, number(a), b, base: base(a))
end method \*;

define method \*
    (a :: <unsigned-integer>, b :: <gmp-integer>) => (product :: <gmp-integer>)
  b * a
end method \*;

define method \<
    (a :: <gmp-integer>, b :: <gmp-integer>) => (cmp-result :: <boolean>)
  mpz-cmp(number(a), number(b)) < 0
end method \<;

define method \=
    (a :: <gmp-integer>, b :: <gmp-integer>) => (cmp-result :: <boolean>)
  mpz-cmp(number(a), number(b)) == 0
end method \=;

define method abs (x :: <gmp-integer>) => (abs-value :: <gmp-integer>)
  let abs-value :: <mpz-type> = make(<mpz-type>);
  mpz-abs(abs-value, number(x));
  make(<gmp-integer>, number: abs-value, base: base(x))
end method abs;

define method zero? (x :: <gmp-integer>) => (zero-p :: <boolean>);
  mpz-cmp-ui(number(x), 0) == 0
end method zero?;
