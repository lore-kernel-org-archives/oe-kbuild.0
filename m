Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0AA3385AC
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Sep 2026 20:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332534; cv=none; b=UWPyNy+ZdsOAz7fX0rarzKAhn+qlzn/0lQfhiCNc/29G7XK0qXoU298yXHmWRKuRTwJgIjrrq04lW/Tq2IQHFfgIeMFvqwJR6/0er/a2byaNGFje5rs6hQAN5FRAUI+D+UUsAgWUuSLg/snFuJxFITm+/tl11wMZmE7pc2cxQxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332534; c=relaxed/simple;
	bh=n114C5/GjAGD7mauV5vWqhICKH0DhXQvdFnzMgLxTSA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GKPCFRLJA5QAgq9fJwHGgWvziqmA2MK3ZbXRvI/KUAXtcKroCSmDsFs3/cFQVWeRZbt+SHdNA9MNzur7MoRJFH+lvLt1Ta86Vw94SvCSq4IK/YT+0teEWzQjWTZUqe9aSaPbNtct1g7Jd6KuiF6ZPR9uNyLZiDOsjuA0eG9ZKA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lq+nRE7h; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lq+nRE7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789332531; x=1820868531;
  h=date:from:to:cc:subject:message-id;
  bh=n114C5/GjAGD7mauV5vWqhICKH0DhXQvdFnzMgLxTSA=;
  b=lq+nRE7h7h46eV3wy5daoEi9raWBvCczx9gFsiqJ/r/3wO8UvojV5Iqv
   RYFafTWEY492+0pKLSMkOGPgQzJL40KzOOqajlZBGKm0EpE3f+fqsCuBX
   VkBt5bbvUKYOFnq3jeme4w3+7z1ETeLBMpaJRqVfoash3gFSHKSXF+Csr
   w7iPfDYoDFKSbvlMjHl5qV9w7zYfdNi0NE11ipDhiW57MWrsJekjJyOif
   DIzlthVPH5c7jjIxBBjWCFnJhXhYYxA5UyhTVbfki9E1gZtSN4IW4o9va
   JKIWFLRQtDh2PGW1+SdBoGMZU2jCOR1zDQsW9FdfSZfKMwQYrj7kBUiRS
   w==;
X-CSE-ConnectionGUID: Ym+iotAfSfqX+AIcLRLaSg==
X-CSE-MsgGUID: 0Fjw1VjOSESw9KJJ00g4xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89633058"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="89633058"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 13:48:51 -0700
X-CSE-ConnectionGUID: 60Oxle5yQF+9mg6dKwLtlQ==
X-CSE-MsgGUID: zooZh9pbQBC1qoTAwkXQQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="269171692"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 13 Sep 2026 13:48:49 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5r83-000000001hv-0tBC;
	Sun, 13 Sep 2026 20:48:47 +0000
Date: Sun, 13 Sep 2026 22:48:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/s390/kernel/perf_pai.c:1320:12-13: WARNING opportunity
 for min()
Message-ID: <202609132234.kZqjNaow-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Thomas Richter <tmricht@linux.ibm.com>
CC: Vasily Gorbik <gor@linux.ibm.com>
CC: Jan Polensky <japo@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d681d7ef617ef83d6a4de36e5cb4418ef602e122
commit: 9ecc4d033879f7761f2df07e20cd2fbec00fd90b s390/pai: Support CPU hotplug for PMU PAI
date:   5 days ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 days ago
config: s390-randconfig-r051-20260913 (https://download.01.org/0day-ci/archive/20260913/202609132234.kZqjNaow-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9ecc4d033879 ("s390/pai: Support CPU hotplug for PMU PAI")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609132234.kZqjNaow-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/s390/kernel/perf_pai.c:1320:12-13: WARNING opportunity for min()

vim +1320 arch/s390/kernel/perf_pai.c

9ecc4d033879f77 arch/s390/kernel/perf_pai.c        Thomas Richter 2026-09-01  1304  
35a27bad075d594 arch/s390/kernel/perf_pai_crypto.c Thomas Richter 2025-11-05  1305  static int __init pai_init(void)
a3f8423622ef34c arch/s390/kernel/perf_pai_crypto.c Thomas Richter 2025-11-05  1306  {
9ecc4d033879f77 arch/s390/kernel/perf_pai.c        Thomas Richter 2026-09-01  1307  	int state, rc;
9ecc4d033879f77 arch/s390/kernel/perf_pai.c        Thomas Richter 2026-09-01  1308  
39d62336f5c126a arch/s390/kernel/perf_pai_crypto.c Thomas Richter 2022-05-04  1309  	/* Setup s390dbf facility */
8cff0ac21658fed arch/s390/kernel/perf_pai.c        Heiko Carstens 2026-08-25  1310  	paidbg = debug_register("pai", 1, 1, 128);
abc524caa1382a5 arch/s390/kernel/perf_pai_crypto.c Thomas Richter 2025-11-05  1311  	if (!paidbg) {
c3d17464f0262c9 arch/s390/kernel/perf_pai.c        Heiko Carstens 2025-11-20  1312  		pr_err("Registration of s390dbf pai failed\n");
39d62336f5c126a arch/s390/kernel/perf_pai_crypto.c Thomas Richter 2022-05-04  1313  		return -ENOMEM;
39d62336f5c126a arch/s390/kernel/perf_pai_crypto.c Thomas Richter 2022-05-04  1314  	}
abc524caa1382a5 arch/s390/kernel/perf_pai_crypto.c Thomas Richter 2025-11-05  1315  	debug_register_view(paidbg, &debug_sprintf_view);
39d62336f5c126a arch/s390/kernel/perf_pai_crypto.c Thomas Richter 2022-05-04  1316  
9ecc4d033879f77 arch/s390/kernel/perf_pai.c        Thomas Richter 2026-09-01  1317  	/* CPUHP_BP_PREPARE_DYN --> before CPU is brought online */
9ecc4d033879f77 arch/s390/kernel/perf_pai.c        Thomas Richter 2026-09-01  1318  	state = cpuhp_setup_state(CPUHP_BP_PREPARE_DYN, "perf/pai:prepare",
9ecc4d033879f77 arch/s390/kernel/perf_pai.c        Thomas Richter 2026-09-01  1319  				  pai_online_cpu, pai_offline_cpu);
9ecc4d033879f77 arch/s390/kernel/perf_pai.c        Thomas Richter 2026-09-01 @1320  	rc = state < 0 ? state : 0;
9ecc4d033879f77 arch/s390/kernel/perf_pai.c        Thomas Richter 2026-09-01  1321  	if (rc < 0)
9ecc4d033879f77 arch/s390/kernel/perf_pai.c        Thomas Richter 2026-09-01  1322  		goto out_debug;
9ecc4d033879f77 arch/s390/kernel/perf_pai.c        Thomas Richter 2026-09-01  1323  
9ecc4d033879f77 arch/s390/kernel/perf_pai.c        Thomas Richter 2026-09-01  1324  	rc = -ENODEV;
9ecc4d033879f77 arch/s390/kernel/perf_pai.c        Thomas Richter 2026-09-01  1325  	if (!paipmu_setup())
9ecc4d033879f77 arch/s390/kernel/perf_pai.c        Thomas Richter 2026-09-01  1326  		goto out_cpuhp;
9ecc4d033879f77 arch/s390/kernel/perf_pai.c        Thomas Richter 2026-09-01  1327  	return 0;
9ecc4d033879f77 arch/s390/kernel/perf_pai.c        Thomas Richter 2026-09-01  1328  
9ecc4d033879f77 arch/s390/kernel/perf_pai.c        Thomas Richter 2026-09-01  1329  out_cpuhp:
9ecc4d033879f77 arch/s390/kernel/perf_pai.c        Thomas Richter 2026-09-01  1330  	cpuhp_remove_state(state);
9ecc4d033879f77 arch/s390/kernel/perf_pai.c        Thomas Richter 2026-09-01  1331  out_debug:
abc524caa1382a5 arch/s390/kernel/perf_pai_crypto.c Thomas Richter 2025-11-05  1332  	debug_unregister_view(paidbg, &debug_sprintf_view);
abc524caa1382a5 arch/s390/kernel/perf_pai_crypto.c Thomas Richter 2025-11-05  1333  	debug_unregister(paidbg);
9ecc4d033879f77 arch/s390/kernel/perf_pai.c        Thomas Richter 2026-09-01  1334  	return rc;
39d62336f5c126a arch/s390/kernel/perf_pai_crypto.c Thomas Richter 2022-05-04  1335  }
39d62336f5c126a arch/s390/kernel/perf_pai_crypto.c Thomas Richter 2022-05-04  1336  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
