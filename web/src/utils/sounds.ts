import { Items } from '../store/items';

// Item drop sounds. `sound` comes from data/items.lua (e.g. 'metal.wav'); weapons fall back to weapon.wav.
// Mute: localStorage.setItem('soundsMuted', 'true')
let lastPlay = 0;

export const playItemSound = (itemName?: string) => {
  if (!itemName) return;
  try {
    if (localStorage.getItem('soundsMuted') === 'true') return;
  } catch {
    // storage can be blocked in CEF previews
  }

  const file = Items[itemName]?.sound || (itemName.toLowerCase().startsWith('weapon_') ? 'weapon.wav' : undefined);
  const now = Date.now();
  if (!file || now - lastPlay < 150) return;
  lastPlay = now;

  // page lives in web/build/, sounds in web/sounds/
  const audio = new Audio(new URL(`../sounds/${file}`, window.location.href).href);
  audio.volume = 0.15;
  audio.play().catch(() => {});
};
