# Experiments

## Controlled recipe (kept fixed)
- Dataset: ImageNet-1K, 256×256, class-conditional
- Latent diffusion: SD VAE latent (32×32×4), scaling factor 0.18215
- Diffusion horizon: DDPM, T=1000 (train)
- Optimizer: AdamW, LR=1e-4 constant, weight decay = 0
- Augmentation: random horizontal flip only
- Sampling: 250 steps; VAE decode uses ÷0.18215; `model.eval()` during sampling

## Experimental variables
- Model size: B vs L vs XL (fixed patch /2)
- Patch size: /2 vs /4 (fixed model family XL)

## Claim-to-comparison mapping
- **Claim 1:** B/2 → L/2 → XL/2 (patch fixed)
- **Claim 2:** XL/4 vs XL/2 (model fixed)
- **Claim 3:** correlate quality with compute (GFLOPs) across all 4 variants
