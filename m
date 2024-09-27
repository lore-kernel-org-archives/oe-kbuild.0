Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8586A920
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 03:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727406836; cv=none; b=INSeE4+UXU5Zns3icfeNrm+8WDLAQJjZbXjghVzCNUAayiA62dS7gi4epOGvMH1FNxbr18tpOZzOZ5yLnbzwn1IySroIiJcj2gYUiZj9tDJuooWAQ71zZQb1BvVf/4ajVtzFDZx3jcAZ7wstFatd0/FAX80TeOTufn7MCeVHgPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727406836; c=relaxed/simple;
	bh=HhDm78eh1AsGGJ34RHxMaeMVeDOHfk8v26SPR6ZrB2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FxitNSzipRt4PXEV10jvRmYgsxBlmVlr141V2Xk1A0A0loQzrIYryX0FaxPfxg4OjuzBOQKnBRz0EM9VgTmyY6mtgZYxl1fupLHZ7HjQknmDadpa2v/xNWhcadX91aQ7nr9Ar0TDnBSa1eayrkN5oRMpaRoi/S0J96hGoky39kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5UzMwaz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5UzMwaz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727406835; x=1758942835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HhDm78eh1AsGGJ34RHxMaeMVeDOHfk8v26SPR6ZrB2w=;
  b=j5UzMwazTAFYePFuSSJ4kzhGdFk1lD/nURjBkcakGcG8ubDF06zEsz0i
   +tCpXTqJApEQBfpsoKf6vuNApaDH6+nIlMx+Z52iPB7ChZ4zVEitNsfVM
   nOykHHgXA6fZae6gQ5538OtzwRU7hUAGQiMAx1ZzHpyBcqTg/uFDWUIux
   ja5NmQ/Gv9JE82UGCwsyY0FuBN6081NIGFKONPYE1tQ2F0MypALfnNW5p
   UllJIRaBF57j4JLS4Pv9o3OR0FQQAic5tqso/dWi/F61Jkklqo36BcKfs
   zdfU60FDUXOypG3hMCN42KR2hw5Teq8PZB5Iib2gqLI15moY5dF/so5Gv
   A==;
X-CSE-ConnectionGUID: fiyomPrqTvSzb+uQvev6Hg==
X-CSE-MsgGUID: +/Yh5FxoTC6mdnRMFJkKRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="44055105"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="44055105"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 20:13:54 -0700
X-CSE-ConnectionGUID: fTTbK/nURr+GlPVvMjaKug==
X-CSE-MsgGUID: Ubzp2WweShullywQKsppzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="72804181"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Sep 2024 20:13:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su1QU-000LPf-2C;
	Fri, 27 Sep 2024 03:13:50 +0000
Date: Fri, 27 Sep 2024 11:13:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-4.19.y-cip-rt-rebase 24034/30000]
 include/asm-generic/percpu.h:151:9: error: implicit declaration of function
 'raw_local_irq_save'
Message-ID: <202409271143.5qiuRG2w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "cip tree"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

Hi Ben,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   67ac3270c7aaf93810ea5b43e2bf8361b683718e
commit: 2c16891623cc7e8c0c4144f8665d117c7fc94552 [24034/30000] Revert "percpu: include irqflags.h for raw_local_irq_save()"
:::::: branch date: 3 days ago
:::::: commit date: 1 year, 9 months ago
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20240927/202409271143.5qiuRG2w-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271143.5qiuRG2w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409271143.5qiuRG2w-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
   In file included from ./arch/um/include/generated/asm/percpu.h:1,
                    from include/linux/percpu.h:13,
                    from include/linux/bpf-cgroup.h:7,
                    from kernel/bpf/local_storage.c:2:
   include/linux/bpf-cgroup.h: In function 'bpf_cgroup_storage_set':
>> include/asm-generic/percpu.h:151:9: error: implicit declaration of function 'raw_local_irq_save' [-Werror=implicit-function-declaration]
     151 |         raw_local_irq_save(__flags);                                    \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:337:41: note: in expansion of macro 'this_cpu_generic_to_op'
     337 | #define this_cpu_write_1(pcp, val)      this_cpu_generic_to_op(pcp, val, =)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:378:25: note: in expansion of macro 'this_cpu_write_1'
     378 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:509:41: note: in expansion of macro '__pcpu_size_call'
     509 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/bpf-cgroup.h:112:9: note: in expansion of macro 'this_cpu_write'
     112 |         this_cpu_write(bpf_cgroup_storage, &buf->data[0]);
         |         ^~~~~~~~~~~~~~
>> include/asm-generic/percpu.h:153:9: error: implicit declaration of function 'raw_local_irq_restore' [-Werror=implicit-function-declaration]
     153 |         raw_local_irq_restore(__flags);                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:337:41: note: in expansion of macro 'this_cpu_generic_to_op'
     337 | #define this_cpu_write_1(pcp, val)      this_cpu_generic_to_op(pcp, val, =)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:378:25: note: in expansion of macro 'this_cpu_write_1'
     378 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:509:41: note: in expansion of macro '__pcpu_size_call'
     509 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/bpf-cgroup.h:112:9: note: in expansion of macro 'this_cpu_write'
     112 |         this_cpu_write(bpf_cgroup_storage, &buf->data[0]);
         |         ^~~~~~~~~~~~~~
   In file included from include/linux/uaccess.h:14,
                    from include/linux/compat.h:19,
                    from include/linux/filter.h:12,
                    from kernel/bpf/local_storage.c:5:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
   arch/um/include/asm/uaccess.h:17:36: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      17 |           (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                                    ^~
   arch/um/include/asm/uaccess.h:45:17: note: in expansion of macro '__access_ok_vsyscall'
      45 |                 __access_ok_vsyscall(addr, size) ||
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/jump_label.h:77,
                    from include/linux/bpf-cgroup.h:6:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
   include/asm-generic/fixmap.h:31:26: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      31 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                          ^~
   include/linux/compiler.h:398:23: note: in definition of macro '__compiletime_assert'
     398 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:418:9: note: in expansion of macro '_compiletime_assert'
     418 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:45:37: note: in expansion of macro 'compiletime_assert'
      45 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:69:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      69 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:31:9: note: in expansion of macro 'BUILD_BUG_ON'
      31 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |         ^~~~~~~~~~~~
   In file included from include/linux/memremap.h:7,
                    from include/linux/mm.h:27,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:11,
                    from include/linux/skbuff.h:34,
                    from include/linux/filter.h:13:
   include/linux/mm.h: In function 'pgtable_init':
   arch/um/include/asm/pgtable.h:35:33: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      35 | #define pgtable_cache_init() do ; while (0)
         |                                 ^
   include/linux/mm.h:1929:9: note: in expansion of macro 'pgtable_cache_init'
    1929 |         pgtable_cache_init();
         |         ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/raw_local_irq_save +151 include/asm-generic/percpu.h

e88d62cd4b2f0b1 Mark Rutland    2017-09-26  147  
eba117889ac444b Tejun Heo       2014-06-17  148  #define this_cpu_generic_to_op(pcp, val, op)				\
9c28278a24c01c0 Tejun Heo       2014-06-17  149  do {									\
eba117889ac444b Tejun Heo       2014-06-17  150  	unsigned long __flags;						\
eba117889ac444b Tejun Heo       2014-06-17 @151  	raw_local_irq_save(__flags);					\
1b5ca12127427c5 Nicholas Piggin 2016-09-22  152  	raw_cpu_generic_to_op(pcp, val, op);				\
eba117889ac444b Tejun Heo       2014-06-17 @153  	raw_local_irq_restore(__flags);					\
9c28278a24c01c0 Tejun Heo       2014-06-17  154  } while (0)
9c28278a24c01c0 Tejun Heo       2014-06-17  155  
1b5ca12127427c5 Nicholas Piggin 2016-09-22  156  

:::::: The code at line 151 was first introduced by commit
:::::: eba117889ac444bea6e8270049cbaeed48169889 percpu: preffity percpu header files

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
