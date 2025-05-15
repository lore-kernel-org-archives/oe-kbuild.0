Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6129E1A01B9
	for <oe-kbuild@lists.linux.dev>; Thu, 15 May 2025 08:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297880; cv=none; b=X2yxNUbjxZK6NAlSuhUfzMyal9LsUShgUuAOsqe7GiPtg1aX5YQtxLspST4XJ2I1VBh/NsyU806CGQ+AIf8QK6gUREvV76H8kR6xdtv0GJ1ZaUw+HvXnUvVYS8307v4BjTsC08zfduC03nBzFfMvYioctn1ng4dMTdj3Yj3Z8GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297880; c=relaxed/simple;
	bh=J4KuRQaJwLCcBJDNUYcoZwE4zeeX/EyME3m9Yqr53Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KZ9aJ3lk94KVGYtf7MHMAXqvwkGpoue3mH4ugN6nPlUC6BDmdFiuk5CRirkuc8W32hxbErJVS6SFP0OYHgxhq97yoI0dTaW3WLKFDKpLr1d1BCxDkoiaeBKoIi4UQ/d+Kb/zLVgTb84DoTRaVvnLnuIpy2ZukoiK3KLoEwZwpR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I42O6v5u; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I42O6v5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747297878; x=1778833878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J4KuRQaJwLCcBJDNUYcoZwE4zeeX/EyME3m9Yqr53Zo=;
  b=I42O6v5uZVcQbUSF2tETXMqeukkqvnMPsr7+JVHi5qbarfko6jM6S+p/
   MQva4T6CoZKg7zU8w4tkko5UWkHgu6WQWAeaCJeOe6tSXVX9uBxgOW3pv
   BJh8l8BXy+E2+Bw3hYyARPBY3DvA9dTK4cZsh3O4aaLC6MT0Ap/TR9Eti
   ARhrr9opTWYwsLGRXFG4rKkLYglvnXXcjMSQK2U+OHcDrDny4L1n7WWAw
   1EWcRRTWxyKn3geNG8vnMPMnFqleo5MuXC+Jn0Ek83pWa8bb05F0UcPZG
   6oTPxdnIj76Ts05thKWSvC++RkCjPC+WHMzndqvVM50Lx9Tkp6crtm2Q9
   w==;
X-CSE-ConnectionGUID: Wn/i5sPJTdK95yrMn4g2Mg==
X-CSE-MsgGUID: WehfCwtTTA2Vj4FQCIq7pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49361038"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="49361038"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 01:31:17 -0700
X-CSE-ConnectionGUID: wza9HhzpS+KE05bwEsukow==
X-CSE-MsgGUID: ZmmdmuNbRziktFSqHxay4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="138168229"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 May 2025 01:31:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFTzm-000IAp-1m;
	Thu, 15 May 2025 08:31:14 +0000
Date: Thu, 15 May 2025 16:30:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 3/3]
 arch/arm64/net/bpf_jit_comp.c:2726:32: sparse: sparse: arithmetics on
 pointers to functions
Message-ID: <202505151610.siraVnKI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm64/net/bpf_jit_comp.c:2726:32: sparse: sparse: arithmetics on pointers to functions"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e1cdedc5dbd14af8ca28472c8d459635f6523cb6
commit: 83e46665472d48dd181c2c9e451f751e9d5b6ec7 [3/3] FROMLIST: arm64/cfi,bpf: Support kCFI + BPF on arm64
:::::: branch date: 17 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-r113-20250515 (https://download.01.org/0day-ci/archive/20250515/202505151610.siraVnKI-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250515/202505151610.siraVnKI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505151610.siraVnKI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/net/bpf_jit_comp.c:2726:32: sparse: sparse: arithmetics on pointers to functions
>> arch/arm64/net/bpf_jit_comp.c:2726:17: sparse: sparse: non size-preserving pointer to integer cast
>> arch/arm64/net/bpf_jit_comp.c:2726:17: sparse: sparse: non size-preserving integer to pointer cast

vim +2726 arch/arm64/net/bpf_jit_comp.c

75fe4c0b3e181f5 Puranjay Mohan 2024-05-02  2709  
1dad391daef129e Puranjay Mohan 2024-02-28  2710  void bpf_jit_free(struct bpf_prog *prog)
1dad391daef129e Puranjay Mohan 2024-02-28  2711  {
1dad391daef129e Puranjay Mohan 2024-02-28  2712  	if (prog->jited) {
1dad391daef129e Puranjay Mohan 2024-02-28  2713  		struct arm64_jit_data *jit_data = prog->aux->jit_data;
1dad391daef129e Puranjay Mohan 2024-02-28  2714  		struct bpf_binary_header *hdr;
1dad391daef129e Puranjay Mohan 2024-02-28  2715  
1dad391daef129e Puranjay Mohan 2024-02-28  2716  		/*
1dad391daef129e Puranjay Mohan 2024-02-28  2717  		 * If we fail the final pass of JIT (from jit_subprogs),
1dad391daef129e Puranjay Mohan 2024-02-28  2718  		 * the program may not be finalized yet. Call finalize here
1dad391daef129e Puranjay Mohan 2024-02-28  2719  		 * before freeing it.
1dad391daef129e Puranjay Mohan 2024-02-28  2720  		 */
1dad391daef129e Puranjay Mohan 2024-02-28  2721  		if (jit_data) {
1dad391daef129e Puranjay Mohan 2024-02-28  2722  			bpf_arch_text_copy(&jit_data->ro_header->size, &jit_data->header->size,
1dad391daef129e Puranjay Mohan 2024-02-28  2723  					   sizeof(jit_data->header->size));
1dad391daef129e Puranjay Mohan 2024-02-28  2724  			kfree(jit_data);
1dad391daef129e Puranjay Mohan 2024-02-28  2725  		}
83e46665472d48d Puranjay Mohan 2025-03-10 @2726  		prog->bpf_func -= cfi_get_offset();

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
