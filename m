Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F44143C56
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Jun 2024 10:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718275494; cv=none; b=f6F5w0ThAMz9CrVg9apiL1rrA4PyHtx0ASuDwfzLLNxoNcHtPo4P4u4WXlK0XiORG8RroAZj7xWZHO3tTfTOXlVU1SJk34glEhAODcPBNjXEGAWINfH4TJUm0TOYWA8yqEA8mmJg+hqAgrS3kYKGz2fFa4KIF/g90K9yVtqS3eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718275494; c=relaxed/simple;
	bh=uY3u5naO04NU795QZ+MI4YovEE8lOQbawEawIwYIlF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=onO8kk6Sd194LSxt3q5HEYSvNTdXvdHgqGl5RYcmswVKTM9m4bXar3jlg24x1gK8vrSgQID6IDim7SwU4QH0qdFIirf+USeuyT/eArKyZx/t7s45Ba0EF6AJlMy9yCI6UiVJT+p7Vm1fDfYzjFJ9ZiyRkv1/3fqzT2kPc7iPw6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KqW2qaGV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KqW2qaGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718275493; x=1749811493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uY3u5naO04NU795QZ+MI4YovEE8lOQbawEawIwYIlF0=;
  b=KqW2qaGVqXbNXVwOy/sAsXUiDtb9BU9hHKKoHDAmuoIzqqGasB3arqdl
   cWdcfGxmLTVL/qXm4S2Ooz92gIDb1URMwQaNoVa2xBC3M6XVG88+sC02e
   ynchRifO0HlOQck4tzEGYYYVWutJlruCtPjJ4abI8u6eXZHhaLeBBqhIu
   B2idxOfdb1/K6rc3pPgqfsJRrkvoXF6Lzw0EaI05VcdyOaqnAK36Zdn8x
   iV/eD07pVoVxuEktryyatoRRMd2XrydpgMFiPOsOq1chi8zWuyzm5v9nU
   dHqrY7xF4ysX0dzgTGDZhoC/m3mXU2c4WWId8OFQWXsuhTQEV3YiA7tJ+
   w==;
X-CSE-ConnectionGUID: typkzGOrQIyYFGiczOm1vA==
X-CSE-MsgGUID: uMTYsEq4RNGHF3pgJctSjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18013218"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="18013218"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 03:44:52 -0700
X-CSE-ConnectionGUID: 8aVGuikqQwSkw40/la0ZMg==
X-CSE-MsgGUID: WZlNUTSaRdiXYF0LlsaU1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40217821"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Jun 2024 03:44:50 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHhwm-0002VC-17;
	Thu, 13 Jun 2024 10:44:48 +0000
Date: Thu, 13 Jun 2024 18:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH bpf-next v5 12/12] bpftool: Support dumping kfunc
 prototypes from BTF
Message-ID: <202406131810.c1B8hTm8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <bf6c08f9263c4bd9d10a717de95199d766a13f61.1718207789.git.dxu@dxuuu.xyz>
References: <bf6c08f9263c4bd9d10a717de95199d766a13f61.1718207789.git.dxu@dxuuu.xyz>
TO: Daniel Xu <dxu@dxuuu.xyz>

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Xu/kbuild-bpf-Tell-pahole-to-DECL_TAG-kfuncs/20240613-000536
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/bf6c08f9263c4bd9d10a717de95199d766a13f61.1718207789.git.dxu%40dxuuu.xyz
patch subject: [PATCH bpf-next v5 12/12] bpftool: Support dumping kfunc prototypes from BTF
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131810.c1B8hTm8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406131810.c1B8hTm8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from progs/arena_htab.c:15:
   In file included from tools/testing/selftests/bpf/bpf_arena_htab.h:5:
   In file included from tools/testing/selftests/bpf/bpf_arena_alloc.h:4:
>> tools/testing/selftests/bpf/bpf_arena_common.h:45:15: error: conflicting types for 'bpf_arena_alloc_pages'
      45 | void __arena* bpf_arena_alloc_pages(void *map, void __arena *addr, __u32 page_cnt,
         |               ^
   /tools/include/vmlinux.h:143359:14: note: previous declaration is here
    143359 | extern void *bpf_arena_alloc_pages(void *p__map, void *addr__ign, u32 page_cnt, int node_id, u64 flags) __weak __ksym;
           |              ^
   In file included from progs/arena_htab.c:15:
   In file included from tools/testing/selftests/bpf/bpf_arena_htab.h:5:
   In file included from tools/testing/selftests/bpf/bpf_arena_alloc.h:4:
>> tools/testing/selftests/bpf/bpf_arena_common.h:47:6: error: conflicting types for 'bpf_arena_free_pages'
      47 | void bpf_arena_free_pages(void *map, void __arena *ptr, __u32 page_cnt) __ksym __weak;
         |      ^
   /tools/include/vmlinux.h:143360:13: note: previous declaration is here
    143360 | extern void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 page_cnt) __weak __ksym;
           |             ^
   In file included from progs/arena_htab.c:15:
   In file included from tools/testing/selftests/bpf/bpf_arena_htab.h:5:
>> tools/testing/selftests/bpf/bpf_arena_alloc.h:33:8: error: assigning 'void *' to '__arena void *' changes address space of pointer
      33 |                 page = bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_arena_alloc.h:62:32: error: passing '__arena void *' to parameter of type 'void *' changes address space of pointer
      62 |                 bpf_arena_free_pages(&arena, addr, 1);
         |                                              ^~~~
   /tools/include/vmlinux.h:143360:54: note: passing argument to parameter 'ptr__ign' here
    143360 | extern void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 page_cnt) __weak __ksym;
           |                                                      ^
   In file included from progs/arena_htab.c:15:
>> tools/testing/selftests/bpf/bpf_arena_htab.h:95:16: error: initializing '__arena void *' with an expression of type 'void *' changes address space of pointer
      95 |         void __arena *buckets = bpf_arena_alloc_pages(&arena, NULL, 2, NUMA_NO_NODE, 0);
         |                       ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 errors generated.
--
   In file included from progs/arena_list.c:20:
   In file included from tools/testing/selftests/bpf/bpf_arena_alloc.h:4:
>> tools/testing/selftests/bpf/bpf_arena_common.h:45:15: error: conflicting types for 'bpf_arena_alloc_pages'
      45 | void __arena* bpf_arena_alloc_pages(void *map, void __arena *addr, __u32 page_cnt,
         |               ^
   /tools/include/vmlinux.h:143359:14: note: previous declaration is here
    143359 | extern void *bpf_arena_alloc_pages(void *p__map, void *addr__ign, u32 page_cnt, int node_id, u64 flags) __weak __ksym;
           |              ^
   In file included from progs/arena_list.c:20:
   In file included from tools/testing/selftests/bpf/bpf_arena_alloc.h:4:
>> tools/testing/selftests/bpf/bpf_arena_common.h:47:6: error: conflicting types for 'bpf_arena_free_pages'
      47 | void bpf_arena_free_pages(void *map, void __arena *ptr, __u32 page_cnt) __ksym __weak;
         |      ^
   /tools/include/vmlinux.h:143360:13: note: previous declaration is here
    143360 | extern void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 page_cnt) __weak __ksym;
           |             ^
   In file included from progs/arena_list.c:20:
>> tools/testing/selftests/bpf/bpf_arena_alloc.h:33:8: error: assigning 'void *' to '__arena void *' changes address space of pointer
      33 |                 page = bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_arena_alloc.h:62:32: error: passing '__arena void *' to parameter of type 'void *' changes address space of pointer
      62 |                 bpf_arena_free_pages(&arena, addr, 1);
         |                                              ^~~~
   /tools/include/vmlinux.h:143360:54: note: passing argument to parameter 'ptr__ign' here
    143360 | extern void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 page_cnt) __weak __ksym;
           |                                                      ^
   4 errors generated.
--
   In file included from progs/verifier_arena.c:9:
>> tools/testing/selftests/bpf/bpf_arena_common.h:45:15: error: conflicting types for 'bpf_arena_alloc_pages'
      45 | void __arena* bpf_arena_alloc_pages(void *map, void __arena *addr, __u32 page_cnt,
         |               ^
   /tools/include/vmlinux.h:143359:14: note: previous declaration is here
    143359 | extern void *bpf_arena_alloc_pages(void *p__map, void *addr__ign, u32 page_cnt, int node_id, u64 flags) __weak __ksym;
           |              ^
   In file included from progs/verifier_arena.c:9:
>> tools/testing/selftests/bpf/bpf_arena_common.h:47:6: error: conflicting types for 'bpf_arena_free_pages'
      47 | void bpf_arena_free_pages(void *map, void __arena *ptr, __u32 page_cnt) __ksym __weak;
         |      ^
   /tools/include/vmlinux.h:143360:13: note: previous declaration is here
    143360 | extern void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 page_cnt) __weak __ksym;
           |             ^
>> progs/verifier_arena.c:29:8: error: assigning 'void *' to '__arena int volatile *' changes address space of pointer
      29 |         page1 = bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   progs/verifier_arena.c:33:8: error: assigning 'void *' to '__arena int volatile *' changes address space of pointer
      33 |         page2 = bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   progs/verifier_arena.c:37:10: error: assigning 'void *' to '__arena int volatile *' changes address space of pointer
      37 |         no_page = bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> progs/verifier_arena.c:44:31: error: passing '__arena void *' to parameter of type 'void *' changes address space of pointer
      44 |         bpf_arena_free_pages(&arena, (void __arena *)page2, 1);
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   /tools/include/vmlinux.h:143360:54: note: passing argument to parameter 'ptr__ign' here
    143360 | extern void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 page_cnt) __weak __ksym;
           |                                                      ^
   progs/verifier_arena.c:49:8: error: assigning 'void *' to '__arena int volatile *' changes address space of pointer
      49 |         page3 = bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> progs/verifier_arena.c:68:8: error: assigning 'void *' to '__arena char volatile *' changes address space of pointer
      68 |         page1 = bpf_arena_alloc_pages(&arena, NULL, 2, NUMA_NO_NODE, 0);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   progs/verifier_arena.c:86:31: error: passing '__arena void *' to parameter of type 'void *' changes address space of pointer
      86 |         bpf_arena_free_pages(&arena, (void __arena *)page1, 2);
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   /tools/include/vmlinux.h:143360:54: note: passing argument to parameter 'ptr__ign' here
    143360 | extern void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 page_cnt) __weak __ksym;
           |                                                      ^
   progs/verifier_arena.c:110:8: error: assigning 'void *' to '__arena char volatile *' changes address space of pointer
     110 |         pages = bpf_arena_alloc_pages(&ar->map, NULL, ar->map.max_entries, NUMA_NO_NODE, 0);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   10 errors generated.
--
   In file included from progs/verifier_arena_large.c:9:
>> tools/testing/selftests/bpf/bpf_arena_common.h:45:15: error: conflicting types for 'bpf_arena_alloc_pages'
      45 | void __arena* bpf_arena_alloc_pages(void *map, void __arena *addr, __u32 page_cnt,
         |               ^
   /tools/include/vmlinux.h:143359:14: note: previous declaration is here
    143359 | extern void *bpf_arena_alloc_pages(void *p__map, void *addr__ign, u32 page_cnt, int node_id, u64 flags) __weak __ksym;
           |              ^
   In file included from progs/verifier_arena_large.c:9:
>> tools/testing/selftests/bpf/bpf_arena_common.h:47:6: error: conflicting types for 'bpf_arena_free_pages'
      47 | void bpf_arena_free_pages(void *map, void __arena *ptr, __u32 page_cnt) __ksym __weak;
         |      ^
   /tools/include/vmlinux.h:143360:13: note: previous declaration is here
    143360 | extern void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 page_cnt) __weak __ksym;
           |             ^
>> progs/verifier_arena_large.c:27:15: error: assigning 'void *' to '__arena void *' changes address space of pointer
      27 |         page1 = base = bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> progs/verifier_arena_large.c:31:40: error: passing '__arena void *' to parameter of type 'void *' changes address space of pointer
      31 |         page2 = bpf_arena_alloc_pages(&arena, base + ARENA_SIZE - PAGE_SIZE,
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   /tools/include/vmlinux.h:143359:56: note: passing argument to parameter 'addr__ign' here
    143359 | extern void *bpf_arena_alloc_pages(void *p__map, void *addr__ign, u32 page_cnt, int node_id, u64 flags) __weak __ksym;
           |                                                        ^
   progs/verifier_arena_large.c:36:42: error: passing '__arena void *' to parameter of type 'void *' changes address space of pointer
      36 |         no_page = bpf_arena_alloc_pages(&arena, base + ARENA_SIZE,
         |                                                 ^~~~~~~~~~~~~~~~~
   /tools/include/vmlinux.h:143359:56: note: passing argument to parameter 'addr__ign' here
    143359 | extern void *bpf_arena_alloc_pages(void *p__map, void *addr__ign, u32 page_cnt, int node_id, u64 flags) __weak __ksym;
           |                                                        ^
   progs/verifier_arena_large.c:44:31: error: passing '__arena void *' to parameter of type 'void *' changes address space of pointer
      44 |         bpf_arena_free_pages(&arena, (void __arena *)page1, 1);
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   /tools/include/vmlinux.h:143360:54: note: passing argument to parameter 'ptr__ign' here
    143360 | extern void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 page_cnt) __weak __ksym;
           |                                                      ^
>> progs/verifier_arena_large.c:49:8: error: assigning 'void *' to '__arena char volatile *' changes address space of pointer
      49 |         page3 = bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 errors generated.


vim +/bpf_arena_alloc_pages +45 tools/testing/selftests/bpf/bpf_arena_common.h

80a4129fcf20da3 Alexei Starovoitov 2024-03-07  44  
80a4129fcf20da3 Alexei Starovoitov 2024-03-07 @45  void __arena* bpf_arena_alloc_pages(void *map, void __arena *addr, __u32 page_cnt,
80a4129fcf20da3 Alexei Starovoitov 2024-03-07  46  				    int node_id, __u64 flags) __ksym __weak;
80a4129fcf20da3 Alexei Starovoitov 2024-03-07 @47  void bpf_arena_free_pages(void *map, void __arena *ptr, __u32 page_cnt) __ksym __weak;
80a4129fcf20da3 Alexei Starovoitov 2024-03-07  48  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
