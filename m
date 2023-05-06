Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FFF10F2
	for <oe-kbuild@lists.linux.dev>; Sat,  6 May 2023 17:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683392482; x=1714928482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lg5GtJq6oEyRJ+EyVmk/CHPeCv1ye1HUfX0SDSCDDW8=;
  b=GuunOf1GslKCUcUkwwKY+KQ/AG1uJ3Qp9x33XealBscqCR/EmdAe05JP
   UnHCFPpgYtAUe0CIMuq9+zeiTdoMLnShU1lLp3YWXCkOpjDMlDDmhSlJ+
   LC3IwMrB0gsj2H2LJzkdqRsWqi8UGWfxUfsby44tVnrjcKihy4X5YgrY2
   /eXbd9FOL5cHmN2n8n3jz40ZWF9X7ChxgfmezgcguFKXgwefDXLeeZSKt
   MJEX3vEfIlMJR2Gne1waqH8nM2rmONOsHyWUf8kynVKAQHQ1y50Pumqd+
   hKKEooOt/RizFg5HPENjXSoc+0eGtvIaVfgTMwAXkmza+R/tbcVXpX9Oa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="435719143"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="435719143"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 10:01:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="767535369"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="767535369"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 May 2023 10:01:21 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvLHc-0000Ph-2f;
	Sat, 06 May 2023 17:01:20 +0000
Date: Sun, 7 May 2023 01:01:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:xfile-page-caching 209/302] fs/xfs/scrub/trace.c:
 xfs_btree_mem.h is included more than once.
Message-ID: <202305070027.YOkXDoJP-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   76bdf8de32013261ec98ee5d0bcf04f8d737063e
commit: 1a3aadd60727d0759270bd3f0f895e934a05737a [209/302] xfs: connect in-memory btrees to xfiles
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202305070027.YOkXDoJP-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/trace.c: xfs_btree_mem.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
