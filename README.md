# Argon2 for React Native

React Native Wrapper around native Argon2 implementations: [CatCrypto](//github.com/ImKcat/CatCrypto) (iOS) and [argon2kt](//github.com/lambdapioneer/argon2kt) (Android)

## Installation
```bash
npm i @mayavolt/argon2-rn --save
```
Works with React-Native 0.71.8

## Usage

```javascript
import argon2 from 'argon2-rn';

try {
    const password = 'password';
    const salt = 'random-strong-salt';
    const result = await argon2(password, salt, {});
    const {rawHash, encodedHash} = result;
} catch (e) {
    //...
}
```

You can specify a third optional parameter, the configuration object. The default configuration values do demonstrate in the following example:

```javascript
const result = await argon2(
    password,
    salt,
    {
      iterations: 2,
      memory: 32 * 1024,
      parallelism: 1,
      hashLength: 32,
      mode: 'argon2id'
    }
);
```

### Output

`rawHash` is the hexadecimal representation

`encodedHash` is the string representation