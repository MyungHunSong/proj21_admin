package proj21_admin.service;

import proj21_admin.dto.member.AuthInfo;

public interface AuthService {
	AuthInfo autuicate(String id, String password);
}
