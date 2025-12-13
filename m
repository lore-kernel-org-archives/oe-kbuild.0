Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E636F1B81CA
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 19:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765655600; cv=none; b=eBfNgYZN3Df0zXUTOHWlpMjJwZ85J0Q3vTl4zvlMHPcc+pUr+IUZ+oG1ftg20/8YDUy8zwBuEZXPqQYgHosjGNJvrsk6KYVae1Uwm8uQiPqFjt3PKKOjM++UclBeRIcLCFp23i+HqEKP5MSX8q5w5PraktsYpcIiajcOlI5FAP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765655600; c=relaxed/simple;
	bh=EtPIFou/uND+t0zv3rPHeBhnTARcu6NHKjLLcYfbsYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ctd2tK+4KOR+IAYZlIiS72kFkAOKN7bUI1GaUIThzbpacqecKRi9rkYFwAquqPl861IEHKJulFzQVVCqwL0Rjlz9isgom8wUz0jtrU168voOAxZHqkZyJhdlYkcRk3g7ZBZeT1x0+xsptBOfHMFx9TqMcSKojqD70vPIVcZbi50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WMc1Huzh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMc1Huzh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765655599; x=1797191599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EtPIFou/uND+t0zv3rPHeBhnTARcu6NHKjLLcYfbsYc=;
  b=WMc1HuzhXoDiQfLqJlfYdHWbWTMrHx3G51eX63EA8q0gWLz5EJzcpsaC
   hb+rwLjnVF/HMKOodj21uQRPi5h1DLnYDqJ02YSVnTLEcb1p8aLx+gbpD
   ujpbRUSiewckkhnuIzLs6eTHuiNHBogv3N3GcbMLWJ+3CTqt5RrqIp3zh
   is7jJno4xcu8F5UB8u/+ikY7MCvUkxj/UAm4Wc4CzNmGTlaL0FHEcmZ49
   NiNEqZ0buqYXCMZmiVwmAq7JHH6p3fLFVXRZ+yaLTSkP8RUQci+ebG9k8
   ApvPi6hdZxqX9MsXC3OopCQ3/jHI3VNBjfccTXiAHpanNm46B+Vkw0Wr/
   A==;
X-CSE-ConnectionGUID: Ofna/agjRteWRtsdWCiypQ==
X-CSE-MsgGUID: ziEZ9sx+T8KcjC8IgVQoCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="79076636"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="79076636"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 11:53:17 -0800
X-CSE-ConnectionGUID: 6Xjb4wn2SWKTCuNH+N7IWg==
X-CSE-MsgGUID: 0uQ/tc9TQt2i2y1dmYWdAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="196979716"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Dec 2025 11:53:15 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUVg1-0000000088T-1pdb;
	Sat, 13 Dec 2025 19:53:13 +0000
Date: Sun, 14 Dec 2025 03:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/net/bpf_jit_comp.c:3071:32: sparse: sparse: arithmetics
 on pointers to functions
Message-ID: <202512140357.cUqP7fty-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm64/net/bpf_jit_comp.c:3071:32: sparse: sparse: arithmetics on pointers to functions"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Puranjay Mohan <puranjay12@gmail.com>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Maxwell Bland <mbland@motorola.com>
CC: Sami Tolvanen <samitolvanen@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: 710618c760c0a3267221517d78f4cfb65ca7b882 arm64/cfi,bpf: Support kCFI + BPF on arm64
date:   5 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-r113-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140357.cUqP7fty-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140357.cUqP7fty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512140357.cUqP7fty-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/net/bpf_jit_comp.c:3071:32: sparse: sparse: arithmetics on pointers to functions
   arch/arm64/net/bpf_jit_comp.c:121:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] data @@
   arch/arm64/net/bpf_jit_comp.c:121:38: sparse:     expected restricted __le32 [usertype]
   arch/arm64/net/bpf_jit_comp.c:121:38: sparse:     got unsigned int const [usertype] data
   arch/arm64/net/bpf_jit_comp.c:121:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] data @@
   arch/arm64/net/bpf_jit_comp.c:121:38: sparse:     expected restricted __le32 [usertype]
   arch/arm64/net/bpf_jit_comp.c:121:38: sparse:     got unsigned int const [usertype] data
   arch/arm64/net/bpf_jit_comp.c:3071:17: sparse: sparse: non size-preserving pointer to integer cast
   arch/arm64/net/bpf_jit_comp.c:3071:17: sparse: sparse: non size-preserving integer to pointer cast

vim +3071 arch/arm64/net/bpf_jit_comp.c

75fe4c0b3e181f Puranjay Mohan 2024-05-02  3052  
1dad391daef129 Puranjay Mohan 2024-02-28  3053  void bpf_jit_free(struct bpf_prog *prog)
1dad391daef129 Puranjay Mohan 2024-02-28  3054  {
1dad391daef129 Puranjay Mohan 2024-02-28  3055  	if (prog->jited) {
1dad391daef129 Puranjay Mohan 2024-02-28  3056  		struct arm64_jit_data *jit_data = prog->aux->jit_data;
1dad391daef129 Puranjay Mohan 2024-02-28  3057  		struct bpf_binary_header *hdr;
6c17a882d3804d Puranjay Mohan 2025-07-24  3058  		void __percpu *priv_stack_ptr;
6c17a882d3804d Puranjay Mohan 2025-07-24  3059  		int priv_stack_alloc_sz;
1dad391daef129 Puranjay Mohan 2024-02-28  3060  
1dad391daef129 Puranjay Mohan 2024-02-28  3061  		/*
1dad391daef129 Puranjay Mohan 2024-02-28  3062  		 * If we fail the final pass of JIT (from jit_subprogs),
1dad391daef129 Puranjay Mohan 2024-02-28  3063  		 * the program may not be finalized yet. Call finalize here
1dad391daef129 Puranjay Mohan 2024-02-28  3064  		 * before freeing it.
1dad391daef129 Puranjay Mohan 2024-02-28  3065  		 */
1dad391daef129 Puranjay Mohan 2024-02-28  3066  		if (jit_data) {
1dad391daef129 Puranjay Mohan 2024-02-28  3067  			bpf_arch_text_copy(&jit_data->ro_header->size, &jit_data->header->size,
1dad391daef129 Puranjay Mohan 2024-02-28  3068  					   sizeof(jit_data->header->size));
1dad391daef129 Puranjay Mohan 2024-02-28  3069  			kfree(jit_data);
1dad391daef129 Puranjay Mohan 2024-02-28  3070  		}
710618c760c0a3 Puranjay Mohan 2025-08-01 @3071  		prog->bpf_func -= cfi_get_offset();

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
