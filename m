Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D74419BAA
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Nov 2023 22:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjG5QXSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700347262; x=1731883262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J1k2wojAgGLx8jzzirrORb/WUSUNcJpy3R+J/QruSLA=;
  b=PjG5QXScfonFVmPfitIKGVcoGSsZ7erIJ4Z+F9vAm74VCRBkQKg7KbLJ
   GJGIkz/dRmTXZyBootPzugRz0K0OYtVHEN8mxNf5BySHM5JJtvOrZYH7F
   M7b3uvhv8uC2s4k8w521zgmXq/FDGeF+0nteLj4zv8BGaQJo7rM24KSr+
   Bs6i7rh9hMOrrQocKSaU0uiYSTqoz70aJzrY3173SWrUqboKAJhJz0lFW
   xQCB6MEPcUmwRfH2W5FOlGjKy5nRkSK/C+2PYAcGbumjSZMyJ834TCwvQ
   dA/9lU8oCaTdG3p6L9UM/nayec58EkHBfkN/FV8JRbqkd70io5RYnhSvM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="391241705"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="391241705"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 14:41:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="769531840"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="769531840"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 18 Nov 2023 14:40:59 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Tzl-0004P0-0w;
	Sat, 18 Nov 2023 22:40:57 +0000
Date: Sun, 19 Nov 2023 06:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:584
 isst_if_clos_assoc() warn: potential spectre issue 'isst_common.sst_inst'
 [r]
Message-ID: <202311190634.2s7nJVnm-lkp@intel.com>
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
head:   b8f1fa2419c19c81bc386a6b350879ba54a573e1
commit: 12a7d2cb811dd8a884dea088a2701fcb8d00136e platform/x86: ISST: Add SST-CP support via TPMI
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20231118 (https://download.01.org/0day-ci/archive/20231119/202311190634.2s7nJVnm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311190634.2s7nJVnm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311190634.2s7nJVnm-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:584 isst_if_clos_assoc() warn: potential spectre issue 'isst_common.sst_inst' [r]
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:586 isst_if_clos_assoc() warn: possible spectre second half.  'sst_inst'

Old smatch warnings:
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:589 isst_if_clos_assoc() warn: potential spectre issue 'sst_inst->power_domain_info' [r]
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:629 isst_if_get_tpmi_instance_count() warn: potential spectre issue 'isst_common.sst_inst' [r] (local cap)
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:633 isst_if_get_tpmi_instance_count() warn: possible spectre second half.  'sst_inst'

vim +584 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c

12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  541  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  542  static long isst_if_clos_assoc(void __user *argp)
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  543  {
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  544  	struct isst_if_clos_assoc_cmds assoc_cmds;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  545  	unsigned char __user *ptr;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  546  	int i;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  547  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  548  	/* Each multi command has u16 command count as the first field */
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  549  	if (copy_from_user(&assoc_cmds, argp, sizeof(assoc_cmds)))
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  550  		return -EFAULT;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  551  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  552  	if (!assoc_cmds.cmd_count || assoc_cmds.cmd_count > ISST_IF_CMD_LIMIT)
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  553  		return -EINVAL;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  554  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  555  	ptr = argp + offsetof(struct isst_if_clos_assoc_cmds, assoc_info);
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  556  	for (i = 0; i < assoc_cmds.cmd_count; ++i) {
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  557  		struct tpmi_per_power_domain_info *power_domain_info;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  558  		struct isst_if_clos_assoc clos_assoc;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  559  		int punit_id, punit_cpu_no, pkg_id;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  560  		struct tpmi_sst_struct *sst_inst;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  561  		int offset, shift, cpu;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  562  		u64 val, mask, clos;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  563  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  564  		if (copy_from_user(&clos_assoc, ptr, sizeof(clos_assoc)))
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  565  			return -EFAULT;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  566  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  567  		if (clos_assoc.socket_id > topology_max_packages())
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  568  			return -EINVAL;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  569  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  570  		cpu = clos_assoc.logical_cpu;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  571  		clos = clos_assoc.clos;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  572  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  573  		if (assoc_cmds.punit_cpu_map)
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  574  			punit_cpu_no = cpu;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  575  		else
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  576  			return -EOPNOTSUPP;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  577  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  578  		if (punit_cpu_no < 0)
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  579  			return -EINVAL;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  580  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  581  		punit_id = clos_assoc.power_domain_id;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  582  		pkg_id = clos_assoc.socket_id;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  583  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07 @584  		sst_inst = isst_common.sst_inst[pkg_id];
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  585  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07 @586  		if (clos_assoc.power_domain_id > sst_inst->number_of_power_domains)
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  587  			return -EINVAL;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  588  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  589  		power_domain_info = &sst_inst->power_domain_info[punit_id];
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  590  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  591  		offset = SST_CLOS_ASSOC_0_OFFSET +
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  592  				(punit_cpu_no / SST_CLOS_ASSOC_CPUS_PER_REG) * SST_REG_SIZE;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  593  		shift = punit_cpu_no % SST_CLOS_ASSOC_CPUS_PER_REG;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  594  		shift *= SST_CLOS_ASSOC_BITS_PER_CPU;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  595  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  596  		val = readq(power_domain_info->sst_base +
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  597  				power_domain_info->sst_header.cp_offset + offset);
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  598  		if (assoc_cmds.get_set) {
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  599  			mask = GENMASK_ULL((shift + SST_CLOS_ASSOC_BITS_PER_CPU - 1), shift);
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  600  			val &= ~mask;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  601  			val |= (clos << shift);
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  602  			writeq(val, power_domain_info->sst_base +
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  603  					power_domain_info->sst_header.cp_offset + offset);
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  604  		} else {
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  605  			val >>= shift;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  606  			clos_assoc.clos = val & GENMASK(SST_CLOS_ASSOC_BITS_PER_CPU - 1, 0);
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  607  			if (copy_to_user(ptr, &clos_assoc, sizeof(clos_assoc)))
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  608  				return -EFAULT;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  609  		}
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  610  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  611  		ptr += sizeof(clos_assoc);
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  612  	}
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  613  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  614  	return 0;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  615  }
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  616  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
