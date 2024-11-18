// Initialize Hydra
const hydra = new Hydra()

// Create a detailed visual
osc(20, 0.1, 1.5) // Oscillator with higher frequency, sync, and offset
  .color(0.9, 0.2, 0.5) // Apply color with different RGB values
  .rotate(0.2, 0.1) // Rotate the visual with different angles
  .kaleid(5) // Apply kaleidoscope effect with 5 segments
  .modulate(noise(5, 0.5)) // Modulate with noise, higher frequency and sync
  .scale(1.2) // Scale the visual
  .diff(osc(10, 0.05).rotate(0.1)) // Add a differential oscillator with rotation
  .blend(o0, 0.5) // Blend with the original output
  .luma(0.5, 0.1) // Apply luma keying
  .out() // Output to screen