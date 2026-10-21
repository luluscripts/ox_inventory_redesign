import React, { useState, useRef, useEffect } from 'react';
import { useDrop } from 'react-dnd';
import { useAppDispatch, useAppSelector } from '../../store';
import { selectItemAmount, setItemAmount } from '../../store/inventory';
import { DragSource } from '../../typings';
import { onUse } from '../../dnd/onUse';
import { onGive } from '../../dnd/onGive';
import { fetchNui } from '../../utils/fetchNui';
import { Locale } from '../../store/locale';
import UsefulControls from './UsefulControls';
import Icon from '../utils/Icon';

const formatAmount = (n: number) => (n > 0 ? n.toLocaleString('en-US') : '0');
const digitsOnly = (s: string) => s.replace(/\D/g, '');
const countDigitsBefore = (s: string, index: number) => digitsOnly(s.substring(0, index)).length;

const InventoryControl: React.FC = () => {
  const itemAmount = useAppSelector(selectItemAmount);
  const dispatch = useAppDispatch();

  const [infoVisible, setInfoVisible] = useState(false);
  const [value, setValue] = useState(formatAmount(itemAmount));
  const inputRef = useRef<HTMLInputElement>(null);
  const cursorRef = useRef<number | null>(null);

  const [{ isOver: overUse }, use] = useDrop<DragSource, void, { isOver: boolean }>(() => ({
    accept: 'SLOT',
    collect: (monitor) => ({ isOver: monitor.isOver() }),
    drop: (source) => {
      source.inventory === 'player' && onUse(source.item);
    },
  }));

  const [{ isOver: overGive }, give] = useDrop<DragSource, void, { isOver: boolean }>(() => ({
    accept: 'SLOT',
    collect: (monitor) => ({ isOver: monitor.isOver() }),
    drop: (source) => {
      source.inventory === 'player' && onGive(source.item);
    },
  }));

  const commitValue = (raw: string, cursorIndex: number) => {
    const digitsBefore = countDigitsBefore(raw, cursorIndex);
    const num = parseInt(digitsOnly(raw), 10) || 0;

    setValue(formatAmount(num));
    dispatch(setItemAmount(num));
    cursorRef.current = digitsBefore;
  };

  const handleChange = (event: React.ChangeEvent<HTMLInputElement>) =>
    commitValue(event.target.value, event.target.selectionStart ?? 0);

  const handleKeyDown = (event: React.KeyboardEvent<HTMLInputElement>) => {
    const el = event.currentTarget;
    const pos = el.selectionStart ?? 0;

    if (pos !== el.selectionEnd) return;

    if (event.key === 'Backspace' && el.value[pos - 1] === ',') {
      event.preventDefault();
      commitValue(el.value.slice(0, pos - 2) + el.value.slice(pos), pos - 2);
    } else if (event.key === 'Delete' && el.value[pos] === ',') {
      event.preventDefault();
      commitValue(el.value.slice(0, pos) + el.value.slice(pos + 2), pos);
    }
  };

  useEffect(() => {
    if (!inputRef.current || cursorRef.current === null) return;
    let newPos = 0;
    let count = 0;

    for (let i = 0; i < value.length && count < cursorRef.current; i++) {
      if (/\d/.test(value[i])) count++;
      newPos++;
    }

    inputRef.current.setSelectionRange(newPos, newPos);
    cursorRef.current = null;
  }, [value]);

  const step = (delta: number) => {
    const num = Math.max(0, itemAmount + delta);
    setValue(formatAmount(num));
    dispatch(setItemAmount(num));
  };

  return (
    <>
      <UsefulControls infoVisible={infoVisible} setInfoVisible={setInfoVisible} />
      <div className="controls">
        <div className="stepper">
          <button type="button" onClick={() => step(-1)} aria-label="-">
            <Icon name="minus" />
          </button>
          <input type="text" ref={inputRef} value={value} onChange={handleChange} onKeyDown={handleKeyDown} />
          <button type="button" onClick={() => step(1)} aria-label="+">
            <Icon name="plus" />
          </button>
        </div>
        <button
          className={overUse ? 'btn over' : 'btn'}
          ref={(el) => {
            use(el);
          }}
        >
          <Icon name="play" size="0.9em" />
          {Locale.ui_use || 'Use'}
        </button>
        <button
          className={overGive ? 'btn over' : 'btn'}
          ref={(el) => {
            give(el);
          }}
        >
          <Icon name="send" size="0.9em" />
          {Locale.ui_give || 'Give'}
        </button>
      </div>

      <button className="help-btn" onClick={() => setInfoVisible(true)} aria-label="help">
        <Icon name="info" size="1.2em" />
      </button>
    </>
  );
};

export default InventoryControl;
