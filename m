Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446EF6ADC
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Apr 2023 15:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682436355; x=1713972355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8uFTOZSM6VWZG4s9zLkPuHVJV5nk+cHG3UMYxqTAH3M=;
  b=OH4o4dzOtb4y8mU1Wi9D8SMwXAEZcSwCeuiIVMKBFwS6O3z9+ogMUU+c
   MYWxXIikT9vFbw3jNaH3vo3dNf7VackD2Oee5KRk24NB8rrCLB40XOd12
   lshLFQg8n719fZ5JVYIxYA209M/rnOGVH2/gtt5WOLpNd17cXjlOvu8/h
   QUT5GC4RHWSisMmIP2fVtjOIhxtEUmjW4rhQnPEux9Cm4Jle7YVRMlOmT
   mPupcxHQXQbOikQ7xsrEHEBKU4QVj99SX+ThVyhp6zegG77z5ES6HoDTe
   QufaH+kYWkZkUyENkBPcK2zK8z8jjhNLJlzQQRlnk0uuNeOZVPghJsB07
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="327108974"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="327108974"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 08:25:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="726160135"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="726160135"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Apr 2023 08:25:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prKY4-000jUm-2W;
	Tue, 25 Apr 2023 15:25:44 +0000
Date: Tue, 25 Apr 2023 23:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: security/apparmor/policy_unpack.c:1212 verify_profile() warn: can
 'rules' even be NULL?
Message-ID: <202304252318.ote3mtCz-lkp@intel.com>
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
head:   173ea743bf7a9eef04460e03b00ba267cc52aee2
commit: 1ad22fcc4d0d2fb2e0f35aed555a86d016d5e590 apparmor: rework profile->rules to be a list
date:   7 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-m021-20230424 (https://download.01.org/0day-ci/archive/20230425/202304252318.ote3mtCz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304252318.ote3mtCz-lkp@intel.com/

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
https://github.com/intel/lkp-tests
