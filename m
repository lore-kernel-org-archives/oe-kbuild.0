Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E736015AD83
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jun 2024 07:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719387764; cv=none; b=LZ5csXPBobkbm/M2m6b+Hoh4YZMvGOD6zkbxMcx6skXm+n+O6Nek3DqxY3r4WtRkbadwV0e4TAJX11iU736TNMB42Bq8q8lhfYNSyiMCzW9zSNPPBF+t99m8Y8cYbbV3krCp6RKHe9yagn8L2w1Wan4wgmPb0C/JbC0wbc8nmCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719387764; c=relaxed/simple;
	bh=V4yHNQPVzGvmgnWb76KCEZPOLLLOIH+w37KKUT8/hgY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JoJVTiKyY5DMQ15pVedsplz0UNeoU18gNzo/kivz9NkqWhp71sJYNU7L96lAYHspeTaxkjAhSgotK87wePlmq/3RZxaCoHaCV/g5ZDWqJ9ujjjJDTho9hpXA6HXo9Ak7uUmHA9khACNAMiMLbUJdU/yCaILxs+6fp6Tf/rui4Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwZ8URUK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwZ8URUK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719387763; x=1750923763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V4yHNQPVzGvmgnWb76KCEZPOLLLOIH+w37KKUT8/hgY=;
  b=MwZ8URUKWf6h7BE780JGiE3Nj4F9EHZK3GzTkBZeCF13pf3+ozevQrmp
   y9ZcrW2vrtqGVj2SAv7lwt4VSGLDbd9qJvnmASvdZ4bqCni0YqoolJMSW
   qLcK7Tz6q7hBfQXKSkdTzGQf8ZXxLBsf5PJeB8CZ/1+MPXvuVQSIRoiHt
   ZoZuqHO4tI+T6+Upc+sd4VH2q23/ZqTOr+n0Qhw2N45b7qK71krYk0tka
   3s9EUeQ8dsPmsEO76AxVQzQFMBpC/uOsNtqrM6AxhcxZ3ATpkxTKPMcik
   HJ0n19eYhy5scgcgxVfvsD7cdAzLDDG4WypjtYSUJ+/PzAUUOPfnUZg52
   g==;
X-CSE-ConnectionGUID: PYqSNAlBQquL49NxuuIPgg==
X-CSE-MsgGUID: lyR6yX35R+GvmbWwYwhdng==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16124063"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16124063"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 00:42:42 -0700
X-CSE-ConnectionGUID: bxm0Ce1zRtuk2kAwXKVBQw==
X-CSE-MsgGUID: 6XXCDpRLRNWd4gobMmssrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48510618"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Jun 2024 00:42:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMNIb-000F5i-2B;
	Wed, 26 Jun 2024 07:42:37 +0000
Date: Wed, 26 Jun 2024 15:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2831/8232] kernel/sysctl-test.c:377
 sysctl_test_register_sysctl_sz_invalid_extra_value() warn: (struct
 ctl_table)->procname cannot be NULL. Expression : table_foo[0]->procname
Message-ID: <202406261503.uiwq297V-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Wen Yang <wen.yang@linux.dev>
CC: Joel Granados <j.granados@samsung.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
commit: b5ffbd1396885f76bf87e67d590a3ef063e6d831 [2831/8232] sysctl: move the extra1/2 boundary check of u8 to sysctl_check_table_array
:::::: branch date: 15 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-161-20240626 (https://download.01.org/0day-ci/archive/20240626/202406261503.uiwq297V-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406261503.uiwq297V-lkp@intel.com/

smatch warnings:
kernel/sysctl-test.c:377 sysctl_test_register_sysctl_sz_invalid_extra_value() warn: (struct ctl_table)->procname cannot be NULL. Expression : table_foo[0]->procname
kernel/sysctl-test.c:377 sysctl_test_register_sysctl_sz_invalid_extra_value() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : table_foo[0]->proc_handler
kernel/sysctl-test.c:389 sysctl_test_register_sysctl_sz_invalid_extra_value() warn: (struct ctl_table)->procname cannot be NULL. Expression : table_bar[0]->procname
kernel/sysctl-test.c:389 sysctl_test_register_sysctl_sz_invalid_extra_value() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : table_bar[0]->proc_handler
kernel/sysctl-test.c:401 sysctl_test_register_sysctl_sz_invalid_extra_value() warn: (struct ctl_table)->procname cannot be NULL. Expression : table_qux[0]->procname
kernel/sysctl-test.c:401 sysctl_test_register_sysctl_sz_invalid_extra_value() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : table_qux[0]->proc_handler

vim +377 kernel/sysctl-test.c

2cb80dbbbaba4f Iurii Zaikin 2019-09-23  369  
b5ffbd1396885f Wen Yang     2024-04-19  370  /*
b5ffbd1396885f Wen Yang     2024-04-19  371   * Test that registering an invalid extra value is not allowed.
b5ffbd1396885f Wen Yang     2024-04-19  372   */
b5ffbd1396885f Wen Yang     2024-04-19  373  static void sysctl_test_register_sysctl_sz_invalid_extra_value(
b5ffbd1396885f Wen Yang     2024-04-19  374  		struct kunit *test)
b5ffbd1396885f Wen Yang     2024-04-19  375  {
b5ffbd1396885f Wen Yang     2024-04-19  376  	unsigned char data = 0;
b5ffbd1396885f Wen Yang     2024-04-19 @377  	struct ctl_table table_foo[] = {
b5ffbd1396885f Wen Yang     2024-04-19  378  		{
b5ffbd1396885f Wen Yang     2024-04-19  379  			.procname	= "foo",
b5ffbd1396885f Wen Yang     2024-04-19  380  			.data		= &data,
b5ffbd1396885f Wen Yang     2024-04-19  381  			.maxlen		= sizeof(u8),
b5ffbd1396885f Wen Yang     2024-04-19  382  			.mode		= 0644,
b5ffbd1396885f Wen Yang     2024-04-19  383  			.proc_handler	= proc_dou8vec_minmax,
b5ffbd1396885f Wen Yang     2024-04-19  384  			.extra1		= SYSCTL_FOUR,
b5ffbd1396885f Wen Yang     2024-04-19  385  			.extra2		= SYSCTL_ONE_THOUSAND,
b5ffbd1396885f Wen Yang     2024-04-19  386  		},
b5ffbd1396885f Wen Yang     2024-04-19  387  	};
b5ffbd1396885f Wen Yang     2024-04-19  388  
b5ffbd1396885f Wen Yang     2024-04-19 @389  	struct ctl_table table_bar[] = {
b5ffbd1396885f Wen Yang     2024-04-19  390  		{
b5ffbd1396885f Wen Yang     2024-04-19  391  			.procname	= "bar",
b5ffbd1396885f Wen Yang     2024-04-19  392  			.data		= &data,
b5ffbd1396885f Wen Yang     2024-04-19  393  			.maxlen		= sizeof(u8),
b5ffbd1396885f Wen Yang     2024-04-19  394  			.mode		= 0644,
b5ffbd1396885f Wen Yang     2024-04-19  395  			.proc_handler	= proc_dou8vec_minmax,
b5ffbd1396885f Wen Yang     2024-04-19  396  			.extra1		= SYSCTL_NEG_ONE,
b5ffbd1396885f Wen Yang     2024-04-19  397  			.extra2		= SYSCTL_ONE_HUNDRED,
b5ffbd1396885f Wen Yang     2024-04-19  398  		},
b5ffbd1396885f Wen Yang     2024-04-19  399  	};
b5ffbd1396885f Wen Yang     2024-04-19  400  
b5ffbd1396885f Wen Yang     2024-04-19 @401  	struct ctl_table table_qux[] = {
b5ffbd1396885f Wen Yang     2024-04-19  402  		{
b5ffbd1396885f Wen Yang     2024-04-19  403  			.procname	= "qux",
b5ffbd1396885f Wen Yang     2024-04-19  404  			.data		= &data,
b5ffbd1396885f Wen Yang     2024-04-19  405  			.maxlen		= sizeof(u8),
b5ffbd1396885f Wen Yang     2024-04-19  406  			.mode		= 0644,
b5ffbd1396885f Wen Yang     2024-04-19  407  			.proc_handler	= proc_dou8vec_minmax,
b5ffbd1396885f Wen Yang     2024-04-19  408  			.extra1		= SYSCTL_ZERO,
b5ffbd1396885f Wen Yang     2024-04-19  409  			.extra2		= SYSCTL_TWO_HUNDRED,
b5ffbd1396885f Wen Yang     2024-04-19  410  		},
b5ffbd1396885f Wen Yang     2024-04-19  411  	};
b5ffbd1396885f Wen Yang     2024-04-19  412  
b5ffbd1396885f Wen Yang     2024-04-19  413  	KUNIT_EXPECT_NULL(test, register_sysctl("foo", table_foo));
b5ffbd1396885f Wen Yang     2024-04-19  414  	KUNIT_EXPECT_NULL(test, register_sysctl("foo", table_bar));
b5ffbd1396885f Wen Yang     2024-04-19  415  	KUNIT_EXPECT_NOT_NULL(test, register_sysctl("foo", table_qux));
b5ffbd1396885f Wen Yang     2024-04-19  416  }
b5ffbd1396885f Wen Yang     2024-04-19  417  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
