exports.views = {
    all_people: {
        map: function (doc) {
             emit(doc._id, doc);
        }
    }
};
