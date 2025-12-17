# Overview & Background

**Problem framing:** Diffusion models still rely on U-Nets as the standard backbone, but it is unclear
whether the U-Net inductive bias is necessary.

**Solution:** Replace U-Net with a ViT-style Transformer backbone under latent diffusion (DiT).

**Key background observation:** Transformer compute (GFLOPs) correlates strongly with FID-50K in DiT scaling analysis.

See `slides/` for the submitted presentation.
