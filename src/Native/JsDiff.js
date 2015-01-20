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

  function diffChars(a, b) {
    return toChangesList(JsDiff.diffChars(a, b));
  }

  function diffWords(a, b) {
    return toChangesList(JsDiff.diffWords(a, b));
  }

  function diffWordsWithSpace(a, b) {
    return toChangesList(JsDiff.diffWordsWithSpace(a, b));
  }

  function diffLines(a, b) {
    return toChangesList(JsDiff.diffLines(a, b));
  }

  function diffSentences(a, b) {
    return toChangesList(JsDiff.diffSentences(a, b));
  }

  return elm.Native.JsDiff.values = {
    diffChars: F2(diffChars),
    diffWords: F2(diffWords),
    diffWordsWithSpace: F2(diffWordsWithSpace),
    diffLines: F2(diffLines),
    diffSentences: F2(diffSentences)
  };
};
