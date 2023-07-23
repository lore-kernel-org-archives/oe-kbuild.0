Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DF3EBD
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Jul 2023 08:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690099468; x=1721635468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jffsiuBDp+Y+HrsgJQAjez69yM9DAifEi5wdBdpEUQ8=;
  b=Ww8SF76ggt/TIkuCZ86oEqpdAslJjmUU/CIw98TrBolgx64MOrP3dGGv
   mpOJMKzVSk/dIwpzTf/UtMXntsHIWFzYgPODB6OoCYRyGNJsVwSmwmi+2
   AvyVGT8Ub7F33/Nin5/Qc72bocz3CzYdmSRGQGhJoocfVF0i8keBu48zz
   +oh8+4/RdqDrHZ8qpnk/g8ufv6n/JCLMVo4ExHuCbpgvRUFo7yGsgfkP+
   7rugFnzV1AHDVDquQLSIpVazI6YPEkUExlQgA8UC8meG3gU8fw7+fEYce
   mdPzCmRxBq5g1FucY2pU/VoZRLEMi8Ywjbd4bue3SeDr5Ql8Kf7SLjTuS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="346858971"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="346858971"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 01:04:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="760442778"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="760442778"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 23 Jul 2023 01:04:25 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNU4m-0008uv-2F;
	Sun, 23 Jul 2023 08:04:24 +0000
Date: Sun, 23 Jul 2023 16:04:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:100
 isst_if_get_tpmi_instance_count() warn: potential spectre issue
 'isst_common.sst_inst' [r] (local cap)
Message-ID: <202307231504.x9KbaaEy-lkp@intel.com>
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
head:   c2782531397f5cb19ca3f8f9c17727f1cdf5bee8
commit: d805456c712f93ba8a012430f2a93bec133b6ff4 platform/x86: ISST: Enumerate TPMI SST and create framework
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-m001-20230723 (https://download.01.org/0day-ci/archive/20230723/202307231504.x9KbaaEy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307231504.x9KbaaEy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307231504.x9KbaaEy-lkp@intel.com/

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
