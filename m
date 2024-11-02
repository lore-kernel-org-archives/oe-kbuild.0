Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D8D2C18C
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Nov 2024 02:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730515036; cv=none; b=N6Gm3SI25bRPqHPAkp0CwMDAiHdk04SEJM0D43AdYFkeh5uX8fcTGt/G99yQiSLzy8D790dxvj82UjvQXUaFJhAfGI+Zb/ho3Km0LD02AAdYXCpFXVdbnPzzwugQObIQAduLlfFaFKdNlWa5dPsDrN+Uea9+mV911aGU5R/gRaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730515036; c=relaxed/simple;
	bh=ca/7YsmTFR6R2eRMoXJWafuFe2vburj1rvmt+LVl6P4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nF4FHXp1wpGtDV4dLzTnDnTy+5sh7fjtdNEo1g76PtbCmJKnwqSRj8quBfMGDatyiDLSQrvRGfrgRxvxLaZqvDZKHVw4V6Esd296bDK4LFN+MGfabEC9ZSAO+B325GSKK0Lx0OnN07DmLVqVZtLKzDHvKdPARXAYmVMyMEoYrzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/MAdskf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/MAdskf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730515034; x=1762051034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ca/7YsmTFR6R2eRMoXJWafuFe2vburj1rvmt+LVl6P4=;
  b=d/MAdskfPadtAtvpzeSd9J8qgv+dxXmAVLPxLzOciGvoAjQuT/HqGlTn
   hLQxkKeitVltQoISghi5aaTjKWJ5I+wac/yua6epHOJ7FDr9SLvDT9/eA
   LGjNcTZ/Ip/g7raFsAG8tQ9hr1k1IrRg9YIXXD739DH5IqbUz5upbWA7N
   ejUTCzOj347rYbkKT60w3uvl25M4AbIC52mN0SDh+PD/lgOmmwN0Fc14P
   ZuFMbVXbLrx1U/MVuM6hKzI6dxVdWBN1r2UrTyB6sSOEDS+NLGkeo7e3W
   hrUYZ3dpUPwUotT9gNKIM34pgkV6OjTCdg2J5LeymgR7rbFCNSzlhvkob
   A==;
X-CSE-ConnectionGUID: 7vr/8EBIQMuLyQfIlYpk2Q==
X-CSE-MsgGUID: rpk+3390TqeCQtE+lVPPYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="40920304"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="40920304"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 19:37:13 -0700
X-CSE-ConnectionGUID: CwUt/stJTo+Gw22uFhbV1w==
X-CSE-MsgGUID: gTyTL5lbR8Kyw64aTeKn+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="106473609"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Nov 2024 19:37:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t740j-000iKP-24;
	Sat, 02 Nov 2024 02:37:09 +0000
Date: Sat, 2 Nov 2024 10:36:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djiang:cxl/extended-linear 2/5] drivers/acpi/numa/hmat.c:149:15-21:
 ERROR: invalid reference to the index variable of the iterator on line 133
Message-ID: <202411021032.pnDujBiz-lkp@intel.com>
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
TO: Dave Jiang <dave.jiang@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/extended-linear
head:   1fb9ccd70e5e5188307656236f4d290c72f40288
commit: afc604fb5d91bd3bdde83f084d9be2407d3338c4 [2/5] acpi/hmat / cxl: Add extended linear cache support for CXL
:::::: branch date: 6 hours ago
:::::: commit date: 28 hours ago
config: arm64-randconfig-r063-20241102 (https://download.01.org/0day-ci/archive/20241102/202411021032.pnDujBiz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411021032.pnDujBiz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/acpi/numa/hmat.c:149:15-21: ERROR: invalid reference to the index variable of the iterator on line 133

vim +149 drivers/acpi/numa/hmat.c

665ac7e92757fb drivers/acpi/hmat/hmat.c Keith Busch 2019-03-11  110  
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  111  /**
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  112   * hmat_get_extended_linear_cache_size - Retrieve the extended linear cache size
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  113   * @backing_res: resource from the backing media
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  114   * @nid: node id for the memory region
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  115   * @cache_size: (Output) size of extended linear cache.
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  116   *
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  117   * Return: 0 on success. Errno on failure.
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  118   *
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  119   */
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  120  int hmat_get_extended_linear_cache_size(struct resource *backing_res, int nid,
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  121  					resource_size_t *cache_size)
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  122  {
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  123  	unsigned int pxm = node_to_pxm(nid);
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  124  	struct memory_target *target;
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  125  	struct target_cache *tcache;
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  126  	bool cache_found = false;
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  127  	struct resource *res;
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  128  
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  129  	target = find_mem_target(pxm);
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  130  	if (!target)
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  131  		return -ENOENT;
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  132  
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12 @133  	list_for_each_entry(tcache, &target->caches, node) {
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  134  		if (tcache->cache_attrs.mode == NODE_CACHE_MODE_EXTENDED_LINEAR) {
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  135  			res = &target->memregions;
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  136  			if (!resource_contains(res, backing_res))
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  137  				continue;
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  138  
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  139  			cache_found = true;
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  140  			break;
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  141  		}
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  142  	}
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  143  
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  144  	if (!cache_found) {
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  145  		*cache_size = 0;
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  146  		return 0;
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  147  	}
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  148  
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12 @149  	*cache_size = tcache->cache_attrs.size;
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  150  
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  151  	return 0;
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  152  }
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  153  EXPORT_SYMBOL_NS_GPL(hmat_get_extended_linear_cache_size, CXL);
afc604fb5d91bd drivers/acpi/numa/hmat.c Dave Jiang  2024-08-12  154  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
