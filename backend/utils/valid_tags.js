exports.isValidTags=(arr1, arr2)=> {
 
  
  
  if (!Array.isArray(arr1) ) {
    throw new TypeError('Both arguments should be arrays1');
  }
  
  if (!Array.isArray(arr2)) {
    throw new TypeError('Both arguments should be arrays2');
  }
  
  return arr1.every(element => arr2.includes(element));  }