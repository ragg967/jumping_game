# Jumping Game 🎮

A fast-paced side-scrolling platformer built with Godot 4, where you jump between moving platforms while the game gets progressively more challenging!

## 🎯 About

Jumping Game is a minimalist endless runner where your goal is to survive as long as possible by jumping between platforms that spawn from the right side of the screen. The game features a clean pixel art aesthetic and progressively increasing difficulty that will test your reflexes and timing.

## 🕹️ Gameplay

- **Objective**: Jump between moving platforms to survive and score points
- **Survival**: Avoid falling into the death zone at the bottom of the screen
- **Scoring**: Your score increases as platforms spawn - see how high you can get!
- **Difficulty**: The game gets faster and more challenging as you progress

### Progressive Difficulty System
The game automatically adjusts difficulty based on your progress:
- **Spawn Rate**: Platform spawn intervals decrease from 5 seconds to 1 second
- **Speed**: Platform movement speed increases from -50 to -300 pixels/second
- **Milestones**: Difficulty ramps up every 10 points (at scores 5, 15, 25, 35, 45, 55, 65, 75+)

## 🎮 Controls

| Action | Key |
|--------|-----|
| Move Left | `A` or `←` |
| Move Right | `D` or `→` |
| Jump | `Space` |
| Restart (when dead) | `Enter` |

## 🛠️ Technical Details

### Built With
- **Engine**: Godot 4.4.1
- **Language**: GDScript
- **Art**: Custom pixel art SVG graphics
- **Font**: PixelOperatorMono (retro pixel font)

### Architecture
- **Modular Design**: Scene-based architecture with reusable components
- **Performance Optimized**: Automatic platform cleanup system
- **Responsive Controls**: Physics-based movement with gravity simulation
- **Clean Code**: Well-structured scripts with clear separation of concerns

### Key Components
- **Player System**: CharacterBody2D with physics-based movement
- **Platform Spawner**: Automatic platform generation with difficulty scaling
- **Platform Despawner**: Memory-efficient cleanup system
- **Score System**: Real-time score tracking and display
- **Death System**: Clean game over handling with restart functionality

## 🎨 Assets

All visual assets are custom-made SVG graphics:
- **Player Sprite**: 32x32 pixel art character
- **Platform Sprite**: 256x32 white platform with black border
- **UI Elements**: Clean, minimalist interface design

## 🚀 Installation & Running

### For Players
1. Download the latest release from the [Releases](https://github.com/ragg967/jumping_game/releases) page
2. Extract the files
3. Run the executable for your platform
4. Start jumping!

### For Developers
1. Clone this repository:
   ```bash
   git clone https://github.com/ragg967/jumping_game.git
   ```
2. Open the project in Godot 4.x
3. Press F5 to run the project

## 📁 Project Structure

```
jumping_game/
├── assets/
│   ├── icon.svg              # Godot project icon
│   ├── platform.svg          # Platform sprite
│   ├── player1.svg           # Player character sprite
│   └── pixel_operator/       # Font files
├── scenes/
│   ├── main.tscn            # Main game scene
│   ├── player.tscn          # Player character
│   ├── platform.tscn        # Platform prefab
│   ├── camera.tscn          # Camera system
│   ├── death_box.tscn       # Death zone detector
│   ├── death_menu.tscn      # Game over screen
│   ├── score_board.tscn     # Score display
│   ├── platform_spawner.tscn # Platform generation
│   └── platform_despawner.tscn # Platform cleanup
├── scripts/
│   ├── player.gd            # Player movement and physics
│   ├── platform_spawner.gd  # Platform generation logic
│   ├── platform_despawner.gd # Platform cleanup
│   ├── death_box.gd         # Death detection
│   ├── death_menu.gd        # Game over handling
│   └── score_board.gd       # Score management
└── LICENSE                  # MIT License
```

## 🎯 Future Plans

- Enhanced visual effects and particle systems
- Sound effects and background music
- Multiple character skins
- Power-ups and special abilities
- Leaderboard system
- Mobile platform support
- Additional game modes

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Report bugs by opening an issue
- Suggest new features
- Submit pull requests
- Improve documentation

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🏆 High Score Challenge

What's your best score? Share your high scores in the discussions section!

---

**Made with ❤️ using Godot 4**

*Jump, survive, and beat your high score!*
