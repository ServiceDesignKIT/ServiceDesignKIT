export function toggleItemInArr(arr, item, type) {
  let array = arr;
  const index = array.indexOf(item);
  const index2 = array.indexOf(array.find(el => el.includes(item.split('-')[0])));

  if (type == 'subC' && index2 !== -1) {
    array = [
      ...array.slice(0, index2),
      ...array.slice(index2 + 1)
    ]

    if (index2 === index){
      return array
    }
  }
  if (index === -1) {
    return array.concat(item)
  } else {
    return [
      ...array.slice(0, index),
      ...array.slice(index + 1)
    ];
  }
};

export function isArraysIntersect(arr1, arr2) {
  let intersect = false;
  arr1.forEach(item => {
    if (arr2.includes(item)) intersect = true;
  });
  return intersect;
};

export function isSubCatArraysIntersect(arr1, arr2) {
  return !arr2.map(e => e.split('-')[0].trim() )
              .filter((v, i, a) => a.indexOf(v) === i)
              .map(n =>  {
    let arrs = arr2.filter(k => k.includes(n));

    return isArraysIntersect(arr1, arrs);
  }).includes(false)
};

export function isTagsArraysIntersect(arr1, arr2) {
  if (arr1.length === 0) return false
  if (arr2.length === 0) return true
  return !arr2.map(item => arr1.includes(item)).includes(false)
};

export function scroll() {
  const timerID = setInterval(() => {
    window.scrollBy(0, -5); // go up by 5px
    if (window.pageYOffset <= 0) clearInterval(timerID);
  }, 5); // 5 millisec
};