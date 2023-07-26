Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B87B4CE97
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jul 2023 19:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690400295; x=1721936295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zj1+6CBbDvboMk8vd75v2aZhKR0fA4jQqyoSxg960Jc=;
  b=GP1FsDFwk12Qt/ujaKrWQh/cvjCGIEz0pjSzg/Kyg72NcTvtliyO33Ap
   TIzL+wgsA3BaAJPTcl8UAHjgz86B0j6UDrIdYddSm/rkAL9kQnejQ2wwU
   oCCjdfDrYEbt5Ipe2UbHqtbHwW4Ubd6QnTx9I6h9tMoqJRk9gLE8qhmsX
   D06uxZ34ZU3/AEDUBF/54BB84t98jGhk/8MvcVOCmyCoIQsH1NPm7DQKs
   On8FrkQYUG09uhjA+BjgjGg2RpTvRkmRYxboEHGBI/GBjP+X2JZjKl3An
   LVgd+M3Di/T8sB6Wfm0SHssgM9UMXmc4VcclS1esvs20B3oAnG6PFJKMD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="358112117"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="358112117"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 12:38:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="726663183"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="726663183"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 26 Jul 2023 12:38:13 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOkKq-0001GP-2y;
	Wed, 26 Jul 2023 19:38:12 +0000
Date: Thu, 27 Jul 2023 03:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 3518/4710] drivers/net/phy/motorcomm.c:885:12-14:
 WARNING opportunity for min()
Message-ID: <202307270328.DzGh7i4i-lkp@intel.com>
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
TO: Samin Guo <samin.guo@starfivetech.com>
CC: Hal Feng <hal.feng@starfivetech.com>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0ba5d07205771c50789fd9063950aa75e7f1183f
commit: 7a561e9351ae7e3fb1f08584d40b49c1e55dde60 [3518/4710] net: phy: motorcomm: Add pad drive strength cfg support
:::::: branch date: 14 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-i051-20230726 (https://download.01.org/0day-ci/archive/20230727/202307270328.DzGh7i4i-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270328.DzGh7i4i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307270328.DzGh7i4i-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/phy/motorcomm.c:885:12-14: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
