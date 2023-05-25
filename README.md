# Argon2 for React Native

React Native Wrapper around native Argon2 implementations:

iOS: [CatCrypto](//github.com/ImKcat/CatCrypto)

Android: [argon2kt](//github.com/lambdapioneer/argon2kt)

## Getting started
```bash
npm i @mayavolt/argon2-rn --save
"argon2-rn": "mayavolt/argon2-rn#master"
```

Compatibility Table

Working with React-Native 0.71.8

## Usage

```javascript
import argon2 from 'argon2-rn';

try {
    const password = 'password';
    const salt = 'random-strong-salt';
    const result = await argon2(password, salt, {});
    const {rawHash, encodedHash} = result;
        
    console.warn('hashedPassword: ', rawHash);
} catch (e) {
    console.warn(e);
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

You are not required to configure the third parameter which is the `config` object, however you do have to provide an empty object to it if you are not changing any of the values. You can set config values with the following example:

```javascript
const result = await argon2(
    password,
    salt,
    {
      iterations: 5,
      memory: 16 * 1024,
      parallelism: 2,
      hashLength: 20,
      mode: 'argon2i'
    }
);
```


### Output

`rawHash` is the hexadecimal representation

`encodedHash` is the string representation
