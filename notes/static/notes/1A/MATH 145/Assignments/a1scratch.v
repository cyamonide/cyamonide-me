(*
Lemma S1' : ∀ a b c : Z, c ≠ 0 ∧ a = b ⇒ a + c = b + c.
Proof.
  intros a b c H. 
  congruence.
Qed.

Theorem S3' : ∀ a b c : Z, c ≠ 0 ∧ a * c = b * c -> a = b.
Proof.
  intros.
  apply (S1' (a*c) (b*c) (a*c)) in H.
  apply <-(S2 a b c) in H.
  
*)

(*
Theorem S3 : ∀ a b c : Z, a * c = b * c ⇒ a = b ∨ c = 0.
Proof.
  intros.
  apply(S1 _ _ (-(b*c))) in H.
  rewrite (A4 (b*c)) in H.
  rewrite <-(A1P7 (b*c)) in H.
  rewrite <-(M2 (-1) b c) in H.
  rewrite <-(D1 _ _ c) in H.
  destruct H as [P_holds Q_holds].

  rewrite <-(A1P6 ) in H.
  rewrite (M1 b c) in H.
*)

(* symmetry across ≠ *)
Lemma neq_symm : ∀ a b : Z, a ≠ b ⇔ b ≠ a.
Proof.
  intros a b.
  split; intros H H0; symmetry in H0; contradiction.
Qed.

Lemma neq_1 : 1 ≠ 0.
Proof.
  intros.
  absurd (1 ≠ 0).
  pose proof (A3 1).
  
  rewrite A3 in H.

Theorem A1P10 : ∀ a b : Z, a * b = a ⇒ b = 1 ∨ a = 0.
Proof.
  intros.
  case (classic (a=0)).
  - intros.
    right.
    exact H0.
  - intros.
  

  case (classic (b=1)).
  - intros.
    left.
    exact H0.
  - intros.
    left.
    destruct H0.
    
  case (classic (a=0)).

  pose proof (classic (a=0)).
  destruct H0.
  - intros.
  - 
