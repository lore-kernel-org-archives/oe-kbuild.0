Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651933D9E
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Jul 2023 12:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690030303; x=1721566303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fKQc07jrePdLXuiXfaEKloCZDkeCVTnckRTQT0UJCVc=;
  b=Y/TTr0MSmzd7sOUs5UAgA6TLV9tpVfVb4/KEXlMkVyXGOSZ0j+LlWcxJ
   P1XlPgjiTTLvncI7DUolFvHMZe8qwcgQ+wItzL0minjsZMjGyZZvQCDEQ
   Y3ke2UmC0sNoQwNpJWvTASsknJNVkA2Qs6WOI+2a2Jjp4ZTCrUVY5AE1J
   1lp4TYvyqsZB/emFQfEGaVmLyGq3wbspCX1rRvpiIc+HcipTusersKUCg
   cI/cM42uJqCHf7KcH74BappIDNEk+uoIFnCpywTgEQ5EzuakNKPvvuF9R
   R+W4IsE1vdR5BRRtjhfwmIXDoVFgaX6MVSaCue0mFrQ7KoXTFJB/O1mtP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="347477771"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="347477771"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 05:51:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="760267327"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="760267327"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 22 Jul 2023 05:51:41 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNC5E-0008Jl-2c;
	Sat, 22 Jul 2023 12:51:40 +0000
Date: Sat, 22 Jul 2023 20:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] riscv: Add HAVE_IOREMAP_PROT support
Message-ID: <202307222034.TVCQ8Y8c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: dfl-afu-main.c:(.rodata+0x2c): undefined reference to `generic_access_phys'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230716152033.3713581-1-guoren@kernel.org>
References: <20230716152033.3713581-1-guoren@kernel.org>
TO: guoren@kernel.org
TO: guoren@kernel.org
TO: palmer@rivosinc.com
TO: paul.walmsley@sifive.com
TO: falcon@tinylab.org
TO: bjorn@kernel.org
TO: conor.dooley@microchip.com
TO: alex@ghiti.fr
CC: linux-arch@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: Guo Ren <guoren@linux.alibaba.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.5-rc2 next-20230721]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/guoren-kernel-org/riscv-Add-HAVE_IOREMAP_PROT-support/20230718-181937
base:   linus/master
patch link:    https://lore.kernel.org/r/20230716152033.3713581-1-guoren%40kernel.org
patch subject: [PATCH] riscv: Add HAVE_IOREMAP_PROT support
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-r083-20230720 (https://download.01.org/0day-ci/archive/20230722/202307222034.TVCQ8Y8c-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307222034.TVCQ8Y8c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307222034.TVCQ8Y8c-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: drivers/fpga/dfl-afu-main.o: in function `.LANCHOR2':
>> dfl-afu-main.c:(.rodata+0x2c): undefined reference to `generic_access_phys'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
