Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C078D3224
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 02:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735266066; cv=none; b=YqaStv4+qwomsc59YXlF8yKu/pWoEZahUPqtuq20lBt0Pci9qXxHkYdTEpUtQunGsBfNdf8pDk56eLzsDt2kyZOysJWJkVXnRFWJokW4R7VU7kSnL2WBNpH/dFTj6Dru6iG0e3Suqnc82ni8atLuMNb10NFaNgX+mnNynTEENOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735266066; c=relaxed/simple;
	bh=zKQ1WpXjuoqsHneTxBR3kQerWMYqOftflqk01k1YiSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=exxmQw0HfCxhBXt0Fm/jZZPQZMbW64e8tbj4SOquCkpaLN/WcT2sdaV3l0ZG94XOMTeN6DH3CiGqBkgumrRVXPsdFbVaQMe6hkDz3SosnbcnmoSdkOvevVfe4el7ihHYhEGlzoeFD9sO3f/wWwh4TXMZ/Xh6GBnJeNlZ9DWwpug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNTe4deE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNTe4deE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735266062; x=1766802062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zKQ1WpXjuoqsHneTxBR3kQerWMYqOftflqk01k1YiSg=;
  b=HNTe4deEq2XvgIVppJkniJP0Zc/i02vmE/W9A4PE9hcw0YRGKIqRqU5b
   +HFxiZ32talXYq3nlqS6hqtwm3KbeWZhxUZmGfoQh9drkqFmHmKzsLDTh
   or+YtdUFbbwX/GwUGIaPgiy9kl0VE+HRqpQH639XSC+Fh5mhMieQn4k4G
   WdCT0qsc45kIJRg+aGnijU2dl9f+GM+tBSyorc3LxRjpHyuj6qWfdk9T6
   Is3Y8XxkCvv+mDvBzvipjsE8jeBtNsRiz5DS232WAcSe28wmWqJwpzQmy
   +GxprDJd4n+782Y9aDX11cQbSX+bYL6oqfR8AOe1fslbe6N9l4H5mnUdJ
   g==;
X-CSE-ConnectionGUID: 0bHXtCQcRAWvHfYQSyBP0Q==
X-CSE-MsgGUID: hIQSdbU/Rz6h7p1EKC+x9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="46171621"
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="46171621"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 18:20:57 -0800
X-CSE-ConnectionGUID: Jiur8m+1Tam+j6fafyc8+Q==
X-CSE-MsgGUID: 4jjya6oMQxO/LqdYtSkKVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105057165"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Dec 2024 18:20:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQzy9-0002us-2F;
	Fri, 27 Dec 2024 02:20:53 +0000
Date: Fri, 27 Dec 2024 10:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android11-kiwi-5.4 410/410] mm/mempolicy.c:1175
 new_page() error: uninitialized symbol 'address'.
Message-ID: <202412271055.vYJA4Eak-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   35ab7830a09d4539593e5485c2bd741a317be77c
commit: 0638dcc7e75fbb766761e7b4694d0f0f141bbbd1 [410/410] treewide: Remove uninitialized_var() usage
:::::: branch date: 10 days ago
:::::: commit date: 1 year, 7 months ago
config: x86_64-randconfig-161-20241217 (https://download.01.org/0day-ci/archive/20241227/202412271055.vYJA4Eak-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412271055.vYJA4Eak-lkp@intel.com/

smatch warnings:
mm/mempolicy.c:1175 new_page() error: uninitialized symbol 'address'.

vim +/address +1175 mm/mempolicy.c

39743889aaf767 Christoph Lameter 2006-01-08  1152  
3ad33b2436b545 Lee Schermerhorn  2007-11-14  1153  /*
3ad33b2436b545 Lee Schermerhorn  2007-11-14  1154   * Allocate a new page for page migration based on vma policy.
d05f0cdcbe6388 Hugh Dickins      2014-06-23  1155   * Start by assuming the page is mapped by the same vma as contains @start.
3ad33b2436b545 Lee Schermerhorn  2007-11-14  1156   * Search forward from there, if not.  N.B., this assumes that the
3ad33b2436b545 Lee Schermerhorn  2007-11-14  1157   * list of pages handed to migrate_pages()--which is how we get here--
3ad33b2436b545 Lee Schermerhorn  2007-11-14  1158   * is in virtual address order.
3ad33b2436b545 Lee Schermerhorn  2007-11-14  1159   */
666feb21a0083e Michal Hocko      2018-04-10  1160  static struct page *new_page(struct page *page, unsigned long start)
95a402c3847cc1 Christoph Lameter 2006-06-23  1161  {
d05f0cdcbe6388 Hugh Dickins      2014-06-23  1162  	struct vm_area_struct *vma;
0638dcc7e75fbb Kees Cook         2020-06-03  1163  	unsigned long address;
95a402c3847cc1 Christoph Lameter 2006-06-23  1164  
d05f0cdcbe6388 Hugh Dickins      2014-06-23  1165  	vma = find_vma(current->mm, start);
3ad33b2436b545 Lee Schermerhorn  2007-11-14  1166  	while (vma) {
3ad33b2436b545 Lee Schermerhorn  2007-11-14  1167  		address = page_address_in_vma(page, vma);
3ad33b2436b545 Lee Schermerhorn  2007-11-14  1168  		if (address != -EFAULT)
3ad33b2436b545 Lee Schermerhorn  2007-11-14  1169  			break;
3ad33b2436b545 Lee Schermerhorn  2007-11-14  1170  		vma = vma->vm_next;
3ad33b2436b545 Lee Schermerhorn  2007-11-14  1171  	}
3ad33b2436b545 Lee Schermerhorn  2007-11-14  1172  
11c731e81bb0d8 Wanpeng Li        2013-12-18  1173  	if (PageHuge(page)) {
389c8178d0904f Michal Hocko      2018-01-31  1174  		return alloc_huge_page_vma(page_hstate(compound_head(page)),
389c8178d0904f Michal Hocko      2018-01-31 @1175  				vma, address);
94723aafb9e764 Michal Hocko      2018-04-10  1176  	} else if (PageTransHuge(page)) {
c8633798497ce8 Naoya Horiguchi   2017-09-08  1177  		struct page *thp;
c8633798497ce8 Naoya Horiguchi   2017-09-08  1178  
19deb7695e072d David Rientjes    2019-09-04  1179  		thp = alloc_hugepage_vma(GFP_TRANSHUGE, vma, address,
19deb7695e072d David Rientjes    2019-09-04  1180  					 HPAGE_PMD_ORDER);
c8633798497ce8 Naoya Horiguchi   2017-09-08  1181  		if (!thp)
c8633798497ce8 Naoya Horiguchi   2017-09-08  1182  			return NULL;
c8633798497ce8 Naoya Horiguchi   2017-09-08  1183  		prep_transhuge_page(thp);
c8633798497ce8 Naoya Horiguchi   2017-09-08  1184  		return thp;
11c731e81bb0d8 Wanpeng Li        2013-12-18  1185  	}
11c731e81bb0d8 Wanpeng Li        2013-12-18  1186  	/*
11c731e81bb0d8 Wanpeng Li        2013-12-18  1187  	 * if !vma, alloc_page_vma() will use task or system default policy
11c731e81bb0d8 Wanpeng Li        2013-12-18  1188  	 */
0f55685627d6dd Michal Hocko      2017-07-12  1189  	return alloc_page_vma(GFP_HIGHUSER_MOVABLE | __GFP_RETRY_MAYFAIL,
0f55685627d6dd Michal Hocko      2017-07-12  1190  			vma, address);
95a402c3847cc1 Christoph Lameter 2006-06-23  1191  }
b20a35035f983f Christoph Lameter 2006-03-22  1192  #else
b20a35035f983f Christoph Lameter 2006-03-22  1193  

:::::: The code at line 1175 was first introduced by commit
:::::: 389c8178d0904f944887ccca2256ff9d79c12e8e hugetlb, mbind: fall back to default policy if vma is NULL

:::::: TO: Michal Hocko <mhocko@suse.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
