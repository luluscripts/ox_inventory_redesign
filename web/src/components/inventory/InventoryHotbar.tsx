import React, { useState } from 'react';
import { isSlotWithItem } from '../../helpers';
import { formatWeight } from '../../helpers/format';
import useNuiEvent from '../../hooks/useNuiEvent';
import { Items } from '../../store/items';
import WeightBar from '../utils/WeightBar';
import ItemImage from '../utils/ItemImage';
import { useAppSelector } from '../../store';
import { selectLeftInventory } from '../../store/inventory';
import SlideUp from '../utils/transitions/SlideUp';

const InventoryHotbar: React.FC = () => {
  const [hotbarVisible, setHotbarVisible] = useState(false);
  const items = useAppSelector(selectLeftInventory).items.slice(0, 5);

  //stupid fix for timeout
  const [handle, setHandle] = useState<ReturnType<typeof setTimeout>>();
  useNuiEvent('toggleHotbar', () => {
    if (hotbarVisible) {
      setHotbarVisible(false);
    } else {
      if (handle) clearTimeout(handle);
      setHotbarVisible(true);
      setHandle(setTimeout(() => setHotbarVisible(false), 3000));
    }
  });

  return (
    <SlideUp in={hotbarVisible}>
      <div className="hotbar-container">
        {items.map((item) => {
          const label = isSlotWithItem(item) ? item.metadata?.label || Items[item.name]?.label || item.name : '';

          return (
            <div className={isSlotWithItem(item) ? 'slot filled' : 'slot'} key={`hotbar-${item.slot}`}>
              {isSlotWithItem(item) && (
                <>
                  <ItemImage item={item} label={label} />
                  <div className="slot-top">
                    <div className="slot-key">{item.slot}</div>
                    {item.count ? <div className="slot-count">{item.count.toLocaleString('en-us')}x</div> : null}
                  </div>
                  <div className="slot-bottom">
                    <div className="slot-label">{label}</div>
                    <div className="slot-meta">
                      <span>{formatWeight(item.weight)}</span>
                    </div>
                  </div>
                  {item.durability !== undefined && <WeightBar percent={item.durability} durability />}
                </>
              )}
              {!isSlotWithItem(item) && (
                <div className="slot-top">
                  <div className="slot-key">{item.slot}</div>
                </div>
              )}
            </div>
          );
        })}
      </div>
    </SlideUp>
  );
};

export default InventoryHotbar;
