Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05891BA20
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Sep 2023 07:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695108278; x=1726644278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9nfBaECzL96TRVjMRVHSMQOyGn2vMXvX81m3QRwlbRc=;
  b=K41NaJ/qF1hC2KcEGzueCEiQQ/+SQX7pc5ljvDRE+TXo5vjx1+XljvhT
   uLJGvFBkYcM6gc4HeMbLnMLmLGQnEFDydsolCUkWLak2+AyzjSd5GDR22
   IXwG8j04yL+bwd4Co5ozCMxarsM9zfXP/0K2Ll7OsKVDYMeM5JNMv+JZ9
   r1xbB8JXXtDxIG3IkXYo3IHLTXdHf5P91DwN44DK+Wvou+u2VZQDqLp8y
   xq2ntAGJtKQQgTsloKq6XVQgQVeP5g5POZD/5JoUo2rSI53e1FfyCCEMk
   cIPLJvkBa4dCXp+1v4sgocNeNvCgYwl2k06q0Ysng3jmgytWxP0+zgUDa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="383694829"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="383694829"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 00:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="739578102"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="739578102"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Sep 2023 00:24:36 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiV61-00072M-36;
	Tue, 19 Sep 2023 07:24:33 +0000
Date: Tue, 19 Sep 2023 15:23:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next v4 4/5] minmax: Allow comparisons of 'int' against
 'unsigned char/short'.
Message-ID: <202309191508.kUazRL3v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: mm/compaction.c:1436:21: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <8732ef5f809c47c28a7be47c938b28d4@AcuMS.aculab.com>
References: <8732ef5f809c47c28a7be47c938b28d4@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
CC: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
CC: "'Christoph Hellwig'" <hch@infradead.org>
CC: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v6.6-rc2]
[cannot apply to next-20230918 next-20230918]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Add-umin-a-b-and-umax-a-b/20230918-162441
base:   linux/master
patch link:    https://lore.kernel.org/r/8732ef5f809c47c28a7be47c938b28d4%40AcuMS.aculab.com
patch subject: [PATCH next v4 4/5] minmax: Allow comparisons of 'int' against 'unsigned char/short'.
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: i386-randconfig-062-20230919 (https://download.01.org/0day-ci/archive/20230919/202309191508.kUazRL3v-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309191508.kUazRL3v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309191508.kUazRL3v-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/compaction.c:1436:21: sparse: sparse: too long token expansion
>> mm/compaction.c:1436:21: sparse: sparse: too long token expansion
   mm/compaction.c:1532:43: sparse: sparse: too long token expansion
   mm/compaction.c:1532:43: sparse: sparse: too long token expansion
   mm/compaction.c:2511:45: sparse: sparse: too long token expansion
   mm/compaction.c:2511:45: sparse: sparse: too long token expansion

vim +1436 mm/compaction.c

70b44595eafe9c Mel Gorman        2019-03-05  1420  
5a811889de10f1 Mel Gorman        2019-03-05  1421  static void
be21b32afe470c NARIBAYASHI Akira 2022-10-26  1422  fast_isolate_around(struct compact_control *cc, unsigned long pfn)
5a811889de10f1 Mel Gorman        2019-03-05  1423  {
5a811889de10f1 Mel Gorman        2019-03-05  1424  	unsigned long start_pfn, end_pfn;
6e2b7044c19922 Vlastimil Babka   2021-02-24  1425  	struct page *page;
5a811889de10f1 Mel Gorman        2019-03-05  1426  
5a811889de10f1 Mel Gorman        2019-03-05  1427  	/* Do not search around if there are enough pages already */
5a811889de10f1 Mel Gorman        2019-03-05  1428  	if (cc->nr_freepages >= cc->nr_migratepages)
5a811889de10f1 Mel Gorman        2019-03-05  1429  		return;
5a811889de10f1 Mel Gorman        2019-03-05  1430  
5a811889de10f1 Mel Gorman        2019-03-05  1431  	/* Minimise scanning during async compaction */
5a811889de10f1 Mel Gorman        2019-03-05  1432  	if (cc->direct_compaction && cc->mode == MIGRATE_ASYNC)
5a811889de10f1 Mel Gorman        2019-03-05  1433  		return;
5a811889de10f1 Mel Gorman        2019-03-05  1434  
5a811889de10f1 Mel Gorman        2019-03-05  1435  	/* Pageblock boundaries */
6e2b7044c19922 Vlastimil Babka   2021-02-24 @1436  	start_pfn = max(pageblock_start_pfn(pfn), cc->zone->zone_start_pfn);
6e2b7044c19922 Vlastimil Babka   2021-02-24  1437  	end_pfn = min(pageblock_end_pfn(pfn), zone_end_pfn(cc->zone));
6e2b7044c19922 Vlastimil Babka   2021-02-24  1438  
6e2b7044c19922 Vlastimil Babka   2021-02-24  1439  	page = pageblock_pfn_to_page(start_pfn, end_pfn, cc->zone);
6e2b7044c19922 Vlastimil Babka   2021-02-24  1440  	if (!page)
6e2b7044c19922 Vlastimil Babka   2021-02-24  1441  		return;
5a811889de10f1 Mel Gorman        2019-03-05  1442  
4fca9730c51d51 Mel Gorman        2019-03-05  1443  	isolate_freepages_block(cc, &start_pfn, end_pfn, &cc->freepages, 1, false);
5a811889de10f1 Mel Gorman        2019-03-05  1444  
5a811889de10f1 Mel Gorman        2019-03-05  1445  	/* Skip this pageblock in the future as it's full or nearly full */
18c59d58baa60a Kemeng Shi        2023-08-04  1446  	if (start_pfn == end_pfn && !cc->no_set_skip_hint)
5a811889de10f1 Mel Gorman        2019-03-05  1447  		set_pageblock_skip(page);
5a811889de10f1 Mel Gorman        2019-03-05  1448  }
5a811889de10f1 Mel Gorman        2019-03-05  1449  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
