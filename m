Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34874846B
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jun 2023 20:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688070831; x=1719606831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=smfOMsMiAImTdIg8ZBpdv880zDuzDh4aMJ23TJfGot8=;
  b=HApL7ZDM7c3MPmXT8A0GsI/T20XckZ2g3Y2n7OF4hpSqLNomxys2P7lc
   H5wLW/AlYwn1Bq3kXoXx6QLD4zT0XR3UAlDdmIuPxtlxBGv1p28h65YPT
   CCKD5Y8DJ26UjnW7UvBjDeLbaVVS3Txw7pliTlzETjo8CzIzqTm1tJnzL
   Ws9sBMy4uWKQEX9CXkJ9KwoYtBglKag89baecO6eJ+Bp9pDsaIeuXWMu+
   Kxmwl+aM0VgJWeaBVbwuW0LyOh8lNYhEiWbwn9q6o+r7VogGBglbou+mH
   TIdLhHpb4kMifXyN3rYnkocaoyB/dtdvRgvpip56kdH2e4ri23DQKRXVr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="364800452"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="364800452"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 13:33:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="667692851"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="667692851"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Jun 2023 13:33:48 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEyKp-000ENp-0M;
	Thu, 29 Jun 2023 20:33:47 +0000
Date: Fri, 30 Jun 2023 04:32:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11776/12721] riscv32-linux-ld: section .data LMA
 [01b8e000,02220c3f] overlaps section .text LMA [0014dab0,031f66fb]
Message-ID: <202306300457.MiZCWguE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: riscv32-linux-ld: section .data LMA [01b8e000,02220c3f] overlaps section .text LMA [0014dab0,031f66fb]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8b14b70331aa4b721b8c489fc43a24c1eb323e1f
commit: 1e8d64bb8c968d87f1f00b260e1ee8fb42b52e0d [11776/12721] Merge branch 'mm-nonmm-unstable' into mm-everything
:::::: branch date: 17 hours ago
:::::: commit date: 6 days ago
config: riscv-randconfig-r092-20230628 (https://download.01.org/0day-ci/archive/20230630/202306300457.MiZCWguE-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300457.MiZCWguE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306300457.MiZCWguE-lkp@intel.com/

Note: the linux-next/master HEAD 8b14b70331aa4b721b8c489fc43a24c1eb323e1f builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> riscv32-linux-ld: section .data LMA [01b8e000,02220c3f] overlaps section .text LMA [0014dab0,031f66fb]
>> riscv32-linux-ld: section .data..percpu LMA [0353f000,036a7cff] overlaps section .rodata LMA [031f6700,03b54105]
>> riscv32-linux-ld: section .rodata VMA [c31f6700,c3b54105] overlaps section .bss VMA [c26ee000,c39b01a7]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
