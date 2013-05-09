exports.views = {
    all_people: {
        map: function (doc) {
             emit(null, doc);
        }
    }
};
