Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BC933F8B7
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763544868; cv=none; b=NrV12KJOfimgX0lr2pLAzbhKxq4uV/MgLWQmaCLK5NcuWk17WFyGHE0cJDfCgDEGZdCRU1Wb6heAyaeB2k+1sOAfxvE/fy6KsAHL5BXg9Ldl38K9SKWQcKFiTjUJ7v85XuFDPXTqLhrJWH5C3FD7RWsapu/L2KD5Ph+MDRpi2Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763544868; c=relaxed/simple;
	bh=Vnq9hWMrdCHM5UazCUUcEYJ1dP0iADpqPNI+31HJr9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=idZKFwtuxGlHnM7cs/HtkbpkhEYG1qd3+VthPtt3kQcOs6pQio7MVJc8u+MN6hIlVUIb7iC+3guK41bcR5sRy8MyBHxixNVw04V73QbaZmbCCUd7Yv8nF1R41gpPr6V5WEwbefbf3JuoSonngubnBFke6puA2kjKWv449vi99C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXZJwtUr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXZJwtUr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763544867; x=1795080867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vnq9hWMrdCHM5UazCUUcEYJ1dP0iADpqPNI+31HJr9g=;
  b=gXZJwtUrIIVC81eTn7wduv+WDKYpw+sga1CFhmYhPZTvfZl9GZOcU7Dw
   5C6QchJmDupjJNdcxEJ3wFui/8gVXOp6HWgM4dFKurHI0KaUxmAWohprB
   /Q+utj2LZTbo1YpzTBB2z1NIAtq0xT4yxGWsTuSiiqI4BUHB2Pbg8gGSC
   KHqA+U7WEY1zWRxFNYymegJ/yLgkOWVjdCslBNFiON8VXuLU3UcA2vBpk
   9Zp2OW9xAOicl/lTa11aZoCEVbbR9QGuRFDSVF2A4stuvxJGUPtX7LaMh
   vsOCmAXLJEIpo0TTjyhtStDmJsnOXQct1GEjrb+5f4iTvYgswL8bQyK2C
   Q==;
X-CSE-ConnectionGUID: HqMAaUilTVeBUbQhj+Kk5w==
X-CSE-MsgGUID: Yj1TmjB6TNWR5BBM12eaHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="77038019"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="77038019"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 01:34:26 -0800
X-CSE-ConnectionGUID: TaWOmzpITO2rKSpkWkg/HA==
X-CSE-MsgGUID: Tk0CURpNQrCLLWPd9bQPTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="195950171"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Nov 2025 01:34:25 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLeZz-0002fN-10;
	Wed, 19 Nov 2025 09:34:23 +0000
Date: Wed, 19 Nov 2025 17:33:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:objtool-split-fix 3/4] block/bio.o: warning: objtool:
 bvec_alloc+0x4e: panic() missing __noreturn in .c/.h or NORETURN() in
 noreturns.h
Message-ID: <202511191759.y7jedeO3-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-split-fix
head:   0bef6d9464b6e3f95945b07ed48571e9c323987a
commit: 270f4606de3bda5ae7882f56ee52ad76fd5e8089 [3/4] objtool: Improve alias handling
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251119/202511191759.y7jedeO3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191759.y7jedeO3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511191759.y7jedeO3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/bio.o: warning: objtool: bvec_alloc+0x4e: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> block/bio.o: warning: objtool: blk_next_bio+0x4f: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> block/bio.o: warning: objtool: bio_alloc_bioset+0x183: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> block/bio.o: warning: objtool: zero_fill_bio_iter+0x28: unreachable instruction
>> block/bio.o: warning: objtool: bio_truncate+0xfc: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> block/bio.o: warning: objtool: bio_free+0x37: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> block/bio.o: warning: objtool: bio_add_vmalloc_chunk+0x2c: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> block/bio.o: warning: objtool: bio_add_vmalloc+0x38: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> block/bio.o: warning: objtool: __bio_release_pages+0xa6: unreachable instruction
>> block/bio.o: warning: objtool: bio_iov_iter_get_pages+0x63: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> block/bio.o: warning: objtool: submit_bio_wait+0x39: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> block/bio.o: warning: objtool: bdev_rw_virt+0x27: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> block/bio.o: warning: objtool: bio_await_chain+0x38: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> block/bio.o: warning: objtool: bio_wait_end_io+0xd: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> block/bio.o: warning: objtool: bio_endio+0x68: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> block/bio.o: warning: objtool: __bio_advance+0x87: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> block/bio.o: warning: objtool: bio_copy_data_iter+0x2b: unreachable instruction
>> block/bio.o: warning: objtool: bio_free_pages+0x6b: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> block/bio.o: warning: objtool: bio_set_pages_dirty+0x9e: unreachable instruction
>> block/bio.o: warning: objtool: bio_check_pages_dirty+0x1dd: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   block/bio.o: warning: objtool: bio_split+0x1a3: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   block/bio.o: warning: objtool: bio_trim+0xea: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   block/bio.o: warning: objtool: bioset_exit+0x20: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   block/bio.o: warning: objtool: bioset_init+0x85: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   block/bio.o: warning: objtool: bio_alloc_rescue+0x16: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   block/bio.o: warning: objtool: init_bio+0x5f: panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
--
>> block/blk-core.o: warning: objtool: blk_dev_init(): unexpected end of section .init.text
--
>> fs/nsfs.o: warning: objtool: nsfs_init(): unexpected end of section .init.text
--
>> fs/pidfs.o: warning: objtool: pidfs_init(): unexpected end of section .init.text
--
>> fs/anon_inodes.o: warning: objtool: anon_inode_init(): unexpected end of section .init.text
--
>> fs/aio.o: warning: objtool: aio_setup(): unexpected end of section .init.text
--
   init/main.o: warning: objtool: do_initcalls() falls through to next function do_initcall_level()
   init/main.o: warning: objtool: rest_init() falls through to next function kernel_init()
>> init/main.o: warning: objtool: kernel_init(): unexpected end of section .ref.text
--
>> kernel/exit.o: warning: objtool: make_task_dead() falls through to next function refcount_inc()
--
>> kernel/reboot.o: warning: objtool: __x64_sys_reboot() falls through to next function ctrl_alt_del()
--
>> mm/slab_common.o: warning: objtool: __kmem_cache_create_args() falls through to next function kmem_buckets_create()
   mm/slab_common.o: warning: objtool: create_boot_cache() falls through to next function setup_kmalloc_cache_index_table()
>> mm/slab_common.o: warning: objtool: create_kmalloc_cache(): unexpected end of section .init.text
--
>> mm/memblock.o: warning: objtool: __memblock_alloc_or_panic() falls through to next function memblock_reserved_size()
>> mm/memblock.o: warning: objtool: memblock_double_array() falls through to next function memblock_merge_regions()
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
