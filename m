Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09EC65EC9
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Dec 2023 17:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOCZ33Qw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702574717; x=1734110717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i6Jp6YvanICUm4ZdN+PVD7WfOk3tdCfFbatL7u+cQrk=;
  b=lOCZ33QwEocOEcY0hdCy5mVgomgNFm/Vrrw8pewthO6YFN2Hj9A/LJ+Y
   AiWNThWhuSik86W/PRiO9kGcfcJ0eFjc4PVbZT26fiDpQh1L954pa3f+U
   hBNGJfSSDqXqbg+EyTaKeHFBF4HRnM8D/ubQCfcmwuvFQGpNoMmG6pLua
   RqezL0V61m+rIarC8MMSSw/FfPjO2ZHXLBSiB/62f8PTvCocHZglvJB8/
   RX4r9RqR9BDouyVe6dngEaTHOEqqTyCT7WxYiWbIp5wwoTtM7aagIiz8T
   oKH8b47p/Lx5T7aJ3CDnoIhFQHjpj7aECHkJn9pQKdsXCoeRhk29gng3h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="375309213"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="375309213"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 09:25:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="767672909"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="767672909"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Dec 2023 09:25:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDpSB-000MO4-1p;
	Thu, 14 Dec 2023 17:25:01 +0000
Date: Fri, 15 Dec 2023 01:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [vincent-guittot:sched/system-pressure 5/11]
 drivers/acpi/cppc_acpi.c:1783:13-14: WARNING opportunity for max()
Message-ID: <202312150148.V2p83vod-lkp@intel.com>
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
TO: Vincent Guittot <vincent.guittot@linaro.org>

Hi Vincent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.linaro.org/people/vincent.guittot/kernel.git sched/system-pressure
head:   5844548bc216fd4d47bc8b20f0ff22ac4b14d48d
commit: 3c697464bdc4ede5507ebb0f43112b31cb07a3d9 [5/11] cpufreq/cppc: Move and rename cppc_cpufreq_{perf_to_khz|khz_to_perf}
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-102-20231214 (https://download.01.org/0day-ci/archive/20231215/202312150148.V2p83vod-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231215/202312150148.V2p83vod-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312150148.V2p83vod-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/acpi/cppc_acpi.c:1783:13-14: WARNING opportunity for max()

vim +1783 drivers/acpi/cppc_acpi.c

3c697464bdc4ed Vincent Guittot 2023-09-18  1772  
3c697464bdc4ed Vincent Guittot 2023-09-18  1773  /* Callback function used to retrieve the max frequency from DMI */
3c697464bdc4ed Vincent Guittot 2023-09-18  1774  static void cppc_find_dmi_mhz(const struct dmi_header *dm, void *private)
3c697464bdc4ed Vincent Guittot 2023-09-18  1775  {
3c697464bdc4ed Vincent Guittot 2023-09-18  1776  	const u8 *dmi_data = (const u8 *)dm;
3c697464bdc4ed Vincent Guittot 2023-09-18  1777  	u16 *mhz = (u16 *)private;
3c697464bdc4ed Vincent Guittot 2023-09-18  1778  
3c697464bdc4ed Vincent Guittot 2023-09-18  1779  	if (dm->type == DMI_ENTRY_PROCESSOR &&
3c697464bdc4ed Vincent Guittot 2023-09-18  1780  	    dm->length >= DMI_ENTRY_PROCESSOR_MIN_LENGTH) {
3c697464bdc4ed Vincent Guittot 2023-09-18  1781  		u16 val = (u16)get_unaligned((const u16 *)
3c697464bdc4ed Vincent Guittot 2023-09-18  1782  				(dmi_data + DMI_PROCESSOR_MAX_SPEED));
3c697464bdc4ed Vincent Guittot 2023-09-18 @1783  		*mhz = val > *mhz ? val : *mhz;
3c697464bdc4ed Vincent Guittot 2023-09-18  1784  	}
3c697464bdc4ed Vincent Guittot 2023-09-18  1785  }
3c697464bdc4ed Vincent Guittot 2023-09-18  1786  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
