Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104910;
	b=bq47jn745bVfkwucCTRvzzioPzy4CUGOMKMcECv/T3SrRLkBEgmGwYYomxycQrWjcbN/
	 CGZNXZYK1ysxsAVUMO85QSoUCPBD+OV1cZXbpdgxqB3SsJenaWRVtCio2cDzj07IQprGc
	 adTxxfFsd2DRCKXUnOnYxL3/zTG6iT562MuABtkL/tplf9bMIV0GzDaSPPhGNQuMOD9PO
	 VpH0LM65c0aMcTk71PEOpel6Pc/MQ9q/ydrA7LFJvDqohRQ7MRuQxB0yKBHNVgD/tsX0q
	 eYK29cdZ13nuPLZIkDu5vPpVDWuZgSIP1BnmhcPoPFUlL3RjLCPM84jQgO4mb1Lw4Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104910;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=FEMRvvX2GhcgPKr99K4oUKBby/VfE1/96Qn1Hl64Q4o=;
	b=NFzGys8JDYhWgD+3s8Azwoq2xV5/1GUv6cQEztB4IPmZvqkWbdURLl6UqKF31n77A8JI
	 MhFGc2Aerfz3dEW17USVDV3seHQoZAIS25ntwvD24/YSMEbdrJUy379+DZHmnjmuLFBrc
	 UIMi6rDfVAQnOvN5JzKNcgLfUx6Go+/zsTllGgLhKjsRnkmHnpOW6v9MhLWobWX659w6U
	 Kn/zzjr9H+agq9BZw9j6VznY2DNv8p6p470gKPMg6JipWmiqkHRq9/QlMnbrA1LA0kZY4
	 Z2Ph7MoUqOyP3BKCJ+TF6pz/5GDE1/i6eoyG27sRuaSd4VvRJq6X5h+evOiqUJylGFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=chRo1vmv;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5825E606A32A
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 16:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5825E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=chRo1vmv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795104909; x=1826640909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ljWRfC2+IcadfrBsM7zX2Zbj0d/LV17N2HCRHgh7adg=;
  b=chRo1vmvEt4PY+/PmjvyPexTYm/YFI/qg5L+1yrv/8uoNfCzFXnLjEUZ
   68nQMLgdCsHMs1ukkaDIOz7N8VqsFzvAfMGtgL367mtRrxLP5a8L5AujC
   D1OpPb1fM0IudrfxFlowyz2KQeySosHYjyLPl8rIdUm5tnAJisMiHDbiF
   5Wep5A94PE9HyOGzsfgMu1srSfu1DGBAHpGWhA0i5uiQuU9U0JSWS5FOQ
   S1I/zQxTGBADpWELnnGup71bqGH5i9PHFOYILCA4h7ul6VX9/FTX/a7vR
   FrmjxzfGhEfYt9qVyWAQuAko9R1X7rEe6LCSi2kCo/HsFKi55ZR72ncyM
   w==;
X-CSE-ConnectionGUID: hmpWrguVS/qufY4ACz0u/g==
X-CSE-MsgGUID: x8TSgxW8TlaZ3ynKBMAW9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3853838"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3853838"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:15:08 -0800
X-CSE-ConnectionGUID: DXaNzquDROWfklllDCJM2g==
X-CSE-MsgGUID: Tu4V6JsiTX6bdt3JafDrtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10543528"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 08:15:07 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU4mv-00000001G5i-12Ve;
	Thu, 19 Nov 2026 16:15:05 +0000
Date: Fri, 20 Nov 2026 00:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] ARC: stop linking libgcc
Message-ID: <202611192318.m6kzkLfb-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261119055958.1621709-5-vgupta@kernel.org>
References: <20261119055958.1621709-5-vgupta@kernel.org>
TO: Vineet Gupta <vgupta@kernel.org>
TO: linux-snps-arc@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Arnd Bergmann <arnd@arndb.de>
CC: Dinh Nguyen <dinguyen@kernel.org>
CC: Simon Schuster <schuster.simon@siemens-energy.com>
CC: Vineet Gupta <vgupta@kernel.org>

Hi Vineet,

kernel test robot noticed the following build errors:

[auto build test ERROR on vgupta-arc/for-curr]
[also build test ERROR on linus/master v7.4-rc3 next-20261116]
[cannot apply to soc/for-next vgupta-arc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vineet-Gupta/ARC-math-emul-elide-64-64-divide-and-floating-point-routines/20261118-215955
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git for-curr
patch link:    https://lore.kernel.org/r/20261119055958.1621709-5-vgupta%40kernel.org
patch subject: [PATCH 4/4] ARC: stop linking libgcc
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20261119/202611192318.m6kzkLfb-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/202611192318.m6kzkLfb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611192318.m6kzkLfb-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: init/calibrate.o: in function `calibrate_delay':
>> calibrate.c:(.text+0x1e2): undefined reference to `__udivsi3'
>> arc-linux-ld: calibrate.c:(.text+0x1e2): undefined reference to `__udivsi3'
>> arc-linux-ld: calibrate.c:(.text+0x1e8): undefined reference to `__umodsi3'
>> arc-linux-ld: calibrate.c:(.text+0x1e8): undefined reference to `__umodsi3'
   arc-linux-ld: calibrate.c:(.text+0x1f6): undefined reference to `__udivsi3'
   arc-linux-ld: calibrate.c:(.text+0x1f6): undefined reference to `__udivsi3'
   arc-linux-ld: arch/arc/mm/cache.o: in function `arc_cache_mumbojumbo':
>> cache.c:(.text+0x3da): undefined reference to `__udivsi3'
>> arc-linux-ld: cache.c:(.text+0x3da): undefined reference to `__udivsi3'
   arc-linux-ld: arch/arc/mm/cache.o: in function `arc_ioc_setup':
>> cache.c:(.init.text+0x72): undefined reference to `__umodsi3'
>> arc-linux-ld: cache.c:(.init.text+0x72): undefined reference to `__umodsi3'
   arc-linux-ld: kernel/workqueue.o: in function `wq_update_node_max_active.constprop.0':
>> workqueue.c:(.text+0x11e2): undefined reference to `__divsi3'
>> arc-linux-ld: workqueue.c:(.text+0x11e2): undefined reference to `__divsi3'
   arc-linux-ld: kernel/workqueue.o: in function `llc_populate_cpu_shard_id.constprop.0':
>> workqueue.c:(.init.text+0xc4): undefined reference to `__udivsi3'
>> arc-linux-ld: workqueue.c:(.init.text+0xc4): undefined reference to `__udivsi3'
>> arc-linux-ld: workqueue.c:(.init.text+0x13e): undefined reference to `__divsi3'
>> arc-linux-ld: workqueue.c:(.init.text+0x13e): undefined reference to `__divsi3'
>> arc-linux-ld: workqueue.c:(.init.text+0x148): undefined reference to `__modsi3'
>> arc-linux-ld: workqueue.c:(.init.text+0x148): undefined reference to `__modsi3'
   arc-linux-ld: kernel/workqueue.o: in function `workqueue_init':
   workqueue.c:(.init.text+0x38c): undefined reference to `__udivsi3'
   arc-linux-ld: workqueue.c:(.init.text+0x38c): undefined reference to `__udivsi3'
   arc-linux-ld: workqueue.c:(.init.text+0x3b2): undefined reference to `__udivsi3'
   arc-linux-ld: workqueue.c:(.init.text+0x3b2): undefined reference to `__udivsi3'
   arc-linux-ld: kernel/workqueue.o: in function `show_pwq':
>> workqueue.c:(.text.unlikely+0x2f8): undefined reference to `__udivsi3'
   arc-linux-ld: kernel/workqueue.o:workqueue.c:(.text.unlikely+0x2f8): more undefined references to `__udivsi3' follow
   arc-linux-ld: kernel/sched/fair.o: in function `sched_balance_find_src_group':
>> fair.c:(.text+0x6f54): undefined reference to `__divsi3'
>> arc-linux-ld: fair.c:(.text+0x6f54): undefined reference to `__divsi3'
>> arc-linux-ld: fair.c:(.text+0x6fa6): undefined reference to `__udivsi3'
   arc-linux-ld: fair.c:(.text+0x6fa6): undefined reference to `__udivsi3'
   arc-linux-ld: fair.c:(.text+0x6fb8): undefined reference to `__udivsi3'
   arc-linux-ld: fair.c:(.text+0x6fb8): undefined reference to `__udivsi3'
   arc-linux-ld: fair.c:(.text+0x700a): undefined reference to `__divsi3'
   arc-linux-ld: fair.c:(.text+0x700a): undefined reference to `__divsi3'
   arc-linux-ld: kernel/sched/fair.o: in function `sched_balance_newidle':
   fair.c:(.text+0x7b06): undefined reference to `__udivsi3'
   arc-linux-ld: fair.c:(.text+0x7b06): undefined reference to `__udivsi3'
   arc-linux-ld: kernel/sched/build_policy.o: in function `__dl_server_attach_bw_locked':
   build_policy.c:(.text+0x24b4): undefined reference to `__divsi3'
   arc-linux-ld: build_policy.c:(.text+0x24b4): undefined reference to `__divsi3'
   arc-linux-ld: kernel/sched/build_policy.o: in function `task_non_contending':
   build_policy.c:(.text+0x2f90): undefined reference to `__divsi3'
   arc-linux-ld: build_policy.c:(.text+0x2f90): undefined reference to `__divsi3'
   arc-linux-ld: kernel/sched/build_policy.o: in function `set_cpus_allowed_dl':
   build_policy.c:(.text+0x3510): undefined reference to `__divsi3'
   arc-linux-ld: kernel/sched/build_policy.o:build_policy.c:(.text+0x3510): more undefined references to `__divsi3' follow
   arc-linux-ld: kernel/sched/build_policy.o: in function `__update_load_avg_blocked_se':
   build_policy.c:(.text+0x748e): undefined reference to `__udivsi3'
   arc-linux-ld: build_policy.c:(.text+0x748e): undefined reference to `__udivsi3'
   arc-linux-ld: build_policy.c:(.text+0x74a8): undefined reference to `__udivsi3'
   arc-linux-ld: build_policy.c:(.text+0x74a8): undefined reference to `__udivsi3'
   arc-linux-ld: build_policy.c:(.text+0x74b4): undefined reference to `__udivsi3'
   arc-linux-ld: kernel/sched/build_policy.o:build_policy.c:(.text+0x74b4): more undefined references to `__udivsi3' follow
   arc-linux-ld: kernel/sched/build_policy.o: in function `__dl_server_attach_root':
   build_policy.c:(.text+0xa506): undefined reference to `__divsi3'
   arc-linux-ld: build_policy.c:(.text+0xa506): undefined reference to `__divsi3'
   arc-linux-ld: kernel/sched/build_policy.o: in function `dl_server_apply_params':
   build_policy.c:(.text+0xa78c): undefined reference to `__divsi3'
   arc-linux-ld: build_policy.c:(.text+0xa78c): undefined reference to `__divsi3'
   arc-linux-ld: build_policy.c:(.text+0xa86e): undefined reference to `__divsi3'
   arc-linux-ld: kernel/sched/build_policy.o:build_policy.c:(.text+0xa86e): more undefined references to `__divsi3' follow
   arc-linux-ld: kernel/time/hrtimer.o: in function `__ktime_divns':
   hrtimer.c:(.text+0x22c): undefined reference to `__udivsi3'
   arc-linux-ld: hrtimer.c:(.text+0x22c): undefined reference to `__udivsi3'
   arc-linux-ld: kernel/time/timekeeping.o: in function `mul_u64_u32_div':
   timekeeping.c:(.text+0x474): undefined reference to `__umodsi3'
   arc-linux-ld: timekeeping.c:(.text+0x474): undefined reference to `__umodsi3'
   arc-linux-ld: timekeeping.c:(.text+0x47e): undefined reference to `__udivsi3'
   arc-linux-ld: timekeeping.c:(.text+0x47e): undefined reference to `__udivsi3'
   arc-linux-ld: timekeeping.c:(.text+0x494): undefined reference to `__udivsi3'
   arc-linux-ld: timekeeping.c:(.text+0x494): undefined reference to `__udivsi3'
   arc-linux-ld: kernel/time/timekeeping.o: in function `convert_clock':
   timekeeping.c:(.text+0x574): undefined reference to `__udivsi3'
   arc-linux-ld: kernel/time/timekeeping.o:timekeeping.c:(.text+0x574): more undefined references to `__udivsi3' follow
   arc-linux-ld: kernel/time/jiffies.o: in function `register_refined_jiffies':
   jiffies.c:(.init.text+0x86): undefined reference to `__divsi3'
   arc-linux-ld: jiffies.c:(.init.text+0x86): undefined reference to `__divsi3'
   arc-linux-ld: jiffies.c:(.init.text+0x9c): undefined reference to `__divsi3'
   arc-linux-ld: jiffies.c:(.init.text+0x9c): undefined reference to `__divsi3'
   arc-linux-ld: jiffies.c:(.init.text+0xa8): undefined reference to `__udivsi3'
   arc-linux-ld: jiffies.c:(.init.text+0xa8): undefined reference to `__udivsi3'
   arc-linux-ld: kernel/time/clockevents.o: in function `cev_delta2ns':
   clockevents.c:(.text+0x1c0): undefined reference to `__udivsi3'
   arc-linux-ld: clockevents.c:(.text+0x1c0): undefined reference to `__udivsi3'
   arc-linux-ld: kernel/time/clockevents.o: in function `clockevents_config.part.0':
   clockevents.c:(.text+0x38a): undefined reference to `__udivsi3'
   arc-linux-ld: kernel/time/clockevents.o:clockevents.c:(.text+0x38a): more undefined references to `__udivsi3' follow
   arc-linux-ld: mm/util.o: in function `randomize_page':
   util.c:(.text+0x14f4): undefined reference to `__umodsi3'
   arc-linux-ld: util.c:(.text+0x14f4): undefined reference to `__umodsi3'
   arc-linux-ld: mm/mm_init.o: in function `find_zone_movable_pfns_for_nodes':
   mm_init.c:(.init.text+0x7ee): undefined reference to `__udivsi3'
   arc-linux-ld: mm_init.c:(.init.text+0x7ee): undefined reference to `__udivsi3'
   arc-linux-ld: mm_init.c:(.init.text+0x806): undefined reference to `__udivsi3'
   arc-linux-ld: mm_init.c:(.init.text+0x806): undefined reference to `__udivsi3'
   arc-linux-ld: mm_init.c:(.init.text+0x84a): undefined reference to `__udivsi3'
   arc-linux-ld: mm/mm_init.o:mm_init.c:(.init.text+0x84a): more undefined references to `__udivsi3' follow
   arc-linux-ld: mm/percpu.o: in function `pcpu_dump_alloc_info':
   percpu.c:(.text.unlikely+0x42): undefined reference to `__divsi3'
   arc-linux-ld: percpu.c:(.text.unlikely+0x42): undefined reference to `__divsi3'
   arc-linux-ld: percpu.c:(.text.unlikely+0x62): undefined reference to `__udivsi3'
   arc-linux-ld: percpu.c:(.text.unlikely+0x62): undefined reference to `__udivsi3'
   arc-linux-ld: percpu.c:(.text.unlikely+0x70): undefined reference to `__divsi3'
   arc-linux-ld: percpu.c:(.text.unlikely+0x70): undefined reference to `__divsi3'
   arc-linux-ld: percpu.c:(.text.unlikely+0x8a): undefined reference to `__udivsi3'
   arc-linux-ld: percpu.c:(.text.unlikely+0x8a): undefined reference to `__udivsi3'
   arc-linux-ld: percpu.c:(.text.unlikely+0xc6): undefined reference to `__modsi3'
   arc-linux-ld: percpu.c:(.text.unlikely+0xc6): undefined reference to `__modsi3'
   arc-linux-ld: percpu.c:(.text.unlikely+0xf2): undefined reference to `__divsi3'
   arc-linux-ld: percpu.c:(.text.unlikely+0xf2): undefined reference to `__divsi3'
   arc-linux-ld: percpu.c:(.text.unlikely+0x12a): undefined reference to `__modsi3'
   arc-linux-ld: percpu.c:(.text.unlikely+0x12a): undefined reference to `__modsi3'
   arc-linux-ld: mm/vmalloc.o: in function `__purge_vmap_area_lazy':
   vmalloc.c:(.text+0x213e): undefined reference to `__udivsi3'
   arc-linux-ld: vmalloc.c:(.text+0x213e): undefined reference to `__udivsi3'
   arc-linux-ld: mm/page_alloc.o: in function `setup_per_zone_lowmem_reserve':
   page_alloc.c:(.text+0x1d8): undefined reference to `__udivsi3'
   arc-linux-ld: page_alloc.c:(.text+0x1d8): undefined reference to `__udivsi3'
   arc-linux-ld: mm/page_alloc.o: in function `__setup_per_zone_wmarks':
   page_alloc.c:(.text+0x646): undefined reference to `__udivsi3'
   arc-linux-ld: mm/page_alloc.o:page_alloc.c:(.text+0x646): more undefined references to `__udivsi3' follow
   arc-linux-ld: mm/slub.o: in function `count_partial_free_approx':
   slub.c:(.text+0xfa): undefined reference to `__umodsi3'
   arc-linux-ld: slub.c:(.text+0xfa): undefined reference to `__umodsi3'
   arc-linux-ld: slub.c:(.text+0x102): undefined reference to `__udivsi3'
   arc-linux-ld: slub.c:(.text+0x102): undefined reference to `__udivsi3'
   arc-linux-ld: slub.c:(.text+0x10e): undefined reference to `__udivsi3'
   arc-linux-ld: slub.c:(.text+0x10e): undefined reference to `__udivsi3'
   arc-linux-ld: mm/slub.o: in function `slab_pad_check.part.0':

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
