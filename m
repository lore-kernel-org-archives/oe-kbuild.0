Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510A113AA25
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jan 2024 21:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706219304; cv=none; b=tP9y6BSedgbJNcsuKBODogXTUzhDulwfJ3Uc4jWbMZyU8lTz2P3VHZTZWmTBkBepP31Ht5gj2Z1AEvhlUY4vKiUiqU+vTxDdu+fe4W99JEO6PGObL5gdHkE8QWY1q4j55WHxuROx+0HSrdVEwGsH1upGkL7f5exWkSoAtdxPftE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706219304; c=relaxed/simple;
	bh=tP7AMlt9z0N3PEq8Q3YtiufcLlmCSDN+roDQySigJM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jylJFYILVa/W3vFGUQbHFIBmqTOCw5rlLXqS78PGJPtriQrFkiwS9j96X/+WQPonPD5/fJQHYWlK/d0t8OV4lyjsTQcOanCUCxlne4BF5G/u9MEGsY2Y0OojLRAcQP3t6AmomqjjEDrGk8oLb5JFuE6EwRbohJ4k/c1Kv1Lsy3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUtFC/yM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUtFC/yM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706219302; x=1737755302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tP7AMlt9z0N3PEq8Q3YtiufcLlmCSDN+roDQySigJM8=;
  b=AUtFC/yM/6N6N13PiC6vJyEWjrUu6mJJoCdYy/fnXGJkeLFcSDlRQajS
   tKOxD9/CA/ZdqXPAPeOmm0y7lIIXe6DLoN906Rwwu3ef9wBSLVNRDmJhP
   qrXWspgKtuy439wDHwxCfVikvNxRFwKm5FKFDvRmYFWX/Zq3X2R7woBIi
   hGOOTf24RU4jrHUVPNUnhf1le557BpoDXm0QG2Vvrk1WC5LfOrvimvNBt
   ZntTurjV/rir7uqI4SvxF+7mYx3Hf4nNOsgrs1CTiJVI6gHKuaDnNeahB
   1r8Jf2atWvxTPaClZdjsEO2T0IpHNWMxjFqu822gCgAGOsCK4J8KcjzIy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="8960847"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8960847"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 13:48:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2567828"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Jan 2024 13:48:21 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rT7a6-0000Qa-0y;
	Thu, 25 Jan 2024 21:48:18 +0000
Date: Fri, 26 Jan 2024 05:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/cgroup/sli.c: linux/cgroup.h is included more than once.
Message-ID: <202401260540.7P5Emiq3-lkp@intel.com>
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
TO: jasperwang@tencent.com
TO: kaixuxia@tencent.com
TO: frankjpliu@tencent.com
TO: kasong@tencent.com
TO: sagazchen@tencent.com
TO: kernelxing@tencent.com
TO: aurelianliu@tencent.com
TO: jason.zeng@intel.com
TO: wu.zheng@intel.com
TO: yingbao.jia@intel.com
TO: pei.p.jia@intel.com

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git master
head:   5aef72f74942091b6d408fce235629dc0620e74e
commit: 2690abc40b3ff5bce2553981394ee072eb1f5f66 sli: add sli event monitoring for cgroup
date:   1 year, 9 months ago
:::::: branch date: 34 hours ago
:::::: commit date: 1 year, 9 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401260540.7P5Emiq3-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> kernel/cgroup/sli.c: linux/cgroup.h is included more than once.

vim +3 kernel/cgroup/sli.c

   > 3	#include <linux/cgroup.h>
     4	#include <linux/module.h>
     5	#include <linux/psi.h>
     6	#include <linux/memcontrol.h>
     7	#include <linux/sched.h>
     8	#include <linux/sched/task_stack.h>
     9	#include <linux/sched/sysctl.h>
    10	#include <linux/stacktrace.h>
    11	#include <asm/irq_regs.h>
    12	#include "../sched/sched.h"
  > 13	#include <linux/cgroup.h>
    14	#include <linux/sli.h>
    15	#include <linux/rculist.h>
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
