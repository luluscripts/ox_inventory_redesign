import React, { useEffect, useState } from 'react';
import { getItemUrl } from '../../helpers';
import { SlotWithItem } from '../../typings';

// Falls back to the item's first letter when its picture file is missing.
const ItemImage: React.FC<{ item: SlotWithItem | string; label?: string; className?: string }> = ({
  item,
  label,
  className = 'item-img',
}) => {
  const url = getItemUrl(item);
  const [failed, setFailed] = useState(false);

  useEffect(() => setFailed(false), [url]);

  if (!url || failed) {
    const name = label || (typeof item === 'string' ? item : item.name);
    return <div className="item-img-fallback">{name?.charAt(0)}</div>;
  }

  return <img className={className} src={url} alt="" draggable={false} onError={() => setFailed(true)} />;
};

export default ItemImage;
