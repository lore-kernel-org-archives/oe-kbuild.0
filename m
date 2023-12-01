Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BCA79F0
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 04:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K68iluXB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701404122; x=1732940122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9zvMWPeaNYvS075i4zG4k0VSfwvnQEmSWfSebzHIC3w=;
  b=K68iluXBhBfiSb3yX714/vWZkgUge7kiCH+8ETYzho3upKKmcubUnX1c
   +drv0PANk6Ght37zZFFzGhzgtwJWrCOscK80fBZg+08ipeY2/T6AmkWDy
   mvAtFwZKrJEXRmxb/FW3wf2NUXujVS8XndXZ1Ss6rZlMhKdi49rU47O/s
   MVgzbQxNFjqgX3XmYMaUibm4c5FSIHWdHD0hEp1V5TKqGV/v5PMFDj7LW
   A5LZMCDOE9lITSPu1vXG6gN97cObgKIK6k7G0816cyd3wVy03CIwxjLh8
   yaGx8sXY8lZ5iiZEEMyO3wJVTQg1TRa3zxaneUBwyvqJ6Wj5ejKa8NgUi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="442746"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="442746"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 20:15:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="840039052"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="840039052"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 30 Nov 2023 20:15:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8uvu-000378-1k;
	Fri, 01 Dec 2023 04:15:18 +0000
Date: Fri, 1 Dec 2023 12:14:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sailus-media-tree:metadata 59/72] drivers/media/i2c/ccs/ccs-core.c:
 media/v4l2-fwnode.h is included more than once.
Message-ID: <202312011210.NJ9ThORB-lkp@intel.com>
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
CC: linux-media@vger.kernel.org
TO: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   d7f1e9eefb0ffe8ed37933b2dbd1806401f5beaf
commit: 4fb0cc41147989b09a86c615141abfd6b9e6a953 [59/72] media: ccs: Support frame descriptors
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312011210.NJ9ThORB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312011210.NJ9ThORB-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/i2c/ccs/ccs-core.c: media/v4l2-fwnode.h is included more than once.

vim +30 drivers/media/i2c/ccs/ccs-core.c

  > 30	#include <media/v4l2-fwnode.h>
    31	#include <media/v4l2-device.h>
  > 32	#include <media/v4l2-fwnode.h>
    33	#include <uapi/linux/ccs.h>
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
