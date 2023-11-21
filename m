Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FACE4777A
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPmmelzE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700577568; x=1732113568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=86PjV8QzMTya0mFUrbLDN+AOWuhjOJm+p3Gs+LPKL3A=;
  b=NPmmelzEA3k9FtJ8IPuxj3DuIo/Ga5QJShgY2PMQPnTt5WHmlX4AhDWZ
   Fl/PICvp2K7PsQ47cgIbAp/Qyzxpzvg4MZGeMxGgGhalcBD9yrXIexFuG
   mOCm9DSN/aCaagkThlKfI6Gw3iT2gwwYGV1o8kFDSlWdWVTp9HLfb2nIx
   dTL84IpH+OsTzadiNo4sF6iaUd/mRQB41PW2DIwlqcc7xdWgjy8ZnSfsi
   tB1HETaYZU34r418qKvSCrKzD2hkcDy9/237p5KmTtHYnTfLZT2RAFAIG
   XLJ4CEToF9f7dO4f0ojiUt93CjHVyQnPrr+zYPywUVeKIBsVEz6FzKKWk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="388999762"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="388999762"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 06:39:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="910472640"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="910472640"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 21 Nov 2023 06:39:04 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5Ru1-0007vU-2S;
	Tue, 21 Nov 2023 14:39:01 +0000
Date: Tue, 21 Nov 2023 22:38:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [yiliu1765-iommufd:wip/iommufd_nesting+pasid-11142023-yi 7/20]
 iommufd.c:2266:44: error: 'IOMMU_HWPT_ALLOC_DATA_SELFTEST' undeclared; did
 you mean 'IOMMU_HWPT_DATA_SELFTEST'?
Message-ID: <202311212250.lTDgKUwk-lkp@intel.com>
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
TO: Yi Liu <yi.l.liu@intel.com>
TO: Kevin Tian <kevin.tian@intel.com>

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting+pasid-11142023-yi
head:   92f313909ee3753f73c9b3341a34aa28116edb62
commit: 731261dcd9270387e7ed95813ad05a02c01006d8 [7/20] iommufd/selftest: Add coverage for iommufd pasid attach/detach
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311212250.lTDgKUwk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311212250.lTDgKUwk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from iommufd_utils.h:13,
                    from iommufd.c:10:
   iommufd.c: In function 'iommufd_device_pasid_pasid_attach':
>> iommufd.c:2266:44: error: 'IOMMU_HWPT_ALLOC_DATA_SELFTEST' undeclared (first use in this function); did you mean 'IOMMU_HWPT_DATA_SELFTEST'?
    2266 |                                            IOMMU_HWPT_ALLOC_DATA_SELFTEST,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../kselftest_harness.h:707:20: note: in definition of macro '__EXPECT'
     707 |         __typeof__(_seen) __seen = (_seen); \
         |                    ^~~~~
   iommufd_utils.h:190:9: note: in expansion of macro 'ASSERT_EQ'
     190 |         ASSERT_EQ(0, _test_cmd_hwpt_alloc(self->fd, device_id, pt_id, flags, \
         |         ^~~~~~~~~
   iommufd.c:2264:17: note: in expansion of macro 'test_cmd_hwpt_alloc_nested'
    2264 |                 test_cmd_hwpt_alloc_nested(self->device_id, parent_hwpt_id, 0,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   iommufd.c:2266:44: note: each undeclared identifier is reported only once for each function it appears in
    2266 |                                            IOMMU_HWPT_ALLOC_DATA_SELFTEST,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../kselftest_harness.h:707:20: note: in definition of macro '__EXPECT'
     707 |         __typeof__(_seen) __seen = (_seen); \
         |                    ^~~~~
   iommufd_utils.h:190:9: note: in expansion of macro 'ASSERT_EQ'
     190 |         ASSERT_EQ(0, _test_cmd_hwpt_alloc(self->fd, device_id, pt_id, flags, \
         |         ^~~~~~~~~
   iommufd.c:2264:17: note: in expansion of macro 'test_cmd_hwpt_alloc_nested'
    2264 |                 test_cmd_hwpt_alloc_nested(self->device_id, parent_hwpt_id, 0,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
