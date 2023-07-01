Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812295CA1
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Jul 2023 10:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688207231; x=1719743231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+rkPC7zE8NSa41CSmziObffTSXP8bGk3fDgIe6U3ajU=;
  b=hWRYNKDKrqIhmDDQuX9xQ2gzGzPYtYmn/bMxj771mOA+tzHZv8cB2SXd
   Lm++Vv+OwLYPuwAGI+26ICdcckRrgOOkuAjaOEkUWtdYvV2meJTDvlZ4V
   +Y+A0t2WMbDMv28GQg9CyLKawGGqw5c/nm9rVp5wWLfpQvPTBvwDTnZKy
   wVvrFZcL14tfj0kchUbo5xNmGYYlaqUzMdv4R14a0SWQ+lViEP0i166LC
   fE6rXIN7V3Y+3Q8tbJTow2zo9H9ytC9Yn5b//VPM/2pzReFB3aQyLHmAv
   P1ipPJP+f3EEz3f+ExuJA3RirGwudPhvXjY8fwANGirS/DTY/u1L1GCGR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="362621659"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="362621659"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 03:27:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="862558588"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="862558588"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Jul 2023 03:27:09 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFXoq-000Fy5-2Q;
	Sat, 01 Jul 2023 10:27:08 +0000
Date: Sat, 1 Jul 2023 18:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jimc:dd-fix-2j 18/28] mips64-linux-ld:
 drivers/gpu/drm/display/drm_dp_helper.o:(__dyndbg_class_users+0x0): multiple
 definition of `__UNIQUE_ID_ddebug_class_user405';
 drivers/gpu/drm/drm_gem_shmem_helper.o:(__dyndbg_class_users+0x0): first
 defined here
Message-ID: <202307011846.9uE6YyNg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: mips64-linux-ld: drivers/gpu/drm/display/drm_dp_helper.o:(__dyndbg_class_users+0x0): multiple definition of `__UNIQUE_ID_ddebug_class_user405'; drivers/gpu/drm/drm_gem_shmem_helper.o:(__dyndbg_class_users+0x0): first defined here"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git dd-fix-2j
head:   991c639dd2c7dccd45b4c1c0730422504205d15e
commit: d496a474dc99f58e1bb17fc1704fcf1cd8cf8990 [18/28] drm-drivers: DRM_CLASSMAP_USE in 2nd batch of drivers, helpers
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: mips-randconfig-r083-20230701 (https://download.01.org/0day-ci/archive/20230701/202307011846.9uE6YyNg-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307011846.9uE6YyNg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307011846.9uE6YyNg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mips64-linux-ld: drivers/gpu/drm/display/drm_dp_helper.o:(__dyndbg_class_users+0x0): multiple definition of `__UNIQUE_ID_ddebug_class_user405'; drivers/gpu/drm/drm_gem_shmem_helper.o:(__dyndbg_class_users+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
