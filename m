Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5B1347A2
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 10:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CHOSVe/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700563134; x=1732099134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/MxblS7I93WUK15pPY5V0p5YTlM8atWhrpI6HXL8vkc=;
  b=CHOSVe/4BBqfSB2IyN62Jmp8ek39jsS3elqQAaMk2yvz8aHSsO2rpNqg
   cWDEeHaIrRoFSGbCvqHAoOkd+SOVxJ2hvAELrKJLAUXSYSEhPQLgGrlEU
   wTDhCK8MToTl7qEyYN1HW8Jl+5z7FQcTN1XMNhMrsHwn5N3X0WpMGk8Mg
   sG5bhPcY8xMHFBtUpEiwY6S14dsFkhnZDtuB2j4svA79XWOr5qyYyLd3d
   a8AazTfSutnorMPrV457QM2Dj8AXHJTCjONXjNfwrLCcY7tVplLE3yfeT
   bTvPsvPSGxZQ4ly80F91VfPXWsf03OowCiV/s3n08xgRobjVxObxrTdrm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="391589766"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="391589766"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 02:38:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="743002907"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="743002907"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Nov 2023 02:38:35 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5O9F-0007h4-1T;
	Tue, 21 Nov 2023 10:38:31 +0000
Date: Tue, 21 Nov 2023 18:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v2 09/15] net: page_pool: implement GET in the
 netlink API
Message-ID: <202311211802.zhmXaacc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/core/netdev-genl-gen.c:16:19: sparse: sparse: decimal constant 4294967295 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231121000048.789613-10-kuba@kernel.org>
References: <20231121000048.789613-10-kuba@kernel.org>
TO: Jakub Kicinski <kuba@kernel.org>
TO: davem@davemloft.net
CC: netdev@vger.kernel.org
CC: edumazet@google.com
CC: pabeni@redhat.com
CC: almasrymina@google.com
CC: hawk@kernel.org
CC: ilias.apalodimas@linaro.org
CC: dsahern@gmail.com
CC: dtatulea@nvidia.com
CC: Jakub Kicinski <kuba@kernel.org>

Hi Jakub,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Kicinski/net-page_pool-split-the-page_pool_params-into-fast-and-slow/20231121-092240
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231121000048.789613-10-kuba%40kernel.org
patch subject: [PATCH net-next v2 09/15] net: page_pool: implement GET in the netlink API
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-061-20231121 (https://download.01.org/0day-ci/archive/20231121/202311211802.zhmXaacc-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211802.zhmXaacc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311211802.zhmXaacc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/netdev-genl-gen.c:16:19: sparse: sparse: decimal constant 4294967295 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here

vim +16 net/core/netdev-genl-gen.c

d3d854fd6a1d97 Jakub Kicinski 2023-02-01  12  
d4fc6a14e941e3 Jakub Kicinski 2023-11-20  13  /* Integer value ranges */
d4fc6a14e941e3 Jakub Kicinski 2023-11-20  14  static const struct netlink_range_validation netdev_a_page_pool_id_range = {
d4fc6a14e941e3 Jakub Kicinski 2023-11-20  15  	.min	= 1,
d4fc6a14e941e3 Jakub Kicinski 2023-11-20 @16  	.max	= 4294967295,
d4fc6a14e941e3 Jakub Kicinski 2023-11-20  17  };
d4fc6a14e941e3 Jakub Kicinski 2023-11-20  18  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
