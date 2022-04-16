package Dao;

import Entities.Users;
import javassist.NotFoundException;

public interface IDaoUser {
public Users getUser (String username, String password);
}
