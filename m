Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AAD360FF
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Aug 2023 23:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691795336; x=1723331336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b1PXJZwY7Fhx6tMpCLFqBh1FwFY4nm/W0wsXS9MeRXs=;
  b=gx78hOaX0N8NX7IRt0Q0cx8bIxhFAY5YMb3B4pHHAif4gO9DodmKX1x3
   WrVGLkw+6PsI2lcKwNylF4WnBn/TD3SofweC6JAy9An82W9z0UVJ7W1EV
   XHJyhmQcq3YM9HkM/MABPnjv5KSNtFcvon5B4O+phRHLDyPJQoZ//VDs2
   UVxi5OHznyWFMhhqmmUo/32NBjjZ1VS4MAaK1rLhcjm0ut/5Fb+VUtcaF
   l+E8mTzMMC5ePMWtf3/UAv4+z4zEZDvPE6SxQibd17vgiJ9ZLA12guvet
   CfwdzUpTsYFQMN/fcHnag2AyiGCOVUYpjz7z8xxeiXNUmbW2xB4ec1TZ7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438113635"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="438113635"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 16:08:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="876334249"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Aug 2023 16:08:57 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUbFV-00085w-2F;
	Fri, 11 Aug 2023 23:08:53 +0000
Date: Sat, 12 Aug 2023 07:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH bpf-next 2/3] bpf: Introduce task_vma open-coded iterator
 kfuncs
Message-ID: <202308120622.rMu98Wlt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230810183513.684836-3-davemarchevsky@fb.com>
References: <20230810183513.684836-3-davemarchevsky@fb.com>
TO: Dave Marchevsky <davemarchevsky@fb.com>
TO: bpf@vger.kernel.org
CC: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: Andrii Nakryiko <andrii@kernel.org>
CC: Martin KaFai Lau <martin.lau@kernel.org>
CC: Kernel Team <kernel-team@fb.com>
CC: Dave Marchevsky <davemarchevsky@fb.com>
CC: Nathan Slingerland <slinger@meta.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Marchevsky/bpf-Explicitly-emit-BTF-for-struct-bpf_iter_num-not-btf_iter_num/20230811-023615
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230810183513.684836-3-davemarchevsky%40fb.com
patch subject: [PATCH bpf-next 2/3] bpf: Introduce task_vma open-coded iterator kfuncs
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230812/202308120622.rMu98Wlt-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120622.rMu98Wlt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308120622.rMu98Wlt-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/task_iter.c:837:17: warning: no previous prototype for 'bpf_iter_task_vma_new' [-Wmissing-prototypes]
     837 | __bpf_kfunc int bpf_iter_task_vma_new(struct bpf_iter_task_vma *it,
         |                 ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c:869:36: warning: no previous prototype for 'bpf_iter_task_vma_next' [-Wmissing-prototypes]
     869 | __bpf_kfunc struct vm_area_struct *bpf_iter_task_vma_next(struct bpf_iter_task_vma *it)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c:878:18: warning: no previous prototype for 'bpf_iter_task_vma_destroy' [-Wmissing-prototypes]
     878 | __bpf_kfunc void bpf_iter_task_vma_destroy(struct bpf_iter_task_vma *it)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   kernel/bpf/task_iter.c: In function 'bpf_iter_task_vma_new':
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_554' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct bpf_iter_task_vma_kern) != sizeof(struct bpf_iter_task_vma)
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c:843:9: note: in expansion of macro 'BUILD_BUG_ON'
     843 |         BUILD_BUG_ON(sizeof(struct bpf_iter_task_vma_kern) != sizeof(struct bpf_iter_task_vma));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_554 +397 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  383  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  384  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  385  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  386  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  387  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  388   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  389   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  390   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  391   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  392   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  393   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  394   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  395   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  396  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @397  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  398  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
