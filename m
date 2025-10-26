Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC261E51EB
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Oct 2025 07:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761465003; cv=none; b=pyJlEkNKABMt4UkZOP9QIilNlZxbW6CMTAX550HSz97Qvz6I9CvP39xbEpUXkjrP7zZ/dYTVO0ZTbpVYLHZuHJihwKZjmZZ6lZDrD+BE07R0t3tHaqpas1k1IugHngvaG8mKSUpaeReDi7geVaK97BdNmCDpWvgm8VxWezJEK5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761465003; c=relaxed/simple;
	bh=zjyICbprtFP8ZJF+zxob/7pwSCssuaDKgGulDEVlSPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZTq8LdMCz8dbvoW2d73R0rmYg5dCUJfwE5Xfo/23A4uijNGJPuUc4Ayb0JCT+bm7Khi1vkJAV/xnCkVjeE9BK0iEj2HuXVVWEgDpknKlqSCGXjHzrNGMB6A3qvk5pjpauIskqfqifCnyokTkkW0JZdhtr7u+uJOkKTk9gUUplZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OB98UMTl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OB98UMTl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761465002; x=1793001002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zjyICbprtFP8ZJF+zxob/7pwSCssuaDKgGulDEVlSPg=;
  b=OB98UMTlzvVHgKy9VT9qT78uqg/CJnv3JuR0e3IHmsv2GJBgzB1ROck0
   sIIISDvymDbRaAXZUtTgP3qrUW1ZDPMCIhE8toyO5Ovh9KER7JptnfESO
   qTLfIjUQ+QruTvP1mzSyhcdEFUEp6RWpb58yobLbfGoiJTZYHqiesxWQ7
   FpH16RhxNwn4E7TXO1KgrElWfX4gj7Pch+oM4CVhPXs17kjq+SAOr/TuA
   6NJHFD+yafe4aJQvrb9JBWhFaVWN9Jh4v8llsq9KC3UTbL7Sai9dV1wdD
   R2DLVfoErnGHwbbvSwCPGtOLxhPO9gVAe+LJLimOfET17E9pJBZocM9js
   g==;
X-CSE-ConnectionGUID: J8hBGXxxTsCp+eDXpRJ8kQ==
X-CSE-MsgGUID: qRMe9IxDQEWPHZKuM/yXLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63727834"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="63727834"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 00:50:01 -0700
X-CSE-ConnectionGUID: 5bW7Um/lTQGjEToZ0Ju5Pw==
X-CSE-MsgGUID: MRF/f9kTRRWzBxZFqnXuvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="185256434"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 26 Oct 2025 00:49:59 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCvVk-000Fy9-2o;
	Sun, 26 Oct 2025 07:49:56 +0000
Date: Sun, 26 Oct 2025 15:49:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: iommufd_utils.h:804:37: warning: array subscript 'struct
 iommu_test_hw_info[0]' is partly outside array bounds of 'struct
 iommu_test_hw_info_buffer_smaller[1]'
Message-ID: <202510261537.q8PGKcsW-lkp@intel.com>
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
TO: Yi Liu <yi.l.liu@intel.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>
CC: Nicolin Chen <nicolinc@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72761a7e31225971d0b29d9195e0ffa986b77867
commit: 6d9500bb1ff8c7f9c3ce199521c41aa41e8fd994 iommufd/selftest: Add coverage for reporting max_pasid_log2 via IOMMU_HW_INFO
date:   7 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 7 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251026/202510261537.q8PGKcsW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261537.q8PGKcsW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510261537.q8PGKcsW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from iommufd_utils.h:11,
                    from iommufd.c:12:
   In function '_test_cmd_get_hw_info',
       inlined from 'iommufd_ioas_get_hw_info' at iommufd.c:779:3,
       inlined from 'wrapper_iommufd_ioas_get_hw_info' at iommufd.c:752:1:
>> iommufd_utils.h:804:37: warning: array subscript 'struct iommu_test_hw_info[0]' is partly outside array bounds of 'struct iommu_test_hw_info_buffer_smaller[1]' [-Warray-bounds=]
     804 |                         assert(!info->flags);
         |                                 ~~~~^~~~~~~
   iommufd.c: In function 'wrapper_iommufd_ioas_get_hw_info':
   iommufd.c:761:11: note: object 'buffer_smaller' of size 4
     761 |         } buffer_smaller;
         |           ^~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
