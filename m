Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744347E9
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Oct 2023 02:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJ7zCtX6"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696474063; x=1728010063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W67npBy7/enmr76r9FB20rvPYcG4Qn8AQ+QirH3EJJY=;
  b=cJ7zCtX6xMZTrGKqQOt5TaiEX4STxz7jfdcEEdf1BmH64cyxwAegRywr
   yw1zFs06pnAidWzobEd7b2jl3uY71EAddYkij6yalGlc82rztqZ3n6/OV
   GgS6hD300kQdH6Z6WEnGFeB8AyeRLHEhkT4VAUOQ3VELrbd/hcCGpAbCj
   AVAMCg1qFW9t8H/HffWBm+zb+n7MFabHJHqOy2+bmP515WspJrklMhHMq
   tTcNQenDY+oV43HYf2tJ4vhhVuAMbeZJuvOQF5+LnW9262kbXLHyMfaWl
   f2ksVJZrWO0u4CzPvPZa5aUmOwPB2eVF6eQF6YBsjRGxmKVL9bdw4PgVl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="373731395"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="373731395"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 19:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="701467762"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="701467762"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 04 Oct 2023 19:47:41 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoEOn-000Ku3-2c;
	Thu, 05 Oct 2023 02:47:37 +0000
Date: Thu, 5 Oct 2023 10:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:100
 isst_if_get_tpmi_instance_count() warn: potential spectre issue
 'isst_common.sst_inst' [r] (local cap)
Message-ID: <202310051017.pSUcZcok-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>
CC: Zhang Rui <rui.zhang@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ba7d997a2a29ee3fa766fee912c65796e0c21903
commit: d805456c712f93ba8a012430f2a93bec133b6ff4 platform/x86: ISST: Enumerate TPMI SST and create framework
date:   7 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20231005 (https://download.01.org/0day-ci/archive/20231005/202310051017.pSUcZcok-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231005/202310051017.pSUcZcok-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310051017.pSUcZcok-lkp@intel.com/

smatch warnings:
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:100 isst_if_get_tpmi_instance_count() warn: potential spectre issue 'isst_common.sst_inst' [r] (local cap)
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:104 isst_if_get_tpmi_instance_count() warn: possible spectre second half.  'sst_inst'

vim +100 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c

d805456c712f93 Srinivas Pandruvada 2023-03-07   87  
d805456c712f93 Srinivas Pandruvada 2023-03-07   88  static int isst_if_get_tpmi_instance_count(void __user *argp)
d805456c712f93 Srinivas Pandruvada 2023-03-07   89  {
d805456c712f93 Srinivas Pandruvada 2023-03-07   90  	struct isst_tpmi_instance_count tpmi_inst;
d805456c712f93 Srinivas Pandruvada 2023-03-07   91  	struct tpmi_sst_struct *sst_inst;
d805456c712f93 Srinivas Pandruvada 2023-03-07   92  	int i;
d805456c712f93 Srinivas Pandruvada 2023-03-07   93  
d805456c712f93 Srinivas Pandruvada 2023-03-07   94  	if (copy_from_user(&tpmi_inst, argp, sizeof(tpmi_inst)))
d805456c712f93 Srinivas Pandruvada 2023-03-07   95  		return -EFAULT;
d805456c712f93 Srinivas Pandruvada 2023-03-07   96  
d805456c712f93 Srinivas Pandruvada 2023-03-07   97  	if (tpmi_inst.socket_id >= topology_max_packages())
d805456c712f93 Srinivas Pandruvada 2023-03-07   98  		return -EINVAL;
d805456c712f93 Srinivas Pandruvada 2023-03-07   99  
d805456c712f93 Srinivas Pandruvada 2023-03-07 @100  	tpmi_inst.count = isst_common.sst_inst[tpmi_inst.socket_id]->number_of_power_domains;
d805456c712f93 Srinivas Pandruvada 2023-03-07  101  
d805456c712f93 Srinivas Pandruvada 2023-03-07  102  	sst_inst = isst_common.sst_inst[tpmi_inst.socket_id];
d805456c712f93 Srinivas Pandruvada 2023-03-07  103  	tpmi_inst.valid_mask = 0;
d805456c712f93 Srinivas Pandruvada 2023-03-07 @104  	for (i = 0; i < sst_inst->number_of_power_domains; ++i) {
d805456c712f93 Srinivas Pandruvada 2023-03-07  105  		struct tpmi_per_power_domain_info *power_domain_info;
d805456c712f93 Srinivas Pandruvada 2023-03-07  106  
d805456c712f93 Srinivas Pandruvada 2023-03-07  107  		power_domain_info = &sst_inst->power_domain_info[i];
d805456c712f93 Srinivas Pandruvada 2023-03-07  108  		if (power_domain_info->sst_base)
d805456c712f93 Srinivas Pandruvada 2023-03-07  109  			tpmi_inst.valid_mask |= BIT(i);
d805456c712f93 Srinivas Pandruvada 2023-03-07  110  	}
d805456c712f93 Srinivas Pandruvada 2023-03-07  111  
d805456c712f93 Srinivas Pandruvada 2023-03-07  112  	if (copy_to_user(argp, &tpmi_inst, sizeof(tpmi_inst)))
d805456c712f93 Srinivas Pandruvada 2023-03-07  113  		return -EFAULT;
d805456c712f93 Srinivas Pandruvada 2023-03-07  114  
d805456c712f93 Srinivas Pandruvada 2023-03-07  115  	return 0;
d805456c712f93 Srinivas Pandruvada 2023-03-07  116  }
d805456c712f93 Srinivas Pandruvada 2023-03-07  117  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
