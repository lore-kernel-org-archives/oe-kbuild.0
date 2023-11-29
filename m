Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142844C98
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 02:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQP926PJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701225793; x=1732761793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jojCZIhmqOOUP4xd/s85xiL/OH3ib5Wnn9IWBCEJQxQ=;
  b=fQP926PJkh/KdGPeiEwbq+hVz//z/aCvYeKCIXEDHoxuvZ+0EKEc1clq
   d2XZETeF4sMj5XOLsi7jMgsCPEhtCpmRtlqnLxB2QRCIx+BWlxwbxF3Nl
   AhY428gL7sPy4n3lC1jJ96/V58amnNYJLo/GUKYuWTbhh28bSKR/YkCIr
   2oRn0eDkNbhD3jgEc666oKu5wbFNR+/tS3ujzRGwJeeTz3JlLFYKH7a5c
   sdyKMitr55yot+4Z2MAGPmN5rbTqpYuOYtE2SOZ7+gOWqU1hvgVgJ5/9u
   1esspkEq/zkUrAGfIW8ELCn8eSdwBtzI4IDTCVoeu34Gu+kMx2i9rA32K
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="373263228"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="373263228"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 18:43:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762137735"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="762137735"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Nov 2023 18:43:03 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8AXU-0008Sd-36;
	Wed, 29 Nov 2023 02:43:00 +0000
Date: Wed, 29 Nov 2023 10:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sailus-media-tree:metadata 59/72] drivers/media/i2c/ccs/ccs-core.c:
 media/v4l2-fwnode.h is included more than once.
Message-ID: <202311290754.2apI277B-lkp@intel.com>
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
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311290754.2apI277B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311290754.2apI277B-lkp@intel.com/

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
