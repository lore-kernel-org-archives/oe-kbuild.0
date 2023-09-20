Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FE81FC8
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Sep 2023 05:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695189551; x=1726725551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R4gojcOXXkOiOfnFpwIvcyfG6qVC0N7fclEcWBFUYDg=;
  b=BN64WduBchCxt7l86FDHpJtYg0Uv/RUUZxxv6BMxHfb80Sh9XWGV2FlD
   vJWZeKH0i29dbnXSqeoO7xCWheOx4a79sNhm8jsdSmhDmUKMK92XNNbra
   HZHgEbj6UVEwc52D0v5Tm03QXC4EsaFpCXCThcvkiGCQla6jIViJZ5hJ3
   Z2isOTyPh+CX3NVx0R9kAEgQIPYvZbNGRNwvLRm6WjryqfGhrgnK7yI9i
   l5+KXUmnOV9udd+3dhXfdrvktGzB1/YQr9SJ1jDTqAP3qmx3FCqJEeNEK
   RRWPTwrh/R6EhHmPUB9z2rVypOAle4x8oguF1wRDX6EJJ3P2fFgWqbM/C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466448605"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="466448605"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 22:59:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="920147989"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="920147989"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 19 Sep 2023 22:59:09 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiqEs-0008N0-33;
	Wed, 20 Sep 2023 05:59:06 +0000
Date: Wed, 20 Sep 2023 13:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] x86/hyperv: Remove hv_vtl_early_init initcall
Message-ID: <202309201327.J4pfXnUv-lkp@intel.com>
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
In-Reply-To: <1695185552-19910-1-git-send-email-ssengar@linux.microsoft.com>
References: <1695185552-19910-1-git-send-email-ssengar@linux.microsoft.com>
TO: Saurabh Sengar <ssengar@linux.microsoft.com>
TO: kys@microsoft.com
TO: haiyangz@microsoft.com
TO: wei.liu@kernel.org
TO: decui@microsoft.com
TO: tglx@linutronix.de
TO: mingo@redhat.com
TO: bp@alien8.de
TO: dave.hansen@linux.intel.com
TO: x86@kernel.org
TO: hpa@zytor.com
TO: linux-hyperv@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: mikelley@microsoft.com
CC: minipli@grsecurity.net
CC: ssengar@microsoft.com

Hi Saurabh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.6-rc2]
[also build test WARNING on linus/master next-20230920]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Saurabh-Sengar/x86-hyperv-Remove-hv_vtl_early_init-initcall/20230920-125357
base:   v6.6-rc2
patch link:    https://lore.kernel.org/r/1695185552-19910-1-git-send-email-ssengar%40linux.microsoft.com
patch subject: [PATCH] x86/hyperv: Remove hv_vtl_early_init initcall
:::::: branch date: 59 minutes ago
:::::: commit date: 59 minutes ago
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230920/202309201327.J4pfXnUv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201327.J4pfXnUv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309201327.J4pfXnUv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/mm/pat/set_memory.c:36:
   arch/x86/include/asm/mshyperv.h: In function 'hv_vtl_early_init':
   arch/x86/include/asm/mshyperv.h:346:1: error: no return statement in function returning non-void [-Werror=return-type]
     346 | static int __init hv_vtl_early_init(void) {}
         | ^~~~~~
   arch/x86/include/asm/mshyperv.h: At top level:
>> arch/x86/include/asm/mshyperv.h:346:19: warning: 'hv_vtl_early_init' defined but not used [-Wunused-function]
     346 | static int __init hv_vtl_early_init(void) {}
         |                   ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/hv_vtl_early_init +346 arch/x86/include/asm/mshyperv.h

79cadff2d92bb8 Vitaly Kuznetsov 2017-08-02  339  
765e33f5211ab6 Michael Kelley   2019-05-30  340  
3be1bc2fe9d2e4 Saurabh Sengar   2023-04-10  341  #ifdef CONFIG_HYPERV_VTL_MODE
3be1bc2fe9d2e4 Saurabh Sengar   2023-04-10  342  void __init hv_vtl_init_platform(void);
9081cfc5d0e7fa Saurabh Sengar   2023-09-19  343  int __init hv_vtl_early_init(void);
3be1bc2fe9d2e4 Saurabh Sengar   2023-04-10  344  #else
3be1bc2fe9d2e4 Saurabh Sengar   2023-04-10  345  static inline void __init hv_vtl_init_platform(void) {}
9081cfc5d0e7fa Saurabh Sengar   2023-09-19 @346  static int __init hv_vtl_early_init(void) {}
3be1bc2fe9d2e4 Saurabh Sengar   2023-04-10  347  #endif
3be1bc2fe9d2e4 Saurabh Sengar   2023-04-10  348  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
