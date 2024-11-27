Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761A6200127
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Nov 2024 16:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732723277; cv=none; b=O8N0HHzhzHmvlsklvkdJEf1QMyEpNg0JOSiGZTQZEG92VfhmMoC+DE2IaQMxntUSzhwdC5avab2QM2CfWWBOLf9gLKvuZavGhqU8WwEG/Aplm8IkwtIpgKACyiZVufWgffavarS8ihFfGMEHnF+e2W2CvVmWeVFq+EYnrBzDWWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732723277; c=relaxed/simple;
	bh=+UD07E9S5XT21rqN9DRGdXdjfG+Ue/Has4YYBlbVZHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aZH2xAHDv2xJOZacSauGh0uuk+bWiyArA893DhyQAcuo8frzedc+60VKVbnLR1Hl5wbU60IcK+5dAVhUNFnU0Q8EBv68PUQodHZyc4ceHA/axX+2EoYtHtSUHH4IY6aFcOE05xpiExobRknvSPN35nhIiRrbNC3aOwczZuV5na4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k20Toxv3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k20Toxv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732723275; x=1764259275;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+UD07E9S5XT21rqN9DRGdXdjfG+Ue/Has4YYBlbVZHY=;
  b=k20Toxv3gazD8HHDt8qQYqnhmSbji7aAvlmpVhrHJOlOVgDAqnpWOcxo
   sy2snvKMHtulAK4sv67onWaRWGdUZCTE6RRtPvoZAg0YRkxW2a7JECGnN
   Ga4AZCYG1aGChnvhODefrIMC9LltI/0S2IYtJc26wCPjlzFKQA9M2SHhH
   5c3iDrSXQvmL3JzdD3V5AmfaxMcPXKWy4CWPGDA2tOAcN1algtIas1hVt
   eGAwZNCmqIZqAzbKRSp3bI8FU3WpyQrkSarCKYSttJgITXx2APl1m881p
   ZJoyjZ5mjf06C8bwuah8UAkJsiYt8fszQfuVX0q64/e1SpRehVLPddStg
   w==;
X-CSE-ConnectionGUID: BvWTZOXWRxWBPt5GmuWCTw==
X-CSE-MsgGUID: kVMbz+pDTkS99oQ/IbuazA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32791443"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="32791443"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 08:01:14 -0800
X-CSE-ConnectionGUID: /UmlyiRDRVWNyeNFigsvZg==
X-CSE-MsgGUID: eyO3lO/6Q1SovMPS1LF5vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="96418422"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Nov 2024 08:01:12 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGKTW-00086j-01;
	Wed, 27 Nov 2024 16:01:10 +0000
Date: Thu, 28 Nov 2024 00:00:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:746
 isst_if_clos_assoc() warn: potential spectre issue
 'sst_inst->power_domain_info[part]' [r] (local cap)
Message-ID: <202411272312.FtUQcmFg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>
CC: Zhang Rui <rui.zhang@intel.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aaf20f870da056752f6386693cc0d8e25421ef35
commit: 9d1d36268f3d8276aefd1fad4e0a415dc8c36edd platform/x86: ISST: Support partitioned systems
date:   7 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20241126 (https://download.01.org/0day-ci/archive/20241127/202411272312.FtUQcmFg-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411272312.FtUQcmFg-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:746 isst_if_clos_assoc() warn: potential spectre issue 'sst_inst->power_domain_info[part]' [r] (local cap)

Old smatch warnings:
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1065 isst_if_get_perf_level_info() warn: potential spectre issue 'power_domain_info->perf_levels' [r] (local cap)
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1167 isst_if_get_perf_level_mask() warn: potential spectre issue 'power_domain_info->perf_levels' [r]
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1212 isst_if_get_base_freq_info() warn: potential spectre issue 'power_domain_info->perf_levels' [r] (local cap)
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1248 isst_if_get_base_freq_mask() warn: potential spectre issue 'power_domain_info->perf_levels' [r]
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1339 isst_if_get_turbo_freq_info() warn: potential spectre issue 'power_domain_info->perf_levels' [r] (local cap)
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1589 tpmi_sst_dev_remove() error: dereferencing freed memory 'tpmi_sst' (line 1588)

vim +746 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c

12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  696  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  697  static long isst_if_clos_assoc(void __user *argp)
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  698  {
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  699  	struct isst_if_clos_assoc_cmds assoc_cmds;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  700  	unsigned char __user *ptr;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  701  	int i;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  702  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  703  	/* Each multi command has u16 command count as the first field */
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  704  	if (copy_from_user(&assoc_cmds, argp, sizeof(assoc_cmds)))
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  705  		return -EFAULT;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  706  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  707  	if (!assoc_cmds.cmd_count || assoc_cmds.cmd_count > ISST_IF_CMD_LIMIT)
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  708  		return -EINVAL;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  709  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  710  	ptr = argp + offsetof(struct isst_if_clos_assoc_cmds, assoc_info);
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  711  	for (i = 0; i < assoc_cmds.cmd_count; ++i) {
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  712  		struct tpmi_per_power_domain_info *power_domain_info;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  713  		struct isst_if_clos_assoc clos_assoc;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  714  		int punit_id, punit_cpu_no, pkg_id;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  715  		struct tpmi_sst_struct *sst_inst;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  716  		int offset, shift, cpu;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  717  		u64 val, mask, clos;
9d1d36268f3d82 Srinivas Pandruvada 2024-04-23  718  		u8 part;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  719  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  720  		if (copy_from_user(&clos_assoc, ptr, sizeof(clos_assoc)))
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  721  			return -EFAULT;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  722  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  723  		if (clos_assoc.socket_id > topology_max_packages())
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  724  			return -EINVAL;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  725  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  726  		cpu = clos_assoc.logical_cpu;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  727  		clos = clos_assoc.clos;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  728  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  729  		if (assoc_cmds.punit_cpu_map)
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  730  			punit_cpu_no = cpu;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  731  		else
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  732  			return -EOPNOTSUPP;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  733  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  734  		if (punit_cpu_no < 0)
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  735  			return -EINVAL;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  736  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  737  		punit_id = clos_assoc.power_domain_id;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  738  		pkg_id = clos_assoc.socket_id;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  739  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  740  		sst_inst = isst_common.sst_inst[pkg_id];
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  741  
9d1d36268f3d82 Srinivas Pandruvada 2024-04-23  742  		punit_id = map_partition_power_domain_id(sst_inst, punit_id, &part);
9d1d36268f3d82 Srinivas Pandruvada 2024-04-23  743  		if (punit_id < 0)
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  744  			return -EINVAL;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  745  
9d1d36268f3d82 Srinivas Pandruvada 2024-04-23 @746  		power_domain_info = &sst_inst->power_domain_info[part][punit_id];
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  747  
8bed9ff7dbcce4 Srinivas Pandruvada 2023-12-04  748  		if (assoc_cmds.get_set && power_domain_info->write_blocked)
8bed9ff7dbcce4 Srinivas Pandruvada 2023-12-04  749  			return -EPERM;
8bed9ff7dbcce4 Srinivas Pandruvada 2023-12-04  750  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  751  		offset = SST_CLOS_ASSOC_0_OFFSET +
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  752  				(punit_cpu_no / SST_CLOS_ASSOC_CPUS_PER_REG) * SST_REG_SIZE;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  753  		shift = punit_cpu_no % SST_CLOS_ASSOC_CPUS_PER_REG;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  754  		shift *= SST_CLOS_ASSOC_BITS_PER_CPU;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  755  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  756  		val = readq(power_domain_info->sst_base +
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  757  				power_domain_info->sst_header.cp_offset + offset);
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  758  		if (assoc_cmds.get_set) {
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  759  			mask = GENMASK_ULL((shift + SST_CLOS_ASSOC_BITS_PER_CPU - 1), shift);
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  760  			val &= ~mask;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  761  			val |= (clos << shift);
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  762  			writeq(val, power_domain_info->sst_base +
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  763  					power_domain_info->sst_header.cp_offset + offset);
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  764  		} else {
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  765  			val >>= shift;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  766  			clos_assoc.clos = val & GENMASK(SST_CLOS_ASSOC_BITS_PER_CPU - 1, 0);
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  767  			if (copy_to_user(ptr, &clos_assoc, sizeof(clos_assoc)))
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  768  				return -EFAULT;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  769  		}
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  770  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  771  		ptr += sizeof(clos_assoc);
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  772  	}
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  773  
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  774  	return 0;
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  775  }
12a7d2cb811dd8 Srinivas Pandruvada 2023-03-07  776  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
