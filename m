Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134B13717D
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Oct 2023 17:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MD6c+vzw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698342937; x=1729878937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9PAgJDEzrSBTV4QPOZpTKxq79+GsXk3ckHyeVy6JMIw=;
  b=MD6c+vzwAfz3yDEyxmYFuUbr2sx5IPJcr12RWnbOK44+2hdHfgRj+au6
   Uey7ctxT8A/uIzxqdwHuj5oR+Ng00TKaH8xNRVt9PoER832Wl9Yz+hBrj
   ghCZOJpistnPO//Y7qbC7aICsyZvrXEgaJ1H3uCfG8Vvx/ixdx7nYTTJv
   dX6sdR1JAFQWUPWpqEisdugAH3udsKHl1JNtx1FQKYVFr+33ku0NLmOG5
   PhLUo45nyOFRiYsoB4Bjl8K9n2MCsdrGiaPqIyUTVa9O3ZdiOuK70bKs0
   tWI1FHgoB5MRtS6LC0gUzLLEaDDCAeWHXA8VXNebx51PxYthnhRuoNu6/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="372660390"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="372660390"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 10:55:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="735803477"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="735803477"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Oct 2023 10:55:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw4Zw-000A0l-23;
	Thu, 26 Oct 2023 17:55:32 +0000
Date: Fri, 27 Oct 2023 01:54:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [isilence:zc/veth 1007/1018] io_uring/zc_rx.c:49:61: sparse: sparse:
 shift too big (48) for type unsigned long
Message-ID: <202310270131.sHW8eGjn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: io_uring/zc_rx.c:49:61: sparse: sparse: shift too big (48) for type unsigned long"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Wei <davidhwei@meta.com>

tree:   https://github.com/isilence/linux zc/veth
head:   cff8a226d561bc0db814b65ca5d2c97894d4d1cd
commit: 568ae4bf1dd0e1796a663c6d120199e2f2f52ebb [1007/1018] io_uring: allocate a uarg for freeing zero copy skbs
:::::: branch date: 13 days ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-061-20231026 (https://download.01.org/0day-ci/archive/20231027/202310270131.sHW8eGjn-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310270131.sHW8eGjn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310270131.sHW8eGjn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/zc_rx.c: note: in included file (through io_uring/io_uring.h):
   include/linux/io_uring_types.h:308:48: sparse: sparse: array of flexible structures
   io_uring/zc_rx.c:173:5: sparse: sparse: symbol 'io_zc_rx_create_pool' was not declared. Should it be static?
>> io_uring/zc_rx.c:49:61: sparse: sparse: shift too big (48) for type unsigned long

vim +49 io_uring/zc_rx.c

de4717889914008 David Wei 2023-08-11  46  
568ae4bf1dd0e17 David Wei 2023-08-14  47  static bool is_zc_rx_page(struct page *page)
568ae4bf1dd0e17 David Wei 2023-08-14  48  {
568ae4bf1dd0e17 David Wei 2023-08-14 @49  	return PagePrivate(page) && ((page_private(page) >> 48) == 0xface);
568ae4bf1dd0e17 David Wei 2023-08-14  50  }
568ae4bf1dd0e17 David Wei 2023-08-14  51  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
