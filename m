Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FDF38736F
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 06:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782973599; cv=none; b=AAS3BoNtoHtK841Rm2CTE5qBHzvwfNdG3Xq1/k+AMCmmPEg+Dc1VHDxsniA7xm9egiAWanTPsQSA2wwkM573sYYpPfq/+qHW1MynjNbeRGWgUmyU5ZCTgJicMnr1/Cq07XVQfFFQmD9jtb//FsbEKJsAQuVLv/fdsPJDwxjyHjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782973599; c=relaxed/simple;
	bh=CicgqTmiOMeqQkJhJI2QhbuRZeI1G7nQGaW92ExTMO4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hZ0Za8q9JAJS+RLt+TxonEjiNnbZqdo5+ACyWB058YUhtVomAWQbxeqbpiLcCcuSEoCv4OrcLt5PmIyJU77r7/ASNC/OdRG6Kli2EjH8u4FcR3troHlznsViUWQRRvkiLpsizIiv0ArsErktq9KJfsjB9Tkixm52TgOm9Z45zU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUusbreg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUusbreg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782973597; x=1814509597;
  h=date:from:to:cc:subject:message-id;
  bh=CicgqTmiOMeqQkJhJI2QhbuRZeI1G7nQGaW92ExTMO4=;
  b=iUusbregjfGmzsnsab9CB/eLvojttOwT8dTrsWEBrMWY+SYtAl7vh3jl
   79XTndO1XF749yHbxsUMckvALK/2x+s0xuGO9eQ6veVHsGBf7R8lYx1VS
   oczg+/LeoACOzrEX7gvjvUw4K8hngmrOHKEpvMJuWlBAOLSATEIJF2Shc
   bBEXI4C5Xa/eT2gtU/qc3aRYMskyzsyLLL4juKHTEsofElxeiFlMT1Gtf
   1dLV7Du9jhyWR4zLypEsXvAcV51jm8Y0y5VQKY1D2zGIKOQpaT407phhT
   wzc0GLh2Kukn5trKxflL7Mio2Y2soHXHz75AiEMQoP8MHlxrgIHpEE/VY
   Q==;
X-CSE-ConnectionGUID: Vq8v5JOHQwm8N/UGEDgKrg==
X-CSE-MsgGUID: Do71st+qRBiWJoX2lXD9fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="109260838"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="109260838"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 23:26:34 -0700
X-CSE-ConnectionGUID: 7r7+gGvIToO18zoFNp0zdA==
X-CSE-MsgGUID: 3BGhQMX0RcSIYx2jHH2j+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="252907481"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Jul 2026 23:26:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfAsX-00000000A5l-35ry;
	Thu, 02 Jul 2026 06:26:29 +0000
Date: Thu, 02 Jul 2026 14:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2042/2633] kernel/crash_core.c:303
 crash_exclude_core_ranges() warn: we never enter this loop
Message-ID: <202607021410.VIPCVui0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jinjie Ruan <ruanjinjie@huawei.com>
CC: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
CC: Sourabh Jain <sourabhjain@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f441960e691d37c880d2cc004de06bb5b6bd5e4
commit: 5beabef0cffaa1ea6e27e85dbd526b7a28e0e7c7 [2042/2633] crash: Add crash_prepare_headers() to exclude crash kernel memory
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: sh-randconfig-r072-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021410.VIPCVui0-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607021410.VIPCVui0-lkp@intel.com/

smatch warnings:
kernel/crash_core.c:303 crash_exclude_core_ranges() warn: we never enter this loop

vim +303 kernel/crash_core.c

5beabef0cffaa1e Jinjie Ruan 2026-06-29  287  
5beabef0cffaa1e Jinjie Ruan 2026-06-29  288  static int crash_exclude_core_ranges(struct crash_mem *cmem)
5beabef0cffaa1e Jinjie Ruan 2026-06-29  289  {
5beabef0cffaa1e Jinjie Ruan 2026-06-29  290  	int ret, i;
5beabef0cffaa1e Jinjie Ruan 2026-06-29  291  
5beabef0cffaa1e Jinjie Ruan 2026-06-29  292  	/* Exclude crashkernel region */
5beabef0cffaa1e Jinjie Ruan 2026-06-29  293  	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
5beabef0cffaa1e Jinjie Ruan 2026-06-29  294  	if (ret)
5beabef0cffaa1e Jinjie Ruan 2026-06-29  295  		return ret;
5beabef0cffaa1e Jinjie Ruan 2026-06-29  296  
5beabef0cffaa1e Jinjie Ruan 2026-06-29  297  	if (crashk_low_res.end) {
5beabef0cffaa1e Jinjie Ruan 2026-06-29  298  		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
5beabef0cffaa1e Jinjie Ruan 2026-06-29  299  		if (ret)
5beabef0cffaa1e Jinjie Ruan 2026-06-29  300  			return ret;
5beabef0cffaa1e Jinjie Ruan 2026-06-29  301  	}
5beabef0cffaa1e Jinjie Ruan 2026-06-29  302  
5beabef0cffaa1e Jinjie Ruan 2026-06-29 @303  	for (i = 0; i < crashk_cma_cnt; ++i) {
5beabef0cffaa1e Jinjie Ruan 2026-06-29  304  		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
5beabef0cffaa1e Jinjie Ruan 2026-06-29  305  					      crashk_cma_ranges[i].end);
5beabef0cffaa1e Jinjie Ruan 2026-06-29  306  		if (ret)
5beabef0cffaa1e Jinjie Ruan 2026-06-29  307  			return ret;
5beabef0cffaa1e Jinjie Ruan 2026-06-29  308  	}
5beabef0cffaa1e Jinjie Ruan 2026-06-29  309  
5beabef0cffaa1e Jinjie Ruan 2026-06-29  310  	return 0;
5beabef0cffaa1e Jinjie Ruan 2026-06-29  311  }
5beabef0cffaa1e Jinjie Ruan 2026-06-29  312  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
