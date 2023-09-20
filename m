Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA8315A0
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Sep 2023 00:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695168199; x=1726704199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZMt4TdmrhlKon0lfngQ0c88EfuoT02h1AMq/wnY453k=;
  b=Gy7X0rjXvum/LaqBm78bQ7yU2wl8Va6VnMmOtw6uFiae0B3MyRipxplj
   wZtZv96lzqbrdSYO2weNm6XidRHOr5vrhw2DX2WDm2iJAXZQktMl4g1eI
   9k4i7R+UshK8P54jgeNMwzJbMTu4kK/XmQJr5gwqI3mZZVRrtnMjQCuam
   wnYsS1oIpNDQKSoyERYAqgod4UYWCD/d2gfYuujWbTHHJk3QTD7JpkHaj
   ekXi2QFR4QndFsqMP07ruEs3ri8F4PXXauNvomzqy015lrg0H2yhcg4d7
   PUspYLxripVvn96/0mYAupuV5Q9lNQn7qBRCBPog2DHdcbC7axDuZYGH/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="377399033"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="377399033"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 17:02:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="1077196887"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="1077196887"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 19 Sep 2023 17:02:35 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qikfp-00085g-0Y;
	Wed, 20 Sep 2023 00:02:33 +0000
Date: Wed, 20 Sep 2023 08:01:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: security/apparmor/policy_unpack.c:1212 verify_profile() warn: can
 'rules' even be NULL?
Message-ID: <202309200745.QZY8nf8F-lkp@intel.com>
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
TO: John Johansen <john.johansen@canonical.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2cf0f715623872823a72e451243bbf555d10d032
commit: 1ad22fcc4d0d2fb2e0f35aed555a86d016d5e590 apparmor: rework profile->rules to be a list
date:   12 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-161-20230919 (https://download.01.org/0day-ci/archive/20230920/202309200745.QZY8nf8F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230920/202309200745.QZY8nf8F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309200745.QZY8nf8F-lkp@intel.com/

New smatch warnings:
security/apparmor/policy_unpack.c:1212 verify_profile() warn: can 'rules' even be NULL?

Old smatch warnings:
security/apparmor/policy_unpack.c:175 aa_loaddata_kref() warn: can 'd' even be NULL?
security/apparmor/policy_unpack.c:488 unpack_trans_table() warn: impossible condition '(size > (1 << 24)) => (0-u16max > 16777216)'
security/apparmor/policy_unpack.c:544 unpack_trans_table() error: uninitialized symbol 'table'.
security/apparmor/policy_unpack.c:735 unpack_pdb() warn: unsigned 'policy->size' is never less than zero.
security/apparmor/policy_unpack.c:1081 unpack_profile() warn: passing zero to 'ERR_PTR'

vim +/rules +1212 security/apparmor/policy_unpack.c

670f31774ab6bf John Johansen 2022-08-26  1199  
736ec752d95e91 John Johansen 2010-07-29  1200  /**
736ec752d95e91 John Johansen 2010-07-29  1201   * verify_profile - Do post unpack analysis to verify profile consistency
736ec752d95e91 John Johansen 2010-07-29  1202   * @profile: profile to verify (NOT NULL)
736ec752d95e91 John Johansen 2010-07-29  1203   *
736ec752d95e91 John Johansen 2010-07-29  1204   * Returns: 0 if passes verification else error
7572fea31e3e5c John Johansen 2020-11-13  1205   *
7572fea31e3e5c John Johansen 2020-11-13  1206   * This verification is post any unpack mapping or changes
736ec752d95e91 John Johansen 2010-07-29  1207   */
736ec752d95e91 John Johansen 2010-07-29  1208  static int verify_profile(struct aa_profile *profile)
736ec752d95e91 John Johansen 2010-07-29  1209  {
1ad22fcc4d0d2f John Johansen 2022-09-05  1210  	struct aa_ruleset *rules = list_first_entry(&profile->rules,
1ad22fcc4d0d2f John Johansen 2022-09-05  1211  						    typeof(*rules), list);
1ad22fcc4d0d2f John Johansen 2022-09-05 @1212  	if (!rules)
1ad22fcc4d0d2f John Johansen 2022-09-05  1213  		return 0;
1ad22fcc4d0d2f John Johansen 2022-09-05  1214  
1ad22fcc4d0d2f John Johansen 2022-09-05  1215  	if ((rules->file.dfa && !verify_dfa_xindex(rules->file.dfa,
1ad22fcc4d0d2f John Johansen 2022-09-05  1216  						  rules->file.trans.size)) ||
1ad22fcc4d0d2f John Johansen 2022-09-05  1217  	    (rules->policy.dfa &&
1ad22fcc4d0d2f John Johansen 2022-09-05  1218  	     !verify_dfa_xindex(rules->policy.dfa, rules->policy.trans.size))) {
7572fea31e3e5c John Johansen 2020-11-13  1219  		audit_iface(profile, NULL, NULL,
7572fea31e3e5c John Johansen 2020-11-13  1220  			    "Unpack: Invalid named transition", NULL, -EPROTO);
736ec752d95e91 John Johansen 2010-07-29  1221  		return -EPROTO;
736ec752d95e91 John Johansen 2010-07-29  1222  	}
736ec752d95e91 John Johansen 2010-07-29  1223  
1ad22fcc4d0d2f John Johansen 2022-09-05  1224  	if (!verify_perms(&rules->file)) {
670f31774ab6bf John Johansen 2022-08-26  1225  		audit_iface(profile, NULL, NULL,
670f31774ab6bf John Johansen 2022-08-26  1226  			    "Unpack: Invalid perm index", NULL, -EPROTO);
670f31774ab6bf John Johansen 2022-08-26  1227  		return -EPROTO;
670f31774ab6bf John Johansen 2022-08-26  1228  	}
1ad22fcc4d0d2f John Johansen 2022-09-05  1229  	if (!verify_perms(&rules->policy)) {
670f31774ab6bf John Johansen 2022-08-26  1230  		audit_iface(profile, NULL, NULL,
670f31774ab6bf John Johansen 2022-08-26  1231  			    "Unpack: Invalid perm index", NULL, -EPROTO);
670f31774ab6bf John Johansen 2022-08-26  1232  		return -EPROTO;
670f31774ab6bf John Johansen 2022-08-26  1233  	}
217af7e2f4deb6 John Johansen 2022-07-29  1234  	if (!verify_perms(&profile->attach.xmatch)) {
670f31774ab6bf John Johansen 2022-08-26  1235  		audit_iface(profile, NULL, NULL,
670f31774ab6bf John Johansen 2022-08-26  1236  			    "Unpack: Invalid perm index", NULL, -EPROTO);
670f31774ab6bf John Johansen 2022-08-26  1237  		return -EPROTO;
670f31774ab6bf John Johansen 2022-08-26  1238  	}
670f31774ab6bf John Johansen 2022-08-26  1239  
736ec752d95e91 John Johansen 2010-07-29  1240  	return 0;
736ec752d95e91 John Johansen 2010-07-29  1241  }
736ec752d95e91 John Johansen 2010-07-29  1242  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
