(** Load required packages. **)

Require Export Setoid Peano List Sorted Constructive_sets Utf8_core.
Require Export Classical_Prop.

(** Unicode (UTF8) notations. **)

Notation "x ⇒ y" := (x -> y)
  (at level 99, y at level 200, right associativity): type_scope.

Notation "x ⇔ y" := (x <-> y) (at level 95, no associativity): type_scope.

Notation "∃ ! x .. y , p" :=
  (ex (unique (fun x => .. (ex (unique (fun y => p))) ..)))
  (at level 200, x binder, right associativity,
   format "'[' '∃'  !  '/  ' x  ..  y ,  '/  ' p ']'")
  : type_scope.

(** Useful symbols: ∀ ∃ ⇒ ⇔ ∧ ∨ ¬ ≠ ≤ ≥ ℕ ℤ ∈ ∉ ⊂ ∑ ∏ **)

(** Axioms for the integers. **)

Parameter Z : Set.

Parameter add mult : Z → Z → Z.
Parameter neg : Z → Z.
Parameter zero one : Z.
Notation "0" := zero.
Notation "1" := one.
Infix "+" := add. 
Infix "*" := mult.
Notation "- x" := (neg x).
Notation "- 0" := (neg 0) (only parsing).
Notation "- 1" := (neg 1).
Definition sub a b := a + -b.
Infix "-" := sub.

Theorem my_first_proof : (∀ A : Prop, A ⇒ A).
Proof.
  intros.
  exact H.
Qed.

Theorem forward_small : (∀ A B : Prop, A ⇒ (A⇒B) ⇒ B).
  intros A B proof_of_A A_implies_B.
  pose (proof_of_B := A_implies_B proof_of_A).
  exact proof_of_B.
Qed.

Theorem backward_small : (∀ A B : Prop, A ⇒ (A⇒B) ⇒ B).
Proof.
  intros A B.
  intros proof_of_A A_implies_B.
  refine (A_implies_B _).
    exact proof_of_A.
Qed.

Theorem backward_large : (∀ A B C : Prop, A ⇒ (A⇒B) ⇒ (B⇒C) ⇒ C).
Proof.
  intros A B C.
  intros proof_of_A A_implies_B B_implies_C.
  refine (B_implies_C _).
    refine (A_implies_B _).
      exact proof_of_A.
Qed.

Theorem backward_huge : (∀ A B C : Prop, A ⇒ (A⇒B) ⇒ (A⇒B⇒C) ⇒ C).
Proof.
  intros A B C.
  intros proof_of_A A_implies_B A_imp_B_imp_C.
  refine (A_imp_B_imp_C _ _).
    exact proof_of_A.

    refine (A_implies_B _).
      exact proof_of_A.
Qed.

Theorem forward_huge : (∀ A B C : Prop, A ⇒ (A⇒B) ⇒ (A⇒B⇒C) ⇒ C).
Proof.
  intros A B C.
  intros proof_of_A A_imp_B A_imp_B_imp_C.
  pose (proof_of_B := A_imp_B proof_of_A).
  pose (proof_of_C := A_imp_B_imp_C proof_of_A proof_of_B).
  exact proof_of_C.
Show Proof.
Qed.

Inductive False : Prop := .
Inductive True : Prop :=
  | I : True.

Inductive bool : Set :=
  | true : bool
  | false : bool.

(* `case a` supposes a is true *)
(* RULE: if your subgoal is `True`, then use tactic "exact I" *)
Theorem True_can_be_proven : True.
  exact I.
Qed.




  
