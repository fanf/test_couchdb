exports.views = {
    utc_only: {
        map: function (doc) {
             if(doc.utc) emit(doc.utc, null);
        }
    }
};
