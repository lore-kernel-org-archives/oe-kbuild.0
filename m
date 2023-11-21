Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8025820DE8
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 17:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="COug6o+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700589587; x=1732125587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ma/Cbgzu0NK2QiZGfNBCnxP6RRxVFhej1LiVtvPu2s8=;
  b=COug6o+vEuoEo3xnEptbe9nwOoeg7LnX5iQFtEDxjwZTfYPqpmqDr1i+
   G1GmbWZrioRg9oqCew7Uyb815FtcUxz7ok/U+mh3Z8m3AnPruH5L1JWrP
   2Crc4KW59F3eCKwTZpUGHCGwWnED6nevNJXkdZ0w188BAaremTFjx1YaT
   6tVpe2PJYTPFKBgLNkfCJjvFD2MaSHZdxb86dFgnDMfXdFdUkF9zyDG8L
   w6D2R8G2CBD25zlw7OxhgzrRvQkGOxdnVoWv6qAjtMNE4X0gn0OtRehp2
   luB1FiMaBoEH72WefIt8Kw28aKow0M3LTlJo8HJdPof98CpwSiScxPP92
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="422990025"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="422990025"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 09:59:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="760171989"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="760171989"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Nov 2023 09:59:44 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5V24-00086I-1C;
	Tue, 21 Nov 2023 17:59:37 +0000
Date: Wed, 22 Nov 2023 01:58:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [yiliu1765-iommufd:wip/iommufd_nesting+pasid-11142023-yi 17/20]
 iommufd.c:1676:44: error: macro "test_cmd_mock_domain" requires 5 arguments,
 but only 4 given
Message-ID: <202311220103.2mel2uEZ-lkp@intel.com>
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
commit: 706387616ffbf6d04773de49dc53324f599d2e64 [17/20] iommufd/selftest: Extend IOMMU_TEST_OP_MOCK_DOMAIN to pass in pasid
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220103.2mel2uEZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311220103.2mel2uEZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   iommufd.c: In function 'iommufd_dirty_tracking_setup':
>> iommufd.c:1676:44: error: macro "test_cmd_mock_domain" requires 5 arguments, but only 4 given
    1676 |                              &self->idev_id);
         |                                            ^
   In file included from iommufd.c:10:
   iommufd_utils.h:91: note: macro "test_cmd_mock_domain" defined here
      91 | #define test_cmd_mock_domain(ioas_id, pasid, stdev_id, hwpt_id, idev_id)   \
         | 
>> iommufd.c:1675:9: error: 'test_cmd_mock_domain' undeclared (first use in this function); did you mean '_test_cmd_mock_domain'?
    1675 |         test_cmd_mock_domain(self->ioas_id, &self->stdev_id, &self->hwpt_id,
         |         ^~~~~~~~~~~~~~~~~~~~
         |         _test_cmd_mock_domain
   iommufd.c:1675:9: note: each undeclared identifier is reported only once for each function it appears in
   iommufd.c: In function 'iommufd_dirty_tracking_enforce_dirty':
   iommufd.c:1726:61: error: macro "test_cmd_mock_domain" requires 5 arguments, but only 4 given
    1726 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |                                                             ^
   iommufd_utils.h:91: note: macro "test_cmd_mock_domain" defined here
      91 | #define test_cmd_mock_domain(ioas_id, pasid, stdev_id, hwpt_id, idev_id)   \
         | 
   iommufd.c:1726:9: error: 'test_cmd_mock_domain' undeclared (first use in this function); did you mean '_test_cmd_mock_domain'?
    1726 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         _test_cmd_mock_domain
   iommufd.c: In function 'iommufd_dirty_tracking_set_dirty_tracking':
   iommufd.c:1748:61: error: macro "test_cmd_mock_domain" requires 5 arguments, but only 4 given
    1748 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |                                                             ^
   iommufd_utils.h:91: note: macro "test_cmd_mock_domain" defined here
      91 | #define test_cmd_mock_domain(ioas_id, pasid, stdev_id, hwpt_id, idev_id)   \
         | 
   iommufd.c:1748:9: error: 'test_cmd_mock_domain' undeclared (first use in this function); did you mean '_test_cmd_mock_domain'?
    1748 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         _test_cmd_mock_domain
   iommufd.c: In function 'iommufd_dirty_tracking_device_dirty_capability':
   iommufd.c:1763:61: error: macro "test_cmd_mock_domain" requires 5 arguments, but only 4 given
    1763 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |                                                             ^
   iommufd_utils.h:91: note: macro "test_cmd_mock_domain" defined here
      91 | #define test_cmd_mock_domain(ioas_id, pasid, stdev_id, hwpt_id, idev_id)   \
         | 
   iommufd.c:1763:9: error: 'test_cmd_mock_domain' undeclared (first use in this function); did you mean '_test_cmd_mock_domain'?
    1763 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         _test_cmd_mock_domain
   iommufd.c: In function 'iommufd_dirty_tracking_get_dirty_bitmap':
   iommufd.c:1785:61: error: macro "test_cmd_mock_domain" requires 5 arguments, but only 4 given
    1785 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |                                                             ^
   iommufd_utils.h:91: note: macro "test_cmd_mock_domain" defined here
      91 | #define test_cmd_mock_domain(ioas_id, pasid, stdev_id, hwpt_id, idev_id)   \
         | 
   iommufd.c:1785:9: error: 'test_cmd_mock_domain' undeclared (first use in this function); did you mean '_test_cmd_mock_domain'?
    1785 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         _test_cmd_mock_domain
   iommufd.c: In function 'iommufd_dirty_tracking_get_dirty_bitmap_no_clear':
   iommufd.c:1815:61: error: macro "test_cmd_mock_domain" requires 5 arguments, but only 4 given
    1815 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |                                                             ^
   iommufd_utils.h:91: note: macro "test_cmd_mock_domain" defined here
      91 | #define test_cmd_mock_domain(ioas_id, pasid, stdev_id, hwpt_id, idev_id)   \
         | 
   iommufd.c:1815:9: error: 'test_cmd_mock_domain' undeclared (first use in this function); did you mean '_test_cmd_mock_domain'?
    1815 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         _test_cmd_mock_domain
   In file included from iommufd_utils.h:13:
   iommufd.c: In function 'iommufd_device_pasid_pasid_attach':
   iommufd.c:2266:44: error: 'IOMMU_HWPT_ALLOC_DATA_SELFTEST' undeclared (first use in this function); did you mean 'IOMMU_HWPT_DATA_SELFTEST'?
    2266 |                                            IOMMU_HWPT_ALLOC_DATA_SELFTEST,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../kselftest_harness.h:707:20: note: in definition of macro '__EXPECT'
     707 |         __typeof__(_seen) __seen = (_seen); \
         |                    ^~~~~
   iommufd_utils.h:193:9: note: in expansion of macro 'ASSERT_EQ'
     193 |         ASSERT_EQ(0, _test_cmd_hwpt_alloc(self->fd, device_id, pt_id, flags, \
         |         ^~~~~~~~~
   iommufd.c:2264:17: note: in expansion of macro 'test_cmd_hwpt_alloc_nested'
    2264 |                 test_cmd_hwpt_alloc_nested(self->device_id, parent_hwpt_id, 0,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
