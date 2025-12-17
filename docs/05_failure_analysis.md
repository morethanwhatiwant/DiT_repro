# Failure Analysis

**Primary cause:** severe training budget mismatch.

- Paper scaling comparisons: reported around **~400K training steps**.
- Our runs: **~52K steps** (10 epochs at global batch 256), far below the paper regime.

**What we checked**
- Official sampling logic (`model.eval()`, VAE decode scaling ÷0.18215).
- Sampling steps fixed (default 250).

**Conclusion**
- Under-training dominated outputs; model-size/patch-size effects could not be observed.
