# Weird Drum — 8-Voice Analog Drum Machine for Ableton Move

Port of [WeirdDrums](https://github.com/dfilaretti/WeirdDrums) (Daniele Filaretti, MIT) to the [Move Everything](https://github.com/charlesvestal/move-anything) framework.

## Architecture

8 independent drum voices, each with:
- Phase-accumulator oscillator (sine/saw/square)
- Exponential AD envelopes (amplitude + noise + pitch)
- Pitch LFO modulation
- White noise with state-variable filter (LP/HP/BP)
- tanh distortion
- Per-voice level

Master bus: compressor, tanh distortion, 3-band EQ with sweepable lows/mids.

## UI Pages (10 total)

| Page | Knobs |
|------|-------|
| **Mixer** | Vol 1-8 (Kick, Snare, Tom, Clap, Rim, HiHat, Cymbal, Tom2) |
| **General** | Compress, Distort, EQ Low/Mid/High, Lo Freq, Mid Freq, Master |
| **Voice 1-8** | Freq, Decay, Wave, P.Env, Mix, Cutoff, Distort, Preset |

## Presets

Each voice has a jog-selectable preset: Kick, Snare, Tom, Clap, Rimshot, HiHat, Cymbal, Custom.

## MIDI Mapping

- Notes C2-G#2 (36-43): trigger voices 1-8 directly
- Other notes: round-robin across all 8 voices

## Build

```bash
./scripts/build.sh
./scripts/install.sh [move-ip]
```

## License

MIT (original WeirdDrums by Daniele Filaretti)
