Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9216374420
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Jul 2025 04:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753245650; cv=none; b=AFwNJ66JPQNDJBI7uPdCEEzkL4MjeiGeBahxYcNf3peFFS1lSjHBX7CHdGGYg0yunZkMrpwHXyqUgx4vpBQYEsYCGcylZ4KnB1ZdN0Ay8NknIImQKSzkCm2yApAZVLJ4DFav8UWrSlTngbCTmsxj2L9gDJ/gvv9kziwj3c0PGVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753245650; c=relaxed/simple;
	bh=8EphLKWNUCRAXrvvGw3WCWSNkzqrAbis2TkTFWyLhcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O75utTuRloJ4/KKmDoPpFKm4dCX7koEjrIg2826LmGJTJWZjeKv7w+cKN+NEQA63QJ34K88hGqGP2tfm2gfGqpyjIFIGNwmuu8Xy7Z00bv6tRN3FciApwtuOYGYRl806H5aQoqyLgn9GKeige5xfUVdvo5odanTkrJbsB0XVLWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bj9Wl9Fx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bj9Wl9Fx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753245648; x=1784781648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8EphLKWNUCRAXrvvGw3WCWSNkzqrAbis2TkTFWyLhcU=;
  b=bj9Wl9FxsxkzmXYroP2aFLbG54rIuaMsdDSmNh3I5WpGNpSUIzeggLOk
   cHCLYJ0IYwIfGT+WZt/nOT0Kue+URdg3GOLRe/1dTxVsAakujysTRsb+4
   EnyGhTVcdOc7QWYp152mIN9NRv869oZmiErS27qB6RTzwmImVJX9nq8bV
   tysClSBWQcMIfxiyjeiqjF39TnoqmOiPjVn9BnJ+58bQ39QO1DE01/7QB
   91DAwCMfcxXLOI1SmDfFNVDRl7bd3xnuFr2NaVKstcCjtOW4J1Q57CAXl
   tY4zD2ZQP0/MvIAZxko0TwlBfQu8sChYeK+SqdZSrrNbcL6v97uwMai/m
   Q==;
X-CSE-ConnectionGUID: 4kG7n4QmQU66WNMkIirOHQ==
X-CSE-MsgGUID: JJGG789xT1abd59/ai9ScQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55610179"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="55610179"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 21:40:41 -0700
X-CSE-ConnectionGUID: x6pvrqHYQXCGEGvZLzJaeQ==
X-CSE-MsgGUID: H4M1MsbRSDON611zN0vnLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="158625813"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Jul 2025 21:40:39 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueRHQ-000Iyt-2x;
	Wed, 23 Jul 2025 04:40:36 +0000
Date: Wed, 23 Jul 2025 12:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 08/13] bpf: Implement signature verification for BPF
 programs
Message-ID: <202507231202.8rYZJ8D1-lkp@intel.com>
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
In-Reply-To: <20250721211958.1881379-9-kpsingh@kernel.org>
References: <20250721211958.1881379-9-kpsingh@kernel.org>
TO: KP Singh <kpsingh@kernel.org>
TO: bpf@vger.kernel.org
TO: linux-security-module@vger.kernel.org
CC: bboscaccy@linux.microsoft.com
CC: paul@paul-moore.com
CC: kys@microsoft.com
CC: ast@kernel.org
CC: daniel@iogearbox.net
CC: andrii@kernel.org
CC: KP Singh <kpsingh@kernel.org>

Hi KP,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]
[cannot apply to bpf-next/net bpf/master herbert-cryptodev-2.6/master linus/master v6.16-rc7 next-20250723]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/KP-Singh/bpf-Update-the-bpf_prog_calc_tag-to-use-SHA256/20250722-052316
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250721211958.1881379-9-kpsingh%40kernel.org
patch subject: [PATCH v2 08/13] bpf: Implement signature verification for BPF programs
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: m68k-randconfig-r073-20250723 (https://download.01.org/0day-ci/archive/20250723/202507231202.8rYZJ8D1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507231202.8rYZJ8D1-lkp@intel.com/

smatch warnings:
kernel/bpf/syscall.c:2797 bpf_prog_verify_signature() warn: 'sig' is an error pointer or valid

vim +/sig +2797 kernel/bpf/syscall.c

2c78ee898d8f10 Alexei Starovoitov 2020-05-13  2781  
c83b0ba795b625 KP Singh           2025-07-21  2782  static noinline int bpf_prog_verify_signature(struct bpf_prog *prog,
c83b0ba795b625 KP Singh           2025-07-21  2783  					      union bpf_attr *attr,
c83b0ba795b625 KP Singh           2025-07-21  2784  					      bool is_kernel)
c83b0ba795b625 KP Singh           2025-07-21  2785  {
c83b0ba795b625 KP Singh           2025-07-21  2786  	bpfptr_t usig = make_bpfptr(attr->signature, is_kernel);
c83b0ba795b625 KP Singh           2025-07-21  2787  	struct bpf_dynptr_kern sig_ptr, insns_ptr;
c83b0ba795b625 KP Singh           2025-07-21  2788  	struct bpf_key *key = NULL;
c83b0ba795b625 KP Singh           2025-07-21  2789  	void *sig;
c83b0ba795b625 KP Singh           2025-07-21  2790  	int err = 0;
c83b0ba795b625 KP Singh           2025-07-21  2791  
c83b0ba795b625 KP Singh           2025-07-21  2792  	key = bpf_lookup_user_key(attr->keyring_id, 0);
c83b0ba795b625 KP Singh           2025-07-21  2793  	if (!key)
c83b0ba795b625 KP Singh           2025-07-21  2794  		return -ENOKEY;
c83b0ba795b625 KP Singh           2025-07-21  2795  
c83b0ba795b625 KP Singh           2025-07-21  2796  	sig = kvmemdup_bpfptr(usig, attr->signature_size);
c83b0ba795b625 KP Singh           2025-07-21 @2797  	if (!sig) {
c83b0ba795b625 KP Singh           2025-07-21  2798  		bpf_key_put(key);
c83b0ba795b625 KP Singh           2025-07-21  2799  		return -ENOMEM;
c83b0ba795b625 KP Singh           2025-07-21  2800  	}
c83b0ba795b625 KP Singh           2025-07-21  2801  
c83b0ba795b625 KP Singh           2025-07-21  2802  	bpf_dynptr_init(&sig_ptr, sig, BPF_DYNPTR_TYPE_LOCAL, 0,
c83b0ba795b625 KP Singh           2025-07-21  2803  			attr->signature_size);
c83b0ba795b625 KP Singh           2025-07-21  2804  	bpf_dynptr_init(&insns_ptr, prog->insnsi, BPF_DYNPTR_TYPE_LOCAL, 0,
c83b0ba795b625 KP Singh           2025-07-21  2805  			prog->len * sizeof(struct bpf_insn));
c83b0ba795b625 KP Singh           2025-07-21  2806  
c83b0ba795b625 KP Singh           2025-07-21  2807  	err = bpf_verify_pkcs7_signature((struct bpf_dynptr *)&insns_ptr,
c83b0ba795b625 KP Singh           2025-07-21  2808  					 (struct bpf_dynptr *)&sig_ptr, key);
c83b0ba795b625 KP Singh           2025-07-21  2809  
c83b0ba795b625 KP Singh           2025-07-21  2810  	bpf_key_put(key);
c83b0ba795b625 KP Singh           2025-07-21  2811  	kvfree(sig);
c83b0ba795b625 KP Singh           2025-07-21  2812  	return err;
c83b0ba795b625 KP Singh           2025-07-21  2813  }
c83b0ba795b625 KP Singh           2025-07-21  2814  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
