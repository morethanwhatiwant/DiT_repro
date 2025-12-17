# Results (Current)

## Observation
- After ~10 epochs (~52K steps), samples remained largely noise-like across all variants.
- With noise-like samples, FID-50K is not meaningful at this stage.

## Status
- These runs are best interpreted as a **pipeline smoke test** (training → checkpoint → sampling).
- Claim verification requires training to the paper-like regime (~400K steps) and computing FID-50K.

Place representative sample grids in `results/samples_small/` (optional).
