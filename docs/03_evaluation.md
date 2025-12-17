# Evaluation

## Sampling (official)
- Use official `sample.py`.
- Ensure model is in eval mode (`model.eval()`).
- Default: 250 sampling steps.
- Decode scaling: `vae.decode(latents / 0.18215)`.

## FID-50K
- Requires generating **50,000 samples** with a fixed sampling protocol.
- Use `clean-fid` or `torch-fidelity`.
