"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SecureData = void 0;
const bcrypt = require("bcrypt");
class SecureData {
    async hashData(data) {
        const salt = await bcrypt.genSalt();
        return await bcrypt.hash(data, salt);
    }
    async isHashDataMatch(data, hashData) {
        return await bcrypt.compare(data, hashData);
    }
}
exports.SecureData = SecureData;
//# sourceMappingURL=secureData.js.map