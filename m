Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F362EC54C
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Apr 2026 17:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777570481; cv=none; b=hb61y7MzTJ4TluunuiUinwQciN8c7KClOWt8rCDGclXosEA1RrxbLxCDX8IgY/CG6ZLEwGY/EYtztbFKtCaUoUv6qNVNDns+uRK+ovIw8Y1A1NiwGwC56B3OD12TU1jCnU4hOaBA2d1iD8QhjXSOY4U0Sk4wRbTv3VI3R3Hb5SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777570481; c=relaxed/simple;
	bh=fueShNjPuGV3ZA83SXDyV9YkD+NHIb4wQ1ykmd1lPzg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bF78B5fC7ZO/hRs5tNw8NgKM5z2+Tr3D0T8PZAcoA235Vwojy7LlaaZROzcx5upE/fbxgoKYpormIjEVa3V+6c//SIhJ/fbsxKl5kfrTT2OX2ioUoAspitbENGfbP4jCakOypMRHdohAdGjHx5X7zb2Wsl8dfEcIQZil+WXHKAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMm7/jvS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMm7/jvS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777570481; x=1809106481;
  h=date:from:to:cc:subject:message-id;
  bh=fueShNjPuGV3ZA83SXDyV9YkD+NHIb4wQ1ykmd1lPzg=;
  b=nMm7/jvSrmZjy7e7R/2ZeC7xwMVCCL47kvYM16AVj5hDaC7ccHZIfn4q
   L3D+MefE7VS28HNfAMR3T5bP1t4+/ONwFYmM+aeTXW0MKENSQeT1YjfqH
   mSB3/6YAS/hbkcipIjobQcvcUVPwgnanhmsrO4LVxtaTAg8RKxTwNBAio
   ksCeWJUvFsL5a8wCI2CUjl6+Mwhqv9WJZFp/CwYp6SsVygpoWmpO3zpxj
   U2Wlp9OLB+REnnTkouBMeOTA7+SvBLFj3NwZan5yHcEPJ7cktjLYD8VI3
   aMrL8zVoB6rkZpsVbzdyADli07KDqfnw/2mFseiqSMLvBdh/Ve2lEFYt4
   w==;
X-CSE-ConnectionGUID: us+vlbVjRBC9tGTCEpBXRw==
X-CSE-MsgGUID: APfejxbjTz+51fVfcksmnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="89128432"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="89128432"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 10:34:40 -0700
X-CSE-ConnectionGUID: q26HpftESqOw+g0zlIgjbA==
X-CSE-MsgGUID: 4o7AVUWSSbO5+5kOm2Yi+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="231999466"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 30 Apr 2026 10:34:38 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIVHY-000000004rx-3Nlm;
	Thu, 30 Apr 2026 17:34:36 +0000
Date: Thu, 30 Apr 2026 19:34:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/x86/events/intel/uncore.c:895:52: warning: '%s'
 directive writing between 1 and 2147483645 bytes into a region of size 25
Message-ID: <202604301946.rm05ywGm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nathan Chancellor <nathan@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Nathan-Chancellor/kbuild-Bump-minimum-version-of-LLVM-for-building-the-kernel-to-17-0-1/20260430-043424
head:   17dfe31b55093c1758a17841543431051822881d
commit: 1e33709337cc5acbb55e18de4e4caa83ed61a091 x86/build: Drop unused '-ffreestanding' addition to KBUILD_CFLAGS
date:   21 hours ago
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260430/202604301946.rm05ywGm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301946.rm05ywGm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604301946.rm05ywGm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/events/intel/uncore.c: In function 'uncore_get_pmu_name':
>> arch/x86/events/intel/uncore.c:895:52: warning: '%s' directive writing between 1 and 2147483645 bytes into a region of size 25 [-Wformat-overflow=]
     895 |                         sprintf(pmu->name, "uncore_%s", type->name);
         |                                                    ^~
   arch/x86/events/intel/uncore.c:895:25: note: 'sprintf' output between 9 and 2147483653 bytes into a destination of size 32
     895 |                         sprintf(pmu->name, "uncore_%s", type->name);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/char/hpet.c: In function 'hpet_ioctl_ieon':
>> drivers/char/hpet.c:483:45: warning: '%d' directive writing between 1 and 9 bytes into a region of size 3 [-Wformat-overflow=]
     483 |                 sprintf(devp->hd_name, "hpet%d", (int)(devp - hpetp->hp_dev));
         |                                             ^~
   drivers/char/hpet.c:483:40: note: directive argument in the range [-24403223, 24403223]
     483 |                 sprintf(devp->hd_name, "hpet%d", (int)(devp - hpetp->hp_dev));
         |                                        ^~~~~~~~
   drivers/char/hpet.c:483:17: note: 'sprintf' output between 6 and 14 bytes into a destination of size 7
     483 |                 sprintf(devp->hd_name, "hpet%d", (int)(devp - hpetp->hp_dev));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +895 arch/x86/events/intel/uncore.c

8053f2d752e293 Kan Liang 2021-06-30  879  
d6c754130435ab Kan Liang 2021-03-17  880  static void uncore_get_pmu_name(struct intel_uncore_pmu *pmu)
d6c754130435ab Kan Liang 2021-03-17  881  {
d6c754130435ab Kan Liang 2021-03-17  882  	struct intel_uncore_type *type = pmu->type;
d6c754130435ab Kan Liang 2021-03-17  883  
d6c754130435ab Kan Liang 2021-03-17  884  	/*
d6c754130435ab Kan Liang 2021-03-17  885  	 * No uncore block name in discovery table.
d6c754130435ab Kan Liang 2021-03-17  886  	 * Use uncore_type_&typeid_&boxid as name.
d6c754130435ab Kan Liang 2021-03-17  887  	 */
d6c754130435ab Kan Liang 2021-03-17  888  	if (!type->name) {
8053f2d752e293 Kan Liang 2021-06-30  889  		uncore_get_alias_name(pmu->name, pmu);
d6c754130435ab Kan Liang 2021-03-17  890  		return;
d6c754130435ab Kan Liang 2021-03-17  891  	}
d6c754130435ab Kan Liang 2021-03-17  892  
d6c754130435ab Kan Liang 2021-03-17  893  	if (type->num_boxes == 1) {
d6c754130435ab Kan Liang 2021-03-17  894  		if (strlen(type->name) > 0)
d6c754130435ab Kan Liang 2021-03-17 @895  			sprintf(pmu->name, "uncore_%s", type->name);
d6c754130435ab Kan Liang 2021-03-17  896  		else
d6c754130435ab Kan Liang 2021-03-17  897  			sprintf(pmu->name, "uncore");
c54c53d9921ade Kan Liang 2021-06-30  898  	} else {
c54c53d9921ade Kan Liang 2021-06-30  899  		/*
c54c53d9921ade Kan Liang 2021-06-30  900  		 * Use the box ID from the discovery table if applicable.
c54c53d9921ade Kan Liang 2021-06-30  901  		 */
c54c53d9921ade Kan Liang 2021-06-30  902  		sprintf(pmu->name, "uncore_%s_%d", type->name,
3af548f2361077 Kan Liang 2023-01-12  903  			uncore_get_box_id(type, pmu));
c54c53d9921ade Kan Liang 2021-06-30  904  	}
d6c754130435ab Kan Liang 2021-03-17  905  }
d6c754130435ab Kan Liang 2021-03-17  906  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
