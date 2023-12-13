Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6843D1EB45
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 08:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eb+N1bNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702456975; x=1733992975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qPQvxpUycn7VLyITXZibAWpv3QWCmjIamfuTuIuWeQQ=;
  b=eb+N1bNJchS/UiNZKTiUKeZTmgObbeOU9JAarta+UFQV68EiQ/JBYS3w
   tlx2GTEeep0GmKWCUW51y4Ta9ybOa3jkLd34F/w68fccYvdt+fkN++VkS
   +39QtikhVY8fd4XdhDqDoeropCVheGW2ys04ouqiCdP2oP3uHYmlacxD/
   Cn6NbJt0NO93eEbcfGdu1zyqaKF8fb3UHJUdiWhlfsYwHra7N2q4glV9x
   kL6i0zfd9cmUWUE873lJrHdEsSSMBCxiR0J4BxlJeZ7zrLhH0X6jVKTXg
   0rOPvMMEZT1sllSmP2Aofw6XcXDHDiIm7n2zOon4jATERk3s33Vt+bMNp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="398773796"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="398773796"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 00:42:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="15335664"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 13 Dec 2023 00:42:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDKpG-000KIB-0N;
	Wed, 13 Dec 2023 08:42:49 +0000
Date: Wed, 13 Dec 2023 16:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/2] thermal/debugfs: Add thermal cooling device
 debugfs information
Message-ID: <202312131653.ydYiv5Nc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/thermal/tegra/../thermal_debugfs.h:10:43: sparse: sparse: no identifier for function argument"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231212161047.1631077-1-daniel.lezcano@linaro.org>
References: <20231212161047.1631077-1-daniel.lezcano@linaro.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: daniel.lezcano@linaro.org
TO: rjw@rjwysocki.net
TO: lukasz.luba@arm.com
CC: rui.zhang@intel.com
CC: linux-kernel@vger.kernel.org
CC: linux-pm@vger.kernel.org

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on linus/master v6.7-rc5 next-20231213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Lezcano/thermal-debugfs-Add-thermal-debugfs-information-for-mitigation-episodes/20231213-001321
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20231212161047.1631077-1-daniel.lezcano%40linaro.org
patch subject: [PATCH v1 1/2] thermal/debugfs: Add thermal cooling device debugfs information
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: nios2-randconfig-r112-20231213 (https://download.01.org/0day-ci/archive/20231213/202312131653.ydYiv5Nc-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312131653.ydYiv5Nc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312131653.ydYiv5Nc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/thermal/tegra/soctherm.c: note: in included file (through drivers/thermal/tegra/../thermal_core.h):
>> drivers/thermal/tegra/../thermal_debugfs.h:10:43: sparse: sparse: no identifier for function argument
   drivers/thermal/tegra/../thermal_debugfs.h:11:46: sparse: sparse: no identifier for function argument
   drivers/thermal/tegra/../thermal_debugfs.h:12:50: sparse: sparse: no identifier for function argument
   drivers/thermal/tegra/../thermal_debugfs.h:12:83: sparse: sparse: no identifier for function argument

vim +10 drivers/thermal/tegra/../thermal_debugfs.h

fa65a73b2a1651 Daniel Lezcano 2023-12-12   2  
fa65a73b2a1651 Daniel Lezcano 2023-12-12   3  #ifdef CONFIG_THERMAL_DEBUGFS
fa65a73b2a1651 Daniel Lezcano 2023-12-12   4  void thermal_debug_init(void);
fa65a73b2a1651 Daniel Lezcano 2023-12-12   5  void thermal_debug_cdev_add(struct thermal_cooling_device *cdev);
fa65a73b2a1651 Daniel Lezcano 2023-12-12   6  void thermal_debug_cdev_remove(struct thermal_cooling_device *cdev);
fa65a73b2a1651 Daniel Lezcano 2023-12-12   7  void thermal_debug_cdev_transition(struct thermal_cooling_device *cdev, int state);
fa65a73b2a1651 Daniel Lezcano 2023-12-12   8  #else
fa65a73b2a1651 Daniel Lezcano 2023-12-12   9  static inline void thermal_debug_init(void) {}
fa65a73b2a1651 Daniel Lezcano 2023-12-12 @10  static inline void thermal_debug_cdev_add(struct thermal_cooling_device *) {}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
