Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6DA322B
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Aug 2023 19:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692992824; x=1724528824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bFpbyTp2vx1YRbQeNxpIYufS8ykFMLd66p3O39TxPpc=;
  b=N2xO+8yUcUpUgsFTbGr7jXZ8Js0kKIKOaZvprzaMLMKXWxML0ZnM6vdN
   UrWitocMCpJfI/3MgGgoIHFSBVPb1WGZne6NqS4pS/3BxlpIfbmgNNE7l
   IFB/bzmnmd5lM7vwxlhjHu7FKXBQYsbYbAsCra9Vz6fvIsK1CT34vBNd8
   g6Ox1EYb8kNrykOOP4rKJ0Bo0LF1/jsWACaFWJDFDL7kpTUlXe1qed7pP
   2DB6ck9BJDN5qobUrNdb7PqGqAXY+EvIDiQvPmEemvSjXE5h0JgGd3Nrl
   gHJLaWrfk1USelMNUzoER13FWfveVEubyIopdP9MfQ4HJ6qsDJyZ5JCGc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="377529211"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="377529211"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 12:47:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="852085890"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="852085890"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 25 Aug 2023 12:47:02 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZclq-0003xb-0O;
	Fri, 25 Aug 2023 19:47:02 +0000
Date: Sat, 26 Aug 2023 03:46:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:xfile-page-caching 105/203] fs/xfs/xfs_buf.c:2065:11-12:
 WARNING kmalloc is used to allocate this memory at line 2031
Message-ID: <202308260310.ZsZNRMtQ-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

Hi Darrick,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   3a75294b1e898d6439eb60de137d003f3a112b58
commit: 3e9de79e2abc8a8713f45254f838298bb47bdb7f [105/203] xfs: make GFP_ usage consistent when allocating buftargs
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-054-20230825 (https://download.01.org/0day-ci/archive/20230826/202308260310.ZsZNRMtQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260310.ZsZNRMtQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308260310.ZsZNRMtQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_buf.c:2065:11-12: WARNING kmalloc is used to allocate this memory at line 2031

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
