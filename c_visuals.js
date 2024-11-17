// Initialize Hydra
const hydra = new Hydra()

// Create a basic visual
osc(10, 0.1, 1.2) // Oscillator with frequency, sync, and offset
  .color(0.8, 0.3, 0.6) // Apply color
  .rotate(0.1, 0.1) // Rotate the visual
  .modulate(noise(3)) // Modulate with noise
  .out() // Output to screen