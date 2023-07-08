Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8279CC121
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Jul 2023 21:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688852317; x=1720388317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Lp11fvArAmgPpk6phj6qThXzDmhSYyLVF7NIyBnGjU=;
  b=Cf6ayDNjF6RIP6ou/XjykCY5/LZZKoqZvsGJbOSirCJtR56Rh+MDUKIG
   4c0iTWHvMBjLdVAxYPejpg2eKKBn8nyvQZP9F3tLz8MKTRw/4PvFXXVLg
   IjmCoL9pOBOH7okU6YMWPSSbK/jzEz2wNeImFz19+y3aoA1SnPkjMGAim
   vPK/us58NDNM1+W7CvCQmnXGg21Jp6Fp3WG0XOc53fIm8Wk6KK97PCoC6
   5qp7iyLeO3APOqSDemjxemJUK95A6+OL96ppGdhdMvJBuzWsWdnFkUhpo
   OvvLU/yh5r+yCoZF7xXjlODQsofegfOZas6ntptXvWh6dUpCv6qYyA/4o
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="394881311"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="394881311"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2023 14:38:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="755555180"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="755555180"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Jul 2023 14:38:35 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIFdS-0002v6-1P;
	Sat, 08 Jul 2023 21:38:34 +0000
Date: Sun, 9 Jul 2023 05:38:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [willy-pagecache:set_ptes 20/38] arch/parisc/kernel/cache.c:383
 flush_icache_pages() warn: potential pointer math issue ('page' is a 288 bit
 pointer)
Message-ID: <202307090536.80ITHgBk-lkp@intel.com>
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
TO: Matthew Wilcox <willy@infradead.org>

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   7fc835f5dab4eda45bb3ccfe31ff21d6bfa39486
commit: fec0c60dfaa0faca021fb8224068a1fd48a573cb [20/38] parisc: Implement the new page table range API
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: parisc-randconfig-m031-20230709 (https://download.01.org/0day-ci/archive/20230709/202307090536.80ITHgBk-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230709/202307090536.80ITHgBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307090536.80ITHgBk-lkp@intel.com/

smatch warnings:
arch/parisc/kernel/cache.c:383 flush_icache_pages() warn: potential pointer math issue ('page' is a 288 bit pointer)

vim +383 arch/parisc/kernel/cache.c

4c5fe5db1ac642 John David Anglin       2018-10-19  372  
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  373) void flush_icache_pages(struct vm_area_struct *vma, struct page *page,
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  374) 		unsigned int nr)
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  375) {
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  376) 	void *kaddr = page_address(page);
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  377) 
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  378) 	for (;;) {
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  379) 		flush_kernel_dcache_page_addr(kaddr);
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  380) 		flush_kernel_icache_page(kaddr);
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  381) 		if (--nr == 0)
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  382) 			break;
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13 @383) 		page += PAGE_SIZE;
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  384) 	}
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  385) }
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  386) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
