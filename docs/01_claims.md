# Claims to Reproduce

We focused on three targeted claims (as in the presentation):

- **Claim 1 (Model-size scaling; patch fixed):**
  With patch size held constant, increasing model size (B → L → XL) — and thus FLOPs — improves FID.

- **Claim 2 (Patch/token scaling; model fixed):**
  With model size held constant, decreasing patch size (more tokens → higher FLOPs) improves FID.

- **Claim 3 (Compute-aware scaling):**
  Sample quality cannot be explained by parameter count alone; compute (GFLOPs) is a key driver of performance.

Models used: **DiT-B/2, DiT-L/2, DiT-XL/2, DiT-XL/4**.
