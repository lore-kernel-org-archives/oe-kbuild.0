Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6746841C67
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Jun 2024 12:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719663460; cv=none; b=Z8AbCPr1F6cMm/H0/oQtNFmt3ZSv4Ci6rzp5pvlpM5VZZXcUvUUp3s7DM83HRYuD0PjtAHp01MWMT5/C6YTs6GN6KsGifI1W9HvkNd7EZdTMY8GzK3i/e3aKidPwOnVYA9iKakJ3opYTdVQ3480c848tkenKj68ulz8bb5S8E3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719663460; c=relaxed/simple;
	bh=/2KMzvgy6hfgSuLE7Gv/NKXNVks96dbkrsV10uParnA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qw9A44j9p/seGWxe/tu3eD31bf1KNC9BA+6YlTkKK588EFbz8SYkrRVRtMa42qarGa3BAmoX3GXvs40VtNm+etAh0Wzwq5MwHVBRfTtotyZXocZTZGwVDz7BIwYYokwrcoPfzt1LbXBN7GLPrGbiiGzPSPiRWjXk4ghyrKpA9KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EatZdBtf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EatZdBtf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719663459; x=1751199459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/2KMzvgy6hfgSuLE7Gv/NKXNVks96dbkrsV10uParnA=;
  b=EatZdBtf5iQnm97WKvKvYI7FXidcyV7vdAXv2EDezyMa8h6VxEbw/9Ws
   ONNEjPAXcw4qHpHEpt+vYlllsKwP+p1Q9NxKaMXdtDbiaUIy7hSIr5bGW
   bHU6ki4XmDifYx6htl/biGPEviUZwV07rb9mgky2rSiVFgFuDtW1Uw2tX
   lx3GrYeeAdI7U2pBlM+SlgIS7fAeCDskiHOdWiHrYNaWJpPNWofEnvmaR
   tk53oJ69akHaGk/A7lhtYHWMaQLberRrJkqRzCd97xwcolcfiq3EPgD5r
   KmvIw5ZiePK2Bo1r1oYCerrMZRMC7XOkmuZsH+Yc8+DiguGVuZgTEeymD
   Q==;
X-CSE-ConnectionGUID: Aq55/Q9gTNiloySHO6cmGw==
X-CSE-MsgGUID: 8dTgXFvYSu2QDAW6gnK1xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16675199"
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="16675199"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2024 05:17:38 -0700
X-CSE-ConnectionGUID: kh7FQAjlRia7x4Mu3IMlpA==
X-CSE-MsgGUID: jdHz4MWZSdKXG5KLzm0mrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="68217070"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jun 2024 05:17:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNX1K-000JIA-1C;
	Sat, 29 Jun 2024 12:17:34 +0000
Date: Sat, 29 Jun 2024 20:16:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jgunthorpe:iommu_pt 78/78] drivers/iommu/generic_pt/pt_common.h:
 linux/bug.h is included more than once.
Message-ID: <202406291955.HKTLJzAr-lkp@intel.com>
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
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   d0152900e179ac694edd160f2b7c576e57e04205
commit: d0152900e179ac694edd160f2b7c576e57e04205 [78/78] MARK
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406291955.HKTLJzAr-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/iommu/generic_pt/pt_common.h: linux/bug.h is included more than once.

vim +15 drivers/iommu/generic_pt/pt_common.h

    14	
  > 15	#include <linux/bug.h>
    16	#include <linux/log2.h>
    17	#include <linux/count_zeros.h>
    18	#include <linux/limits.h>
    19	#include <linux/errno.h>
    20	
    21	/*
    22	 * Use to mangle symbols so that backtraces and the symbol table are
    23	 * understandable. Any non-inlined function should get mangled like this.
    24	 */
    25	#define NS(fn) CONCATENATE(PTPFX, fn)
    26	
    27	/* Validate the fmt matches the function prototypes */
    28	static inline void *pt_table_ptr(struct pt_state *pts);
    29	static inline pt_oaddr_t pt_entry_oa(struct pt_state *pts);
    30	static inline unsigned int pt_table_item_lg2sz(struct pt_state *pts);
    31	static inline unsigned int pt_entry_num_contig_lg2(struct pt_state *pts);
    32	static inline pt_vaddr_t pt_possible_sizes(struct pt_state *pts);
    33	static inline unsigned int pt_table_memory_lg2sz(struct pt_state *pts);
    34	static inline unsigned int pt_num_entries_lg2(struct pt_state *pts);
    35	static inline void pt_reset(struct pt_state *pts);
    36	static inline enum pt_entry_type pt_load_entry(struct pt_state *pts);
    37	static inline void pt_install_leaf_entry(struct pt_state *pts, pt_oaddr_t pa,
    38						 pt_vaddr_t pgsize,
    39						 struct pt_write_attrs *attrs);
    40	static inline bool pt_install_table_entry(struct pt_state *pts,
    41						  pt_oaddr_t table_pa,
    42						  struct pt_write_attrs *attrs);
    43	static inline void pt_clear_entry(struct pt_state *pts,
    44					  unsigned int num_contig);
    45	
    46	/* Size of a single table entry in bytes */
    47	static inline pt_vaddr_t pt_table_item_size(struct pt_state *pts)
    48	{
    49		return ((pt_vaddr_t)1) << pt_table_item_lg2sz(pts);
    50	}
    51	
    52	/* Amount of OA a valid entry covers */
    53	static inline unsigned int pt_entry_oa_lg2sz(struct pt_state *pts)
    54	{
    55		return pt_entry_num_contig_lg2(pts) + pt_table_item_lg2sz(pts);
    56	}
    57	
    58	
    59	/* Include the sub page bits as well */
    60	static inline pt_oaddr_t pt_entry_oa_full(struct pt_state *pts)
    61	{
    62		return pt_entry_oa(pts) | log2_mod(pts->va, pt_entry_oa_lg2sz(pts));
    63	}
    64	
    65	/* Compute the size of the top table */
    66	static inline unsigned int pt_top_memsize_lg2(struct pt_common *common)
    67	{
    68		struct pt_state pts;
    69	
    70		pts.table = common;
    71		pts.va = pt_first_va(&pts);
    72		pt_reset(&pts);
    73		return pt_num_entries_lg2(&pts) + ilog2(PT_ENTRY_WORD_SIZE);
    74	}
    75	
    76	static inline pt_vaddr_t pt_last_va(struct pt_state *pts)
    77	{
    78		return pt_first_va(pts) | log2_mod(U64_MAX, pt_va_lg2sz(pts));
    79	}
    80	
    81	static inline int pt_check_range(struct pt_state *pts, pt_vaddr_t va,
    82					 pt_vaddr_t len, pt_vaddr_t *last_va)
    83	{
    84		pt_vaddr_t va_lg2sz = pt_va_lg2sz(pts);
    85		pt_vaddr_t va_prefix = log2_div(pt_first_va(pts), va_lg2sz);
    86	
    87		if (len == 0)
    88			return -EINVAL;
    89		if (check_add_overflow(va, len - 1, last_va))
    90			return -EOVERFLOW;
    91		if (log2_div(va, va_lg2sz) != va_prefix ||
    92		    log2_div(*last_va, va_lg2sz) != va_prefix)
    93			return -ERANGE;
    94		return 0;
    95	}
    96	
    97	/*
    98	 * Add entry_size number of entries to pts's VA and index. contig_index_count is
    99	 * the number of contiguous entries for this level. The va will be adjusted to
   100	 * the end of the contiguous block if it is currently in the middle. 1 means a
   101	 * single entry.
   102	 */
   103	static inline void _pt_advance(struct pt_state *pts, pt_vaddr_t entry_size,
   104				       unsigned int index_count_lg2)
   105	{
   106		unsigned int index_count = 1 << index_count_lg2;
   107	
   108		index_count =
   109			((index_count - 1) ^ log2_mod(pts->index, index_count_lg2)) + 1;
   110	
   111		/* FIXME align_down_lg2(va, index_count + isz) + (index << isz) */
   112		// FIXME pts->index = ALIGN(pts->index +1, contig_index_count) ?
   113		pts->index += index_count;
   114		pts->va &= ~(entry_size - 1);
   115		pts->va += entry_size * index_count;
   116	}
   117	
   118	/* True if the current entry is fully enclosed by the range of va to last_va. */
   119	static inline bool pt_entry_fully_covered(struct pt_state *pts,
   120						  pt_vaddr_t last_va)
   121	{
   122		unsigned int num_contig_lg2 = pt_entry_num_contig_lg2(pts);
   123		unsigned int isz_lg2 = pt_table_item_lg2sz(pts);
   124	
   125		/* No sub page offset */
   126		if (log2_mod(pts->va, num_contig_lg2 + isz_lg2))
   127			return false;
   128	
   129		/* last_va falls within this entry */
   130		if (log2_div(pts->va ^ last_va, num_contig_lg2 + isz_lg2) == 0)
   131			return log2_mod(pts->va ^ last_va, num_contig_lg2 + isz_lg2) ==
   132			       log2_mod(U64_MAX, num_contig_lg2 + isz_lg2);
   133		return true;
   134	}
   135	
   136	#define xWALK_PRINTK(name, pts)                                               \
   137		printk(" %s:%u %s level=%u va=%llx -> %llx table=%px index=%u/%u\n", \
   138		       __func__, __LINE__, name, (pts)->level, (pts)->va,            \
   139		       (pts)->last_va, (pts)->tables[(pts)->level], (pts)->index,    \
   140		       (pts)->end_index)
   141	#define WALK_PRINTK(name, pts)
   142	
   143	static inline void _pt_iter_first(struct pt_state *pts,
   144					  unsigned int num_entries_lg2,
   145					  unsigned int isz_lg2)
   146	{
   147		pts->index = log2_mod(log2_div(pts->va, isz_lg2), num_entries_lg2);
   148		if (pts->va == (pts->last_va + 1)) {
   149			pts->end_index = pts->index;
   150			return;
   151		}
   152	
   153		/* last_va falls within this table */
   154		if (log2_div(pts->va ^ pts->last_va, num_entries_lg2 + isz_lg2) ==
   155		    0) {
   156			pts->end_index =
   157				log2_mod(log2_div(pts->last_va, isz_lg2), num_entries_lg2) +
   158				1;
   159			WALK_PRINTK(" e1st", pts);
   160			return;
   161		}
   162		pts->end_index = 1 << num_entries_lg2;
   163		WALK_PRINTK("first", pts);
   164	}
   165	
   166	static inline bool _pt_iter_load(struct pt_state *pts, enum pt_entry_type *type)
   167	{
   168		if (pts->index == pts->end_index)
   169			return false;
   170		*type = pt_load_entry(pts);
   171		return true;
   172	}
   173	
 > 174	#include <linux/bug.h>
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
