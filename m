Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5342DCC1B
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Jun 2025 01:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748741770; cv=none; b=KlNP81iOvbI4nEK1kPY7oW/0nrCZZmCa1SBYwP8S5HbtQWPAVd2rIrU5ph8m2yvM+w17WzEjdESqTq/ehxq8+HdQrVZ60bvcuHVsZ/ccsRRgTyzIOL5nUfwplRYDG84rdthrC5iWtVJjeOzRoY3ysnxxUGw0CbC74WW7Wd/0IHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748741770; c=relaxed/simple;
	bh=0/w2mrPoS1B/otMdXyv64fCZtkYtgHJ+DtUetNTuqdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AZUgBkD/+vMrn9r4aR4/8wFp/ifbOnl8s6fRZ12rGKAbc3z/iGB0HNscqMDt6fCAhJETq2N21OEy/lUTU0h/ONd7YrxKvqVWqYG+3GPH5+AhSn0xzelhrzRqW9VhWKZTP21GL7/8fCHUID/y0AVvBycTO55mxy2sztWfy2TAAlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vv8PwnRs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vv8PwnRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748741768; x=1780277768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0/w2mrPoS1B/otMdXyv64fCZtkYtgHJ+DtUetNTuqdU=;
  b=Vv8PwnRssgqH1PMR4bjJv70HJP0yXLKMrIHXrid7QnHUwRbNA5fd1PW4
   srNfCwKyG6FDaa5EPTbteS04LENFUrPlYbqTjPIBiRR2HNoQu2lBLlSM7
   26aMh82kmPQCKLQFa0RtIwnxvs83qwfbpNwp3gT17WIcGORMNRrJ5AyJ7
   7OVmpR2t7ho+YS8ypCBNZs80D3FJ8GkK91a4Phwho+ZZIUmpUbY7aFAq8
   xiHkTdgO40G2Xpkcn6mmpxGciYgC32JEtzBMLF2XTRCBt7B+j3IpUShjV
   jZY827xPg8GH9OithnBZ4Vj0Htvmqm8RQNM+hGQ6pSkh8xGMI9O/Ju6Sm
   Q==;
X-CSE-ConnectionGUID: 8MPlTtsiRiaQIlqdvAwLjw==
X-CSE-MsgGUID: yuA3WRe7RUKbbRlDy3WYog==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="62143790"
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="62143790"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 18:36:07 -0700
X-CSE-ConnectionGUID: xTiDHiMOTxulyWVMkhn6tA==
X-CSE-MsgGUID: DMWLjCURTWyFIu7UUdwTUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="144071639"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 May 2025 18:36:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLXcJ-000Yjc-32;
	Sun, 01 Jun 2025 01:36:03 +0000
Date: Sun, 1 Jun 2025 09:35:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/netlabel/netlabel_kapi.c:1200 netlbl_conn_setattr() warn:
 inconsistent returns 'rcu_read'.
Message-ID: <202506010920.TbxfWuYH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kuniyuki Iwashima <kuniyu@amazon.com>
CC: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4cb6c8af8591135ec000fbe4bb474139ceec595d
commit: 6e9f2df1c550ead7cecb3e450af1105735020c92 calipso: Don't call calipso functions for AF_INET sk.
date:   4 days ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20250601 (https://download.01.org/0day-ci/archive/20250601/202506010920.TbxfWuYH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506010920.TbxfWuYH-lkp@intel.com/

smatch warnings:
net/netlabel/netlabel_kapi.c:1200 netlbl_conn_setattr() warn: inconsistent returns 'rcu_read'.

vim +/rcu_read +1200 net/netlabel/netlabel_kapi.c

8ec9897ec2e93a Davide Caratti    2024-05-10  1116  
014ab19a69c325 Paul Moore        2008-10-10  1117  /**
014ab19a69c325 Paul Moore        2008-10-10  1118   * netlbl_conn_setattr - Label a connected socket using the correct protocol
014ab19a69c325 Paul Moore        2008-10-10  1119   * @sk: the socket to label
014ab19a69c325 Paul Moore        2008-10-10  1120   * @addr: the destination address
014ab19a69c325 Paul Moore        2008-10-10  1121   * @secattr: the security attributes
014ab19a69c325 Paul Moore        2008-10-10  1122   *
014ab19a69c325 Paul Moore        2008-10-10  1123   * Description:
014ab19a69c325 Paul Moore        2008-10-10  1124   * Attach the correct label to the given connected socket using the security
014ab19a69c325 Paul Moore        2008-10-10  1125   * attributes specified in @secattr.  The caller is responsible for ensuring
014ab19a69c325 Paul Moore        2008-10-10  1126   * that @sk is locked.  Returns zero on success, negative values on failure.
014ab19a69c325 Paul Moore        2008-10-10  1127   *
014ab19a69c325 Paul Moore        2008-10-10  1128   */
014ab19a69c325 Paul Moore        2008-10-10  1129  int netlbl_conn_setattr(struct sock *sk,
014ab19a69c325 Paul Moore        2008-10-10  1130  			struct sockaddr *addr,
014ab19a69c325 Paul Moore        2008-10-10  1131  			const struct netlbl_lsm_secattr *secattr)
014ab19a69c325 Paul Moore        2008-10-10  1132  {
014ab19a69c325 Paul Moore        2008-10-10  1133  	int ret_val;
014ab19a69c325 Paul Moore        2008-10-10  1134  	struct sockaddr_in *addr4;
ceba1832b1b2da Huw Davies        2016-06-27  1135  #if IS_ENABLED(CONFIG_IPV6)
ceba1832b1b2da Huw Davies        2016-06-27  1136  	struct sockaddr_in6 *addr6;
ceba1832b1b2da Huw Davies        2016-06-27  1137  #endif
6a8b7f0c85f1f4 Paul Moore        2013-08-02  1138  	struct netlbl_dommap_def *entry;
014ab19a69c325 Paul Moore        2008-10-10  1139  
014ab19a69c325 Paul Moore        2008-10-10  1140  	rcu_read_lock();
014ab19a69c325 Paul Moore        2008-10-10  1141  	switch (addr->sa_family) {
014ab19a69c325 Paul Moore        2008-10-10  1142  	case AF_INET:
014ab19a69c325 Paul Moore        2008-10-10  1143  		addr4 = (struct sockaddr_in *)addr;
6a8b7f0c85f1f4 Paul Moore        2013-08-02  1144  		entry = netlbl_domhsh_getentry_af4(secattr->domain,
014ab19a69c325 Paul Moore        2008-10-10  1145  						   addr4->sin_addr.s_addr);
6a8b7f0c85f1f4 Paul Moore        2013-08-02  1146  		if (entry == NULL) {
014ab19a69c325 Paul Moore        2008-10-10  1147  			ret_val = -ENOENT;
014ab19a69c325 Paul Moore        2008-10-10  1148  			goto conn_setattr_return;
014ab19a69c325 Paul Moore        2008-10-10  1149  		}
6a8b7f0c85f1f4 Paul Moore        2013-08-02  1150  		switch (entry->type) {
014ab19a69c325 Paul Moore        2008-10-10  1151  		case NETLBL_NLTYPE_CIPSOV4:
014ab19a69c325 Paul Moore        2008-10-10  1152  			ret_val = cipso_v4_sock_setattr(sk,
8ec9897ec2e93a Davide Caratti    2024-05-10  1153  							entry->cipso, secattr,
8ec9897ec2e93a Davide Caratti    2024-05-10  1154  							netlbl_sk_lock_check(sk));
014ab19a69c325 Paul Moore        2008-10-10  1155  			break;
014ab19a69c325 Paul Moore        2008-10-10  1156  		case NETLBL_NLTYPE_UNLABELED:
014ab19a69c325 Paul Moore        2008-10-10  1157  			/* just delete the protocols we support for right now
014ab19a69c325 Paul Moore        2008-10-10  1158  			 * but we could remove other protocols if needed */
ceba1832b1b2da Huw Davies        2016-06-27  1159  			netlbl_sock_delattr(sk);
014ab19a69c325 Paul Moore        2008-10-10  1160  			ret_val = 0;
014ab19a69c325 Paul Moore        2008-10-10  1161  			break;
014ab19a69c325 Paul Moore        2008-10-10  1162  		default:
014ab19a69c325 Paul Moore        2008-10-10  1163  			ret_val = -ENOENT;
014ab19a69c325 Paul Moore        2008-10-10  1164  		}
014ab19a69c325 Paul Moore        2008-10-10  1165  		break;
dfd56b8b38fff3 Eric Dumazet      2011-12-10  1166  #if IS_ENABLED(CONFIG_IPV6)
014ab19a69c325 Paul Moore        2008-10-10  1167  	case AF_INET6:
6e9f2df1c550ea Kuniyuki Iwashima 2025-05-22  1168  		if (sk->sk_family != AF_INET6)
6e9f2df1c550ea Kuniyuki Iwashima 2025-05-22  1169  			return -EAFNOSUPPORT;
6e9f2df1c550ea Kuniyuki Iwashima 2025-05-22  1170  
ceba1832b1b2da Huw Davies        2016-06-27  1171  		addr6 = (struct sockaddr_in6 *)addr;
ceba1832b1b2da Huw Davies        2016-06-27  1172  		entry = netlbl_domhsh_getentry_af6(secattr->domain,
ceba1832b1b2da Huw Davies        2016-06-27  1173  						   &addr6->sin6_addr);
ceba1832b1b2da Huw Davies        2016-06-27  1174  		if (entry == NULL) {
ceba1832b1b2da Huw Davies        2016-06-27  1175  			ret_val = -ENOENT;
ceba1832b1b2da Huw Davies        2016-06-27  1176  			goto conn_setattr_return;
ceba1832b1b2da Huw Davies        2016-06-27  1177  		}
ceba1832b1b2da Huw Davies        2016-06-27  1178  		switch (entry->type) {
ceba1832b1b2da Huw Davies        2016-06-27  1179  		case NETLBL_NLTYPE_CALIPSO:
ceba1832b1b2da Huw Davies        2016-06-27  1180  			ret_val = calipso_sock_setattr(sk,
ceba1832b1b2da Huw Davies        2016-06-27  1181  						       entry->calipso, secattr);
ceba1832b1b2da Huw Davies        2016-06-27  1182  			break;
ceba1832b1b2da Huw Davies        2016-06-27  1183  		case NETLBL_NLTYPE_UNLABELED:
ceba1832b1b2da Huw Davies        2016-06-27  1184  			/* just delete the protocols we support for right now
ceba1832b1b2da Huw Davies        2016-06-27  1185  			 * but we could remove other protocols if needed */
ceba1832b1b2da Huw Davies        2016-06-27  1186  			netlbl_sock_delattr(sk);
014ab19a69c325 Paul Moore        2008-10-10  1187  			ret_val = 0;
014ab19a69c325 Paul Moore        2008-10-10  1188  			break;
ceba1832b1b2da Huw Davies        2016-06-27  1189  		default:
ceba1832b1b2da Huw Davies        2016-06-27  1190  			ret_val = -ENOENT;
ceba1832b1b2da Huw Davies        2016-06-27  1191  		}
ceba1832b1b2da Huw Davies        2016-06-27  1192  		break;
014ab19a69c325 Paul Moore        2008-10-10  1193  #endif /* IPv6 */
014ab19a69c325 Paul Moore        2008-10-10  1194  	default:
389fb800ac8be2 Paul Moore        2009-03-27  1195  		ret_val = -EPROTONOSUPPORT;
014ab19a69c325 Paul Moore        2008-10-10  1196  	}
014ab19a69c325 Paul Moore        2008-10-10  1197  
014ab19a69c325 Paul Moore        2008-10-10  1198  conn_setattr_return:
014ab19a69c325 Paul Moore        2008-10-10  1199  	rcu_read_unlock();
014ab19a69c325 Paul Moore        2008-10-10 @1200  	return ret_val;
014ab19a69c325 Paul Moore        2008-10-10  1201  }
014ab19a69c325 Paul Moore        2008-10-10  1202  

:::::: The code at line 1200 was first introduced by commit
:::::: 014ab19a69c325f52d7bae54ceeda73d6307ae0c selinux: Set socket NetLabel based on connection endpoint

:::::: TO: Paul Moore <paul.moore@hp.com>
:::::: CC: Paul Moore <paul.moore@hp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
