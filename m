Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A234B1BDA86
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Aug 2024 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722937413; cv=none; b=lr8PtVpJ2+BslvebkbtKzDUdEqK7NtPAbQ4IYJ0jMhOTut3m5H4gAesWv/+03POkGaXkciEcZwVguzfXqn9mnyAbfbz0TIAP4G9sAcOLwOnRSNACzQGNEY211nIS78pleg3/99izENFSHgwNvR/bIkpBJxuYuY87oNpv06mVtGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722937413; c=relaxed/simple;
	bh=Qq+QsLBzt69PFbwqdum0+OveaB0uynLaPX1CsxdLE28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k91SAeqhhvmbJUU+cjlFgcIaSIOnpMUj4H8SGYMNF67Wj32yJSzhm9YnIdBeNHjG7Roz9VVH45js+3oZpISb5UZTKHL0StCe1akp7IxKutJA3mYRUIsmeMJPXNEo2iHW1ejvtr+mliJ1BjKca7fdzVaIbqWkFTjN740F/Uu36EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fvOi7Lxm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fvOi7Lxm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722937412; x=1754473412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qq+QsLBzt69PFbwqdum0+OveaB0uynLaPX1CsxdLE28=;
  b=fvOi7LxmIkVApW9T9NANFOYaaG39c6PwuFHgzBswEgx0ip69L98CLHzA
   Mr0Gee8qo1pZ7gm33t/7Uxo13QRNGC4YDuqYmorwZsH56GBB2Zi4ii3yc
   yrBuPrDGIbEnAGx5v89U99ZP12QItOcdogfmWTJKqJ6yOuzzg81Mg5fSO
   kTNHd2qgMCBy9NxXzXIfCoK2LN+cAum/vHRu8GNaIi4wQ3sSu0V4Kc5Pl
   CcSqKZajrWAyk89Pd/KKFHCu4xIJLACi0bEJ6qNEkuUZRVQSJaHm/R9Ni
   yXdmx8g/rjqMip9QNf0jmTq3JIIRtmMmuulmo4J90Z+1QWnLEXVrOKHCq
   w==;
X-CSE-ConnectionGUID: r8amExmVRj6GLntX5mfNqg==
X-CSE-MsgGUID: CN1NcwscTfOj2fds/H0jWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="32094085"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="32094085"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 02:43:30 -0700
X-CSE-ConnectionGUID: rdYGXAAzSeKsxC+H+NnQ8A==
X-CSE-MsgGUID: M8+3c+8+RDqNGRxzT1Akow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="79718313"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 06 Aug 2024 02:43:28 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbGj0-0004Me-26;
	Tue, 06 Aug 2024 09:43:26 +0000
Date: Tue, 6 Aug 2024 17:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:cpufreq-compile-test 3/6] drivers/cpufreq/omap-cpufreq.c:
 linux/cpu.h is included more than once.
Message-ID: <202408061738.zVWNWzJq-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git cpufreq-compile-test
head:   51646201e21cdf40aad3925f7742a8d2ac727f43
commit: c03f7c269533692f7a8b6058613adcd17381039e [3/6] cpufreq: omap: Drop asm includes
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408061738.zVWNWzJq-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/cpufreq/omap-cpufreq.c: linux/cpu.h is included more than once.

vim +19 drivers/cpufreq/omap-cpufreq.c

    15	
    16	#include <linux/types.h>
    17	#include <linux/kernel.h>
    18	#include <linux/sched.h>
  > 19	#include <linux/cpu.h>
    20	#include <linux/cpufreq.h>
    21	#include <linux/delay.h>
    22	#include <linux/init.h>
    23	#include <linux/err.h>
    24	#include <linux/clk.h>
    25	#include <linux/io.h>
    26	#include <linux/pm_opp.h>
  > 27	#include <linux/cpu.h>
    28	#include <linux/module.h>
    29	#include <linux/platform_device.h>
    30	#include <linux/regulator/consumer.h>
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
