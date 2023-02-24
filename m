Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E2AD2F7
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Feb 2023 05:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677216702; x=1708752702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=at1o6EZxVVzXYBilGmSiA9kk8h44XJmRFCdEwxWTxWY=;
  b=J9LX9f1/TUPn3gyQse69A9+urhvIz6lbxc3A71IIbSIvvzJ0C7qVAhV2
   vcxO3l4ZA+reTRE9FvHtrHWC+HupR4Hp2scE8qxPWTEeVY0GZXNOciKap
   sU+UBxkozAVHEkLlSLJhjInqOLQMIpeBvKBnSwJ2CjdKlZozmmO7vjpI+
   TH55zZ5XVL2ZWKIlQCwLidQdEbooLOqtDJfrn0haJoxI/sfn0Lj6Mlaqy
   PWPbASIxTzrNbutpCNQJrMOFV4SGOCyDlyxA3CXKIGGSWhT4kYELnXs7A
   JXAWHb20kRVBjm8qxQp5HkHr7opIk1AvMjC3iBRupNWU2QBgrlHB83hBj
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="331133277"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="331133277"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 21:31:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="650239519"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="650239519"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Feb 2023 21:31:38 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVQgD-00029p-1A;
	Fri, 24 Feb 2023 05:31:37 +0000
Date: Fri, 24 Feb 2023 13:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/slab_common.c:92 kmem_cache_sanity_check() warn: impossible
 condition '(size > (1 << (17 + 16 - 1))) => (0-u32max > 4294967296)'
Message-ID: <202302241306.cml6ecFI-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Hyeonggon Yoo <42.hyeyoo@gmail.com>
CC: Vlastimil Babka <vbabka@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2980d8d826554fa6981d621e569a453787472f8
commit: d6a71648dbc0ca5520cba16a8fdce8d37ae74218 mm/slab: kmalloc: pass requests larger than order-1 page to page allocator
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
config: ia64-randconfig-m041-20230222 (https://download.01.org/0day-ci/archive/20230224/202302241306.cml6ecFI-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302241306.cml6ecFI-lkp@intel.com/

smatch warnings:
mm/slab_common.c:92 kmem_cache_sanity_check() warn: impossible condition '(size > (1 << (17 + 16 - 1))) => (0-u32max > 4294967296)'

vim +92 mm/slab_common.c

07f361b2bee388 Joonsoo Kim     2014-10-09   88  
77be4b1366c97b Shuah Khan      2012-08-16   89  #ifdef CONFIG_DEBUG_VM
f4957d5bd09165 Alexey Dobriyan 2018-04-05   90  static int kmem_cache_sanity_check(const char *name, unsigned int size)
77be4b1366c97b Shuah Khan      2012-08-16   91  {
74c1d3e0815338 Kees Cook       2021-06-15  @92  	if (!name || in_interrupt() || size > KMALLOC_MAX_SIZE) {
77be4b1366c97b Shuah Khan      2012-08-16   93  		pr_err("kmem_cache_create(%s) integrity check failed\n", name);
77be4b1366c97b Shuah Khan      2012-08-16   94  		return -EINVAL;
77be4b1366c97b Shuah Khan      2012-08-16   95  	}
77be4b1366c97b Shuah Khan      2012-08-16   96  
77be4b1366c97b Shuah Khan      2012-08-16   97  	WARN_ON(strchr(name, ' '));	/* It confuses parsers */
77be4b1366c97b Shuah Khan      2012-08-16   98  	return 0;
77be4b1366c97b Shuah Khan      2012-08-16   99  }
77be4b1366c97b Shuah Khan      2012-08-16  100  #else
f4957d5bd09165 Alexey Dobriyan 2018-04-05  101  static inline int kmem_cache_sanity_check(const char *name, unsigned int size)
77be4b1366c97b Shuah Khan      2012-08-16  102  {
77be4b1366c97b Shuah Khan      2012-08-16  103  	return 0;
77be4b1366c97b Shuah Khan      2012-08-16  104  }
77be4b1366c97b Shuah Khan      2012-08-16  105  #endif
77be4b1366c97b Shuah Khan      2012-08-16  106  

:::::: The code at line 92 was first introduced by commit
:::::: 74c1d3e081533825f2611e46edea1fcdc0701985 mm/slub: fix redzoning for small allocations

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
