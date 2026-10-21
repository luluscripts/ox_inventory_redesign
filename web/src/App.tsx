import InventoryComponent from './components/inventory';
import useNuiEvent from './hooks/useNuiEvent';
import { Items } from './store/items';
import { Locale } from './store/locale';
import { setImagePath } from './store/imagepath';
import { setupInventory } from './store/inventory';
import { Inventory } from './typings';
import { useAppDispatch } from './store';
import { debugData } from './utils/debugData';
import DragPreview from './components/utils/DragPreview';
import { fetchNui } from './utils/fetchNui';
import { useDragDropManager } from 'react-dnd';
import KeyPress from './components/utils/KeyPress';

const mockItems: Record<string, { label: string; description?: string; stack?: boolean }> = {
  money: { label: 'Cash' },
  water: { label: 'Water', description: 'Fresh bottled water.' },
  burger: { label: 'Burger', description: 'Juicy, with **extra** mustard.' },
  phone: { label: 'Phone', stack: false },
  lockpick: { label: 'Lockpick', description: 'Opens simple locks. Breaks easily.' },
  iron: { label: 'Iron' },
  copper: { label: 'Copper' },
  bandage: { label: 'Bandage' },
  armour: { label: 'Body Armor' },
  radio: { label: 'Radio' },
  lftablet: { label: 'LonelyFans Tablet' },
  diamond: { label: 'Diamond' },
};

debugData(
  [
    {
      action: 'init',
      data: {
        locale: {
          ui_use: 'Use', ui_give: 'Give', ui_close: 'Close', ui_drop: 'Drop', ui_durability: 'Durability',
          ui_ammo: 'Ammo', ui_serial: 'Serial', ui_added: 'Added', ui_removed: 'Removed', ui_usefulcontrols: 'Useful controls',
          ui_rmb: 'Open the item context menu', ui_alt_lmb: 'Use an item', ui_ctrl_lmb: 'Quick-move a full stack',
          ui_shift_drag: 'Split a stack in half', ui_ctrl_shift_lmb: 'Move one item', $: '$',
        },
        items: mockItems,
        imagepath: 'images',
        leftInventory: { id: 'test', type: 'player', slots: 50, label: 'Bag', weight: 0, maxWeight: 30000, items: [] },
      },
    },
    {
      action: 'setupInventory',
      data: {
        leftInventory: {
          id: 'test',
          type: 'player',
          slots: 50,
          label: 'Bob Smith',
          weight: 23400,
          maxWeight: 30000,
          items: Array.from({ length: 50 }, (_, i) => {
            const slot = i + 1;
            const filled: Record<number, object> = {
              1: { name: 'money', count: 12500, weight: 0 },
              2: { name: 'phone', count: 1, weight: 200, metadata: { description: 'Number: **555-0143**' } },
              3: { name: 'water', count: 4, weight: 2000 },
              4: { name: 'burger', count: 2, weight: 700 },
              5: { name: 'lockpick', count: 3, weight: 300, metadata: { durability: 34 } },
              6: { name: 'iron', count: 32, weight: 9600 },
              7: { name: 'copper', count: 12, weight: 3600 },
              8: { name: 'armour', count: 1, weight: 3000, metadata: { durability: 82 } },
              9: { name: 'lftablet', count: 1, weight: 500 },
              10: { name: 'diamond', count: 2, weight: 200 },
            };
            return { slot, ...(filled[slot] || {}) };
          }),
        },
        rightInventory: {
          id: 'shop',
          type: 'shop',
          slots: 20,
          label: 'General Store',
          weight: 0,
          maxWeight: 0,
          items: [
            { slot: 1, name: 'water', weight: 500, price: 15, count: 99 },
            { slot: 2, name: 'burger', weight: 350, price: 28, count: 40 },
            { slot: 3, name: 'bandage', weight: 100, price: 80, count: 12 },
            { slot: 4, name: 'radio', weight: 1000, price: 350, count: 5 },
            { slot: 5, name: 'lockpick', weight: 300, price: 900, currency: 'black_money', count: 3 },
            { slot: 6 },
          ],
        },
      },
    },
  ],
  500
);

const App: React.FC = () => {
  const dispatch = useAppDispatch();
  const manager = useDragDropManager();

  useNuiEvent<{
    locale: { [key: string]: string };
    items: typeof Items;
    leftInventory: Inventory;
    imagepath: string;
  }>('init', ({ locale, items, leftInventory, imagepath }) => {
    for (const name in locale) Locale[name] = locale[name];
    for (const name in items) Items[name] = items[name];

    setImagePath(imagepath);
    dispatch(setupInventory({ leftInventory }));
  });

  fetchNui('uiLoaded', {});

  useNuiEvent('closeInventory', () => {
    manager.dispatch({ type: 'dnd-core/END_DRAG' });
  });

  return (
    <div className="app-wrapper">
      <InventoryComponent />
      <DragPreview />
      <KeyPress />
    </div>
  );
};

addEventListener('dragstart', function (event) {
  event.preventDefault();
});

export default App;
