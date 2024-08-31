Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE3F12E78
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Aug 2024 14:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725114493; cv=none; b=YrtgtWjNRj6uqWBKedarD/92eiXTgJ58M4UzRS3ycskoUBlb9LaDQHVmE/WESm7yNWvjhiIkJ5rlEgtni/mABxVHrbKSKOfG32RmkUjHiX6TGxc/DBv2ca5rG221yeZGXjIssImdwy9I4+mpE672OHDwZA9UfPMKKkpQz/aqz/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725114493; c=relaxed/simple;
	bh=c8y3JuOBi7FIEILknX1H9CqBDgXNrNm0wQcA5P3VwJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ui79rEbX5ShLgnPOCQk/uxWaXFLo+SKID9YFPJZmVinnfq2DncaS3T3ZkZMtjZ/gCBuHAIyj2rXG4iPdB78H7xdKlnK0ZYFMY1Zrq0tt9B8dSnNmk1uces40Ki9YSMnrn0uCzDNtoA3A+7Eh8XxkMXbklRJbbh5B6Vvf4wiiGhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPP/stvv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPP/stvv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725114491; x=1756650491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c8y3JuOBi7FIEILknX1H9CqBDgXNrNm0wQcA5P3VwJk=;
  b=UPP/stvvdNgn3dQNg5W/JlFmfe9rodM2JFmn7WF3Kyw7PBbpBKJnlZ2e
   0l/7cCWSuAEO+YQmxyHN1AyqAryBP0TEvakbmRWGz+Jj1A5Ar0qsGUKFi
   0kmpsDPHQefqjZSv4lJIE9PIlnsw9S+Ntvva6mzSLCCt9IvVF4sCnR97F
   osCb9nSrUWx23f8JV2DSlHAPDLOjbqAIIvgWKTTvvl4WuyjNtgaRq6VUl
   /PJ3s6UoStiL28GGn5ubPuabGfKQ3yR+8CwWd2NYipkrFf6zQ8E9x3DgK
   hQuZVTK8mf9kOAnZ7g+2u0vo6fAEeKX+IG8nv4OdEakXE846WzboS+C8P
   Q==;
X-CSE-ConnectionGUID: SbTqo9J6TcyTWD1wEKAKvQ==
X-CSE-MsgGUID: MbFcm9mzRSeXs5GP8IRP2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="34316428"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="34316428"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 07:28:09 -0700
X-CSE-ConnectionGUID: 1uirzpQhQrOfXDMLCL91WA==
X-CSE-MsgGUID: 2Hrk6g8jSBuXtTbJdm2ibA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="64666872"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Aug 2024 07:28:08 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skP5C-0002oo-1S;
	Sat, 31 Aug 2024 14:28:06 +0000
Date: Sat, 31 Aug 2024 22:28:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jgunthorpe:iommu_pt 47/47]
 drivers/iommu/generic_pt/kunit_iommu_cmp.h: linux/timekeeping.h is included
 more than once.
Message-ID: <202408312207.ht9iffbD-lkp@intel.com>
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
TO: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   5a40c5df4fb5f5a12ee01c506d5f8585105d2aff
commit: 5a40c5df4fb5f5a12ee01c506d5f8585105d2aff [47/47] iommupt: Add kunit test to benchmark page table operations
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408312207.ht9iffbD-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/iommu/generic_pt/kunit_iommu_cmp.h: linux/timekeeping.h is included more than once.

vim +27 drivers/iommu/generic_pt/kunit_iommu_cmp.h

    25	
    26	/* ktime related definitions */
  > 27	#include <linux/timekeeping.h>
    28	
    29	struct compare_map_timings {
    30		ktime_t map_genpt_ns;
    31		ktime_t map_iopt_ns;
    32	};
    33	
    34	struct compare_unmap_timings {
    35		ktime_t unmap_genpt_ns;
    36		ktime_t unmap_iopt_ns;
    37	};
    38	
    39	struct compare_timings {
    40		struct compare_map_timings map_time;
    41		struct compare_unmap_timings unmap_time;
    42	};
    43	
    44	#endif
    45	
    46	struct compare_tables {
    47		struct kunit *test;
    48		struct pt_range ref_range;
    49		struct pt_table_p *ref_table;
    50	};
    51	
    52	static int __compare_tables(struct pt_range *range, void *arg,
    53				    unsigned int level, struct pt_table_p *table)
    54	{
    55		struct pt_state pts = pt_init(range, level, table);
    56		struct compare_tables *cmp = arg;
    57		struct pt_state ref_pts =
    58			pt_init(&cmp->ref_range, level, cmp->ref_table);
    59		struct kunit *test = cmp->test;
    60		int ret;
    61	
    62		for_each_pt_level_item(&pts) {
    63			u64 entry, ref_entry;
    64	
    65			cmp->ref_range.va = range->va;
    66			ref_pts.index = pts.index;
    67			pt_load_entry(&ref_pts);
    68	
    69			entry = pt_kunit_cmp_mask_entry(&pts);
    70			ref_entry = pt_kunit_cmp_mask_entry(&ref_pts);
    71	
    72			/*if (entry != 0 || ref_entry != 0)
    73				printk("Check %llx Level %u index %u ptr %px refptr %px: %llx (%llx) %llx (%llx)\n",
    74				       pts.range->va, pts.level, pts.index,
    75				       pts.table,
    76				       ref_pts.table,
    77				       pts.entry, entry,
    78				       ref_pts.entry, ref_entry);*/
    79	
    80			KUNIT_ASSERT_EQ(test, pts.type, ref_pts.type);
    81			KUNIT_ASSERT_EQ(test, entry, ref_entry);
    82			if (entry != ref_entry)
    83				return 0;
    84	
    85			if (pts.type == PT_ENTRY_TABLE) {
    86				cmp->ref_table = ref_pts.table_lower;
    87				ret = pt_descend(&pts, arg, __compare_tables);
    88				if (ret)
    89					return ret;
    90			}
    91	
    92			/* Defeat contiguous entry aggregation */
    93			pts.type = PT_ENTRY_EMPTY;
    94		}
    95	
    96		return 0;
    97	}
    98	
    99	static void compare_tables(struct kunit *test)
   100	{
   101		struct kunit_iommu_cmp_priv *cmp_priv = test->priv;
   102		struct kunit_iommu_priv *priv = &cmp_priv->fmt;
   103		struct pt_range range = pt_top_range(priv->common);
   104		struct compare_tables cmp = {
   105			.test = test,
   106		};
   107		struct pt_state pts = pt_init_top(&range);
   108		struct pt_state ref_pts;
   109	
   110		pt_iommu_setup_ref_table(&cmp_priv->ref_table, cmp_priv->pgtbl_ops);
   111		cmp.ref_range =
   112			pt_top_range(common_from_iommu(&cmp_priv->ref_table.iommu));
   113		ref_pts = pt_init_top(&cmp.ref_range);
   114		KUNIT_ASSERT_EQ(test, pts.level, ref_pts.level);
   115	
   116		cmp.ref_table = ref_pts.table;
   117		KUNIT_ASSERT_EQ(test, pt_walk_range(&range, __compare_tables, &cmp), 0);
   118	}
   119	
   120	static void test_cmp_init(struct kunit *test)
   121	{
   122		struct kunit_iommu_cmp_priv *cmp_priv = test->priv;
   123		struct kunit_iommu_priv *priv = &cmp_priv->fmt;
   124		struct io_pgtable_cfg *pgtbl_cfg =
   125			&io_pgtable_ops_to_pgtable(cmp_priv->pgtbl_ops)->cfg;
   126	
   127		/* Fixture does the setup */
   128		KUNIT_ASSERT_NE(test, priv->info.pgsize_bitmap, 0);
   129	
   130		/* pt_iommu has a superset of page sizes (ARM supports contiguous) */
   131		KUNIT_ASSERT_EQ(test,
   132				priv->info.pgsize_bitmap & pgtbl_cfg->pgsize_bitmap,
   133				pgtbl_cfg->pgsize_bitmap);
   134	
   135		/* Empty compare works */
   136		compare_tables(test);
   137	}
   138	
   139	static void do_cmp_map(struct kunit *test, pt_vaddr_t va, pt_oaddr_t pa,
   140			       pt_oaddr_t len, unsigned int prot)
   141	{
   142		struct kunit_iommu_cmp_priv *cmp_priv = test->priv;
   143		struct kunit_iommu_priv *priv = &cmp_priv->fmt;
   144		const struct pt_iommu_ops *ops = priv->iommu->ops;
   145		size_t mapped;
   146		int ret;
   147	
   148		/* This lacks pagination, must call with perfectly aligned everything */
   149		if (sizeof(unsigned long) == 8) {
   150			KUNIT_ASSERT_EQ(test, va % len, 0);
   151			KUNIT_ASSERT_EQ(test, pa % len, 0);
   152		}
   153	
   154		mapped = 0;
   155		ret = ops->map_pages(priv->iommu, va, pa, len, prot, GFP_KERNEL,
   156				     &mapped, NULL);
   157		KUNIT_ASSERT_EQ(test, ret, 0);
   158		KUNIT_ASSERT_EQ(test, mapped, len);
   159	
   160		mapped = 0;
   161		ret = cmp_priv->pgtbl_ops->map_pages(cmp_priv->pgtbl_ops, va, pa, len,
   162						     1, prot, GFP_KERNEL, &mapped);
   163		KUNIT_ASSERT_EQ(test, ret, 0);
   164		KUNIT_ASSERT_EQ(test, mapped, len);
   165	}
   166	
   167	static void do_cmp_unmap(struct kunit *test, pt_vaddr_t va, pt_vaddr_t len)
   168	{
   169		struct kunit_iommu_cmp_priv *cmp_priv = test->priv;
   170		struct kunit_iommu_priv *priv = &cmp_priv->fmt;
   171		const struct pt_iommu_ops *ops = priv->iommu->ops;
   172		size_t ret;
   173	
   174		KUNIT_ASSERT_EQ(test, va % len, 0);
   175	
   176		ret = ops->unmap_pages(priv->iommu, va, len, NULL);
   177		KUNIT_ASSERT_EQ(test, ret, len);
   178		ret = cmp_priv->pgtbl_ops->unmap_pages(cmp_priv->pgtbl_ops, va, len, 1,
   179						       NULL);
   180		KUNIT_ASSERT_EQ(test, ret, len);
   181	}
   182	
   183	#if IS_ENABLED(CONFIG_IOMMU_PT_KUNIT_BENCHMARK)
   184	
 > 185	#include <linux/timekeeping.h>
   186	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
