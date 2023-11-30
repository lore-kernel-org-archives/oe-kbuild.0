Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3181E5FEFF
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 19:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lo/M2B+b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701371318; x=1732907318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N3x4mwAtpOpaHRi2XQ4cGwdqZ1/Iz+jYoSc7wIkTBVk=;
  b=lo/M2B+be2fwV6JBieRbZO61AaV9i04Y4gI+bc6iVRzZ1AZXQ9XACEXD
   CUIFHYhFyoK7CBpeqau9SbWCUbuRuX0RCeSQP8kPTEs7AShf9icbhWu5f
   aPIHKq4GehchfGSHdiOPK+gbHYlNE4PAwDIx7e5OI8UFF+Z1DVQ+VfO47
   qRSKjVf76X8MqvNa5uP8yqu1wmxOVmrrxJt28OkAW4fvHCHAiFUOXQFfJ
   N/RWwIwpnc2fFVfh+7d5oPsUqzjJoupDQTHTvwnbQzfuZGsjVLjePILk4
   5Mdq/XYzyU2qLxNeTLLzAKYDhRwaupW9/rBrVGAhb7aXOEv79g/U5PsdC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="373345"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="373345"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 11:08:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="769405106"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="769405106"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Nov 2023 11:08:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8mOn-0002aa-20;
	Thu, 30 Nov 2023 19:08:33 +0000
Date: Fri, 1 Dec 2023 03:08:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/binfmt_elf_fdpic.c:1024:52: warning: variable 'excess1' set but
 not used
Message-ID: <202312010207.Qsl8cXfK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: fs/binfmt_elf_fdpic.c:1024:52: warning: variable 'excess1' set but not used [-Wunused-but-set-variable]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Greg Ungerer <gerg@kernel.org>
CC: Palmer Dabbelt <palmer@rivosinc.com>

Hi Greg,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: 9549fb354ef1a451ceddfa404ae3e943c5c803d0 riscv: support the elf-fdpic binfmt loader
date:   3 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-r031-20230608 (https://download.01.org/0day-ci/archive/20231201/202312010207.Qsl8cXfK-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312010207.Qsl8cXfK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312010207.Qsl8cXfK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/binfmt_elf_fdpic.c: In function 'elf_fdpic_map_file_by_direct_mmap':
>> fs/binfmt_elf_fdpic.c:1024:52: warning: variable 'excess1' set but not used [-Wunused-but-set-variable]
    1024 |                 unsigned long maddr, disp, excess, excess1;
         |                                                    ^~~~~~~

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
>> fs/binfmt_elf_fdpic.c:620:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:620:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:620:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:624:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:624:17: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:624:17: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:631:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:631:17: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:631:17: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:638:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:638:17: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:638:17: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:643:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:643:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:643:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:647:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:647:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:647:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:648:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:648:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:648:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:649:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:649:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:649:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:650:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:650:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:650:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:651:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:651:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:651:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:652:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:652:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:652:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:655:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:655:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:655:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:656:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:656:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:656:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:657:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:657:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:657:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:658:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:658:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:658:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:659:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:659:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:659:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:660:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:660:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:660:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:661:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:661:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:661:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:662:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:662:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:662:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:671:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:671:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:671:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:671:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:671:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:671:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:671:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:671:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:671:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:671:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:671:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:671:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:671:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:671:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:671:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:671:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:671:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:671:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:671:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:671:9: sparse:     got struct <noident> [noderef] __user *
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct <noident> [noderef] __user * @@
   fs/binfmt_elf_fdpic.c:671:9: sparse:     expected void const *from
   fs/binfmt_elf_fdpic.c:671:9: sparse:     got struct <noident> [noderef] __user *
>> fs/binfmt_elf_fdpic.c:698:21: sparse: sparse: cast removes address space '__user' of expression
>> fs/binfmt_elf_fdpic.c:977:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void * @@
   fs/binfmt_elf_fdpic.c:977:41: sparse:     expected void [noderef] __user *to
   fs/binfmt_elf_fdpic.c:977:41: sparse:     got void *
   fs/binfmt_elf_fdpic.c:1151:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void * @@
   fs/binfmt_elf_fdpic.c:1151:55: sparse:     expected void [noderef] __user *to
   fs/binfmt_elf_fdpic.c:1151:55: sparse:     got void *
>> fs/binfmt_elf_fdpic.c:620:9: sparse: sparse: dereference of noderef expression
>> fs/binfmt_elf_fdpic.c:620:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:624:17: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:624:17: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:631:17: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:631:17: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:638:17: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:638:17: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:643:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:643:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:647:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:647:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:648:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:648:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:649:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:649:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:650:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:650:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:651:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:651:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:652:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:652:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:655:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:655:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:656:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:656:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:657:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:657:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:658:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:658:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:659:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:659:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:660:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:660:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:661:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:661:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:662:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:662:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression
   fs/binfmt_elf_fdpic.c:671:9: sparse: sparse: dereference of noderef expression

vim +/excess1 +1024 fs/binfmt_elf_fdpic.c

^1da177e4c3f41 Linus Torvalds    2005-04-16   915  
^1da177e4c3f41 Linus Torvalds    2005-04-16   916  /*****************************************************************************/
^1da177e4c3f41 Linus Torvalds    2005-04-16   917  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16   918   * map a file with constant displacement under uClinux
^1da177e4c3f41 Linus Torvalds    2005-04-16   919   */
^1da177e4c3f41 Linus Torvalds    2005-04-16   920  #ifndef CONFIG_MMU
8a2ab7f5df76b9 David Howells     2006-07-10   921  static int elf_fdpic_map_file_constdisp_on_uclinux(
8a2ab7f5df76b9 David Howells     2006-07-10   922  	struct elf_fdpic_params *params,
^1da177e4c3f41 Linus Torvalds    2005-04-16   923  	struct file *file,
^1da177e4c3f41 Linus Torvalds    2005-04-16   924  	struct mm_struct *mm)
^1da177e4c3f41 Linus Torvalds    2005-04-16   925  {
b922bf04d2c135 Greg Ungerer      2023-07-11   926  	struct elf_fdpic_loadseg *seg;
b922bf04d2c135 Greg Ungerer      2023-07-11   927  	struct elf_phdr *phdr;
a4eec6a3dfb7a6 David Hildenbrand 2021-06-28   928  	unsigned long load_addr, base = ULONG_MAX, top = 0, maddr = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16   929  	int loop, ret;
^1da177e4c3f41 Linus Torvalds    2005-04-16   930  
^1da177e4c3f41 Linus Torvalds    2005-04-16   931  	load_addr = params->load_addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16   932  	seg = params->loadmap->segs;
^1da177e4c3f41 Linus Torvalds    2005-04-16   933  
8a2ab7f5df76b9 David Howells     2006-07-10   934  	/* determine the bounds of the contiguous overall allocation we must
8a2ab7f5df76b9 David Howells     2006-07-10   935  	 * make */
^1da177e4c3f41 Linus Torvalds    2005-04-16   936  	phdr = params->phdrs;
^1da177e4c3f41 Linus Torvalds    2005-04-16   937  	for (loop = 0; loop < params->hdr.e_phnum; loop++, phdr++) {
^1da177e4c3f41 Linus Torvalds    2005-04-16   938  		if (params->phdrs[loop].p_type != PT_LOAD)
^1da177e4c3f41 Linus Torvalds    2005-04-16   939  			continue;
^1da177e4c3f41 Linus Torvalds    2005-04-16   940  
^1da177e4c3f41 Linus Torvalds    2005-04-16   941  		if (base > phdr->p_vaddr)
^1da177e4c3f41 Linus Torvalds    2005-04-16   942  			base = phdr->p_vaddr;
^1da177e4c3f41 Linus Torvalds    2005-04-16   943  		if (top < phdr->p_vaddr + phdr->p_memsz)
^1da177e4c3f41 Linus Torvalds    2005-04-16   944  			top = phdr->p_vaddr + phdr->p_memsz;
^1da177e4c3f41 Linus Torvalds    2005-04-16   945  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16   946  
^1da177e4c3f41 Linus Torvalds    2005-04-16   947  	/* allocate one big anon block for everything */
6be5ceb02e98ea Linus Torvalds    2012-04-20   948  	maddr = vm_mmap(NULL, load_addr, top - base,
a4eec6a3dfb7a6 David Hildenbrand 2021-06-28   949  			PROT_READ | PROT_WRITE | PROT_EXEC, MAP_PRIVATE, 0);
8a2ab7f5df76b9 David Howells     2006-07-10   950  	if (IS_ERR_VALUE(maddr))
^1da177e4c3f41 Linus Torvalds    2005-04-16   951  		return (int) maddr;
^1da177e4c3f41 Linus Torvalds    2005-04-16   952  
^1da177e4c3f41 Linus Torvalds    2005-04-16   953  	if (load_addr != 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16   954  		load_addr += PAGE_ALIGN(top - base);
^1da177e4c3f41 Linus Torvalds    2005-04-16   955  
^1da177e4c3f41 Linus Torvalds    2005-04-16   956  	/* and then load the file segments into it */
^1da177e4c3f41 Linus Torvalds    2005-04-16   957  	phdr = params->phdrs;
^1da177e4c3f41 Linus Torvalds    2005-04-16   958  	for (loop = 0; loop < params->hdr.e_phnum; loop++, phdr++) {
^1da177e4c3f41 Linus Torvalds    2005-04-16   959  		if (params->phdrs[loop].p_type != PT_LOAD)
^1da177e4c3f41 Linus Torvalds    2005-04-16   960  			continue;
^1da177e4c3f41 Linus Torvalds    2005-04-16   961  
^1da177e4c3f41 Linus Torvalds    2005-04-16   962  		seg->addr = maddr + (phdr->p_vaddr - base);
^1da177e4c3f41 Linus Torvalds    2005-04-16   963  		seg->p_vaddr = phdr->p_vaddr;
^1da177e4c3f41 Linus Torvalds    2005-04-16   964  		seg->p_memsz = phdr->p_memsz;
^1da177e4c3f41 Linus Torvalds    2005-04-16   965  
3dc20cb282ec03 Al Viro           2013-04-13   966  		ret = read_code(file, seg->addr, phdr->p_offset,
3dc20cb282ec03 Al Viro           2013-04-13   967  				       phdr->p_filesz);
^1da177e4c3f41 Linus Torvalds    2005-04-16   968  		if (ret < 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16   969  			return ret;
^1da177e4c3f41 Linus Torvalds    2005-04-16   970  
^1da177e4c3f41 Linus Torvalds    2005-04-16   971  		/* map the ELF header address if in this segment */
^1da177e4c3f41 Linus Torvalds    2005-04-16   972  		if (phdr->p_offset == 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16   973  			params->elfhdr_addr = seg->addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16   974  
^1da177e4c3f41 Linus Torvalds    2005-04-16   975  		/* clear any space allocated but not loaded */
ab4ad55512e95b Mike Frysinger    2009-04-02   976  		if (phdr->p_filesz < phdr->p_memsz) {
e30c7c3b306312 Takuya Yoshikawa  2010-06-01  @977  			if (clear_user((void *) (seg->addr + phdr->p_filesz),
e30c7c3b306312 Takuya Yoshikawa  2010-06-01   978  				       phdr->p_memsz - phdr->p_filesz))
e30c7c3b306312 Takuya Yoshikawa  2010-06-01   979  				return -EFAULT;
ab4ad55512e95b Mike Frysinger    2009-04-02   980  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16   981  
^1da177e4c3f41 Linus Torvalds    2005-04-16   982  		if (mm) {
^1da177e4c3f41 Linus Torvalds    2005-04-16   983  			if (phdr->p_flags & PF_X) {
aa289b47231c95 David Howells     2007-03-23   984  				if (!mm->start_code) {
^1da177e4c3f41 Linus Torvalds    2005-04-16   985  					mm->start_code = seg->addr;
aa289b47231c95 David Howells     2007-03-23   986  					mm->end_code = seg->addr +
aa289b47231c95 David Howells     2007-03-23   987  						phdr->p_memsz;
aa289b47231c95 David Howells     2007-03-23   988  				}
8a2ab7f5df76b9 David Howells     2006-07-10   989  			} else if (!mm->start_data) {
^1da177e4c3f41 Linus Torvalds    2005-04-16   990  				mm->start_data = seg->addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16   991  				mm->end_data = seg->addr + phdr->p_memsz;
^1da177e4c3f41 Linus Torvalds    2005-04-16   992  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16   993  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16   994  
^1da177e4c3f41 Linus Torvalds    2005-04-16   995  		seg++;
^1da177e4c3f41 Linus Torvalds    2005-04-16   996  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16   997  
^1da177e4c3f41 Linus Torvalds    2005-04-16   998  	return 0;
8a2ab7f5df76b9 David Howells     2006-07-10   999  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1000  #endif
^1da177e4c3f41 Linus Torvalds    2005-04-16  1001  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1002  /*****************************************************************************/
^1da177e4c3f41 Linus Torvalds    2005-04-16  1003  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  1004   * map a binary by direct mmap() of the individual PT_LOAD segments
^1da177e4c3f41 Linus Torvalds    2005-04-16  1005   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1006  static int elf_fdpic_map_file_by_direct_mmap(struct elf_fdpic_params *params,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1007  					     struct file *file,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1008  					     struct mm_struct *mm)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1009  {
b922bf04d2c135 Greg Ungerer      2023-07-11  1010  	struct elf_fdpic_loadseg *seg;
b922bf04d2c135 Greg Ungerer      2023-07-11  1011  	struct elf_phdr *phdr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1012  	unsigned long load_addr, delta_vaddr;
e30c7c3b306312 Takuya Yoshikawa  2010-06-01  1013  	int loop, dvset;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1014  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1015  	load_addr = params->load_addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1016  	delta_vaddr = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1017  	dvset = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1018  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1019  	seg = params->loadmap->segs;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1020  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1021  	/* deal with each load segment separately */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1022  	phdr = params->phdrs;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1023  	for (loop = 0; loop < params->hdr.e_phnum; loop++, phdr++) {
^1da177e4c3f41 Linus Torvalds    2005-04-16 @1024  		unsigned long maddr, disp, excess, excess1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1025  		int prot = 0, flags;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1026  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1027  		if (phdr->p_type != PT_LOAD)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1028  			continue;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1029  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1030  		kdebug("[LOAD] va=%lx of=%lx fs=%lx ms=%lx",
^1da177e4c3f41 Linus Torvalds    2005-04-16  1031  		       (unsigned long) phdr->p_vaddr,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1032  		       (unsigned long) phdr->p_offset,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1033  		       (unsigned long) phdr->p_filesz,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1034  		       (unsigned long) phdr->p_memsz);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1035  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1036  		/* determine the mapping parameters */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1037  		if (phdr->p_flags & PF_R) prot |= PROT_READ;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1038  		if (phdr->p_flags & PF_W) prot |= PROT_WRITE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1039  		if (phdr->p_flags & PF_X) prot |= PROT_EXEC;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1040  
4589ff7ca81516 David Hildenbrand 2021-04-23  1041  		flags = MAP_PRIVATE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1042  		maddr = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1043  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1044  		switch (params->flags & ELF_FDPIC_FLAG_ARRANGEMENT) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1045  		case ELF_FDPIC_FLAG_INDEPENDENT:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1046  			/* PT_LOADs are independently locatable */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1047  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1048  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1049  		case ELF_FDPIC_FLAG_HONOURVADDR:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1050  			/* the specified virtual address must be honoured */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1051  			maddr = phdr->p_vaddr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1052  			flags |= MAP_FIXED;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1053  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1054  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1055  		case ELF_FDPIC_FLAG_CONSTDISP:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1056  			/* constant displacement
8a2ab7f5df76b9 David Howells     2006-07-10  1057  			 * - can be mapped anywhere, but must be mapped as a
8a2ab7f5df76b9 David Howells     2006-07-10  1058  			 *   unit
^1da177e4c3f41 Linus Torvalds    2005-04-16  1059  			 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1060  			if (!dvset) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1061  				maddr = load_addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1062  				delta_vaddr = phdr->p_vaddr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1063  				dvset = 1;
8a2ab7f5df76b9 David Howells     2006-07-10  1064  			} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1065  				maddr = load_addr + phdr->p_vaddr - delta_vaddr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1066  				flags |= MAP_FIXED;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1067  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1068  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1069  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1070  		case ELF_FDPIC_FLAG_CONTIGUOUS:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1071  			/* contiguity handled later */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1072  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1073  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1074  		default:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1075  			BUG();
^1da177e4c3f41 Linus Torvalds    2005-04-16  1076  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1077  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1078  		maddr &= PAGE_MASK;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1079  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1080  		/* create the mapping */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1081  		disp = phdr->p_vaddr & ~PAGE_MASK;
6be5ceb02e98ea Linus Torvalds    2012-04-20  1082  		maddr = vm_mmap(file, maddr, phdr->p_memsz + disp, prot, flags,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1083  				phdr->p_offset - disp);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1084  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1085  		kdebug("mmap[%d] <file> sz=%lx pr=%x fl=%x of=%lx --> %08lx",
8a2ab7f5df76b9 David Howells     2006-07-10  1086  		       loop, phdr->p_memsz + disp, prot, flags,
8a2ab7f5df76b9 David Howells     2006-07-10  1087  		       phdr->p_offset - disp, maddr);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1088  
8a2ab7f5df76b9 David Howells     2006-07-10  1089  		if (IS_ERR_VALUE(maddr))
^1da177e4c3f41 Linus Torvalds    2005-04-16  1090  			return (int) maddr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1091  
8a2ab7f5df76b9 David Howells     2006-07-10  1092  		if ((params->flags & ELF_FDPIC_FLAG_ARRANGEMENT) ==
8a2ab7f5df76b9 David Howells     2006-07-10  1093  		    ELF_FDPIC_FLAG_CONTIGUOUS)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1094  			load_addr += PAGE_ALIGN(phdr->p_memsz + disp);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1095  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1096  		seg->addr = maddr + disp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1097  		seg->p_vaddr = phdr->p_vaddr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1098  		seg->p_memsz = phdr->p_memsz;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1099  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1100  		/* map the ELF header address if in this segment */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1101  		if (phdr->p_offset == 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1102  			params->elfhdr_addr = seg->addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1103  
8a2ab7f5df76b9 David Howells     2006-07-10  1104  		/* clear the bit between beginning of mapping and beginning of
8a2ab7f5df76b9 David Howells     2006-07-10  1105  		 * PT_LOAD */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1106  		if (prot & PROT_WRITE && disp > 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1107  			kdebug("clear[%d] ad=%lx sz=%lx", loop, maddr, disp);
e30c7c3b306312 Takuya Yoshikawa  2010-06-01  1108  			if (clear_user((void __user *) maddr, disp))
e30c7c3b306312 Takuya Yoshikawa  2010-06-01  1109  				return -EFAULT;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1110  			maddr += disp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1111  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1112  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1113  		/* clear any space allocated but not loaded
^1da177e4c3f41 Linus Torvalds    2005-04-16  1114  		 * - on uClinux we can just clear the lot
^1da177e4c3f41 Linus Torvalds    2005-04-16  1115  		 * - on MMU linux we'll get a SIGBUS beyond the last page
^1da177e4c3f41 Linus Torvalds    2005-04-16  1116  		 *   extant in the file
^1da177e4c3f41 Linus Torvalds    2005-04-16  1117  		 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1118  		excess = phdr->p_memsz - phdr->p_filesz;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1119  		excess1 = PAGE_SIZE - ((maddr + phdr->p_filesz) & ~PAGE_MASK);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1120  

:::::: The code at line 1024 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
