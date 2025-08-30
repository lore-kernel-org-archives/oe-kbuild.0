Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5641217736
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 05:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756532190; cv=none; b=K5d6PYlxdiPddPuw/Mqkdd0Q3gvgd13+dM4hE+17alR0pngISJ/KSMKl34s1t8rA5Vn5heGlUo/erHm+b0Tpw63377Ig46PcXhnOIr603a+ES9gzLu/dElyF83mLAVUTyaefTkn6ajofhhA1j9ebfICqKkJMSJo9Rql4BnTp6vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756532190; c=relaxed/simple;
	bh=VmI1yWuH5wHG4byZnxFqUw8sQF2cbnaVO3pbWM4LzvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QWHxbZBwbQOiF6EgqF0sB8ms6h1+9VbCJtWRYaekpvIKz1IUGlzd1xxf4Jc+081mGsAqeqSdHhXvxOvtpxQK/kBSdWruFhP6A8/TfGnadZTkJMRqRMcGjAKg/FQRPo/ehzT/8PRCOnQYdsvxo0fWxy7AOTlhkZznYDupGTWd8W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VycC6hEA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VycC6hEA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756532188; x=1788068188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VmI1yWuH5wHG4byZnxFqUw8sQF2cbnaVO3pbWM4LzvY=;
  b=VycC6hEAijWuHV8d0UQnw/6W22C9RbacaVvun0hAR0qNZqVHJo67Nu5s
   dXq/wIHPrZxtxxDQuJOURIUbqcQzLKFMVhkNaSwdRy0y4/dIHV5r7t9F/
   QqlWWWk/yqkqxJ5usLTHFivBNyS/zT+HcklIIwpW8G1R9s2L0vNtmIq6S
   18R6TtvgWr3XrYq0CAx6ZrjULAxAvGWlmVBjfwZOvIicpcTdNBcRjjDFT
   GdafrvGOcUpEvAtyT0/wwTHINm/hokic2+8BsAv2lB/v4v2TSO9Hqmic2
   DWtsbBqy64fgy6Ok5FH11cU4XK20zUFZ3AGqXEQtwPvXyM+ebESMwzuaj
   Q==;
X-CSE-ConnectionGUID: hVJRZ45cSTGJdn6YHPj07Q==
X-CSE-MsgGUID: wNRH85DlQ0qei54xd+gUWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58962741"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58962741"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 22:36:28 -0700
X-CSE-ConnectionGUID: 4nuRa1nBT0mT95xXrt3sAg==
X-CSE-MsgGUID: ISSb7OMIQwiprwi2QSxWoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170067137"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Aug 2025 22:36:26 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usEFs-000VCJ-0J;
	Sat, 30 Aug 2025 05:36:12 +0000
Date: Sat, 30 Aug 2025 13:35:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jgunthorpe:iommu_pt_all 41/56]
 drivers/iommu/generic_pt/fmt/../iommu_pt.h:735 __cut_mapping() warn:
 continue to end of do { ... } while(0); loop
Message-ID: <202508301321.c3GXwQnF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux iommu_pt_all
head:   451e6e58d3fc7e3c1eb9a6d5bfb5d5da4b088133
commit: e3440a4e2ef96292c91a870405399bfcc197e973 [41/56] iommupt: Add cut_mapping op
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: powerpc-randconfig-r072-20250830 (https://download.01.org/0day-ci/archive/20250830/202508301321.c3GXwQnF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ac23f7465eedd0dd565ffb201f573e7a69695fa3)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508301321.c3GXwQnF-lkp@intel.com/

New smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:735 __cut_mapping() warn: continue to end of do { ... } while(0); loop

Old smatch warnings:
drivers/iommu/generic_pt/fmt/../pt_defs.h:224 pt_feature() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../iommu_pt.h:180 pt_iommu_armv7s_iova_to_phys() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:321 armv7s_set_dirty() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:745 __cut_mapping() warn: continue to end of do { ... } while(0); loop
drivers/iommu/generic_pt/fmt/../iommu_pt.h:771 armv7s_cut_mapping() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1054 increase_top() error: uninitialized symbol 'table_mem'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1054 increase_top() error: uninitialized symbol 'new_level'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1003 increase_top() warn: missing unwind goto?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1414 pt_init_common() warn: bitwise AND condition is false here

vim +735 drivers/iommu/generic_pt/fmt/../iommu_pt.h

e3440a4e2ef962 Jason Gunthorpe 2025-04-03  710  
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  711  static int __cut_mapping(struct pt_range *range, void *arg, unsigned int level,
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  712  			 struct pt_table_p *table)
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  713  {
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  714  	struct pt_state pts = pt_init(range, level, table);
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  715  	const struct pt_write_attrs *cut_attrs = arg;
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  716  
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  717  	do {
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  718  		switch (pt_load_single_entry(&pts)) {
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  719  		case PT_ENTRY_EMPTY:
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  720  			return -ENOENT;
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  721  		case PT_ENTRY_TABLE:
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  722  			return pt_descend(&pts, arg, __cut_mapping);
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  723  		case PT_ENTRY_OA: {
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  724  			int ret;
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  725  
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  726  			/* This entry's OA starts at the cut point, all done */
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  727  			if (!log2_mod(range->va, pt_entry_oa_lg2sz(&pts)))
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  728  				return 0;
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  729  
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  730  			/* This is a contiguous entry, split it down */
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  731  			if (pt_entry_num_contig_lg2(&pts) != ilog2(1)) {
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  732  				if (!pts_feature(&pts, PT_FEAT_OA_SIZE_CHANGE))
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  733  					return -EOPNOTSUPP;
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  734  				replace_contiguous_entry(&pts);
e3440a4e2ef962 Jason Gunthorpe 2025-04-03 @735  				continue;
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  736  			}
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  737  
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  738  			/*
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  739  			 * Need to replace an OA with a table. The new table
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  740  			 * will map the same OA as the table item, just with
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  741  			 * smaller granularity.
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  742  			 */
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  743  			ret = replace_cut_table(&pts, cut_attrs);
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  744  			if (ret == -EAGAIN)
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  745  				continue;
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  746  			return ret;
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  747  		}
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  748  		}
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  749  	} while (false);
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  750  	return -ENOENT;
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  751  }
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  752  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
