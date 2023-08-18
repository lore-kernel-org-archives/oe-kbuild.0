Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CA2812
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Aug 2023 05:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692337859; x=1723873859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KfgC4i8IdJ6tJCIawHFAY6pjZFOSC212D8fekSnnJXY=;
  b=UokkkyhIOST5ZokcJ89y/+e0mjmVdWStL7J4sW8/oeUVxOtvdxalkIpt
   +fLm0tKsEmwJnh9/T/XLfs3n5SV6Ng5JU8SQhQDXvY409xYoMPJXJFBhI
   XBAxLt3Hx6RnFuIDn/Z+q5AuiGu9OB/MGyWGDONN6zOjwTvNTUoFDmVd5
   bmwQ9lK2q8TgAYYhm8H7ICI8Ei1kJ/gP8wPgYtRjgArtHVIrjm4Ivphu9
   RsRY9Pp7USH7QMlIhGz8IiFZcj4KZBZbtgnCSEtuAaM4kCtg18LvOok6s
   TtAO3YTDE8bDWz29wNyU6sKvdGRh+MjJUx2zQMbdX4lwlBGAdB55ERE2u
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="459374292"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="459374292"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 22:50:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="981511421"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="981511421"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Aug 2023 22:50:56 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWsN5-00029I-1n;
	Fri, 18 Aug 2023 05:50:10 +0000
Date: Fri, 18 Aug 2023 13:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC v3] mm: Proper document tail pages fields for folio
Message-ID: <202308181323.AdR1xgvN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/mm_types.h:440:1: sparse: sparse: static assertion failed: "offsetof(struct folio, _mapcount_1) == offsetof(struct page, _mapcount) + sizeof(struct page)""
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230815212547.431693-1-peterx@redhat.com>
References: <20230815212547.431693-1-peterx@redhat.com>
TO: Peter Xu <peterx@redhat.com>

Hi Peter,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5-rc6 next-20230817]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Xu/mm-Proper-document-tail-pages-fields-for-folio/20230816-052726
base:   linus/master
patch link:    https://lore.kernel.org/r/20230815212547.431693-1-peterx%40redhat.com
patch subject: [PATCH RFC v3] mm: Proper document tail pages fields for folio
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: mips-randconfig-r073-20230818 (https://download.01.org/0day-ci/archive/20230818/202308181323.AdR1xgvN-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181323.AdR1xgvN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308181323.AdR1xgvN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __STDC_HOSTED__ redefined
   builtin:0:0: sparse: this was the original definition
   command-line: note: in included file (through arch/mips/include/asm/vdso.h, arch/mips/include/asm/vdso/vdso.h, arch/mips/include/asm/vdso/gettimeofday.h, ...):
>> include/linux/mm_types.h:440:1: sparse: sparse: static assertion failed: "offsetof(struct folio, _mapcount_1) == offsetof(struct page, _mapcount) + sizeof(struct page)"
>> include/linux/mm_types.h:441:1: sparse: sparse: static assertion failed: "offsetof(struct folio, _refcount_1) == offsetof(struct page, _refcount) + sizeof(struct page)"
>> include/linux/mm_types.h:452:1: sparse: sparse: static assertion failed: "offsetof(struct folio, _mapcount_2a) == offsetof(struct page, _mapcount) + 2 * sizeof(struct page)"
>> include/linux/mm_types.h:453:1: sparse: sparse: static assertion failed: "offsetof(struct folio, _refcount_2a) == offsetof(struct page, _refcount) + 2 * sizeof(struct page)"
   command-line: note: in included file (through builtin):
   lib/vdso/gettimeofday.c:282:24: sparse: sparse: undefined identifier 'clock_gettime32_fallback'
   lib/vdso/gettimeofday.c:425:24: sparse: sparse: undefined identifier 'clock_getres32_fallback'

vim +440 include/linux/mm_types.h

7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  417) 
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  418) #define FOLIO_MATCH(pg, fl)						\
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  419) 	static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  420) FOLIO_MATCH(flags, flags);
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  421) FOLIO_MATCH(lru, lru);
536f4217ced62b Wei Yang                2022-01-29  422  FOLIO_MATCH(mapping, mapping);
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  423) FOLIO_MATCH(compound_head, lru);
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  424) FOLIO_MATCH(index, index);
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  425) FOLIO_MATCH(private, private);
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  426) FOLIO_MATCH(_mapcount, _mapcount);
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  427) FOLIO_MATCH(_refcount, _refcount);
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  428) #ifdef CONFIG_MEMCG
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  429) FOLIO_MATCH(memcg_data, memcg_data);
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  430) #endif
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  431) #undef FOLIO_MATCH
379708ffde1b04 Matthew Wilcox (Oracle  2022-09-02  432) #define FOLIO_MATCH(pg, fl)						\
379708ffde1b04 Matthew Wilcox (Oracle  2022-09-02  433) 	static_assert(offsetof(struct folio, fl) ==			\
379708ffde1b04 Matthew Wilcox (Oracle  2022-09-02  434) 			offsetof(struct page, pg) + sizeof(struct page))
379708ffde1b04 Matthew Wilcox (Oracle  2022-09-02  435) FOLIO_MATCH(flags, _flags_1);
dad6a5eb555648 Hugh Dickins            2022-11-02  436  FOLIO_MATCH(compound_head, _head_1);
2a678a0821365b Peter Xu                2023-08-15  437  #ifdef CONFIG_64BIT
2a678a0821365b Peter Xu                2023-08-15  438  FOLIO_MATCH(private, _private_1);
2a678a0821365b Peter Xu                2023-08-15  439  #endif
2a678a0821365b Peter Xu                2023-08-15 @440  FOLIO_MATCH(_mapcount, _mapcount_1);
2a678a0821365b Peter Xu                2023-08-15 @441  FOLIO_MATCH(_refcount, _refcount_1);
379708ffde1b04 Matthew Wilcox (Oracle  2022-09-02  442) #undef FOLIO_MATCH
dad6a5eb555648 Hugh Dickins            2022-11-02  443  #define FOLIO_MATCH(pg, fl)						\
dad6a5eb555648 Hugh Dickins            2022-11-02  444  	static_assert(offsetof(struct folio, fl) ==			\
dad6a5eb555648 Hugh Dickins            2022-11-02  445  			offsetof(struct page, pg) + 2 * sizeof(struct page))
dad6a5eb555648 Hugh Dickins            2022-11-02  446  FOLIO_MATCH(flags, _flags_2);
dad6a5eb555648 Hugh Dickins            2022-11-02  447  FOLIO_MATCH(compound_head, _head_2);
2a678a0821365b Peter Xu                2023-08-15  448  FOLIO_MATCH(_mapcount, _mapcount_2);
2a678a0821365b Peter Xu                2023-08-15  449  FOLIO_MATCH(_refcount, _refcount_2);
2a678a0821365b Peter Xu                2023-08-15  450  FOLIO_MATCH(flags, _flags_2a);
2a678a0821365b Peter Xu                2023-08-15  451  FOLIO_MATCH(compound_head, _head_2a);
2a678a0821365b Peter Xu                2023-08-15 @452  FOLIO_MATCH(_mapcount, _mapcount_2a);
2a678a0821365b Peter Xu                2023-08-15 @453  FOLIO_MATCH(_refcount, _refcount_2a);
2a678a0821365b Peter Xu                2023-08-15  454  #ifdef CONFIG_64BIT
2a678a0821365b Peter Xu                2023-08-15  455  FOLIO_MATCH(private, _private_2a);
2a678a0821365b Peter Xu                2023-08-15  456  #endif
dad6a5eb555648 Hugh Dickins            2022-11-02  457  #undef FOLIO_MATCH
7b230db3b8d373 Matthew Wilcox (Oracle  2020-12-06  458) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
