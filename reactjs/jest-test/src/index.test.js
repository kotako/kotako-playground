import snapshotDiff from 'snapshot-diff';

// toBeは===で等価性のテストを行う
test('オブジェクトの値をtoBeで評価できない', () => {
  const data = { one: 1 };
  data['two'] = 2;
  expect(data).not.toBe({ one: 1, two: 2 });
});

// オブジェクトの値を確認したい場合はtoEqualを用いる
test('オブジェクトの値をtoEqualで評価できる', () => {
  const data = { one: 1 };
  data['two'] = 2;
  expect(data).toEqual({ one: 1, two: 2 });
});

// スナップショットテスト: テスト前のスナップショットと比較してくれる
// スナップショットの再生性したい時は jest --updateSnapshot
test('object assignment with jest snapshot', () => {
  const data = { one: 1, two: 2 };
  expect(data).toMatchSnapshot();
});

// snapshot-diffを用いたスナップショットテスト
// 差分を表示してくれる
test('object assignment with jest snapshot-diff', () => {
  const data = { one: 1, two: 2 };
  const dummy = { one: 2, two: 2 };
  expect(snapshotDiff(data, dummy)).toMatchSnapshot();
});
