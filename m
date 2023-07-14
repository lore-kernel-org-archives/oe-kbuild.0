Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9212CEA3
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Jul 2023 04:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689310226; x=1720846226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dbq86KK8gxslLHbRWgr4eZ6rGaDgHaxrFm2uz9kgqSE=;
  b=Z83UXVAtJ9VmOZP7lM+PksL0bROPNqT22NRoDmXUTMCJK5L8gRkLlgwS
   hg1h7NNPyHvDeNw6WxKarOMyD8boI9i47m+vwdPDkb+Q1HbsHyvdZ5yez
   oJfBSIhceZeBr8mcbsIM/JKgYlNaWrUTScnQxw8Xa7JSgdsSrXdbGmQtm
   HF4awpzGVkVPl4jwP68SqSeM47yQ6b6B8UftFQ8qPYLTxlUZY3mNOmcyS
   8FumQDqh9KYl82NuN6gluWl6HXgYmw8NUoOKdhsWNwxrahyIcnFjqes+O
   0KCyVkU4CK8Jtpnygu9tHYFW+OdudQR2yNk7WHkHcKjvCgQghnHuHDR7o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="431561308"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="431561308"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 21:50:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="792311576"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="792311576"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jul 2023 21:50:22 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKAl4-0007Bu-0K;
	Fri, 14 Jul 2023 04:50:22 +0000
Date: Fri, 14 Jul 2023 12:50:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sean-jc:x86/gmem 10/28] virt/kvm/guest_mem.c: linux/pagemap.h is
 included more than once.
Message-ID: <202307141227.pSP5wpov-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sean Christopherson <seanjc@google.com>
CC: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
CC: Yu Zhang <yu.c.zhang@linux.intel.com>
CC: Chao Peng <chao.p.peng@linux.intel.com>
CC: Ackerley Tng <ackerleytng@google.com>

tree:   https://github.com/sean-jc/linux x86/gmem
head:   9cbe075ae7adfaccafbef6c181188fefceaf7482
commit: 083ee48321c38c48cb22f98f966de86b2c6ca77b [10/28] KVM: Introduced ioctl() to allocate dedicated memory for guests
:::::: branch date: 6 hours ago
:::::: commit date: 30 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141227.pSP5wpov-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307141227.pSP5wpov-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> virt/kvm/guest_mem.c: linux/pagemap.h is included more than once.

vim +5 virt/kvm/guest_mem.c

   > 5	#include <linux/pagemap.h>
     6	#include <linux/sbitmap.h>
     7	
     8	
     9	#include <linux/mm.h>
    10	#include <linux/fs.h>
    11	#include <linux/swap.h>
    12	#include <linux/mount.h>
    13	#include <linux/memfd.h>
    14	#include <linux/bitops.h>
    15	#include <linux/printk.h>
  > 16	#include <linux/pagemap.h>
    17	#include <linux/syscalls.h>
    18	#include <linux/pseudo_fs.h>
    19	#include <linux/secretmem.h>
    20	#include <linux/set_memory.h>
    21	#include <linux/sched/signal.h>
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
