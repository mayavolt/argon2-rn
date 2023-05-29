# Argon2 for React Native

React Native Wrapper around native Argon2 implementations: [CatCrypto](//github.com/ImKcat/CatCrypto) (iOS) and [argon2kt](//github.com/lambdapioneer/argon2kt) (Android)

## Installation
```bash
npm i mayavolt/argon2-rn --save
```
Works with React-Native 0.71.8

## Usage
You can specify a third optional parameter, the configuration object. The default configuration values do demonstrate in the following example:

```javascript
import {hash} from 'argon2-rn';

try {
    const result = await hash("password", "salt", {
      iterations: 2,
      memory: 32 * 1024,
      parallelism: 1,
      hashLength: 32,
      mode: 'argon2id'
    });
    const {rawHash, encodedHash} = result;
} catch (e) {
    //...
}
```

To verify a password:

```javascript
import {verify} from 'argon2-rn';

try {
  const result = await verify("<big long hash>", "password")
  if (result) {
    // password match
  } else {
    // password did not match
  }
} catch (e) {
  //...
}
```