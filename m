Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225664;
	b=2tpvE5ogEasHrH4h8AUgdf/zhJ+SshMx8MiQtsnCAdtNtnAzLyxv+6c7CM23y6j4yFGX
	 JWS4a+MNqDPR/07XkxCWVj5jEobgpkv8JuFKKuouTbaRXR7LBmgVnhCc6ChQFpQvdTit/
	 m5CzUCb8kaqFCQve17d0m1LOAYWb+cJTU/7TRpaiaqoRA79zriK46W/VUg5t+I4pv56by
	 q3rLsfBlGIqSmZNF20PxeAXTZiw0h9kD/z7H2jNaY8KOhUxnGcIsRz9KNbC9bozfnTOIF
	 m8sh1HIdLU+qgORYmxbRH4bFq92Nwsg1yYrOYBA1vWv4z4MQkesshimN6viBO1fZdbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225664;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zOnIiglwcBq/mdV3T4oVDZzDpYjDGtmPw+cj84zTtWU=;
	b=opbierghOMAkRaU+M8RRcFuX5fJYPcvC9xeqFMTo9ErXkgawT3/0TX28sy9rXqfTqMh1
	 MBwqt1FoUg9EDJeRbK6VdhB54UhmBgSGscDhe+RLPOl1Njhb9fzbij8D1PGIfhkGGk39Q
	 U7QBT+acICrWCPZJxXD+Lf+zyuocAHqf3g/A6EYVF112dutYUKebXtRt1Yz85oRmBxrfS
	 v9Xs20b2v7dgUYuF0gWuzOHi2eAcfe/FWEE0sGZoYEAF2nlVNkQ6eWhSX9cp6X/60+VAK
	 B5IHY64JZlRaYRwbbOXHrvJPjQjYPVAs98TnkPGyAb9hhhCy1Q2PtG726ZXfqx+SANA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oHSNYRbG;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D199606A32A
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Nov 2026 12:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D199606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oHSNYRbG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794225662; x=1825761662;
  h=date:from:to:cc:subject:message-id;
  bh=S0JM9iVLVAsq0jypyUACzdK/Ai1O4mhBvmbnBLAEF4w=;
  b=oHSNYRbGzGZ6OucNVRkAFJs1T0JObWjQOnxFqoeTziVmnjOLnWaIRlBh
   kHh8hfxFat7YeRUOnN7VGHmSqxfyU50pW4n3o4JxKg80JXnlIwkVvi8DI
   TVZknP+kND2J8vx/JBLYfVIaiDjk1TZrm9aaiYpM/RsD5nfYANKZ6zYy8
   PpxMPhPxG1o3CvdAE8EmeY+tfjbXIska5WoLxYdPlventae331TdqnP9O
   2C9GyxNhWRe7X4IP1QitMPASoNI5aKW5mvOsNGRvy/5pFpuiJikeFQ7Ro
   RH0GspX63dlI+wqJX5tk+pV025YRaPA10Uos8ssflWnMrLvRLT4i6PSVE
   Q==;
X-CSE-ConnectionGUID: 8DQPkhR6R/yS+ksCAwOJSw==
X-CSE-MsgGUID: gyRSY9aoSkGqPn965UH4bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2934499"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2934499"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:01:02 -0800
X-CSE-ConnectionGUID: cUtLYjq0QZGKo3ZoEuXLDw==
X-CSE-MsgGUID: reMqvy5+TNy8ZlNPP2uMbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="9624288"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 09 Nov 2026 04:01:01 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQO3V-000000000JP-0d0l;
	Mon, 09 Nov 2026 12:00:57 +0000
Date: Mon, 09 Nov 2026 13:00:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kkdwivedi:cancellations 31/48] kernel/bpf/frame_desc.c:207
 insn_subprog() error: buffer overflow 'env->subprog_info' 1026 <= 1073741823
Message-ID: <202611091250.noF1mTAA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>

tree:   https://github.com/kkdwivedi/linux cancellations
head:   c5378a88f114558f34a5251ecc2e401d1c111548
commit: ec83c9d519f8d4358632039cc2c6f8146f925e70 [31/48] bpf: Keep the descriptors of a site apart by chain of calls
:::::: branch date: 5 hours ago
:::::: commit date: 7 hours ago
config: hexagon-randconfig-2200-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091250.noF1mTAA-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611091250.noF1mTAA-lkp@intel.com/

smatch warnings:
kernel/bpf/frame_desc.c:207 insn_subprog() error: buffer overflow 'env->subprog_info' 1026 <= 1073741823

vim +207 kernel/bpf/frame_desc.c

240b6bc21978f8 Kumar Kartikeya Dwivedi 2026-11-08  197  
ec1e74abdd85c3 Kumar Kartikeya Dwivedi 2026-11-08  198  /* The subprog insn @idx belongs to. */
ec1e74abdd85c3 Kumar Kartikeya Dwivedi 2026-11-08  199  static int insn_subprog(struct bpf_verifier_env *env, u32 idx)
ec1e74abdd85c3 Kumar Kartikeya Dwivedi 2026-11-08  200  {
ec83c9d519f8d4 Kumar Kartikeya Dwivedi 2026-11-08  201  	int l = 0, r = env->subprog_cnt, m;
ec1e74abdd85c3 Kumar Kartikeya Dwivedi 2026-11-08  202  
ec83c9d519f8d4 Kumar Kartikeya Dwivedi 2026-11-08  203  	if (idx >= env->subprog_info[r].start)
ec1e74abdd85c3 Kumar Kartikeya Dwivedi 2026-11-08  204  		return -1;
ec83c9d519f8d4 Kumar Kartikeya Dwivedi 2026-11-08  205  	while (r - l > 1) {
ec83c9d519f8d4 Kumar Kartikeya Dwivedi 2026-11-08  206  		m = l + (r - l) / 2;
ec83c9d519f8d4 Kumar Kartikeya Dwivedi 2026-11-08 @207  		if (env->subprog_info[m].start <= idx)
ec83c9d519f8d4 Kumar Kartikeya Dwivedi 2026-11-08  208  			l = m;
ec83c9d519f8d4 Kumar Kartikeya Dwivedi 2026-11-08  209  		else
ec83c9d519f8d4 Kumar Kartikeya Dwivedi 2026-11-08  210  			r = m;
ec83c9d519f8d4 Kumar Kartikeya Dwivedi 2026-11-08  211  	}
ec83c9d519f8d4 Kumar Kartikeya Dwivedi 2026-11-08  212  	return l;
ec83c9d519f8d4 Kumar Kartikeya Dwivedi 2026-11-08  213  }
ec83c9d519f8d4 Kumar Kartikeya Dwivedi 2026-11-08  214  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
