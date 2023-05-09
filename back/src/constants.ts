export const FAVORITE_REQUEST_MAPPING = {
  CREATE_FAVORITE: '/create_favorite',
  GET_ALL_FAVORITE: '/getAllFavorites',
  GET_FAVORITE_BY_ID: 'getFavoritesById',
  REMOVE_FAVORITE: '/removeFavorite',
};

export const PRODUCT_REQUEST_MAPPING = {
  CREATE_PRODUCT: '/create_product',
  GET_ALL_PRODUCT: '/getAllProduct',
  GET_PRODUCT_BY_ID: '/getProductById',
  REMOVE_PRODUCT: '/removeProduct',
};

export const USER_REQUEST_MAPPING = {
  CREATE_USER: '/create_user',
  GET_ALL_USER: '/getAllUsers',
  GET_USER_BY_ID: '/getUsersById',
  GET_USER_BY_EMAIL: '/getUserByEmail',
  REMOVE_USER: '/removeUsers',
};

export const ROUTEPATH = 'API/V1';

export const JWT_SECRET = 'jD5h2X93Pcgc4inZ44210a!';

export const AUTH_REQUEST_MAPPING = {
  SIGN_IN: '/signIn',
  SIGN_UP: '/signUp',
};
