Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8CE881E
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jun 2023 19:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686598920; x=1718134920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E1N4DLEAFe/nCYkcAiy/n9LNo1rQtoTR1fM8Ci2QNLM=;
  b=LMeEsrgbnQpFrx3Uz3NXIHeg8pO0etC8GDPIXznrGVFhnzR43+jzW9ks
   NGqWWOjK7ZBd4VZriL8GN76MsyPZL3HIOHoqHazfxGOLicb9EJ9ImnEmZ
   TlKKMm5S6kFB4Mzdz3ouBLPYzuHBOVID7IPF4+lBJfM36C74ACmDbS7sP
   iojNM169rPQLqbe4AYMlpAJRzC2hJbJvDIIRz3NYzItqQoi65wfxmQI+9
   CziAPmBQYCr5D/ZekvPqpt2zMJ/A4WE8hPZ8kzscfGfa4gTepZEmiABhb
   o4Gqro6hIzR6Ve1kfiB0kYJTTyWCy8RETpKVbBuyW/DuW2ybMtcjQ53b+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="347797857"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347797857"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 12:41:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="705519298"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="705519298"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Jun 2023 12:41:58 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8nQL-0000cy-2H;
	Mon, 12 Jun 2023 19:41:57 +0000
Date: Tue, 13 Jun 2023 03:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:xfile-page-caching 98/196] fs/xfs/xfs_buf.c:2061:11-12:
 WARNING kmalloc is used to allocate this memory at line 2027
Message-ID: <202306130333.rfoOkR17-lkp@intel.com>
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
head:   cc77862c21f358548d987f990b0ed32a39255523
commit: 6e27b8bd149a70c4b8f605fb6a600d29e0ce25b6 [98/196] xfs: make GFP_ usage consistent when allocating buftargs
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: sh-randconfig-c023-20230612 (https://download.01.org/0day-ci/archive/20230613/202306130333.rfoOkR17-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306130333.rfoOkR17-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_buf.c:2061:11-12: WARNING kmalloc is used to allocate this memory at line 2027

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
