require 'rubygems'
require 'bundler'

Bundler::setup

require 'treetop'
require 'ecell/phonyem/expr/parser'

parser = ECell::Phonyem::Expr::ExpressionProcessScriptParser.new
p parser.parse('abc.ef + 123 ^ (4 + 78) + 234 ^ 456 * self.getSuperSystem().SizeN_A + sin(1)').ast_node
