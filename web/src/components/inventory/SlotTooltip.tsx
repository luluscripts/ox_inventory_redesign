import { Inventory, SlotWithItem } from '../../typings';
import React, { useMemo } from 'react';
import { Items } from '../../store/items';
import { Locale } from '../../store/locale';
import { useAppSelector } from '../../store';
import Icon from '../utils/Icon';
import ItemImage from '../utils/ItemImage';
import Divider from '../utils/Divider';
import Markdown from '../utils/Markdown';

const Row: React.FC<{ label: React.ReactNode; value: React.ReactNode }> = ({ label, value }) => (
  <div className="tooltip-row">
    <span>{label}</span>
    <span>{value}</span>
  </div>
);

const SlotTooltip: React.ForwardRefRenderFunction<
  HTMLDivElement,
  { item: SlotWithItem; inventoryType: Inventory['type']; style: React.CSSProperties }
> = ({ item, inventoryType, style }, ref) => {
  const additionalMetadata = useAppSelector((state) => state.inventory.additionalMetadata);
  const itemData = useMemo(() => Items[item.name], [item]);
  const ingredients = useMemo(() => {
    if (!item.ingredients) return null;
    return Object.entries(item.ingredients).sort((a, b) => a[1] - b[1]);
  }, [item]);
  const description = item.metadata?.description || itemData?.description;
  const ammoName = itemData?.ammoName && Items[itemData?.ammoName]?.label;

  if (!itemData) {
    return (
      <div className="tooltip-wrapper" ref={ref} style={style}>
        <div className="tooltip-head">
          <h3>{item.name}</h3>
        </div>
      </div>
    );
  }

  const components: string[] = item.metadata?.components || [];

  return (
    <div className="tooltip-wrapper" ref={ref} style={style}>
      <div className="tooltip-head">
        <h3>{item.metadata?.label || itemData.label || item.name}</h3>
        {inventoryType === 'crafting' ? (
          <span className="chip time">
            <Icon name="clock" size="0.9em" />
            {(item.duration !== undefined ? item.duration : 3000) / 1000}s
          </span>
        ) : (
          item.metadata?.type && <span className="chip">{item.metadata.type}</span>
        )}
      </div>
      {(description || inventoryType !== 'crafting') && <Divider />}
      {description && (
        <div className="tooltip-description">
          <Markdown content={description} className="tooltip-markdown" />
        </div>
      )}
      {inventoryType !== 'crafting' ? (
        <div className="tooltip-rows">
          {item.durability !== undefined && <Row label={Locale.ui_durability} value={Math.trunc(item.durability)} />}
          {item.metadata?.ammo !== undefined && <Row label={Locale.ui_ammo} value={item.metadata.ammo} />}
          {ammoName && <Row label={Locale.ammo_type} value={ammoName} />}
          {item.metadata?.serial && <Row label={Locale.ui_serial} value={item.metadata.serial} />}
          {components[0] && (
            <Row label={Locale.ui_components} value={components.map((c) => Items[c]?.label).join(', ')} />
          )}
          {item.metadata?.weapontint && <Row label={Locale.ui_tint} value={item.metadata.weapontint} />}
          {additionalMetadata.map(
            (data: { metadata: string; value: string }, index: number) =>
              item.metadata &&
              item.metadata[data.metadata] && <Row key={`metadata-${index}`} label={data.value} value={item.metadata[data.metadata]} />
          )}
        </div>
      ) : (
        <div className="tooltip-rows">
          {ingredients &&
            ingredients.map(([name, count]) => (
              <div className="tooltip-ingredient" key={`ingredient-${name}`}>
                <ItemImage item={name} />
                <span>
                  {count >= 1
                    ? `${count}x ${Items[name]?.label || name}`
                    : count === 0
                      ? `${Items[name]?.label || name}`
                      : `${count * 100}% ${Items[name]?.label || name}`}
                </span>
              </div>
            ))}
        </div>
      )}
    </div>
  );
};

export default React.forwardRef(SlotTooltip);
