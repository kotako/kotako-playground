import sum from './sum.js';

// test('失敗するテスト', () => {
//   expect(1).toBe(2);
// });

test('1+2 = 3である', () => {
  expect(sum(1, 2)).toBe(3);
});

test('1+2 = 5でない', () => {
  expect(sum(1, 2)).not.toBe(5);
});

// 浮動小数点の値まで確認したい時はtoBeCloseTo
// toBeだと失敗する
test('0.1+0.2 = 0.3である', () => {
  expect(sum(0.1, 0.2)).toBeCloseTo(0.3);
});

test('文字列が入力されたら連結 1+2 = 12', () => {
  expect(sum('1', '2')).toBe('12');
});
