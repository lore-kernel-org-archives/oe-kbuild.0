Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8193A16439
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Nov 2023 15:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9Fykh5F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699715945; x=1731251945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m9vV2yvPcjDV2qkoHcJyZg0olvHESrW3MLq8PLLjUNg=;
  b=P9Fykh5FyG1/zCB/RhZiomDDwEH9QzBnzo7Q1/bgL779Gft9E49AgXlL
   g/tM6ilDlJ/4fIGcsVL34Qes5GCGs+SqSIJj04ravWTZWrFcx0xhIEaLL
   zCrSketGEXJ8UBWtohiv3YUAQM6piXWqlhWYHW+/4K1DNhjaYYrCBwVmc
   jacrzHfpOYMTGneKDR+tCH3Vw1wW5WlSsPOk9+NK6jQhU3c0R5VFAMWiC
   TjbK5D7HjNZpzA/MZ12GQTZ4AdWSCiwKWGinH+3+PxmqJed1tv+0ZKXyJ
   zAHPGkbE5z5njzsZdI2WR6zA+1r7afu49mdTNIavFT5sqEG0CPGYNczRr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="375312327"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="375312327"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 07:18:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="767538976"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="767538976"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Nov 2023 07:18:56 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1pl8-000AXM-0r;
	Sat, 11 Nov 2023 15:18:54 +0000
Date: Sat, 11 Nov 2023 23:18:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cilium:pr/ndo_peer3 4/10] net/core/dev.c:10070
 netdev_do_alloc_pcpu_stats() error: uninitialized symbol 'v'.
Message-ID: <202311112310.HvT1O9FQ-lkp@intel.com>
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
CC: Daniel Borkmann <daniel@iogearbox.net>
TO: Daniel Borkmann <daniel@iogearbox.net>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://github.com/cilium/linux.git pr/ndo_peer3
head:   ddb88b96e475adac389f075e464cad705d44cf22
commit: d031867e94675b30ecb39fd71c7428675ff1107a [4/10] net: Move {l,t,d}stats allocation to core and convert veth & vrf
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-141-20231111 (https://download.01.org/0day-ci/archive/20231111/202311112310.HvT1O9FQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311112310.HvT1O9FQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311112310.HvT1O9FQ-lkp@intel.com/

New smatch warnings:
net/core/dev.c:10070 netdev_do_alloc_pcpu_stats() error: uninitialized symbol 'v'.

Old smatch warnings:
net/core/dev.c:10522 netdev_run_todo() warn: passing freed memory 'dev'

vim +/v +10070 net/core/dev.c

a2029240e5836e73 Denys Vlasenko  2015-05-11  10051  
d031867e94675b30 Daniel Borkmann 2023-11-10  10052  static int netdev_do_alloc_pcpu_stats(struct net_device *dev)
d031867e94675b30 Daniel Borkmann 2023-11-10  10053  {
d031867e94675b30 Daniel Borkmann 2023-11-10  10054  	void __percpu *v;
d031867e94675b30 Daniel Borkmann 2023-11-10  10055  
d031867e94675b30 Daniel Borkmann 2023-11-10  10056  	switch (dev->pcpu_stat_type) {
d031867e94675b30 Daniel Borkmann 2023-11-10  10057  	case NETDEV_PCPU_STAT_NONE:
d031867e94675b30 Daniel Borkmann 2023-11-10  10058  		return 0;
d031867e94675b30 Daniel Borkmann 2023-11-10  10059  	case NETDEV_PCPU_STAT_LSTATS:
d031867e94675b30 Daniel Borkmann 2023-11-10  10060  		v = dev->lstats = netdev_alloc_pcpu_stats(struct pcpu_lstats);
d031867e94675b30 Daniel Borkmann 2023-11-10  10061  		break;
d031867e94675b30 Daniel Borkmann 2023-11-10  10062  	case NETDEV_PCPU_STAT_TSTATS:
d031867e94675b30 Daniel Borkmann 2023-11-10  10063  		v = dev->tstats = netdev_alloc_pcpu_stats(struct pcpu_sw_netstats);
d031867e94675b30 Daniel Borkmann 2023-11-10  10064  		break;
d031867e94675b30 Daniel Borkmann 2023-11-10  10065  	case NETDEV_PCPU_STAT_DSTATS:
d031867e94675b30 Daniel Borkmann 2023-11-10  10066  		v = dev->dstats = netdev_alloc_pcpu_stats(struct pcpu_dstats);
d031867e94675b30 Daniel Borkmann 2023-11-10  10067  		break;
d031867e94675b30 Daniel Borkmann 2023-11-10  10068  	}
d031867e94675b30 Daniel Borkmann 2023-11-10  10069  
d031867e94675b30 Daniel Borkmann 2023-11-10 @10070  	return v ? 0 : -ENOMEM;
d031867e94675b30 Daniel Borkmann 2023-11-10  10071  }
d031867e94675b30 Daniel Borkmann 2023-11-10  10072  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
