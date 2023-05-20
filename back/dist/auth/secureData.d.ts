export declare class SecureData {
    hashData(data: string): Promise<string>;
    isHashDataMatch(data: string, hashData: string): Promise<boolean>;
}
