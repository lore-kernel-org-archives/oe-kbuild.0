Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76D41B78F3
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 07:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730791157; cv=none; b=ObdHV/ywmGEZyAqfeV7LOS8YB2dqHX9G/81Df/OhM26LzsvPmehP3JAisBHVnlP/fd5I4RQTn2b5Zoc6T+0YSsOutNDS51gXqpR4OEBTVb2DTSmSqY0JntytIoJ8kj9Z16zErT5YHRhboN5oOrAPlxWPg4IHqsh1rC2ibqWNIHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730791157; c=relaxed/simple;
	bh=D8WLdh0gg/7AsESrhg30MH2N7lMtP1RB3ezCMsIgpO4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ow8kmsN2+bWxW22kUPXPdV8aqk3PCIUG65OUgfikeQY4oFMx/DJv6JpJbbVeMwXaFrapDnaiyMbRaR7HVvbn2vnRKRNzVclJBw/eJ1h9pw8FjpJAPcYzYVv47uvH0umQO/fSK7YR1+M43nynhEcNm10GicE6WFJE4jctEipTkSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZlHZGCRS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZlHZGCRS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730791155; x=1762327155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D8WLdh0gg/7AsESrhg30MH2N7lMtP1RB3ezCMsIgpO4=;
  b=ZlHZGCRS11PKl0sZ6sPmVJBz209ZOrTTnOKmUMK5EQWIvm89kj403NJ/
   udejiXWMx0UFc8qmvYybX3iJtvYGR7WPV0yn/cylGeHwmBUk+kDZisLZB
   3HZY0FuCJMfNpy6+743PbKmFFk+JzQx+Z7PxFM5KelpsVYZDBNPHx3yGG
   MECirik8MhEAc7vDU4wdJ7hhUg64MTfucoMjusyRl1dzUicXRmWI3djxh
   S+etCOc+rQV21KigE3X9c9URUp5Ga+LqSlvFQZk1LJ9J9lPlZwlF6MCUj
   dfcg74xOcbVdx6Nwk07BXOG63TjNHVbjoFtUDja7rlqBr4goFSjnCMwWY
   w==;
X-CSE-ConnectionGUID: 4RENQcdDR0WAA/Tinpi3UA==
X-CSE-MsgGUID: r12uoIbXTki3LjugrAutpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34209899"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34209899"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 23:19:12 -0800
X-CSE-ConnectionGUID: I3H3RS9MQqeHPjkA/32pvA==
X-CSE-MsgGUID: tfwRKBVeQsKBw+s68p03Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="83799416"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2024 23:19:11 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8DqG-000lkl-2A;
	Tue, 05 Nov 2024 07:19:08 +0000
Date: Tue, 5 Nov 2024 15:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 1351/1351] mm/page_alloc.c:4552
 prepare_before_alloc() warn: bitwise AND condition is false here
Message-ID: <202411051748.CMTAbO6V-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Wupeng Ma <mawupeng1@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   25571440419e086ce4361fed1e31c2304a9a9a48
commit: 7829f27d03dbdb975be3a72915dc71ac414f2a16 [1351/1351] mm: mem_reliable: Alloc task memory from reliable region
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20241103 (https://download.01.org/0day-ci/archive/20241105/202411051748.CMTAbO6V-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411051748.CMTAbO6V-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:4552 prepare_before_alloc() warn: bitwise AND condition is false here

vim +4552 mm/page_alloc.c

387ba26fb1cb9b Mel Gorman 2021-04-29  4532  
7829f27d03dbdb Ma Wupeng  2024-01-10  4533  static inline void prepare_before_alloc(gfp_t *gfp_mask)
7829f27d03dbdb Ma Wupeng  2024-01-10  4534  {
7829f27d03dbdb Ma Wupeng  2024-01-10  4535  	bool zone_movable;
7829f27d03dbdb Ma Wupeng  2024-01-10  4536  
7829f27d03dbdb Ma Wupeng  2024-01-10  4537  	if (!mem_reliable_is_enabled())
7829f27d03dbdb Ma Wupeng  2024-01-10  4538  		return;
7829f27d03dbdb Ma Wupeng  2024-01-10  4539  
7829f27d03dbdb Ma Wupeng  2024-01-10  4540  	/*
7829f27d03dbdb Ma Wupeng  2024-01-10  4541  	 * memory reliable only handle memory allocation from movable zone
7829f27d03dbdb Ma Wupeng  2024-01-10  4542  	 * (force alloc from non-movable zone or force alloc from movable
7829f27d03dbdb Ma Wupeng  2024-01-10  4543  	 * zone) to get total isolation.
7829f27d03dbdb Ma Wupeng  2024-01-10  4544  	 */
7829f27d03dbdb Ma Wupeng  2024-01-10  4545  	zone_movable = gfp_zone(*gfp_mask & ~GFP_RELIABLE) == ZONE_MOVABLE;
7829f27d03dbdb Ma Wupeng  2024-01-10  4546  	if (!zone_movable)
7829f27d03dbdb Ma Wupeng  2024-01-10  4547  		goto clear_flag;
7829f27d03dbdb Ma Wupeng  2024-01-10  4548  
7829f27d03dbdb Ma Wupeng  2024-01-10  4549  	if (!in_task())
7829f27d03dbdb Ma Wupeng  2024-01-10  4550  		return;
7829f27d03dbdb Ma Wupeng  2024-01-10  4551  
7829f27d03dbdb Ma Wupeng  2024-01-10 @4552  	if ((current->flags & PF_RELIABLE) || is_global_init(current))
7829f27d03dbdb Ma Wupeng  2024-01-10  4553  		*gfp_mask |= GFP_RELIABLE;
7829f27d03dbdb Ma Wupeng  2024-01-10  4554  
7829f27d03dbdb Ma Wupeng  2024-01-10  4555  	return;
7829f27d03dbdb Ma Wupeng  2024-01-10  4556  clear_flag:
7829f27d03dbdb Ma Wupeng  2024-01-10  4557  	*gfp_mask &= ~GFP_RELIABLE;
7829f27d03dbdb Ma Wupeng  2024-01-10  4558  }
7829f27d03dbdb Ma Wupeng  2024-01-10  4559  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
