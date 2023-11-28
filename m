Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2475F111A6
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Nov 2023 06:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQI8uWIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701151794; x=1732687794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k0iVAP1CzPhiR2Y43HSc7L4oRmqp2gcuvLUHVK867Is=;
  b=nQI8uWIiz9Oqjntpt10evjpTZfHG6+PCEeepzIXJW2naV+VZCOimZGDT
   Hqn82eTdQfYSKZHAaCXxYnFqe4dK9ITqorVI90jVwSltG3626Baezjt91
   afFwuT0s7drnbIGz+0wS8e8pbIG11DrB6E0v23lTEQPGU05+iOY83byXu
   /NEpBmfb4O/an+Q9ZcApybpAapKdU8zV0hSBruNR/RVkQiiY+qBbuy40y
   khLCD97TuGrbxlg+GHYTrPpRBa6QQVmQ/uOpNMiiLvOn+R656q34RmAKB
   OIMZK9U8bjlEsxBX587L2GRPLm6X0dGd/2otzCncyGZQQDyuoeGZiPS6f
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="377886168"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="377886168"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 22:09:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="1015815336"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="1015815336"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Nov 2023 22:09:51 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7rI5-00076s-1R;
	Tue, 28 Nov 2023 06:09:49 +0000
Date: Tue, 28 Nov 2023 14:09:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gustavoars:testing/next20231127-Warray-bounds 3/3]
 arch/sparc/mm/init_64.c:3088:31: warning: array subscript -1 is outside
 array bounds of 'char[]'
Message-ID: <202311281123.fsH3uu8M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "has Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC: LKML <linux-kernel@vger.kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/next20231127-Warray-bounds
head:   cb7d8700da3e4c763ac30bfa34ee7dc143bd2758
commit: cb7d8700da3e4c763ac30bfa34ee7dc143bd2758 [3/3] Makefile: Enable -Warray-bounds globally
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20231128/202311281123.fsH3uu8M-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311281123.fsH3uu8M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311281123.fsH3uu8M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sparc/mm/init_64.c: In function 'arch_hugetlb_valid_size':
   arch/sparc/mm/init_64.c:361:24: warning: variable 'hv_pgsz_idx' set but not used [-Wunused-but-set-variable]
     361 |         unsigned short hv_pgsz_idx;
         |                        ^~~~~~~~~~~
   arch/sparc/mm/init_64.c: At top level:
   arch/sparc/mm/init_64.c:2644:6: warning: no previous prototype for 'vmemmap_free' [-Wmissing-prototypes]
    2644 | void vmemmap_free(unsigned long start, unsigned long end,
         |      ^~~~~~~~~~~~
   In function 'kernel_lds_init',
       inlined from 'report_memory' at arch/sparc/mm/init_64.c:3100:2:
>> arch/sparc/mm/init_64.c:3088:31: warning: array subscript -1 is outside array bounds of 'char[]' [-Warray-bounds=]
    3088 |         code_resource.end   = compute_kern_paddr(_etext - 1);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/sparc/include/asm/sections.h:6,
                    from include/linux/interrupt.h:21,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/hugetlb.h:10,
                    from arch/sparc/mm/init_64.c:16:
   include/asm-generic/sections.h: In function 'report_memory':
   include/asm-generic/sections.h:35:32: note: at offset -1 into object '_etext' of size [0, 9223372036854775807]
      35 | extern char _text[], _stext[], _etext[];
         |                                ^~~~~~
   In function 'kernel_lds_init',
       inlined from 'report_memory' at arch/sparc/mm/init_64.c:3100:2:
   arch/sparc/mm/init_64.c:3090:31: warning: array subscript -1 is outside array bounds of 'char[]' [-Warray-bounds=]
    3090 |         data_resource.end   = compute_kern_paddr(_edata - 1);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/sections.h: In function 'report_memory':
   include/asm-generic/sections.h:36:32: note: at offset -1 into object '_edata' of size [0, 9223372036854775807]
      36 | extern char _data[], _sdata[], _edata[];
         |                                ^~~~~~
   In function 'kernel_lds_init',
       inlined from 'report_memory' at arch/sparc/mm/init_64.c:3100:2:
   arch/sparc/mm/init_64.c:3092:31: warning: array subscript -1 is outside array bounds of 'char[]' [-Warray-bounds=]
    3092 |         bss_resource.end    = compute_kern_paddr(_end - 1);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/sections.h: In function 'report_memory':
   include/asm-generic/sections.h:41:13: note: at offset -1 into object '_end' of size [0, 9223372036854775807]
      41 | extern char _end[];
         |             ^~~~


vim +3088 arch/sparc/mm/init_64.c

f6d4fb5cc0475c bob picco 2014-03-03  3084  
f6d4fb5cc0475c bob picco 2014-03-03  3085  static void __init kernel_lds_init(void)
f6d4fb5cc0475c bob picco 2014-03-03  3086  {
f6d4fb5cc0475c bob picco 2014-03-03  3087  	code_resource.start = compute_kern_paddr(_text);
f6d4fb5cc0475c bob picco 2014-03-03 @3088  	code_resource.end   = compute_kern_paddr(_etext - 1);
f6d4fb5cc0475c bob picco 2014-03-03  3089  	data_resource.start = compute_kern_paddr(_etext);
f6d4fb5cc0475c bob picco 2014-03-03  3090  	data_resource.end   = compute_kern_paddr(_edata - 1);
f6d4fb5cc0475c bob picco 2014-03-03  3091  	bss_resource.start  = compute_kern_paddr(__bss_start);
f6d4fb5cc0475c bob picco 2014-03-03  3092  	bss_resource.end    = compute_kern_paddr(_end - 1);
f6d4fb5cc0475c bob picco 2014-03-03  3093  }
f6d4fb5cc0475c bob picco 2014-03-03  3094  

:::::: The code at line 3088 was first introduced by commit
:::::: f6d4fb5cc0475c36437a618db31cbb7f2bf7c282 sparc64 - add mem to iomem resource

:::::: TO: bob picco <bpicco@meloft.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
