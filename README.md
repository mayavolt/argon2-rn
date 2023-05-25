# Argon2 for React Native

React Native Wrapper around native Argon2 implementations:

iOS: [CatCrypto](//github.com/ImKcat/CatCrypto)

Android: [argon2kt](//github.com/lambdapioneer/argon2kt)

## Getting started
```bash
npm i @mayavolt/argon2-rn --save
"argon2-rn": "mayavolt/argon2-rn#master"
```
Working with React-Native 0.71.8

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

### Input
The package takes in the following variables:

| Parameter           | Type    |
|---------------------|---------|
| password            | string  |
| salt                | string  |
| config              | object  |
| config.iterations   | integer |
| config.memory       | integer |
| config.parallelism  | integer |
| config.hashLength   | integer |
| config.mode         | string  |

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
