
> type Layout = String
> type Width = Int
> data Doc -- set of possible layouts for text

in this algebra
    the elements are of type Doc
when we want to look at the Doc
    needs to be first transitioned into a Layout
the operations are
    (<>)
    nil
    going from the syntactic, ie String
        and go into the Semantic

> pretty :: Width -> Doc -> Layout -- 1
> pretty = undefined

> layouts :: Doc -> [Layout] -- 2
> layouts = undefined

> (<>) :: Doc -> Doc -> Doc -- 3
> (<>) = undefined

associative
(x <> y) <> z = x <> (y <> z)

> nil :: Doc -- 4
> nil = undefined

string with no newlines into a doc

> text :: String -> Doc -- 5
> text = undefined

homomorphism
    text (s ++ t) = text s <> text t
    text ""       = nil
    to provide for docs containing more than one line
    from String concatenation to Doc concatenation

> line :: Doc -- 6
> line = undefined

allows us to create a document with more than one
and dont have to inspect the string for newline chars

> nest :: Int -> Doc -> Doc -- 7
> nest = undefined

nest a document.
ie insert i spaces after every newline

nest i (x <> y)   = nest i x <> nest i y
nest i nil        = nil
nest i (text s)   = text s
nest i line       = line <> text (replicate i ' ')
nest i (nest j x) = nest (i+j) x
nest 0 x          = x
nest i (group x)  = group (nest i x)

8
takes a document
    adds an extra layout
        a single line of text
        with no line breaks

> group :: Doc -> Doc -- 8
> group = undefined

produces multiple layouts
