# Simulation of Honey bee shemmering

## Demo

<img src="demo.gif">

## Tri-State Model

### State transitions of a single agent
```mermaid
flowchart LR
  A(("A"))
  R(("R"))
  I(("I"))

I -->|p_IA| A
A -->|p_AR| R
R -->|p_RI| I
```

### Interaction between neighbors

```mermaid
flowchart LR
  A1(("A"))
  R1(("R"))
  I2(("I"))
  A2(("A"))
  int["p_T"]

  A1 -.-> int
  int -.-> R1
  I2 --> int
  int --> A2
```

## refs
- Navin Patel, Henri Huijberts, Kaspar Althoefer, Ketao Zhang, "Mathematical Tri-State Model for Bee Shimmering Propagation Dynamics", [arXiv:2401.14145](https://arxiv.org/abs/2401.14145)
- Japanese natural beekeeping, "Shimmering Waves: How Japanese Honeybees Use Their Wings to Intimidate Predators", [YouTube](https://www.youtube.com/watch?v=Y8k7mTQoIhw) 
