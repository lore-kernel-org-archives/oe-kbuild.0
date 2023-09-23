Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20409638
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Sep 2023 02:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695437607; x=1726973607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xot01OAyxDzCy6A5HTynBmdt4EM0/UojZq10hB6o3TM=;
  b=ms40F6IdPY+WmIfZI2ziTv/5EiEvvLm4xt4yV+ChDX54aoT3oybK8XgW
   bTkPu6Rpz3JhSpoiBP/6XxyVRhaO7AdtadO/OmxY4997qrlevPjO5F/Sg
   DGMLanLphBYjPbLUGV33f1sNngffEbNenlj+AkWwPW62M2dCoO/ZLuKdz
   ud45vblofi7SbTblqis4pCwTOdEtrNCyB0MSoy6ty+ydXvqPzi2R6vsx+
   XKYHKoqfB/kf0db5VD8/5dGbWi8yZn79rfENjad6118Cbr9PntidiyxBN
   HPoEHhiaEXtiW8PL/6xvJvtj6O19rNqL/1NEJqWoazDd4G5u5gM64cnX6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="445088930"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="445088930"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 19:53:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="751058161"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="751058161"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 22 Sep 2023 19:53:25 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjslg-0001f2-1X;
	Sat, 23 Sep 2023 02:53:18 +0000
Date: Sat, 23 Sep 2023 10:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: security/apparmor/policy_unpack.c:1212 verify_profile() warn: can
 'rules' even be NULL?
Message-ID: <202309231036.NePW0cOa-lkp@intel.com>
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
head:   d90b0276af8f25a0b8ae081a30d1b2a61263393b
commit: 1ad22fcc4d0d2fb2e0f35aed555a86d016d5e590 apparmor: rework profile->rules to be a list
date:   12 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-161-20230919 (https://download.01.org/0day-ci/archive/20230923/202309231036.NePW0cOa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230923/202309231036.NePW0cOa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309231036.NePW0cOa-lkp@intel.com/

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
