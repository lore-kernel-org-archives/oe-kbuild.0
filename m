Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F3F27706
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Mar 2023 21:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679693561; x=1711229561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q3teSkvd8FnzuayIMEW55+/300o20+5P45vETorPZ9Q=;
  b=Ms8/TzMyORRq+dkuh324QHTNqC1ZlsK2vhbdolsxrUihaCWyiKnwS1Ta
   gcgiflyGYabzxOKa/9CteJHgSFoD4EFg7Qjk4VahoqNFq6bnAXcjDKZSc
   hDFiB2cCzA/vfJmzr8mO2Xskw6h2OxuYX3GW50jv5PWnzq2mnJfz6ncEm
   kkTV3QA6zKbHPMv0W0po/2D+JOED0mLpMPRxEzaySBuOL1EgZ2GZSKZxl
   /+zPaCct2Xg+he5RK+Tp4hb9FtovxD2X3G2b3uyNsqT1Tmptu02UzSNy5
   NE+vB1uukn+Dhkv4bw3DaoBfoX5R0a988HzVjCr4PN8vmFE62RuKuJHzy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="320291991"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="320291991"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 14:32:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="632970349"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="632970349"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Mar 2023 14:32:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfp1W-000Ffs-1A;
	Fri, 24 Mar 2023 21:32:34 +0000
Date: Sat, 25 Mar 2023 05:32:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [kvalo-ath:pending 5/49]
 drivers/net/wireless/legacy/ray_cs.c:2115:2-4: WARNING: possible condition
 with no effect (if == else)
Message-ID: <202303250547.u12s9OSX-lkp@intel.com>
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
CC: Kalle Valo <kvalo@codeaurora.org>
CC: ath10k@lists.infradead.org
TO: Kalle Valo <kvalo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   d90137a547f80c39d755e9b88e049cc4b17a388f
commit: 298e50ad8eb8fa12ea68bb2da45bb8ef4edcd0ec [5/49] wifi: move raycs, wl3501 and rndis_wlan to legacy directory
:::::: branch date: 6 hours ago
:::::: commit date: 11 days ago
config: xtensa-randconfig-c033-20230322 (https://download.01.org/0day-ci/archive/20230325/202303250547.u12s9OSX-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202303250547.u12s9OSX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/legacy/ray_cs.c:2115:2-4: WARNING: possible condition with no effect (if == else)
--
>> drivers/net/wireless/legacy/ray_cs.c:2084:13-14: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
