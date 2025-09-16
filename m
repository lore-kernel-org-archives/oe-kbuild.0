Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262A82DC78E
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Sep 2025 03:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757993466; cv=none; b=rIyIZ/l/OPoXFqmXyEL7lz3fmAmlS3LiGheZvoJUFYcTem1l4l7IrIxyyLV7rf6gSDUj7hiBA3QK3VMYPMSZIRbkMwt9crABRLlaDK0zT8/piKm3yiXoBgdK78dBVAmpehB16ktk+T+HjcOPylxm6P3cjUXIHyKNg0QtPUgZOgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757993466; c=relaxed/simple;
	bh=TT2Gdrgrbp8chiWyRws2sQjLJHwq37h/lFqqWPV3s+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=reizqO6sT+lVDfanPmMCdXaDzTAuc3NTgDq2M1h+7HznV/U8tLJzdy3LGRbo9YCZQTjo1g/gulkyfaSH07JcUxpqhQ0kgek/OodNX7fcktyxzuohbJe9fFw5++GvoVdvpunWruK9HZAjLVB3Kyc9GrSr1KqvP74SnwULLQCgi6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DNvKQK7q; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DNvKQK7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757993463; x=1789529463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TT2Gdrgrbp8chiWyRws2sQjLJHwq37h/lFqqWPV3s+g=;
  b=DNvKQK7q2Jkwm0JHW6YQZrtcSF8Fu9yZujLiUaL5qWgznmRHv0FN1X/1
   QRGlKk2rX5jmeS4ED4vzrjouOG2+Zi4TdFMFVi4CE/ch7rzCpWa55wt3q
   iwokrPc3Zoki4UvQygbOQymB1xYfS24FtKzGBTKAlGS71zU0/i9GgP0Sm
   DQG8vutxS7M22xKz485qdlx2khsNEn5PstTL1bTKYqCTRkdDSCr8+HM5N
   Dw3R2AdOaNpgcTMwqbZ4pcMJ8WzHKTSOzbBPQjx3mYqHL/JTOwpG4Z+9G
   +/Y/SA7o/Ojo5uinozV7MucAzv6v/s0lvyR6YOCLkVPcK5+bnKTJ6AbWB
   w==;
X-CSE-ConnectionGUID: 2Z1rW7tKRyCyi8YyDeUjLg==
X-CSE-MsgGUID: QV2emNYPSLeznc0tUDaH7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60374648"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="60374648"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 20:31:01 -0700
X-CSE-ConnectionGUID: ZC50wGB1ScecdRgBXY/W9w==
X-CSE-MsgGUID: hgRYcya5QqmoHEtjQ8Y4Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="174119807"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Sep 2025 20:31:00 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyMPB-0000yN-1O;
	Tue, 16 Sep 2025 03:30:57 +0000
Date: Tue, 16 Sep 2025 11:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 2/3] iommu/riscv: Add Makefile support for RISC-V
 IOMMU perf driver
Message-ID: <202509161121.SHWsStQM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250915020911.1313-2-guoyaxing@bosc.ac.cn>
References: <20250915020911.1313-2-guoyaxing@bosc.ac.cn>
TO: Yaxing Guo <guoyaxing@bosc.ac.cn>
TO: linux-riscv@lists.infradead.org
CC: iommu@lists.linux.dev
CC: tjeznach@rivosinc.com
CC: joro@8bytes.org
CC: will@kernel.org
CC: robin.murphy@arm.com
CC: paul.walmsley@sifive.com
CC: palmer@dabbelt.com
CC: aou@eecs.berkeley.edu
CC: alex@ghiti.fr
CC: anxu@bosc.ac.cn
CC: wangran@bosc.ac.cn
CC: Yaxing Guo <guoyaxing@bosc.ac.cn>

Hi Yaxing,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.17-rc6 next-20250915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yaxing-Guo/iommu-riscv-Add-Makefile-support-for-RISC-V-IOMMU-perf-driver/20250915-101640
base:   linus/master
patch link:    https://lore.kernel.org/r/20250915020911.1313-2-guoyaxing%40bosc.ac.cn
patch subject: [PATCH v1 2/3] iommu/riscv: Add Makefile support for RISC-V IOMMU perf driver
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: riscv-randconfig-001-20250916 (https://download.01.org/0day-ci/archive/20250916/202509161121.SHWsStQM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 65ad21d730d25789454d18e811f8ff5db79cb5d4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509161121.SHWsStQM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509161121.SHWsStQM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/riscv/iommu-perf.c:12:
   In file included from drivers/iommu/riscv/iommu.h:20:
   drivers/iommu/riscv/iommu-perf.h:68:29: error: no member named 'pmu' in 'struct perf_event'
      68 |         return container_of(event->pmu, struct riscv_iommu_pmu, pmu);
         |                             ~~~~~  ^
   drivers/iommu/riscv/iommu-perf.h:68:29: error: no member named 'pmu' in 'struct perf_event'
      68 |         return container_of(event->pmu, struct riscv_iommu_pmu, pmu);
         |                             ~~~~~  ^
   drivers/iommu/riscv/iommu-perf.h:68:29: error: no member named 'pmu' in 'struct perf_event'
      68 |         return container_of(event->pmu, struct riscv_iommu_pmu, pmu);
         |                             ~~~~~  ^
>> drivers/iommu/riscv/iommu-perf.c:157:34: error: no member named 'attr' in 'struct perf_event'
     157 |         unsigned long event_id = event->attr.config;
         |                                  ~~~~~  ^
>> drivers/iommu/riscv/iommu-perf.c:159:38: error: no member named 'hw' in 'struct perf_event'
     159 |         struct hw_perf_event *hwc = &event->hw;
         |                                      ~~~~~  ^
   drivers/iommu/riscv/iommu-perf.c:162:23: error: no member named 'attr' in 'struct perf_event'
     162 |         config1.val = event->attr.config1;
         |                       ~~~~~  ^
>> drivers/iommu/riscv/iommu-perf.c:182:8: error: no member named 'idx' in 'struct hw_perf_event'
     182 |                 hwc->idx = 0;
         |                 ~~~  ^
   drivers/iommu/riscv/iommu-perf.c:201:8: error: no member named 'idx' in 'struct hw_perf_event'
     201 |                 hwc->idx = nr;
         |                 ~~~  ^
   drivers/iommu/riscv/iommu-perf.c:224:32: error: no member named 'attr' in 'struct perf_event'
     224 |         unsigned long config = event->attr.config;
         |                                ~~~~~  ^
   drivers/iommu/riscv/iommu-perf.c:252:38: error: no member named 'hw' in 'struct perf_event'
     252 |         struct hw_perf_event *hwc = &event->hw;
         |                                      ~~~~~  ^
   drivers/iommu/riscv/iommu-perf.c:254:13: error: no member named 'attr' in 'struct perf_event'
     254 |         if (event->attr.sample_period)
         |             ~~~~~  ^
>> drivers/iommu/riscv/iommu-perf.c:257:13: error: no member named 'cpu' in 'struct perf_event'
     257 |         if (event->cpu < 0)
         |             ~~~~~  ^
>> drivers/iommu/riscv/iommu-perf.c:260:7: error: no member named 'config' in 'struct hw_perf_event'
     260 |         hwc->config = event->attr.config;
         |         ~~~  ^
   drivers/iommu/riscv/iommu-perf.c:260:23: error: no member named 'attr' in 'struct perf_event'
     260 |         hwc->config = event->attr.config;
         |                       ~~~~~  ^
   drivers/iommu/riscv/iommu-perf.c:276:38: error: no member named 'hw' in 'struct perf_event'
     276 |         struct hw_perf_event *hwc = &event->hw;
         |                                      ~~~~~  ^
>> drivers/iommu/riscv/iommu-perf.c:279:7: error: no member named 'state' in 'struct hw_perf_event'
     279 |         hwc->state = 0;
         |         ~~~  ^
   drivers/iommu/riscv/iommu-perf.c:281:11: error: no member named 'idx' in 'struct hw_perf_event'
     281 |         if (hwc->idx == EVENT_CYCLES)
         |             ~~~  ^
   drivers/iommu/riscv/iommu-perf.c:284:77: error: no member named 'idx' in 'struct hw_perf_event'
     284 |                 count = riscv_iommu_readq(iommu_pmu->iommu, RISCV_IOMMU_REG_IOHPMCTR(hwc->idx));
         |                                                                                      ~~~  ^
>> drivers/iommu/riscv/iommu-perf.c:286:21: error: no member named 'prev_count' in 'struct hw_perf_event'
     286 |         local64_set((&hwc->prev_count), count);
         |                       ~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +157 drivers/iommu/riscv/iommu-perf.c

8cf5fb280f5fc0 Yaxing Guo 2025-09-15  152  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  153  static int riscv_iommu_pmu_event_add(struct riscv_iommu_pmu *iommu_pmu,
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  154  				     struct perf_event *event)
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  155  {
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  156  	int nr = -1, of;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15 @157  	unsigned long event_id = event->attr.config;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  158  	riscv_iommu_pmu_cfg1_t config1;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15 @159  	struct hw_perf_event *hwc = &event->hw;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  160  	struct riscv_iommu_device *iommu = iommu_pmu->iommu;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  161  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  162  	config1.val = event->attr.config1;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  163  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  164  	if (event_id >= RISCV_IOMMU_IOHPMCTR_CNT)
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  165  		return -EINVAL;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  166  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  167  	if (iommu->hpm_irq)
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  168  		of = 0;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  169  	else
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  170  		of = 1;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  171  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  172  	if (event_id == EVENT_CYCLES) {
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  173  		unsigned long val;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  174  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  175  		val = riscv_iommu_readq(iommu_pmu->iommu, RISCV_IOMMU_REG_IOHPMCYCLES);
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  176  		if (of)
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  177  			val &= ~RISCV_IOMMU_IOHPMCYCLES_OF;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  178  		else
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  179  			val |= RISCV_IOMMU_IOHPMCYCLES_OF;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  180  		riscv_iommu_writeq(iommu_pmu->iommu, RISCV_IOMMU_REG_IOHPMCYCLES, val);
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  181  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15 @182  		hwc->idx = 0;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  183  		iommu->events[0]->perf_event = event;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  184  	} else {
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  185  		struct riscv_iommu_perf_event *iommu_perf_event;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  186  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  187  		iommu_perf_event = get_riscv_iommu_perf_event(iommu_pmu, event,
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  188  							      config1.pv_pscv, config1.dv_gscv,
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  189  							      config1.idt, config1.pid_pscid,
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  190  							      config1.did_gscid, &nr);
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  191  		if (!iommu_perf_event)
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  192  			return -ENOSPC;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  193  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  194  		riscv_iommu_pmu_hpmevt_set(&iommu_pmu->iommu->iohpmevt[nr], event_id,
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  195  					   iommu_perf_event->pv_pscv, iommu_perf_event->dv_gscv,
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  196  					   iommu_perf_event->idt, iommu_perf_event->pid_pscid,
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  197  					   iommu_perf_event->did_gscid, of);
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  198  		riscv_iommu_writeq(iommu_pmu->iommu, RISCV_IOMMU_REG_IOHPMEVT(nr),
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  199  				   iommu_pmu->iommu->iohpmevt[nr].val);
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  200  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  201  		hwc->idx = nr;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  202  	}
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  203  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  204  	return 0;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  205  }
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  206  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  207  static int riscv_iommu_pmu_hpmevt_idx_get(struct riscv_iommu_pmu *iommu_pmu, int event_id)
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  208  {
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  209  	int i;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  210  	iohpmevt_t *iohpmevt;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  211  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  212  	for (i = 0; i < RISCV_IOMMU_IOHPMCTR_CNT; i++) {
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  213  		iohpmevt = &iommu_pmu->iommu->iohpmevt[i];
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  214  		if (iohpmevt->eventID == event_id)
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  215  			return iohpmevt - iommu_pmu->iommu->iohpmevt;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  216  	}
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  217  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  218  	return -1;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  219  }
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  220  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  221  static int riscv_iommu_event_del(struct riscv_iommu_pmu *iommu_pmu,
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  222  				 struct perf_event *event)
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  223  {
8cf5fb280f5fc0 Yaxing Guo 2025-09-15 @224  	unsigned long config = event->attr.config;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  225  	struct riscv_iommu_device *iommu = iommu_pmu->iommu;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  226  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  227  	if (config >= RISCV_IOMMU_IOHPMCTR_CNT)
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  228  		return -EINVAL;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  229  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  230  	if (config == EVENT_CYCLES) {
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  231  		iommu->events[0] = NULL;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  232  	} else {
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  233  		int nr;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  234  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  235  		nr = riscv_iommu_pmu_hpmevt_idx_get(iommu_pmu, config);
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  236  		if (-1 == nr)
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  237  			return -1;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  238  		riscv_iommu_pmu_hpmevt_set(&iommu_pmu->iommu->iohpmevt[nr], 0,
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  239  					   0, 0, 0, 0, 0, 0);
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  240  		clear_bit(nr, &iommu_pmu->iommu->iohpmctr_bitmap);
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  241  		riscv_iommu_writeq(iommu_pmu->iommu, RISCV_IOMMU_REG_IOHPMEVT(nr),
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  242  				   0);
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  243  		kfree(iommu->events[nr]);
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  244  		iommu->events[nr] = NULL;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  245  	}
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  246  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  247  	return 0;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  248  }
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  249  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  250  static int riscv_iommu_pmu_event_init(struct perf_event *event)
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  251  {
8cf5fb280f5fc0 Yaxing Guo 2025-09-15 @252  	struct hw_perf_event *hwc = &event->hw;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  253  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  254  	if (event->attr.sample_period)
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  255  		return -EINVAL;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  256  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15 @257  	if (event->cpu < 0)
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  258  		return -EINVAL;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  259  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15 @260  	hwc->config = event->attr.config;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  261  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  262  	return 0;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  263  }
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  264  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  265  static void riscv_iommu_pmu_enable(struct pmu *pmu)
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  266  {
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  267  }
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  268  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  269  static void riscv_iommu_pmu_disable(struct pmu *pmu)
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  270  {
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  271  }
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  272  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  273  static void riscv_iommu_pmu_start(struct perf_event *event, int flags)
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  274  {
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  275  	struct riscv_iommu_pmu *iommu_pmu = riscv_iommu_event_to_pmu(event);
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  276  	struct hw_perf_event *hwc = &event->hw;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  277  	unsigned long count;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  278  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15 @279  	hwc->state = 0;
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  280  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  281  	if (hwc->idx == EVENT_CYCLES)
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  282  		count = riscv_iommu_readq(iommu_pmu->iommu, RISCV_IOMMU_REG_IOHPMCYCLES);
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  283  	else
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  284  		count = riscv_iommu_readq(iommu_pmu->iommu, RISCV_IOMMU_REG_IOHPMCTR(hwc->idx));
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  285  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15 @286  	local64_set((&hwc->prev_count), count);
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  287  
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  288  	perf_event_update_userpage(event);
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  289  }
8cf5fb280f5fc0 Yaxing Guo 2025-09-15  290  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
