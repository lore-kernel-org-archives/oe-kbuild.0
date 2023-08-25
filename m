Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAF12571
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Aug 2023 16:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692980122; x=1724516122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZOGUuq2TNAaTNc4kfnlQEoQM/qGx2eBWNQadWs+zMqE=;
  b=Q6iELvpdFVj1EQwUZZoKXgbII0zHjE7Wq0zwJQLwgfpvqA6bxr7/6CXb
   F+bcvuMohT6RwwBb6Y1zH3A7coPElC45ZHHvSJHVkuaYKmr0CijmA6ukj
   O5EK7MaQRTVzgxspihrGgzZE5vSZ4gOU0QFleCVwljNCMKrPfGk3xx9ZH
   MDt/J+mOBR2fwyKkCWltnNuRJMczN8hHRRb4My8NmtpT6M0SUx3LJYULi
   0+IciBAoEuuUzoZDDC2tq2zkQYCnbgNlYfzWOYSeLiJ92Yzxi0vshYNXw
   oT7yY3PJKxFlZKejCQOpBpuBfmurezNxh5hMWsqXe/lfQgaJAt61Imjj8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="364942517"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="364942517"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 09:10:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="1068283954"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="1068283954"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 25 Aug 2023 09:10:47 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZZOY-0003nN-1F;
	Fri, 25 Aug 2023 16:10:46 +0000
Date: Sat, 26 Aug 2023 00:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:100
 isst_if_get_tpmi_instance_count() warn: potential spectre issue
 'isst_common.sst_inst' [r] (local cap)
Message-ID: <202308260026.QIMj168R-lkp@intel.com>
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
head:   4f9e7fabf8643003afefc172e62dd276686f016e
commit: d805456c712f93ba8a012430f2a93bec133b6ff4 platform/x86: ISST: Enumerate TPMI SST and create framework
date:   5 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-r071-20230824 (https://download.01.org/0day-ci/archive/20230826/202308260026.QIMj168R-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260026.QIMj168R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308260026.QIMj168R-lkp@intel.com/

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
