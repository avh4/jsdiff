Elm.Native.JsDiff = {};
Elm.Native.JsDiff.make = function(elm) {
  elm.Native = elm.Native || {};
  elm.Native.Spec = elm.Native.Spec || {};
  elm.Native.JsDiff = elm.Native.JsDiff || {};
  if (elm.Native.JsDiff.values) return elm.Native.JsDiff.values;

  // node.js dependencies
  var JsDiff = require('diff');

  // Elm imports
  var List = Elm.Native.List.make(elm);

  function toChangesList(changeObjects) {
    var changesJsArray = changeObjects.map(function(c) {
      if (c.added) {
        return { ctor: 'Added', _0: c.value };
      } else if (c.removed) {
        return { ctor: 'Removed', _0: c.value };
      } else {
        return { ctor: 'NoChange', _0: c.value };
      }
    });
    return List.fromArray(changesJsArray);
  }

  var functions = [
    'diffChars', 'diffWords', 'diffWordsWithSpace', 'diffLines', 'diffSentences'
  ];

  elm.Native.JsDiff.values = {};
  functions.forEach(function(functionName) {
    elm.Native.JsDiff.values[functionName] = F2(function(a, b) {
      return toChangesList(JsDiff[functionName](a, b));
    });
  });

  elm.Native.JsDiff.values.diffInternalStructure = F2(function(a, b) {
    return toChangesList(JsDiff.diffJson(a, b));
  });

  return elm.Native.JsDiff.values;
};
