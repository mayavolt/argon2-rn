import { NativeModules } from 'react-native';

const { RNArgon2 } = NativeModules;

export default {
    hash: (password, salt, config) => RNArgon2.hash(password, salt, config),
    verify: (hash, password) => RNArgon2.verify(hash, password),
};