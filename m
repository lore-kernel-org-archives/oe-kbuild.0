Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4792139C
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Oct 2023 04:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFu4IF4e"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696480367; x=1728016367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2RUiQb41e1OogeewjDRj8Cs9MqbeLCjyVt19oW3tT9Y=;
  b=YFu4IF4eqBZ9by5JGGKvq6txXsEhI/gWH3GwAWcOF4moURXiwi9IzIcP
   gglDSPpLRDKYL0a3PnXBpF1xWu19VmLnLcvP3NHPFjsHwov0mClO2wAcP
   perprjyVtTH0Tr2wJk6wVwDntnNsPpx2FABl2wsinHXyhI47TFDgE+sy8
   Nq0V1FLy1clS+FxV7XzTorFZHl0sTGjZnqkReEryUjEOIEi1kMkFz1Q9S
   BkldDNK3eslBpudjsTuTNR8vjaZkoWbiTQbzZdYsr7w11Dwmd9oWKVLyR
   TB1SqE2PE9jlFus4COY71mP1IhtUX0gL+wSWuckYPeTkkjAl1dfot1u3V
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380676105"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="380676105"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 21:32:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="842224802"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="842224802"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Oct 2023 21:32:45 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoG2U-000L0w-35;
	Thu, 05 Oct 2023 04:32:42 +0000
Date: Thu, 5 Oct 2023 12:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:584
 isst_if_clos_assoc() warn: potential spectre issue 'isst_common.sst_inst'
 [r]
Message-ID: <202310051222.IZ8pUZzc-lkp@intel.com>
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
head:   3006adf3be79cde4d14b1800b963b82b6e5572e0
commit: 12a7d2cb811dd8a884dea088a2701fcb8d00136e platform/x86: ISST: Add SST-CP support via TPMI
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20231005 (https://download.01.org/0day-ci/archive/20231005/202310051222.IZ8pUZzc-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231005/202310051222.IZ8pUZzc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310051222.IZ8pUZzc-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:584 isst_if_clos_assoc() warn: potential spectre issue 'isst_common.sst_inst' [r]
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:586 isst_if_clos_assoc() warn: possible spectre second half.  'sst_inst'
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:589 isst_if_clos_assoc() warn: potential spectre issue 'sst_inst->power_domain_info' [r]

Old smatch warnings:
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
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07 @589  		power_domain_info = &sst_inst->power_domain_info[punit_id];
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
