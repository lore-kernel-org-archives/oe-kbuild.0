Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22083193427
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Aug 2024 06:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724223314; cv=none; b=PRervrSXVFrUqC8uJ6vqTjEomUPC6INxCuOCDaCIfj/kg9Qtq65HeEe8AHdQ1j/STuON4fQr6Gq04AG/OrIXqmZ/34clX1Yf56ju7/hYhGCjl4CD+sx9kRJS/WmXm9EFsf9S74nUot1QJxW3TkVFB4Pm4B3y4oxcNnlSdJccN40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724223314; c=relaxed/simple;
	bh=tBTdFme698KNw6C3Q4JIY2jFpzN5dCCiZPUU3nkqTZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZaofeGj2+50FRUqR8h6xxQFyWfQbeChKPy/5YT8fRjym/q5x9uCb9T8510A7Kj2hSq0e4rA5LyebNjQZCsOBNu9Nx25hrrG9r9InsQ7Y1XPYn5JFe0l76GtigETsfbVU7Qzc+dC82ED2G7QSCFDBQOR1n3ovFm6cSyFan/hKd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWuWefby; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWuWefby"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724223312; x=1755759312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tBTdFme698KNw6C3Q4JIY2jFpzN5dCCiZPUU3nkqTZs=;
  b=dWuWefby9ArWeilmIg1WZg+BvAZ4hQMw12Y7wPy85QHHj9Zd0iyIYNku
   uzBqbALZW9q6HwHUAwP8fa4VZ4agqui8RO6JmLIVTXJdNIxr1MuxcEz1q
   0L/riT4XRvHuhH0riEbhTX1MlEvV7IY0asuvVc0ErEUSUHPwYYFPn89WP
   Uzn0wIlos6lM12ap9lVHHVkgjPGt7RDLybT+qLTfSQ9l6oHtQ98SpMrsh
   YfMPZ4BDVJCwX+LNiq9yPMCVBWNqSCRUN7UORUTOZGrgHPEYE/sXXbjRe
   bndlV0uWkf5P65RgtOMwgENCLJK+98ytIhBsIxRiPhONaDtOEylMZiG0I
   Q==;
X-CSE-ConnectionGUID: e09VlErPStCKC6El/yi39Q==
X-CSE-MsgGUID: bSJjIK9tQ96cGiOwHSLDMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22704785"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22704785"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 23:55:12 -0700
X-CSE-ConnectionGUID: K9ZCVitGRV21AhuhRBBPAA==
X-CSE-MsgGUID: uU1SnuZHRWyBk8b4uS5/qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="61760464"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Aug 2024 23:55:11 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgfFM-000Azx-25;
	Wed, 21 Aug 2024 06:55:08 +0000
Date: Wed, 21 Aug 2024 14:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jgunthorpe:fwctl 17/20] drivers/fwctl/cxl/cxl.c:
 linux/auxiliary_bus.h is included more than once.
Message-ID: <202408211415.ToWENcwO-lkp@intel.com>
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
TO: Dave Jiang <dave.jiang@intel.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>

tree:   https://github.com/jgunthorpe/linux fwctl
head:   49296e2e608f31151e3b5644cf88a65b7f7b56e5
commit: e6537a248fe6241de233cf02c499dfd48ce73fce [17/20] fwctl/cxl: Add driver for CXL mailbox for handling CXL features commands (RFC)
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408211415.ToWENcwO-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/fwctl/cxl/cxl.c: linux/auxiliary_bus.h is included more than once.

vim +6 drivers/fwctl/cxl/cxl.c

   > 6	#include <linux/auxiliary_bus.h>
     7	#include <linux/cxl/mailbox.h>
   > 8	#include <linux/auxiliary_bus.h>
     9	#include <uapi/fwctl/cxl.h>
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
