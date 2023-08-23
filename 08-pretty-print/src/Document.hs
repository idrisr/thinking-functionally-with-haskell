module Document where

type Layout = String
data Doc

-- max line width
-- given document
-- return best layout
pretty :: Int -> Doc -> Layout
pretty = undefined

-- possible layouts for given document
layouts :: Doc -> [Layout]
layouts = undefined

instance Semigroup Doc where
    (<>) = undefined

instance Monoid Doc where
    mempty = nil

text :: String -> Doc
text = undefined

line :: Doc
line = undefined

nil :: Doc
nil = undefined

-- nest i indents a document by inserting
-- i spaces after every newline.
-- not done at beginning of document
-- unless it begins with a newline
nest :: Int -> Doc -> Doc
nest = undefined

{-
function that produces multiple layouts

takes a document and
    adds an extra layout
    consisting of a single line of text
    with no line breaks
-}
group :: Doc -> Doc
group = undefined

{-
laws we want

text (s ++ t) = text s <> text t
text "" = nil

-}

{-

nest i (x <> y)   = nest i x <> nest i y           1
nest i nil        = nil                            2
nest i (text s)   = text s                         3
nest i line       = line <> text (replicate i ' ') 4
nest i (nest j x) = nest (i+j) x                   5
nest 0 x          = x                              6
nest i (group x)  = group (nest i x)               7

-}

{-
mathematical names
    nest i
        distributes through concatenation

    nest homomorphism
        from numerical addition
        to functional composition

    nest i
        commutes with group

    third law fails
        if nest were to indent
            from the beginning of a document

        if we allowed text strings
            to contain newline characters.

    last law holds
        because grouping adds a layout with no line breaks and
        nesting has no effect on such a layout
        see exercise D
-}
