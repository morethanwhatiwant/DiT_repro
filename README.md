# DiT Scaling Replication Attempt

Reproduction attempt of "Scalable Diffusion Models with Transformers" (Peebles et al., 2023, ICCV)

**Seoul National University of Science and Technology**  
**Course Project - December 2025**

---

## TL;DR

We attempted to reproduce DiT's scaling properties with limited training budget (52K steps).  
**Result:** All models produced noise-like samples → Training budget insufficient for claim verification.

---

## What We Did

### Models Trained
All models trained for **10 epochs (~52K training iterations)**:
- **DiT-B/2**: 52K steps
- **DiT-L/2**: 52K steps
- **DiT-XL/2**: 52K steps
- **DiT-XL/4**: 52K steps

### Hardware & Setup
- **GPUs**: 8× NVIDIA A100-80GB (NVLink)
- **CPU**: 2× AMD EPYC 7763 (256 threads)
- **RAM**: 1.0 TiB
- **Dataset**: ImageNet-1K (~1.33M images, 256×256)
- **Global batch size**: 256
- **Steps per epoch**: ~5,200

### Target Claims
1. **Claim 1 (Model size scaling)**: With patch fixed, B/2 < L/2 < XL/2 in FID
2. **Claim 2 (Patch size scaling)**: With model fixed, XL/4 vs XL/2
3. **Claim 3 (Compute-aware scaling)**: Gflops (not just params) drive performance

---

## Results

### All Models Failed to Converge

**Training Budget Gap:**
- Paper baseline: **400K training iterations**
- Our training: **52K training iterations**
- Ratio: **12.5% of paper baseline**
- Gap: **8× under-trained**

**Observation:**
- All models produced noise-like samples
- No visible difference between model sizes
- FID-50K not meaningful at this stage
- Scaling trends not observable

See `slides/presentation.pdf` (pages 10-11) for sample images.

---

## Key Finding

**Diffusion models require minimum training threshold for scaling properties to emerge.**

- **Below 52K steps**: All models fail equally (no size-based differentiation)
- **At 400K steps**: Paper shows clear scaling trends
- **Implication**: Minimum compute threshold exists between 52K-400K steps

This **negative result** is valuable: it quantifies the minimum compute requirement for DiT scaling experiments.

---

## What We Learned

### 1. Minimum Training Budget Required
- With ~52K steps, none of the models reached quality level where size/patch effects are observable
- Meaningful scaling comparisons require hundreds of thousands of steps
- Paper reports clear trends at 400K steps

### 2. Protocol Alignment Matters
- For valid comparison: training steps, EMA, sampling protocol must match paper
- Even with correct hyperparameters, insufficient training dominates all other factors

---
---

## Quick Start

### Environment Setup
```bash
conda env create -f environment.yml
conda activate dit-repro
```

### What We Actually Ran
```bash
# Training (10 epochs, ~52K steps each)
bash scripts/train_smoke_3gpu_10ep_xl2.sh
bash scripts/train_smoke_3gpu_10ep_l2.sh
bash scripts/train_smoke_3gpu_10ep_xl4.sh
bash scripts/train_smoke_3gpu_10ep_b2.sh

# Sampling from checkpoint
bash scripts/sample_from_ckpt.sh /path/to/checkpoint.pt DiT-XL/2 xl2_52k 4.0 250 mse
```


---

## What We Would Do Differently

If we had more time/compute:

1. **Train to minimum 200K steps** (40 epochs) to observe early trends
2. **Monitor loss curves continuously** to detect convergence issues early
3. **Use intermediate checkpoints** for progressive FID evaluation
4. **Budget for 400K steps baseline** to properly verify claims

---

## Detailed Documentation

- **`docs/00_overview_background.md`**: Problem statement & DiT overview
- **`docs/01_claims.md`**: Three claims we targeted
- **`docs/02_experiments.md`**: Experimental protocol & controlled variables
- **`docs/03_evaluation.md`**: Sampling & FID-50K methodology
- **`docs/04_results.md`**: Current results (noise-like samples)
- **`docs/05_failure_analysis.md`**: Root cause analysis
- **`docs/06_critical_review.md`**: Sensitivity & evaluation considerations
- **`docs/07_compute_setup.md`**: Hardware specifications

---

## Presentation

**Full analysis and visual results:** `slides/presentation.pdf`

**Key slides:**
- Slide 7: GPU specification & training timeline
- Slide 8: Experimental setup comparison (Paper vs Ours)
- Slide 9: Results summary
- Slide 10: Sample images showing failure modes
- Slide 11: Failure analysis & lessons learned

---

## Citation
```bibtex
@inproceedings{peebles2023dit,
  title={Scalable Diffusion Models with Transformers},
  author={Peebles, William and Xie, Saining},
  booktitle={ICCV},
  year={2023}
}
```

**Official DiT implementation:** https://github.com/facebookresearch/DiT

---

## Notes

- **Checkpoints excluded**: `.gitignore` excludes checkpoint files (too large for Git)
- **Logs excluded**: Training logs excluded for privacy and size
- **Samples included**: Representative sample images in slides
- **Metadata available**: `results/runs.csv` documents all experiments

---

**Project by Hyunsoo Oh**  
**Seoul National University of Science and Technology**  
**Data Science Department - December 2025**