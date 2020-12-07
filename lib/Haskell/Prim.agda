
-- Basic things needed by other primitive modules.

module Haskell.Prim where

open import Agda.Primitive
open import Agda.Builtin.Bool
open import Agda.Builtin.Nat
open import Agda.Builtin.Unit
open import Agda.Builtin.List
open import Agda.Builtin.FromNat

private
  variable
    a b c d : Set


--------------------------------------------------
-- Booleans

infix -2 if_then_else_

if_then_else_ : Bool → a → a → a
if false then x else y = y
if true  then x else y = x

data IsTrue : Bool → Set where
  instance itsTrue : IsTrue true


--------------------------------------------------
-- Numbers

instance
  iNumberNat : Number Nat
  iNumberNat .Number.Constraint _ = ⊤
  iNumberNat .fromNat n = n


--------------------------------------------------
-- Proof things

-- Use to bundle up constraints
data All {a b} {A : Set a} (B : A → Set b) : List A → Set (a ⊔ b) where
  instance
    allNil  : All B []
    allCons : ∀ {x xs} ⦃ i : B x ⦄ ⦃ is : All B xs ⦄ → All B (x ∷ xs)