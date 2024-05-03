Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8750122EED
	for <oe-kbuild@lists.linux.dev>; Fri,  3 May 2024 20:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714769395; cv=none; b=jz6Iy9K40t9OHZe/MBH7briRAgCaNt7Yawb4KZ9tUKNS2fjrEcpPNY5GKgvHu8PwY88iBfbUWQ1M1Kg1Fq2flS+FAsdSursK4kkIYKZlnLrY3NBiuh3rkb7orROHQptGHjqG5ZhwGzgEyk/CQq69nE9rRPOAqiv88G1daJobZcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714769395; c=relaxed/simple;
	bh=zEj4bgfVyqz3fibxTeaffmkHFxUffiteAD19TWsL4mg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mYQGZ8OeZYAq7yjRBbbURGgxlfKHerFK8yNcuog789hDJTLDYNE5aWNvtDFuElFtp1FPl3yudMiIxs3D7/fasR0ZLSPZueLdwsyes5BipZp1PQbBpM359tE+DMmNDuYy5ODxWfam5CzmQ2p1vODwzFIPeyPQO+HNllOJGtJDHhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Igtlb1Jt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Igtlb1Jt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714769394; x=1746305394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zEj4bgfVyqz3fibxTeaffmkHFxUffiteAD19TWsL4mg=;
  b=Igtlb1Jt+sO3dz0HH9GALcpImuPXQc4r1Qea39bYo0xpHNDaI1sb0G4w
   thuOzPvaRzGJnKVt1Mqg9RgdU3ZerUwLnJkusLE/kKZjmE0tNW9RPZUxF
   95HIlAjjPcHAdBWWTCb8gtGVEQ3NkQQqPLkHhWstDke7ViUPw0TsV/Lqn
   dnNhfS7+PEg3RzMSV1yMbHe7z0RE1APgtLYk0BdQg5PKqx5HKq7W5OfUl
   KFl0n5ttDdp7BRQE5RzRyu7l+saXYdwQGvjX5jpZuVRWu+lLDPi58wHrp
   YADhrIuqG2qyODuKRXxHrR2DVZRodzEfzqvne+eXed8lws2OKYMFRrt18
   A==;
X-CSE-ConnectionGUID: UZqFPKvWT/CMfEx2Y3FBKQ==
X-CSE-MsgGUID: gmULlE1mQQ+J7zJqGecdPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14408013"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="14408013"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 13:49:54 -0700
X-CSE-ConnectionGUID: Ir3ozgyjSNOs7J1CgUivVA==
X-CSE-MsgGUID: U4L2ubm3R5urcAWBEqGs3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27614462"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 May 2024 13:49:52 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2zqn-000C5Y-34;
	Fri, 03 May 2024 20:49:49 +0000
Date: Sat, 4 May 2024 04:49:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shenki:aspeed-6.9-rebase 333/1143]
 drivers/soc/aspeed/aspeed-host-bmc-dev.c: linux/module.h is included more
 than once.
Message-ID: <202405040448.kMCIvzh3-lkp@intel.com>
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
TO: Joel Stanley <joel@jms.id.au>

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 04915d7a3a4227b25ec12f962920278a437df53b [333/1143] soc:aspeed: add host side bmc driver
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405040448.kMCIvzh3-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/soc/aspeed/aspeed-host-bmc-dev.c: linux/module.h is included more than once.

vim +6 drivers/soc/aspeed/aspeed-host-bmc-dev.c

     3	
     4	#include <linux/init.h>
     5	#include <linux/version.h>
   > 6	#include <linux/module.h>
     7	#include <linux/kernel.h>
     8	#include <linux/errno.h>
     9	#include <linux/pci.h>
    10	#include <linux/file.h>
    11	#include <linux/fs.h>
    12	#include <linux/interrupt.h>
    13	#include <linux/wait.h>
    14	#include <linux/workqueue.h>
    15	#include <linux/miscdevice.h>
  > 16	#include <linux/module.h>
    17	#include <linux/serial_core.h>
    18	#include <linux/serial_8250.h>
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
