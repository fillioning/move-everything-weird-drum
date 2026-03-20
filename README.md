# Weird Dreams — 8-Voice Drum Machine for Ableton Move

Port of [WeirdDrums](https://github.com/dfilaretti/WeirdDrums) (Daniele Filaretti, MIT) to the [Move Everything](https://github.com/charlesvestal/move-everything) framework, expanded into a full 8-voice drum machine with master bus FX, 64 kit presets and randomization (kit, pitch, pan).

## Features

- **8 independent drum voices**, each with oscillator (continuous sine/tri/saw/square morph), white noise with SVF filter, exponential AD envelopes, pitch modulation, tanh distortion, and clap retrigger
- **41 voice presets** across 8 categories: Kicks, Snares, Toms, Hi-Hats, Cymbals, Claps, Percussion, FX
- **64 kit presets**: classic machines (808, 909, LinnDrum, CR-78), genre kits (Techno, House, Trap, DnB, Afrobeat, Footwork...), character kits (Industrial, Lo-Fi, Ambient, Glitch...), and hybrid/specialized kits
- **96 musical pitch scales** (Rnd Pitch): 8 scale types (Major, Minor, Pentatonic, Blues, Modes, Harmonic/Melodic minor, Exotic) x 12 root notes, with per-voice frequency ranges tuned to real hardware drum synth standards
- **Master bus FX**: dirty compressor, Isolator3-style DJ filter, Massenburg 8200-inspired 3-band parametric EQ
- **Per-voice panning** with constant-power law
- **12 UI pages**: Mixer, General, Patch, Pan, Voice 1-8

## UI Pages

| Page | Knobs |
|------|-------|
| **Mixer** | V1-V8 volume |
| **General** | Crush, Filter, Lo Gain, Lo Freq, Mid Gain, Mid Freq, Hi Gain, Hi Freq |
| **Patch** | Kit, Rnd Kit, Rnd Voice, Rnd Pitch, SameFreq, Init Freq, Rnd Pan, All Mono |
| **Pan** | V1-V8 panning |
| **Voice 1-8** | Freq, Decay, Wave, P.Env, Mix, Cutoff, Distort, Preset |

Pressing a pad triggers the voice AND switches to that voice's parameter page.

## MIDI Mapping

- Notes C2-G#2 (36-43): trigger voices 1-8 directly
- Other notes: round-robin across all 8 voices

## Build

```bash
./scripts/build.sh          # Docker ARM64 cross-compile
./scripts/install.sh        # SCP to Move
```

## Credits

- Original DSP: [Daniele Filaretti](https://github.com/dfilaretti/WeirdDrums) (MIT)
- Move port and expansion: Vincent Fillion
- Framework: [Move Everything](https://github.com/charlesvestal/move-everything)

## License

MIT
