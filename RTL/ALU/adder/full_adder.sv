module full_adder(input logic a, b, cin,
						output logic out, cout);
		logic absum, abcout, cinabcout;
		half_adder abadd(a, b, absum , abcout);
		half_adder cinabadd(cin, absum, out, cinabcout);
		assign cout = abcout|cinabcout;
endmodule