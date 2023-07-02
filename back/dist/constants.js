"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.AUTH_REQUEST_MAPPING = exports.JWT_SECRET = exports.ROUTEPATH = exports.USER_REQUEST_MAPPING = exports.PRODUCT_REQUEST_MAPPING = void 0;
exports.PRODUCT_REQUEST_MAPPING = {
    CREATE_PRODUCT: '/create_product',
    GET_ALL_PRODUCT: '/getAllProduct',
    GET_PRODUCT_BY_ID: '/getProductById',
    REMOVE_PRODUCT: '/removeProduct',
};
exports.USER_REQUEST_MAPPING = {
    CREATE_USER: '/create_user',
    GET_ALL_USER: '/getAllUsers',
    GET_USER_BY_ID: '/getUsersById/:id',
    GET_USER_BY_EMAIL: '/getUserByEmail/:email',
    REMOVE_USER: '/removeUsers/:id',
};
exports.ROUTEPATH = 'API/V1';
exports.JWT_SECRET = 'jD5h2X93Pcgc4inZ44210a!';
exports.AUTH_REQUEST_MAPPING = {
    SIGN_IN: '/signIn',
    SIGN_UP: '/signUp',
};
//# sourceMappingURL=constants.js.map