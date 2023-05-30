import { NativeModules } from 'react-native';

const { RNArgon2 } = NativeModules;

export const { hash, verify } = RNArgon2;