import userRepository from "../repositories/user-repository.js";
export default class userService {
  loginAsync = async (body) => {
    const repo = new userRepository();
    let arrayRes = await repo.loginAsync(body);
    return arrayRes;
  };
  registerAsync = async (body) => {
    const repo = new userRepository();
    let arrayRes = await repo.registerAsync(body);
    return arrayRes;
  };
}
