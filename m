Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D304AEE9
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Sep 2024 15:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726154048; cv=none; b=bJsOpXiBJuKDV618b8s5DfK69TeLb05OYme744r0Y551nG58QxCRu5EjaCopbrHTLEuiTkRt6mAz+uL1/VLv36v78cx7bvf3tx7g1P478EKrDRDad/LjcECuFo2q/HFuju3GoPVJsa/XbmV7wwX1iR5bGlbxBnZeE3hi8MVycfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726154048; c=relaxed/simple;
	bh=e6dDKGvRBhsDmvYSa1eiMkgaw1LNEw4Lo6Opg/vpWno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JbL/tpCWJePs/xiEM+nQ9oJb/ooIGS8uDC5KwmBqVLDGOmuVjbM3PcKfpldNngBLECmFDVuw7Vc1STntQNGrbyD5EaabXdF0NiO0b8548vPiCn8W40y3TmHeBnzPq/I8QSu1edcJ/YjF6kKcC3Z8IL+su/gTyaF6PgliI/nw0Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPqEvk6C; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPqEvk6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726154046; x=1757690046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e6dDKGvRBhsDmvYSa1eiMkgaw1LNEw4Lo6Opg/vpWno=;
  b=dPqEvk6CtOP344VnbmtJIpc0Q5ljqA31W3PpnkFFADBd+JMhAI14AMY2
   ZJ+CNwqdY75Z+CYB4d2I8dVw5L+NNKOzgY4qt8Ieku2AQC+nxtxsbZS1z
   HD5aL6av0aebunUIeOURTzidKYeYMLI7W3Ot9oZuT7WW5w9FDWRI8FsqD
   5wHjeeCEoftIApcFieGXfHWB2uf12NVRCwc36uxidraIgs+tPjNAhxVJH
   E3Lkd3FrODFoJtdT0Szn1pueFItappnp3zf0alQHbsbhLG/t01D2opPoa
   sMHRl9UoBIr/1Rn3GTmze117VP2Pw+PY+9uUKrGa9Ac2khVv6KerXSKDE
   w==;
X-CSE-ConnectionGUID: VUxF4TkoQginnxZ/IUEgfA==
X-CSE-MsgGUID: /dKIL/QxQlivQnAPdbsX0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="36399206"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="36399206"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 08:14:06 -0700
X-CSE-ConnectionGUID: KVhP7pMYRw2CjQbNQRgMbg==
X-CSE-MsgGUID: vMHrLXVGQimsefMBe22bpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="67686003"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Sep 2024 08:14:05 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1solWE-0005KE-12;
	Thu, 12 Sep 2024 15:14:02 +0000
Date: Thu, 12 Sep 2024 23:13:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 4/5] mm/slub: Improve redzone check and zeroing for
 krealloc()
Message-ID: <202409122122.U5RpHfCY-lkp@intel.com>
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
In-Reply-To: <20240911064535.557650-5-feng.tang@intel.com>
References: <20240911064535.557650-5-feng.tang@intel.com>
TO: Feng Tang <feng.tang@intel.com>

Hi Feng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240910]
[cannot apply to akpm-mm/mm-everything vbabka-slab/for-next vbabka/slab-next v6.11-rc7 v6.11-rc6 v6.11-rc5 linus/master v6.11-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Feng-Tang/mm-kasan-Don-t-store-metadata-inside-kmalloc-object-when-slub_debug_orig_size-is-on/20240911-144724
base:   next-20240910
patch link:    https://lore.kernel.org/r/20240911064535.557650-5-feng.tang%40intel.com
patch subject: [PATCH v2 4/5] mm/slub: Improve redzone check and zeroing for krealloc()
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-141-20240912 (https://download.01.org/0day-ci/archive/20240912/202409122122.U5RpHfCY-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409122122.U5RpHfCY-lkp@intel.com/

smatch warnings:
mm/slub.c:4748 __do_krealloc() error: uninitialized symbol 's'.

vim +/s +4748 mm/slub.c

b774d3e326d30f Vlastimil Babka 2023-10-03  4714  
474fff8e68012d Feng Tang       2024-09-11  4715  static __always_inline __realloc_size(2) void *
474fff8e68012d Feng Tang       2024-09-11  4716  __do_krealloc(const void *p, size_t new_size, gfp_t flags)
474fff8e68012d Feng Tang       2024-09-11  4717  {
474fff8e68012d Feng Tang       2024-09-11  4718  	void *ret;
474fff8e68012d Feng Tang       2024-09-11  4719  	size_t ks;
89a7731cc91033 Feng Tang       2024-09-11  4720  	int orig_size = 0;
89a7731cc91033 Feng Tang       2024-09-11  4721  	struct kmem_cache *s;
474fff8e68012d Feng Tang       2024-09-11  4722  
89a7731cc91033 Feng Tang       2024-09-11  4723  	/* Check for double-free. */
474fff8e68012d Feng Tang       2024-09-11  4724  	if (likely(!ZERO_OR_NULL_PTR(p))) {
474fff8e68012d Feng Tang       2024-09-11  4725  		if (!kasan_check_byte(p))
474fff8e68012d Feng Tang       2024-09-11  4726  			return NULL;
89a7731cc91033 Feng Tang       2024-09-11  4727  
89a7731cc91033 Feng Tang       2024-09-11  4728  		s = virt_to_cache(p);
89a7731cc91033 Feng Tang       2024-09-11  4729  		orig_size = get_orig_size(s, (void *)p);
89a7731cc91033 Feng Tang       2024-09-11  4730  		ks = s->object_size;
474fff8e68012d Feng Tang       2024-09-11  4731  	} else
474fff8e68012d Feng Tang       2024-09-11  4732  		ks = 0;
474fff8e68012d Feng Tang       2024-09-11  4733  
89a7731cc91033 Feng Tang       2024-09-11  4734  	/* If the object doesn't fit, allocate a bigger one */
89a7731cc91033 Feng Tang       2024-09-11  4735  	if (new_size > ks)
89a7731cc91033 Feng Tang       2024-09-11  4736  		goto alloc_new;
89a7731cc91033 Feng Tang       2024-09-11  4737  
474fff8e68012d Feng Tang       2024-09-11  4738  	/* Zero out spare memory. */
474fff8e68012d Feng Tang       2024-09-11  4739  	if (want_init_on_alloc(flags)) {
474fff8e68012d Feng Tang       2024-09-11  4740  		kasan_disable_current();
89a7731cc91033 Feng Tang       2024-09-11  4741  		if (orig_size < new_size)
89a7731cc91033 Feng Tang       2024-09-11  4742  			memset((void *)p + orig_size, 0, new_size - orig_size);
89a7731cc91033 Feng Tang       2024-09-11  4743  		else
474fff8e68012d Feng Tang       2024-09-11  4744  			memset((void *)p + new_size, 0, ks - new_size);
474fff8e68012d Feng Tang       2024-09-11  4745  		kasan_enable_current();
474fff8e68012d Feng Tang       2024-09-11  4746  	}
474fff8e68012d Feng Tang       2024-09-11  4747  
89a7731cc91033 Feng Tang       2024-09-11 @4748  	if (slub_debug_orig_size(s) && !is_kfence_address(p)) {
89a7731cc91033 Feng Tang       2024-09-11  4749  		set_orig_size(s, (void *)p, new_size);
89a7731cc91033 Feng Tang       2024-09-11  4750  		if (s->flags & SLAB_RED_ZONE && new_size < ks)
89a7731cc91033 Feng Tang       2024-09-11  4751  			memset_no_sanitize_memory((void *)p + new_size,
89a7731cc91033 Feng Tang       2024-09-11  4752  						SLUB_RED_ACTIVE, ks - new_size);
89a7731cc91033 Feng Tang       2024-09-11  4753  	}
89a7731cc91033 Feng Tang       2024-09-11  4754  
474fff8e68012d Feng Tang       2024-09-11  4755  	p = kasan_krealloc((void *)p, new_size, flags);
474fff8e68012d Feng Tang       2024-09-11  4756  	return (void *)p;
474fff8e68012d Feng Tang       2024-09-11  4757  
89a7731cc91033 Feng Tang       2024-09-11  4758  alloc_new:
474fff8e68012d Feng Tang       2024-09-11  4759  	ret = kmalloc_node_track_caller_noprof(new_size, flags, NUMA_NO_NODE, _RET_IP_);
474fff8e68012d Feng Tang       2024-09-11  4760  	if (ret && p) {
474fff8e68012d Feng Tang       2024-09-11  4761  		/* Disable KASAN checks as the object's redzone is accessed. */
474fff8e68012d Feng Tang       2024-09-11  4762  		kasan_disable_current();
89a7731cc91033 Feng Tang       2024-09-11  4763  		if (orig_size)
89a7731cc91033 Feng Tang       2024-09-11  4764  			memcpy(ret, kasan_reset_tag(p), orig_size);
474fff8e68012d Feng Tang       2024-09-11  4765  		kasan_enable_current();
474fff8e68012d Feng Tang       2024-09-11  4766  	}
474fff8e68012d Feng Tang       2024-09-11  4767  
474fff8e68012d Feng Tang       2024-09-11  4768  	return ret;
474fff8e68012d Feng Tang       2024-09-11  4769  }
474fff8e68012d Feng Tang       2024-09-11  4770  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
