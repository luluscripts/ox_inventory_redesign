export const formatWeight = (grams?: number) => {
  if (!grams || grams <= 0) return '';
  if (grams >= 1000) return `${(grams / 1000).toLocaleString('en-us', { minimumFractionDigits: 2 })}kg`;
  return `${grams.toLocaleString('en-us')}g`;
};
