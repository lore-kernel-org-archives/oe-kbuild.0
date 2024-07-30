Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9101684BE
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jul 2024 20:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722371641; cv=none; b=FrKhIvw1o7RTEZ37d3BNpdpayByHV2YIqv8oULH2OTCPvOqkvSBsrSolmk3dTtZhHycBQ583vFRy/pQeyxN99OZG7QbNS0p3ChcZW3jXePMYxqFAx9mSpM6Q+FYeMgOUyFUgKkfnV1BY4JCPkEWTU1oNnVH5LROIg+ufDI2gz1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722371641; c=relaxed/simple;
	bh=dHyCLbhusuTL6zNuZy84eayY60Z82oM9s/aXcQWYPQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ku9jjXO94y6dqT0cJsJG9GbaWn3sQ/Mir/97mjzWnj3IIb86puln2fC6sfXmTKZRdG0C9rswyF62YIHWSZG5qTII13r0WcY+Camjiutcsp/fxHB/+d2Yh2rAulnKA5bnrGbV7Ua+FtKcyYeMpo/9QsZynctDYEz8CB9VAmb1HFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvUe52vR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvUe52vR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722371639; x=1753907639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dHyCLbhusuTL6zNuZy84eayY60Z82oM9s/aXcQWYPQ0=;
  b=hvUe52vRICKelaStMxu8ci7LM+aqM/0QQeGSVjxtGuo/Zl+1u9q7B+y1
   MVW+ejoVu07nvf9ildUV875kOBimm5jlWQxsWU2Hwq/dxEVCJXAj3crbQ
   Fbr4wiwhveTmouaZJBNDqsoaF+NmUoeaVK41nHGb3UIcSa9bLJdDS9u4A
   1QvEOjt+47FEi+4WDlUfbV353AEXhTAvcsjX2AMXBQ8efUJdD4FHjIN5k
   +/a4WyokX/ScuP+QaRmJhFGLrarKnTjG88Ks2ZF7zwFXeZFuwNl5gNl+/
   Kbm94yES1C64ANmIc1S4d9/FTzYDkuq+kp+iY5k21K6bBl+07sNn8YBDb
   g==;
X-CSE-ConnectionGUID: n4qYiQGCSma2OWIfSG3g4w==
X-CSE-MsgGUID: nw4ZOQ6DRImMUdl9GrERGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20378711"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="20378711"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 13:33:59 -0700
X-CSE-ConnectionGUID: XAD4TaRTTIm9vfxKt50Piw==
X-CSE-MsgGUID: UGZMuY8gTOWjkVPWjwO4mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="59310292"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Jul 2024 13:33:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYtXf-000tJq-0w;
	Tue, 30 Jul 2024 20:33:55 +0000
Date: Wed, 31 Jul 2024 04:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kdave-btrfs-devel:misc-next 66/73] fs/btrfs/inode.o: warning:
 objtool: btrfs_data_csum_ok+0x74: unreachable instruction
Message-ID: <202407310425.ZVQxU4bE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josef Bacik <josef@toxicpanda.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   986ec0b4635da5c76d8b8b3b8a5c9f4b09fbab60
commit: 1737011ce349ca2d993cce51cd9ce50b8dfcc588 [66/73] btrfs: convert read_inline_extent to use a folio
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: loongarch-randconfig-001-20240730 (https://download.01.org/0day-ci/archive/20240731/202407310425.ZVQxU4bE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310425.ZVQxU4bE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407310425.ZVQxU4bE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/loongarch/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/bio.h:10,
                    from fs/btrfs/inode.c:8:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:290:34: warning: missing braces around initializer [-Wmissing-braces]
     290 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:556:16: note: in expansion of macro '__swp_entry_to_pmd'
     556 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.o: warning: objtool: insert_inline_extent+0x70: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_del_delalloc_inode+0x8c: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_set_delalloc_extent+0x154: unreachable instruction
>> fs/btrfs/inode.o: warning: objtool: btrfs_data_csum_ok+0x74: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_evict_inode+0x154: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_get_extent+0x434: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_create_io_em+0x64: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_set_range_writeback+0x80: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_finish_one_ordered+0x138: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_invalidate_folio+0x160: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: cow_file_range+0x10c: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: run_delalloc_nocow+0xac: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: compress_file_range+0xf8: unreachable instruction


objdump-func vmlinux.o btrfs_data_csum_ok:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
