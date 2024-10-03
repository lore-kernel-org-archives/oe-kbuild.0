Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08B584E0D
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Oct 2024 10:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727949746; cv=none; b=cLjbO/5Aap0Ti4pavxAAB/EG0970ab8PX8co3icmwlnFsnzwEsGG/s6jQx+S5bmZ239OImIitAmcDgx3+95qaypkyp1Dyb/C5xADQAi1crIjsGvG/pTsyj3F2e61967i6OGPNrD0jXTDq4gXyCE6asCEj6o0Lc0bhB8wVAkgCWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727949746; c=relaxed/simple;
	bh=XK22TcimA9NdX8QXiiQzHQ5GyDOB8PIauU4JvY9x+UY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EJAp7WIzDRpAfj187+v+gjto8fAGgyTHfv87PTlQ0d3jaG5hHag12W3w/LWMx50omDb12nPDl/sSkVsI/twJOTiv+hx8C/r2bYDAMkQFLwEW9Wgq4ZQnfRT8Pvv6LKSDQhGEogSEJiznlJuXpaGgF6NwsJuo7hG7V8hyf3U6Y2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOUw/hu9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOUw/hu9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727949745; x=1759485745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XK22TcimA9NdX8QXiiQzHQ5GyDOB8PIauU4JvY9x+UY=;
  b=aOUw/hu9Q2qxgMW6GqyNUZu/VzB6cQ37B4T9yW5spxotJ0/Ksu/oW5Yl
   G1g4Q9Bvuby0hXpB1cjS6l8U6bJIZ//bJJ55xdO3S4iY0HA+AHd4niw3O
   2wOk87XCDhPVrNUkyPyMRdxZSrjxyy8jgbHHmPmDvdVSwcv22nO3lalo2
   1+AnCW2JVouY/UmFWhyLfpfu15s7aVgUwbzl13A/WqazMGaxp5pvLiJVC
   7PBXnnpBzyn8S/KPowLuFx318eKzbaaw9e6tHucrwm+pJFxXrLszn0OrG
   ZvqX7tjX9G6JesY+91qMVSTSjqGtEbr1dOhFqVb57lV54vCzSMixmYkk5
   g==;
X-CSE-ConnectionGUID: Eiv14wwaR8et2J7vLTdXjw==
X-CSE-MsgGUID: XHbiiivdTJm93V2vQIfzoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="49660950"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="49660950"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 03:02:25 -0700
X-CSE-ConnectionGUID: TPNezt3jRs2OEb+B0QwO9w==
X-CSE-MsgGUID: zeb9LJKuSrGhIlotLJjCzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74406352"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Oct 2024 03:02:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swIf7-0000GO-0G;
	Thu, 03 Oct 2024 10:02:21 +0000
Date: Thu, 3 Oct 2024 18:01:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1897/2170] mm/slub.c:4748 __do_krealloc() error:
 uninitialized symbol 's'.
Message-ID: <202410031740.baMIOckQ-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Feng Tang <feng.tang@intel.com>
CC: Vlastimil Babka <vbabka@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c02d24a5af66a9806922391493205a344749f2c4
commit: d0a38fad51cc70ab3dd3c59b54d8079ac19220b9 [1897/2170] mm/slub: Improve redzone check and zeroing for krealloc()
:::::: branch date: 6 hours ago
:::::: commit date: 23 hours ago
config: i386-randconfig-141-20241003 (https://download.01.org/0day-ci/archive/20241003/202410031740.baMIOckQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410031740.baMIOckQ-lkp@intel.com/

smatch warnings:
mm/slub.c:4748 __do_krealloc() error: uninitialized symbol 's'.

vim +/s +4748 mm/slub.c

b774d3e326d30f Vlastimil Babka 2023-10-03  4714  
f97ac9f57ebbe7 Feng Tang       2024-09-11  4715  static __always_inline __realloc_size(2) void *
f97ac9f57ebbe7 Feng Tang       2024-09-11  4716  __do_krealloc(const void *p, size_t new_size, gfp_t flags)
f97ac9f57ebbe7 Feng Tang       2024-09-11  4717  {
f97ac9f57ebbe7 Feng Tang       2024-09-11  4718  	void *ret;
f97ac9f57ebbe7 Feng Tang       2024-09-11  4719  	size_t ks;
d0a38fad51cc70 Feng Tang       2024-09-11  4720  	int orig_size = 0;
d0a38fad51cc70 Feng Tang       2024-09-11  4721  	struct kmem_cache *s;
f97ac9f57ebbe7 Feng Tang       2024-09-11  4722  
d0a38fad51cc70 Feng Tang       2024-09-11  4723  	/* Check for double-free. */
f97ac9f57ebbe7 Feng Tang       2024-09-11  4724  	if (likely(!ZERO_OR_NULL_PTR(p))) {
f97ac9f57ebbe7 Feng Tang       2024-09-11  4725  		if (!kasan_check_byte(p))
f97ac9f57ebbe7 Feng Tang       2024-09-11  4726  			return NULL;
d0a38fad51cc70 Feng Tang       2024-09-11  4727  
d0a38fad51cc70 Feng Tang       2024-09-11  4728  		s = virt_to_cache(p);
d0a38fad51cc70 Feng Tang       2024-09-11  4729  		orig_size = get_orig_size(s, (void *)p);
d0a38fad51cc70 Feng Tang       2024-09-11  4730  		ks = s->object_size;
f97ac9f57ebbe7 Feng Tang       2024-09-11  4731  	} else
f97ac9f57ebbe7 Feng Tang       2024-09-11  4732  		ks = 0;
f97ac9f57ebbe7 Feng Tang       2024-09-11  4733  
d0a38fad51cc70 Feng Tang       2024-09-11  4734  	/* If the object doesn't fit, allocate a bigger one */
d0a38fad51cc70 Feng Tang       2024-09-11  4735  	if (new_size > ks)
d0a38fad51cc70 Feng Tang       2024-09-11  4736  		goto alloc_new;
d0a38fad51cc70 Feng Tang       2024-09-11  4737  
f97ac9f57ebbe7 Feng Tang       2024-09-11  4738  	/* Zero out spare memory. */
f97ac9f57ebbe7 Feng Tang       2024-09-11  4739  	if (want_init_on_alloc(flags)) {
f97ac9f57ebbe7 Feng Tang       2024-09-11  4740  		kasan_disable_current();
d0a38fad51cc70 Feng Tang       2024-09-11  4741  		if (orig_size < new_size)
d0a38fad51cc70 Feng Tang       2024-09-11  4742  			memset((void *)p + orig_size, 0, new_size - orig_size);
d0a38fad51cc70 Feng Tang       2024-09-11  4743  		else
f97ac9f57ebbe7 Feng Tang       2024-09-11  4744  			memset((void *)p + new_size, 0, ks - new_size);
f97ac9f57ebbe7 Feng Tang       2024-09-11  4745  		kasan_enable_current();
f97ac9f57ebbe7 Feng Tang       2024-09-11  4746  	}
f97ac9f57ebbe7 Feng Tang       2024-09-11  4747  
d0a38fad51cc70 Feng Tang       2024-09-11 @4748  	if (slub_debug_orig_size(s) && !is_kfence_address(p)) {
d0a38fad51cc70 Feng Tang       2024-09-11  4749  		set_orig_size(s, (void *)p, new_size);
d0a38fad51cc70 Feng Tang       2024-09-11  4750  		if (s->flags & SLAB_RED_ZONE && new_size < ks)
d0a38fad51cc70 Feng Tang       2024-09-11  4751  			memset_no_sanitize_memory((void *)p + new_size,
d0a38fad51cc70 Feng Tang       2024-09-11  4752  						SLUB_RED_ACTIVE, ks - new_size);
d0a38fad51cc70 Feng Tang       2024-09-11  4753  	}
d0a38fad51cc70 Feng Tang       2024-09-11  4754  
f97ac9f57ebbe7 Feng Tang       2024-09-11  4755  	p = kasan_krealloc((void *)p, new_size, flags);
f97ac9f57ebbe7 Feng Tang       2024-09-11  4756  	return (void *)p;
f97ac9f57ebbe7 Feng Tang       2024-09-11  4757  
d0a38fad51cc70 Feng Tang       2024-09-11  4758  alloc_new:
f97ac9f57ebbe7 Feng Tang       2024-09-11  4759  	ret = kmalloc_node_track_caller_noprof(new_size, flags, NUMA_NO_NODE, _RET_IP_);
f97ac9f57ebbe7 Feng Tang       2024-09-11  4760  	if (ret && p) {
f97ac9f57ebbe7 Feng Tang       2024-09-11  4761  		/* Disable KASAN checks as the object's redzone is accessed. */
f97ac9f57ebbe7 Feng Tang       2024-09-11  4762  		kasan_disable_current();
d0a38fad51cc70 Feng Tang       2024-09-11  4763  		if (orig_size)
d0a38fad51cc70 Feng Tang       2024-09-11  4764  			memcpy(ret, kasan_reset_tag(p), orig_size);
f97ac9f57ebbe7 Feng Tang       2024-09-11  4765  		kasan_enable_current();
f97ac9f57ebbe7 Feng Tang       2024-09-11  4766  	}
f97ac9f57ebbe7 Feng Tang       2024-09-11  4767  
f97ac9f57ebbe7 Feng Tang       2024-09-11  4768  	return ret;
f97ac9f57ebbe7 Feng Tang       2024-09-11  4769  }
f97ac9f57ebbe7 Feng Tang       2024-09-11  4770  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
