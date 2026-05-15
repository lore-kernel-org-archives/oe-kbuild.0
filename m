Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5C7396B73
	for <oe-kbuild@lists.linux.dev>; Fri, 15 May 2026 11:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845480; cv=none; b=EPCL3toFtxdK8LV6n4+2oZ3JnxTG2GrSaz5nfvnb9pRMCMi5JvH+nPU2Jk+4+wQffkjHcv7qxvO/4DiHQeVdfPPKRjLZGZJikdWsqkghXKMMBftoSjjCZjt82T3avw1+WIgYMnmbuGNz4X2vbsXDYsFaBaPdKx6OrMCVLCclxOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845480; c=relaxed/simple;
	bh=4jXiVzr7EEVwAEIQlaZLimUOqIQaU1PjVkkZul/yNTI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tvVRob/8fKA5kwUNlay+abhJJ21ZyfbeDk63pklfEDx9XkJ7WH2+f7ozDaoFD8XzLygVL1x8xlHZXFX8LgdE+r6jOqrbqdCeURMTEjFowo0/oqP2Pc1HVzVsJ0ZY0P8pbuHPOmZNVv6+0gC0c2aHhJm1w8RUrwJ0WgeBYep+Cz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbRCOKEB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbRCOKEB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778845479; x=1810381479;
  h=date:from:to:cc:subject:message-id;
  bh=4jXiVzr7EEVwAEIQlaZLimUOqIQaU1PjVkkZul/yNTI=;
  b=JbRCOKEBchU4Yv1LD8goxoovZgMQ9CWqkq1pTC1NdvIIQoV4xOWARte9
   y1SgAphJRfGTnVHtmbj6Iw/2HvK0GF8WqPjCv+UpShJ/CU/9OVzaKhBlE
   9YZ9iz3EK7L0GNI41zczED9ZkEEi9sbvbaB7lGv2a3Vruo+uNI2qQunZa
   ZhuUzhHilPKscz7tHhGmX5BQMvsFpsWaGw4Ae2Uu9EXPOjgROHUepX47w
   sY9S+7rcUs/1p1kBzMyHducCqjDroi25yKg4rmnXNRbPNGjKt0tlwnIbz
   KFSSJK2fjv6UXYPYwv7wMRMG+B3H5O0W2zvbSNUTw2TP4TkN+pAyBlHRY
   g==;
X-CSE-ConnectionGUID: T+mXflOBR3G+TFRovIqgRQ==
X-CSE-MsgGUID: HF2y47a6STWzMpmEhOC3bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79780100"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79780100"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 04:44:39 -0700
X-CSE-ConnectionGUID: 3Q2UYcDUSeW4XwFWZ9oJEg==
X-CSE-MsgGUID: qUc0pNo4Sya+2xXVpP++kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="237812842"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 15 May 2026 04:44:38 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNqx0-000000001Th-07dA;
	Fri, 15 May 2026 11:43:50 +0000
Date: Fri, 15 May 2026 19:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android17-6.18 2/2]
 arch/arm64/net/bpf_jit_comp.c:3071:32: sparse: sparse: arithmetics on
 pointers to functions
Message-ID: <202605151944.IHemAbQg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm64/net/bpf_jit_comp.c:3071:32: sparse: sparse: arithmetics on pointers to functions"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   2199ad6b82e4d501ba6be4d48df53ca71ecbbbfa
commit: 710618c760c0a3267221517d78f4cfb65ca7b882 [2/2] arm64/cfi,bpf: Support kCFI + BPF on arm64
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r112-20260515 (https://download.01.org/0day-ci/archive/20260515/202605151944.IHemAbQg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151944.IHemAbQg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 710618c760c0 ("arm64/cfi,bpf: Support kCFI + BPF on arm64")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605151944.IHemAbQg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/net/bpf_jit_comp.c:3071:32: sparse: sparse: arithmetics on pointers to functions
>> arch/arm64/net/bpf_jit_comp.c:121:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] data @@
   arch/arm64/net/bpf_jit_comp.c:121:38: sparse:     expected restricted __le32 [usertype]
   arch/arm64/net/bpf_jit_comp.c:121:38: sparse:     got unsigned int const [usertype] data
>> arch/arm64/net/bpf_jit_comp.c:121:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] data @@
   arch/arm64/net/bpf_jit_comp.c:121:38: sparse:     expected restricted __le32 [usertype]
   arch/arm64/net/bpf_jit_comp.c:121:38: sparse:     got unsigned int const [usertype] data
>> arch/arm64/net/bpf_jit_comp.c:3071:17: sparse: sparse: non size-preserving pointer to integer cast
>> arch/arm64/net/bpf_jit_comp.c:3071:17: sparse: sparse: non size-preserving integer to pointer cast

vim +3071 arch/arm64/net/bpf_jit_comp.c

75fe4c0b3e181f5 Puranjay Mohan 2024-05-02  3052  
1dad391daef129e Puranjay Mohan 2024-02-28  3053  void bpf_jit_free(struct bpf_prog *prog)
1dad391daef129e Puranjay Mohan 2024-02-28  3054  {
1dad391daef129e Puranjay Mohan 2024-02-28  3055  	if (prog->jited) {
1dad391daef129e Puranjay Mohan 2024-02-28  3056  		struct arm64_jit_data *jit_data = prog->aux->jit_data;
1dad391daef129e Puranjay Mohan 2024-02-28  3057  		struct bpf_binary_header *hdr;
6c17a882d3804dc Puranjay Mohan 2025-07-24  3058  		void __percpu *priv_stack_ptr;
6c17a882d3804dc Puranjay Mohan 2025-07-24  3059  		int priv_stack_alloc_sz;
1dad391daef129e Puranjay Mohan 2024-02-28  3060  
1dad391daef129e Puranjay Mohan 2024-02-28  3061  		/*
1dad391daef129e Puranjay Mohan 2024-02-28  3062  		 * If we fail the final pass of JIT (from jit_subprogs),
1dad391daef129e Puranjay Mohan 2024-02-28  3063  		 * the program may not be finalized yet. Call finalize here
1dad391daef129e Puranjay Mohan 2024-02-28  3064  		 * before freeing it.
1dad391daef129e Puranjay Mohan 2024-02-28  3065  		 */
1dad391daef129e Puranjay Mohan 2024-02-28  3066  		if (jit_data) {
1dad391daef129e Puranjay Mohan 2024-02-28  3067  			bpf_arch_text_copy(&jit_data->ro_header->size, &jit_data->header->size,
1dad391daef129e Puranjay Mohan 2024-02-28  3068  					   sizeof(jit_data->header->size));
1dad391daef129e Puranjay Mohan 2024-02-28  3069  			kfree(jit_data);
1dad391daef129e Puranjay Mohan 2024-02-28  3070  		}
710618c760c0a32 Puranjay Mohan 2025-08-01 @3071  		prog->bpf_func -= cfi_get_offset();

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
