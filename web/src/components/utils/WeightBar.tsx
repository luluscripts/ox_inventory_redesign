import React from 'react';

// Weight: pink→purple, warm at 75%+, red at 95%+. Durability: green, amber under 50, red under 25.
const WeightBar: React.FC<{ percent: number; durability?: boolean }> = ({ percent, durability }) => {
  const pct = Math.max(0, Math.min(100, percent));
  const tone = durability ? (pct < 25 ? 'danger' : pct < 50 ? 'warn' : '') : pct >= 95 ? 'danger' : pct >= 75 ? 'warn' : '';

  return (
    <div className={durability ? 'durability-bar' : 'weight-track'}>
      <div className={tone} style={{ width: `${pct}%`, visibility: pct > 0 ? 'visible' : 'hidden' }} />
    </div>
  );
};

export default WeightBar;
