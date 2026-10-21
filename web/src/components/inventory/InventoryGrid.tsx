import React, { useEffect, useMemo, useRef, useState } from 'react';
import { Inventory } from '../../typings';
import WeightBar from '../utils/WeightBar';
import Icon from '../utils/Icon';
import InventorySlot from './InventorySlot';
import { getTotalWeight } from '../../helpers';
import { useAppSelector } from '../../store';
import { useIntersection } from '../../hooks/useIntersection';

const PAGE_SIZE = 30;

const InventoryGrid: React.FC<{ inventory: Inventory }> = ({ inventory }) => {
  const weight = useMemo(
    () => (inventory.maxWeight !== undefined ? Math.floor(getTotalWeight(inventory.items) * 1000) / 1000 : 0),
    [inventory.maxWeight, inventory.items]
  );
  const [page, setPage] = useState(0);
  const containerRef = useRef(null);
  const { ref, entry } = useIntersection({ threshold: 0.5 });
  const isBusy = useAppSelector((state) => state.inventory.isBusy);

  useEffect(() => {
    if (entry && entry.isIntersecting) {
      setPage((prev) => ++prev);
    }
  }, [entry]);

  return (
    <div className="panel" style={{ pointerEvents: isBusy ? 'none' : 'auto' }}>
      <div className="panel-head">
        <div className="panel-title-row">
          <div className="panel-title">
            <span className="panel-title-icon">
              <Icon name="package" />
            </span>
            <h2>{inventory.label}</h2>
          </div>
          {inventory.maxWeight ? (
            <span className="weight-pill">
              <b>{+(weight / 1000).toFixed(2)}</b> / {+(inventory.maxWeight / 1000).toFixed(2)} kg
            </span>
          ) : null}
        </div>
        {inventory.maxWeight ? (
          <WeightBar percent={(weight / inventory.maxWeight) * 100} />
        ) : (
          <div className="weight-track ghost" />
        )}
      </div>
      <div className="slot-grid" ref={containerRef}>
        {inventory.items.slice(0, (page + 1) * PAGE_SIZE).map((item, index) => (
          <InventorySlot
            key={`${inventory.type}-${inventory.id}-${item.slot}`}
            item={item}
            ref={index === (page + 1) * PAGE_SIZE - 1 ? ref : null}
            inventoryType={inventory.type}
            inventoryGroups={inventory.groups}
            inventoryId={inventory.id}
          />
        ))}
      </div>
    </div>
  );
};

export default InventoryGrid;
