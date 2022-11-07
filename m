Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210E515AD
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Nov 2022 21:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667856798; x=1699392798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+W5hodfWbYCsy9cN/SplJaot8dj5MvdI0j5+aT7yJa4=;
  b=RCEglfvaEHLK1hMors3jk9GbBBEIALqTQmZjy90TyWN8timuygBq3/bm
   sUFyD9rcxwD1Au/nj3q0LZaNNE2Z0/58YV6LSIjWQGd7OUBjtQwlJ+9Oz
   XH/1QGsXG0OnGuwyUtlNikW4aSx69hTCQcEoSYHtklsydrdYdcHnFVFqi
   UPFEudOQhjZvXnFn3+99ftNxHQRXoMlxCaxW5p693OiVbxO8s46tn/0pC
   fgcXEpeHBP1o73ofhjphAcvFnhxNyASZFkGl04PWcYw7I9bXPhVsV9qvw
   8wT1DkY0gCV0MXm6qkbstkIgaxZssJQrk/jAOwJXEoH252CYCDdidhdJn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="290251278"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="290251278"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 13:33:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="699649052"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="699649052"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Nov 2022 13:33:16 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1os9k3-0001AS-39;
	Mon, 07 Nov 2022 21:33:16 +0000
Date: Tue, 8 Nov 2022 05:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/mlock.c:230:20: warning: Using pointer that is a temporary.
 [danglingTemporaryLifetime]
Message-ID: <202211080503.8U4LiRAI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/mlock.c:230:20: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a1de832bd3243577de365222d8bc92708005ebf3
commit: adb11e78c5dc5e26774acb05f983da36447f7911 mm/munlock: protect the per-CPU pagevec by a local_lock_t
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout adb11e78c5dc5e26774acb05f983da36447f7911
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/mlock.c:230:20: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]
    if (pagevec_count(pvec))
                      ^
   mm/mlock.c:229:9: note: Address of variable taken here.
    pvec = &per_cpu(mlock_pvec.vec, cpu);
           ^
   mm/mlock.c:229:17: note: Temporary created here.
    pvec = &per_cpu(mlock_pvec.vec, cpu);
                   ^
   mm/mlock.c:230:20: note: Using pointer that is a temporary.
    if (pagevec_count(pvec))
                      ^

vim +230 mm/mlock.c

adb11e78c5dc5e Sebastian Andrzej Siewior 2022-04-01  223  
adb11e78c5dc5e Sebastian Andrzej Siewior 2022-04-01  224  void mlock_page_drain_remote(int cpu)
56afe477df3cbb Vlastimil Babka           2013-09-11  225  {
2fbb0c10d1e822 Hugh Dickins              2022-02-14  226  	struct pagevec *pvec;
2fbb0c10d1e822 Hugh Dickins              2022-02-14  227  
adb11e78c5dc5e Sebastian Andrzej Siewior 2022-04-01  228  	WARN_ON_ONCE(cpu_online(cpu));
adb11e78c5dc5e Sebastian Andrzej Siewior 2022-04-01  229  	pvec = &per_cpu(mlock_pvec.vec, cpu);
2fbb0c10d1e822 Hugh Dickins              2022-02-14 @230  	if (pagevec_count(pvec))
2fbb0c10d1e822 Hugh Dickins              2022-02-14  231  		mlock_pagevec(pvec);
56afe477df3cbb Vlastimil Babka           2013-09-11  232  }
56afe477df3cbb Vlastimil Babka           2013-09-11  233  

:::::: The code at line 230 was first introduced by commit
:::::: 2fbb0c10d1e8222604132b3a3f81bfd8345a44b6 mm/munlock: mlock_page() munlock_page() batch by pagevec

:::::: TO: Hugh Dickins <hughd@google.com>
:::::: CC: Matthew Wilcox (Oracle) <willy@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
