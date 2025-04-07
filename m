Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE3722172E
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Apr 2025 22:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744064570; cv=none; b=lQvNAgPz6kaekiAslSFYp5/+6sHoqzvFqHKGwft87eDYybotjZ5AdhhCUf6yRCJeO4bnL8Xp/2QdeFUSsRU518ix2i0nX2WC5xCm3T+rYB6gH5qgm543fyyWgxEPA9DMnp6+QmyQekfvE+kbiXoM72HX+7NURqt1i42ojfTU85A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744064570; c=relaxed/simple;
	bh=mQF2jnlO7z0kLPhqTp1Jmxoi15G8Nw0xttUBhCaNcn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YldM2ojsJuOwJP3Sa9LGsWCj5Yh8SvvGHscW0LIjVdFUvTnuI8kQfN3NvjkyOKcqRTjf89wCvDtzUHSJwjsqNNZIjv3UeevG0kPNTu/r/qV9CBL4ksOjihvNgiBUvChm0J8W6pT9wf545avqChvVDWb4Nx3WZuy9J/gx/lAG8w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L7MtSmw5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7MtSmw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744064568; x=1775600568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mQF2jnlO7z0kLPhqTp1Jmxoi15G8Nw0xttUBhCaNcn4=;
  b=L7MtSmw5yrNNsxOmLFj1lMcXmIJbOkHT1vDFwMQxvWE+ab5dEammvduP
   mH4Lp6bKyPA9uvtnYKFx2Waw2UtaiaZQgTgnPnv2QncdHCA4qYPGawrMD
   4ptV7nvf5nwIFuhNAXTn4SX8WMdfPRx6PTnIHtwTdChMlLLsAbK83HCbT
   TVju4z5lwLkTbjwwEfi0z6KAzgyuJp2Veagr4dCfAw6LXkowWccZ6pShd
   mLbQYsJpfgy4ElLTfWI0jFEXbyGX74LJDmL0E11SaW6ANkvMCs96N5DTo
   V3GKKNDmQkPT312meqFauVNlpZ9O0+4YxwcfUd3DdyoqoeEb8tUtJ778T
   g==;
X-CSE-ConnectionGUID: v4TofruvSt+Owr1OMCYRHQ==
X-CSE-MsgGUID: F8hTNM2wTGKz0jNtGDi3pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="70850861"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="70850861"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 15:22:45 -0700
X-CSE-ConnectionGUID: 8do78EI7RAOjJNpcHYulgw==
X-CSE-MsgGUID: n4Oi0x1sQcixm4Iuqf9ffQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="128061280"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Apr 2025 15:22:44 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1urZ-0003rZ-2U;
	Mon, 07 Apr 2025 22:22:41 +0000
Date: Tue, 8 Apr 2025 06:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: [android-common:android13-5.15-2024-05 0/1]
 kernel/ucount.c:329:7-29: WARNING: x = atomic_add_return(-1, ...)
Message-ID: <202504080603.bkHyOlPE-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15-2024-05
head:   96ddb774d408960590543f104a10aba091d123d6
commit: 15bc01effefe97757ef02ca09e9d1b927ab22725 [0/1] ucounts: Fix signal ucount refcounting
:::::: branch date: 6 days ago
:::::: commit date: 3 years, 6 months ago
config: i386-randconfig-052-20250403 (https://download.01.org/0day-ci/archive/20250408/202504080603.bkHyOlPE-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202504080603.bkHyOlPE-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/ucount.c:329:7-29: WARNING: x = atomic_add_return(-1, ...)

vim +329 kernel/ucount.c

15bc01effefe97 Eric W. Biederman 2021-10-16  304  
15bc01effefe97 Eric W. Biederman 2021-10-16  305  long inc_rlimit_get_ucounts(struct ucounts *ucounts, enum ucount_type type)
15bc01effefe97 Eric W. Biederman 2021-10-16  306  {
15bc01effefe97 Eric W. Biederman 2021-10-16  307  	/* Caller must hold a reference to ucounts */
15bc01effefe97 Eric W. Biederman 2021-10-16  308  	struct ucounts *iter;
15bc01effefe97 Eric W. Biederman 2021-10-16  309  	long dec, ret = 0;
15bc01effefe97 Eric W. Biederman 2021-10-16  310  
15bc01effefe97 Eric W. Biederman 2021-10-16  311  	for (iter = ucounts; iter; iter = iter->ns->ucounts) {
15bc01effefe97 Eric W. Biederman 2021-10-16  312  		long max = READ_ONCE(iter->ns->ucount_max[type]);
15bc01effefe97 Eric W. Biederman 2021-10-16  313  		long new = atomic_long_add_return(1, &iter->ucount[type]);
15bc01effefe97 Eric W. Biederman 2021-10-16  314  		if (new < 0 || new > max)
15bc01effefe97 Eric W. Biederman 2021-10-16  315  			goto unwind;
15bc01effefe97 Eric W. Biederman 2021-10-16  316  		if (iter == ucounts)
15bc01effefe97 Eric W. Biederman 2021-10-16  317  			ret = new;
15bc01effefe97 Eric W. Biederman 2021-10-16  318  		/*
15bc01effefe97 Eric W. Biederman 2021-10-16  319  		 * Grab an extra ucount reference for the caller when
15bc01effefe97 Eric W. Biederman 2021-10-16  320  		 * the rlimit count was previously 0.
15bc01effefe97 Eric W. Biederman 2021-10-16  321  		 */
15bc01effefe97 Eric W. Biederman 2021-10-16  322  		if (new != 1)
15bc01effefe97 Eric W. Biederman 2021-10-16  323  			continue;
15bc01effefe97 Eric W. Biederman 2021-10-16  324  		if (!get_ucounts(iter))
15bc01effefe97 Eric W. Biederman 2021-10-16  325  			goto dec_unwind;
15bc01effefe97 Eric W. Biederman 2021-10-16  326  	}
15bc01effefe97 Eric W. Biederman 2021-10-16  327  	return ret;
15bc01effefe97 Eric W. Biederman 2021-10-16  328  dec_unwind:
15bc01effefe97 Eric W. Biederman 2021-10-16 @329  	dec = atomic_long_add_return(-1, &iter->ucount[type]);
15bc01effefe97 Eric W. Biederman 2021-10-16  330  	WARN_ON_ONCE(dec < 0);
15bc01effefe97 Eric W. Biederman 2021-10-16  331  unwind:
15bc01effefe97 Eric W. Biederman 2021-10-16  332  	do_dec_rlimit_put_ucounts(ucounts, iter, type);
15bc01effefe97 Eric W. Biederman 2021-10-16  333  	return 0;
15bc01effefe97 Eric W. Biederman 2021-10-16  334  }
15bc01effefe97 Eric W. Biederman 2021-10-16  335  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
