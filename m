Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817033EA76
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Dec 2024 23:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735082547; cv=none; b=DZoRK/g6HE3kvBq6UESN6W+c1hSYuMpR1c5n0542yTkNj5lKp8T6DHoUsvMgjXz2fjacjkPrNGB8dD6ze6zcWGzzMHKJSR0mxScr15eK/aBiJA1gF+UiIiD3KduZpcaGIZJhdoo5RpIZpWRxLzXmho+luwoj8ru3q2d2b/A1cYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735082547; c=relaxed/simple;
	bh=pQ8QP0phsLzKiJ6wbPIzR3m2Gf5MdNmBjlcZqwjttbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lzfhsBUC8PkqKZOqFcWhcsmC2znhdEKMRM72PYN2rLr0SK+1wck0IrgEAi4x6400n7SFcwbBCM43Q1Z3jqHnKo2YRy3y3tTxpgQPVtNjOIQM2quPN5iC4lnT/4Qpad8tcjHbmIq+/vSJK6R7t+rNP8wwfq2Luih4ONQZ42OOtXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IshteAYO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IshteAYO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735082545; x=1766618545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pQ8QP0phsLzKiJ6wbPIzR3m2Gf5MdNmBjlcZqwjttbA=;
  b=IshteAYOznh/a2RU4VyD71hzbwNS5m4PDS0DHcke/5R5KDBx8GXqm47a
   8Yx+r0pa9H8YKENdFKHYQ3zybgYCnwCq0CRRa5GZK03/ozVjioBveUog2
   21pxERsYJ9pY0it/BgU2tqW/2cf6TtZhoPfHCTmLB3byz2PmJgfSd3b90
   ASMbpsQN6Fyzf9n0WBPMOAkpaO9H4NdTnxXGbAwc04EPcCYTs1Y2r99/u
   nJrn5dhwiUOAddz8sr43oQwdHjL1aoLbqkYHV3h/0YLqJwEgGSp84gBnN
   N8KTYOoNQ80xVbeqK9/55g7vOJB9inHBEvRv1vyelH5GREcAPtY/j9J0/
   w==;
X-CSE-ConnectionGUID: l4YxjtlhSF+et1HaihRHgg==
X-CSE-MsgGUID: q3JYXs+5Sia+kojFIrJjYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35709212"
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="35709212"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 15:22:24 -0800
X-CSE-ConnectionGUID: KzZ6SakoRLSyW2nfWoOPBg==
X-CSE-MsgGUID: 8xxqy+stQL+2oCTnSqmpng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="100099214"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Dec 2024 15:22:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQEEH-0001WZ-2m;
	Tue, 24 Dec 2024 23:22:21 +0000
Date: Wed, 25 Dec 2024 07:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android14-kiwi-6.1 199/199]
 drivers/acpi/cppc_acpi.c:1687:13-14: WARNING opportunity for max()
Message-ID: <202412250941.JapgkIFR-lkp@intel.com>
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

Hi Vincent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   1e9745a1ca80aa1eaa5db90d17ed4dbbf6ef1bbb
commit: ff2a9c4029046a1b4bc64f47c7d248c056ba61f4 [199/199] cpufreq/cppc: Move and rename cppc_cpufreq_{perf_to_khz|khz_to_perf}()
:::::: branch date: 25 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-102-20241224 (https://download.01.org/0day-ci/archive/20241225/202412250941.JapgkIFR-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412250941.JapgkIFR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/acpi/cppc_acpi.c:1687:13-14: WARNING opportunity for max()

vim +1687 drivers/acpi/cppc_acpi.c

ff2a9c4029046a Vincent Guittot 2023-12-11  1676  
ff2a9c4029046a Vincent Guittot 2023-12-11  1677  /* Callback function used to retrieve the max frequency from DMI */
ff2a9c4029046a Vincent Guittot 2023-12-11  1678  static void cppc_find_dmi_mhz(const struct dmi_header *dm, void *private)
ff2a9c4029046a Vincent Guittot 2023-12-11  1679  {
ff2a9c4029046a Vincent Guittot 2023-12-11  1680  	const u8 *dmi_data = (const u8 *)dm;
ff2a9c4029046a Vincent Guittot 2023-12-11  1681  	u16 *mhz = (u16 *)private;
ff2a9c4029046a Vincent Guittot 2023-12-11  1682  
ff2a9c4029046a Vincent Guittot 2023-12-11  1683  	if (dm->type == DMI_ENTRY_PROCESSOR &&
ff2a9c4029046a Vincent Guittot 2023-12-11  1684  	    dm->length >= DMI_ENTRY_PROCESSOR_MIN_LENGTH) {
ff2a9c4029046a Vincent Guittot 2023-12-11  1685  		u16 val = (u16)get_unaligned((const u16 *)
ff2a9c4029046a Vincent Guittot 2023-12-11  1686  				(dmi_data + DMI_PROCESSOR_MAX_SPEED));
ff2a9c4029046a Vincent Guittot 2023-12-11 @1687  		*mhz = val > *mhz ? val : *mhz;
ff2a9c4029046a Vincent Guittot 2023-12-11  1688  	}
ff2a9c4029046a Vincent Guittot 2023-12-11  1689  }
ff2a9c4029046a Vincent Guittot 2023-12-11  1690  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
