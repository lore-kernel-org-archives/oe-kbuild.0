Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E094568A
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Mar 2023 22:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679781744; x=1711317744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LKKMcjJ1kht76GjQdHKyFVZF/AMeD2Qkp5XQYWkQfJc=;
  b=g27+4QWw2rjlLOR4ZO3a7I3CSpTwOJnYGfOBt9B/Z9SynQ6uIRxkp+0B
   skhNKfkYBNlyvWL89zHuXpiIBF4ivrR2nz30Su2BmdAvyQ2IN6XoPcHXK
   GN+yTKZkHasNYJB5GDMjcyTOvRHFH5fz20PT1gLNpQW15U9TMSCMfNTzo
   pDIw5f03ndd69ZrXOeINNVA95erikEW60FM/02lhsdJywEpdvYsCGVb8c
   TPTFIfSFh3s3+uAHW3z0yltllISRX17od79Wp36ITylkXK3kzQ5EMGvty
   EJtnayrwYDftT7QiPeUKCdeCHd0YoxwGIGjvIYnJ3+TV99kRXWBf2PUku
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="426276913"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="426276913"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 15:02:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="660443211"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="660443211"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 25 Mar 2023 15:02:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgBxr-000GgV-2w;
	Sat, 25 Mar 2023 22:02:19 +0000
Date: Sun, 26 Mar 2023 06:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/sgi/ioc3-eth.c:1017:59: sparse: sparse:
 incorrect type in argument 5 (different base types)
Message-ID: <202303260548.Bs8zMiwH-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Maciej W. Rozycki" <macro@orcam.me.uk>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   da8e7da11e4ba758caf4c149cc8d8cd555aefe5f
commit: 84aa85108b1b8af0d1d310e76975f421c5975e66 MIPS: Rewrite `csum_tcpudp_nofold' in plain C
date:   10 months ago
:::::: branch date: 81 minutes ago
:::::: commit date: 10 months ago
config: mips-randconfig-s042-20230326 (https://download.01.org/0day-ci/archive/20230326/202303260548.Bs8zMiwH-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=84aa85108b1b8af0d1d310e76975f421c5975e66
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 84aa85108b1b8af0d1d310e76975f421c5975e66
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips SHELL=/bin/bash drivers/net/ethernet/sgi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303260548.Bs8zMiwH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/sgi/ioc3-eth.c:1247:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1247:35: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:1247:35: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:1248:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1248:24: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:1248:24: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:1251:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1251:35: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:1251:35: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:1252:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1252:24: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:1252:24: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:1269:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1269:37: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:1269:37: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:1270:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1270:37: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:1270:37: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:999:35: sparse: sparse: cast to restricted __be16
   drivers/net/ethernet/sgi/ioc3-eth.c:1016:45: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/sgi/ioc3-eth.c:1017:60: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __wsum [usertype] csum @@     got unsigned int [assigned] [usertype] ehsum @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1017:60: sparse:     expected restricted __wsum [usertype] csum
   drivers/net/ethernet/sgi/ioc3-eth.c:1017:60: sparse:     got unsigned int [assigned] [usertype] ehsum
>> drivers/net/ethernet/sgi/ioc3-eth.c:1017:59: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected restricted __wsum [usertype] isum @@     got restricted __sum16 @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1017:59: sparse:     expected restricted __wsum [usertype] isum
   drivers/net/ethernet/sgi/ioc3-eth.c:1017:59: sparse:     got restricted __sum16
   drivers/net/ethernet/sgi/ioc3-eth.c:1015:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] csum @@     got restricted __wsum @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1015:22: sparse:     expected unsigned int [usertype] csum
   drivers/net/ethernet/sgi/ioc3-eth.c:1015:22: sparse:     got restricted __wsum
   drivers/net/ethernet/sgi/ioc3-eth.c:1025:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __sum16 [usertype] check @@     got unsigned int [assigned] [usertype] csum @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1025:45: sparse:     expected restricted __sum16 [usertype] check
   drivers/net/ethernet/sgi/ioc3-eth.c:1025:45: sparse:     got unsigned int [assigned] [usertype] csum
   drivers/net/ethernet/sgi/ioc3-eth.c:1029:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __sum16 [usertype] check @@     got unsigned int [assigned] [usertype] csum @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1029:45: sparse:     expected restricted __sum16 [usertype] check
   drivers/net/ethernet/sgi/ioc3-eth.c:1029:45: sparse:     got unsigned int [assigned] [usertype] csum
   drivers/net/ethernet/sgi/ioc3-eth.c:1051:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] cmd @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1051:27: sparse:     expected unsigned int [usertype] cmd
   drivers/net/ethernet/sgi/ioc3-eth.c:1051:27: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/sgi/ioc3-eth.c:1052:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] bufcnt @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1052:30: sparse:     expected unsigned int [usertype] bufcnt
   drivers/net/ethernet/sgi/ioc3-eth.c:1052:30: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/sgi/ioc3-eth.c:1059:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] cmd @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1059:30: sparse:     expected unsigned int [usertype] cmd
   drivers/net/ethernet/sgi/ioc3-eth.c:1059:30: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/sgi/ioc3-eth.c:1061:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] bufcnt @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1061:30: sparse:     expected unsigned int [usertype] bufcnt
   drivers/net/ethernet/sgi/ioc3-eth.c:1061:30: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/sgi/ioc3-eth.c:1071:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] p1 @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1071:30: sparse:     expected unsigned long long [usertype] p1
   drivers/net/ethernet/sgi/ioc3-eth.c:1071:30: sparse:     got restricted __be64 [usertype]
   drivers/net/ethernet/sgi/ioc3-eth.c:1072:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] p2 @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1072:30: sparse:     expected unsigned long long [usertype] p2
   drivers/net/ethernet/sgi/ioc3-eth.c:1072:30: sparse:     got restricted __be64 [usertype]
   drivers/net/ethernet/sgi/ioc3-eth.c:1077:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] cmd @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1077:27: sparse:     expected unsigned int [usertype] cmd
   drivers/net/ethernet/sgi/ioc3-eth.c:1077:27: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/sgi/ioc3-eth.c:1078:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] bufcnt @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1078:30: sparse:     expected unsigned int [usertype] bufcnt
   drivers/net/ethernet/sgi/ioc3-eth.c:1078:30: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/sgi/ioc3-eth.c:1082:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] p1 @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1082:30: sparse:     expected unsigned long long [usertype] p1
   drivers/net/ethernet/sgi/ioc3-eth.c:1082:30: sparse:     got restricted __be64 [usertype]
   drivers/net/ethernet/sgi/ioc3-eth.c:1090:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:1090:33: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:1090:33: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:747:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:747:29: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:747:29: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:748:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:748:36: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:748:36: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:749:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:749:33: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:749:33: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:750:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:750:47: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:750:47: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:757:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:757:29: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:757:29: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:758:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:758:36: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:758:36: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:759:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:759:33: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:759:33: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:760:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:760:33: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:760:33: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:761:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:761:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:761:16: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:765:27: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:765:27: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:765:27: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:768:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:768:50: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:768:50: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:769:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:769:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:769:16: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:723:27: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:723:27: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:723:27: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:724:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:724:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:724:16: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:726:20: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:726:20: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:726:20: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:727:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:727:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:727:16: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:730:28: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:730:28: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:730:28: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:731:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:731:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:731:16: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:732:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:732:21: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/net/ethernet/sgi/ioc3-eth.c:732:21: sparse:     got unsigned int *
   drivers/net/ethernet/sgi/ioc3-eth.c:733:20: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/net/ethernet/sgi/ioc3-eth.c:733:20: sparse:     expected void volatile [noderef] __iomem *mem

vim +1017 drivers/net/ethernet/sgi/ioc3-eth.c

^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16   979  
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16   980  
28d304efb88f18 drivers/net/ethernet/sgi/ioc3-eth.c YueHaibing               2018-09-21   981  static netdev_tx_t ioc3_start_xmit(struct sk_buff *skb, struct net_device *dev)
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16   982  {
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16   983  	struct ioc3_private *ip = netdev_priv(dev);
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16   984  	struct ioc3_etxd *desc;
cbe7d51745f933 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30   985  	unsigned long data;
cbe7d51745f933 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30   986  	unsigned int len;
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16   987  	int produce;
c1b6a3d85d3f2a drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30   988  	u32 w0 = 0;
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16   989  
c1b6a3d85d3f2a drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30   990  	/* IOC3 has a fairly simple minded checksumming hardware which simply
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16   991  	 * adds up the 1's complement checksum for the entire packet and
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16   992  	 * inserts it at an offset which can be specified in the descriptor
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16   993  	 * into the transmit packet.  This means we have to compensate for the
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16   994  	 * MAC header which should not be summed and the TCP/UDP pseudo headers
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16   995  	 * manually.
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16   996  	 */
84fa7933a33f80 drivers/net/ioc3-eth.c              Patrick McHardy          2006-08-29   997  	if (skb->ip_summed == CHECKSUM_PARTIAL) {
eddc9ec53be2ec drivers/net/ioc3-eth.c              Arnaldo Carvalho de Melo 2007-04-20   998  		const struct iphdr *ih = ip_hdr(skb);
eddc9ec53be2ec drivers/net/ioc3-eth.c              Arnaldo Carvalho de Melo 2007-04-20   999  		const int proto = ntohs(ih->protocol);
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1000  		unsigned int csoff;
c1b6a3d85d3f2a drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1001  		u32 csum, ehsum;
c1b6a3d85d3f2a drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1002  		u16 *eh;
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1003  
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1004  		/* The MAC header.  skb->mac seem the logic approach
c1b6a3d85d3f2a drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1005  		 * to find the MAC header - except it's a NULL pointer ...
c1b6a3d85d3f2a drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1006  		 */
c1b6a3d85d3f2a drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1007  		eh = (u16 *)skb->data;
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1008  
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1009  		/* Sum up dest addr, src addr and protocol  */
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1010  		ehsum = eh[0] + eh[1] + eh[2] + eh[3] + eh[4] + eh[5] + eh[6];
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1011  
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1012  		/* Skip IP header; it's sum is always zero and was
c1b6a3d85d3f2a drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1013  		 * already filled in by ip_output.c
c1b6a3d85d3f2a drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1014  		 */
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1015  		csum = csum_tcpudp_nofold(ih->saddr, ih->daddr,
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1016  					  ih->tot_len - (ih->ihl << 2),
8dff19a6dcb8bc drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30 @1017  					  proto, csum_fold(ehsum));
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1018  
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1019  		csum = (csum & 0xffff) + (csum >> 16);	/* Fold again */
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1020  		csum = (csum & 0xffff) + (csum >> 16);
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1021  
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1022  		csoff = ETH_HLEN + (ih->ihl << 2);
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1023  		if (proto == IPPROTO_UDP) {
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1024  			csoff += offsetof(struct udphdr, check);
4bedb45203eab9 drivers/net/ioc3-eth.c              Arnaldo Carvalho de Melo 2007-03-13  1025  			udp_hdr(skb)->check = csum;
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1026  		}
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1027  		if (proto == IPPROTO_TCP) {
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1028  			csoff += offsetof(struct tcphdr, check);
aa8223c7bb0b05 drivers/net/ioc3-eth.c              Arnaldo Carvalho de Melo 2007-04-10  1029  			tcp_hdr(skb)->check = csum;
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1030  		}
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1031  
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1032  		w0 = ETXD_DOCHECKSUM | (csoff << ETXD_CHKOFF_SHIFT);
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1033  	}
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1034  
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1035  	spin_lock_irq(&ip->ioc3_lock);
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1036  
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1037  	data = (unsigned long)skb->data;
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1038  	len = skb->len;
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1039  
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1040  	produce = ip->tx_pi;
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1041  	desc = &ip->txr[produce];
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1042  
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1043  	if (len <= 104) {
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1044  		/* Short packet, let's copy it directly into the ring.  */
d626f62b11e00c drivers/net/ioc3-eth.c              Arnaldo Carvalho de Melo 2007-03-27  1045  		skb_copy_from_linear_data(skb, desc->data, skb->len);
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1046  		if (len < ETH_ZLEN) {
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1047  			/* Very short packet, pad with zeros at the end. */
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1048  			memset(desc->data + len, 0, ETH_ZLEN - len);
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1049  			len = ETH_ZLEN;
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1050  		}
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1051  		desc->cmd = cpu_to_be32(len | ETXD_INTWHENDONE | ETXD_D0V | w0);
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1052  		desc->bufcnt = cpu_to_be32(len);
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1053  	} else if ((data ^ (data + len - 1)) & 0x4000) {
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1054  		unsigned long b2 = (data | 0x3fffUL) + 1UL;
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1055  		unsigned long s1 = b2 - data;
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1056  		unsigned long s2 = data + len - b2;
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1057  		dma_addr_t d1, d2;
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1058  
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1059  		desc->cmd    = cpu_to_be32(len | ETXD_INTWHENDONE |
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1060  					   ETXD_B1V | ETXD_B2V | w0);
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1061  		desc->bufcnt = cpu_to_be32((s1 << ETXD_B1CNT_SHIFT) |
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1062  					   (s2 << ETXD_B2CNT_SHIFT));
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1063  		d1 = dma_map_single(ip->dma_dev, skb->data, s1, DMA_TO_DEVICE);
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1064  		if (dma_mapping_error(ip->dma_dev, d1))
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1065  			goto drop_packet;
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1066  		d2 = dma_map_single(ip->dma_dev, (void *)b2, s1, DMA_TO_DEVICE);
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1067  		if (dma_mapping_error(ip->dma_dev, d2)) {
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1068  			dma_unmap_single(ip->dma_dev, d1, len, DMA_TO_DEVICE);
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1069  			goto drop_packet;
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1070  		}
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1071  		desc->p1     = cpu_to_be64(ioc3_map(d1, PCI64_ATTR_PREF));
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1072  		desc->p2     = cpu_to_be64(ioc3_map(d2, PCI64_ATTR_PREF));
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1073  	} else {
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1074  		dma_addr_t d;
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1075  
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1076  		/* Normal sized packet that doesn't cross a page boundary. */
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1077  		desc->cmd = cpu_to_be32(len | ETXD_INTWHENDONE | ETXD_B1V | w0);
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1078  		desc->bufcnt = cpu_to_be32(len << ETXD_B1CNT_SHIFT);
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1079  		d = dma_map_single(ip->dma_dev, skb->data, len, DMA_TO_DEVICE);
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1080  		if (dma_mapping_error(ip->dma_dev, d))
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1081  			goto drop_packet;
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1082  		desc->p1     = cpu_to_be64(ioc3_map(d, PCI64_ATTR_PREF));
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1083  	}
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1084  
c1b6a3d85d3f2a drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1085  	mb(); /* make sure all descriptor changes are visible */
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1086  
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1087  	ip->tx_skbs[produce] = skb;			/* Remember skb */
141a7dbb886f39 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1088  	produce = (produce + 1) & TX_RING_MASK;
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1089  	ip->tx_pi = produce;
cbe7d51745f933 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1090  	writel(produce << 7, &ip->regs->etpir);		/* Fire ... */
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1091  
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1092  	ip->txqlen++;
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1093  
141a7dbb886f39 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1094  	if (ip->txqlen >= (TX_RING_ENTRIES - 1))
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1095  		netif_stop_queue(dev);
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1096  
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1097  	spin_unlock_irq(&ip->ioc3_lock);
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1098  
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1099  	return NETDEV_TX_OK;
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1100  
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1101  drop_packet:
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1102  	dev_kfree_skb_any(skb);
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1103  	dev->stats.tx_dropped++;
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1104  
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1105  	spin_unlock_irq(&ip->ioc3_lock);
ed870f6a7aa212 drivers/net/ethernet/sgi/ioc3-eth.c Thomas Bogendoerfer      2019-08-30  1106  
6ed106549d1747 drivers/net/ioc3-eth.c              Patrick McHardy          2009-06-23  1107  	return NETDEV_TX_OK;
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1108  }
^1da177e4c3f41 drivers/net/ioc3-eth.c              Linus Torvalds           2005-04-16  1109  

:::::: The code at line 1017 was first introduced by commit
:::::: 8dff19a6dcb8bcab8bed86e60c8033aaf0a13646 net: sgi: ioc3-eth: use csum_fold

:::::: TO: Thomas Bogendoerfer <tbogendoerfer@suse.de>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
