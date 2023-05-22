Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EC21642B
	for <oe-kbuild@lists.linux.dev>; Mon, 22 May 2023 22:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684793124; x=1716329124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qP7T2qEosGQAzp5GZW21l1T8ISwAfiYmh1/17caMvx4=;
  b=eANt68zHAcJlwN7HcuwBJvGWSV6oKyy+DA8Piyr5RRtWJrfZS9vr8IcG
   tI1uZpRcpVckDERfKDog1Wznr4BcRm8gww7CwyTAuns0KcNQauYd+Sc8W
   h/VT7wV3aBSr3Zvqhggt3Fu6+74OM6Ye1ITNgtFDMVm69NbjhcFgtFm11
   ZxSvjWv7W791MyAScWoZ89H1PqxJea8B0xHvFR8PdS25d/jLkUZKefd6X
   oNO0DOT6Ki60fpvhzeEl5JJI3NXGTxUTXHqjUC1BUeaPFgF0irm10AURm
   i3oudPUwxRZsv1enej+ySpUdJEchtlxhq50fkFip9vpa2Fml43Ht4k0LS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="416520966"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="416520966"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 15:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="768701815"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="768701815"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 May 2023 15:05:22 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q1Deb-000DF2-2T;
	Mon, 22 May 2023 22:05:21 +0000
Date: Tue, 23 May 2023 06:04:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3546/3918] mm/mempolicy.c:1213 new_folio() error:
 uninitialized symbol 'address'.
Message-ID: <202305230521.igOv178S-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Huang, Ying" <ying.huang@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9f258af06b6268be8e960f63c3f66e88bdbbbdb0
commit: 81e5f3e27385bed45263bd46c953545dd25862f0 [3546/3918] mm: convert migrate_pages() to work on folios
:::::: branch date: 18 hours ago
:::::: commit date: 3 days ago
config: ia64-randconfig-m041-20230521 (https://download.01.org/0day-ci/archive/20230523/202305230521.igOv178S-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305230521.igOv178S-lkp@intel.com/

smatch warnings:
mm/mempolicy.c:1213 new_folio() error: uninitialized symbol 'address'.

vim +/address +1213 mm/mempolicy.c

39743889aaf767 Christoph Lameter       2006-01-08  1190  
3ad33b2436b545 Lee Schermerhorn        2007-11-14  1191  /*
3ad33b2436b545 Lee Schermerhorn        2007-11-14  1192   * Allocate a new page for page migration based on vma policy.
d05f0cdcbe6388 Hugh Dickins            2014-06-23  1193   * Start by assuming the page is mapped by the same vma as contains @start.
3ad33b2436b545 Lee Schermerhorn        2007-11-14  1194   * Search forward from there, if not.  N.B., this assumes that the
3ad33b2436b545 Lee Schermerhorn        2007-11-14  1195   * list of pages handed to migrate_pages()--which is how we get here--
3ad33b2436b545 Lee Schermerhorn        2007-11-14  1196   * is in virtual address order.
3ad33b2436b545 Lee Schermerhorn        2007-11-14  1197   */
81e5f3e27385be Matthew Wilcox (Oracle  2023-05-13  1198) static struct folio *new_folio(struct folio *src, unsigned long start)
95a402c3847cc1 Christoph Lameter       2006-06-23  1199  {
d05f0cdcbe6388 Hugh Dickins            2014-06-23  1200  	struct vm_area_struct *vma;
3f649ab728cda8 Kees Cook               2020-06-03  1201  	unsigned long address;
66850be55e8e5f Liam R. Howlett         2022-09-06  1202  	VMA_ITERATOR(vmi, current->mm, start);
ec4858e07ed62e Matthew Wilcox (Oracle  2022-04-04  1203) 	gfp_t gfp = GFP_HIGHUSER_MOVABLE | __GFP_RETRY_MAYFAIL;
95a402c3847cc1 Christoph Lameter       2006-06-23  1204  
66850be55e8e5f Liam R. Howlett         2022-09-06  1205  	for_each_vma(vmi, vma) {
81e5f3e27385be Matthew Wilcox (Oracle  2023-05-13  1206) 		address = page_address_in_vma(&src->page, vma);
3ad33b2436b545 Lee Schermerhorn        2007-11-14  1207  		if (address != -EFAULT)
3ad33b2436b545 Lee Schermerhorn        2007-11-14  1208  			break;
3ad33b2436b545 Lee Schermerhorn        2007-11-14  1209  	}
3ad33b2436b545 Lee Schermerhorn        2007-11-14  1210  
d0ce0e47b323a8 Sidhartha Kumar         2023-01-25  1211  	if (folio_test_hugetlb(src)) {
81e5f3e27385be Matthew Wilcox (Oracle  2023-05-13  1212) 		return alloc_hugetlb_folio_vma(folio_hstate(src),
389c8178d0904f Michal Hocko            2018-01-31 @1213  				vma, address);
d0ce0e47b323a8 Sidhartha Kumar         2023-01-25  1214  	}
c8633798497ce8 Naoya Horiguchi         2017-09-08  1215  
ec4858e07ed62e Matthew Wilcox (Oracle  2022-04-04  1216) 	if (folio_test_large(src))
ec4858e07ed62e Matthew Wilcox (Oracle  2022-04-04  1217) 		gfp = GFP_TRANSHUGE;
ec4858e07ed62e Matthew Wilcox (Oracle  2022-04-04  1218) 
11c731e81bb0d8 Wanpeng Li              2013-12-18  1219  	/*
ec4858e07ed62e Matthew Wilcox (Oracle  2022-04-04  1220) 	 * if !vma, vma_alloc_folio() will use task or system default policy
11c731e81bb0d8 Wanpeng Li              2013-12-18  1221  	 */
81e5f3e27385be Matthew Wilcox (Oracle  2023-05-13  1222) 	return vma_alloc_folio(gfp, folio_order(src), vma, address,
ec4858e07ed62e Matthew Wilcox (Oracle  2022-04-04  1223) 			folio_test_large(src));
95a402c3847cc1 Christoph Lameter       2006-06-23  1224  }
b20a35035f983f Christoph Lameter       2006-03-22  1225  #else
b20a35035f983f Christoph Lameter       2006-03-22  1226  

:::::: The code at line 1213 was first introduced by commit
:::::: 389c8178d0904f944887ccca2256ff9d79c12e8e hugetlb, mbind: fall back to default policy if vma is NULL

:::::: TO: Michal Hocko <mhocko@suse.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
