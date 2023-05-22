"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.AUTH_REQUEST_MAPPING = exports.JWT_SECRET = exports.ROUTEPATH = exports.USER_REQUEST_MAPPING = exports.PRODUCT_REQUEST_MAPPING = exports.FAVORITE_REQUEST_MAPPING = exports.PRODUCT_REVIEW_REQUEST_MAPPING = exports.ORDER_REQUEST_MAPPING = void 0;
exports.ORDER_REQUEST_MAPPING = {
    CREATE_ORDER: '/create_order',
    GET_ALL_ORDERS: '/getAllProductOrders',
    GET_ORDER_BY_ID: '/getOrderById',
    REMOVE_ORDER: '/removeOrder',
};
exports.PRODUCT_REVIEW_REQUEST_MAPPING = {
    CREATE_PRODUCT_REVIEW: '/create_product_review',
    GET_ALL_PRODUCT_REVIEW: '/getAllProductReviews',
    GET_PRODUCT_REVIEW_BY_ID: '/getProductReviewById',
    REMOVE_PRODUCT_REVIEW: '/removeProductReview',
};
exports.FAVORITE_REQUEST_MAPPING = {
    CREATE_FAVORITE: '/create_favorite',
    GET_ALL_FAVORITE: '/getAllFavorites',
    GET_FAVORITE_BY_ID: 'getFavoritesById',
    REMOVE_FAVORITE: '/removeFavorite',
};
exports.PRODUCT_REQUEST_MAPPING = {
    CREATE_PRODUCT: '/create_product',
    GET_ALL_PRODUCT: '/getAllProduct',
    GET_PRODUCT_BY_ID: '/getProductById',
    REMOVE_PRODUCT: '/removeProduct',
};
exports.USER_REQUEST_MAPPING = {
    CREATE_USER: '/create_user',
    GET_ALL_USER: '/getAllUsers',
    GET_USER_BY_ID: '/getUsersById',
    GET_USER_BY_EMAIL: '/getUserByEmail',
    REMOVE_USER: '/removeUsers',
};
exports.ROUTEPATH = 'API/V1';
exports.JWT_SECRET = 'jD5h2X93Pcgc4inZ44210a!';
exports.AUTH_REQUEST_MAPPING = {
    SIGN_IN: '/signIn',
    SIGN_UP: '/signUp',
};
//# sourceMappingURL=constants.js.map