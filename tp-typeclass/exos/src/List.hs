
module List where

data List a
    = Nil
    | Cons a (List a)

list1, list2 :: List Integer
list1 = Cons 13 $ Cons 37 Nil
list2 = Cons 42 Nil

-- TODO instance Show

-- TODO instance Semigroup

-- TODO instance Monoid 

-- TODO instance Functor

-- TODO instance Foldable 

