Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07A3159912
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Apr 2024 17:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714150866; cv=none; b=fF3ZXvbiwbk4r2KIyi3Hs7QFv6v3Ta0IYhWYLUPlC9t/WWu0u6bl/8Q2oEUcUk5ah3OZbfwP8jvyslzukxQKA7+swcSwBtIIXAJV2dbND71Nxf/8z8qZTJzILJT6RlN23fe4qQJ14Xx/AIht7mooRRl8JzlhXFcAowDQv7Rcvvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714150866; c=relaxed/simple;
	bh=XO07ezL65FWVloWRmaXVXEs4pdPDLQCB39z2KVi3JXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SKdI/MwXjsNduZbcPb/r1FDR7gkzclwhWkgiGICPYbffrVpJLV857YQ6QXdugAk6Z4j7lcu/cnVLpzv38QhE+BfBsxG8wnbSeCIjXoJu840baMnE6vSWD+eWYzn3owe1Tecjgg95g8zzBVwKosrBRdylsoQG/JfxRK3gADfNY3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gUoN8YbZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gUoN8YbZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714150862; x=1745686862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XO07ezL65FWVloWRmaXVXEs4pdPDLQCB39z2KVi3JXQ=;
  b=gUoN8YbZrvPydiUg/dRzoePmH2/3o/0gbIRkv0+d2umrY7pCIfokTUFv
   hKcCIWv73xHASqslUPJNPg8ZS5lZO9FN47hEW6/tSpFVTVbrwQHXxrW1A
   6IYdle4AZWiYuBZUj/84uChvkS6rKxZTSG+sK5PCNj9Wi/3Y66KkBEKUq
   uqwmrb3OegI499IJ7ljKUnYc7+U3o7YPEDdnq5P49DSEHc4+yOE3rn4be
   bfFxKrkdI3ZGwRt5c1igl7fSI6I2mGiFudEijWH5iJzUWaspzucCS8WSE
   N39ZtEE+BkHSUvJmEjtbMJ2prK9C5Ybig0ZmVNTjz/qklJ72ex99dqyI5
   A==;
X-CSE-ConnectionGUID: 61pCxbQHR7uX58RrHeFbcw==
X-CSE-MsgGUID: OXwQskLHRnuulZCY9AO+og==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="32392593"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="32392593"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 10:01:01 -0700
X-CSE-ConnectionGUID: 5RgV08IDQ7WoocKjyIQnNA==
X-CSE-MsgGUID: NmuLeAryRGWAA/YARCe/MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="25879524"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Apr 2024 10:00:59 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0OwT-0003zW-1B;
	Fri, 26 Apr 2024 17:00:57 +0000
Date: Sat, 27 Apr 2024 01:00:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [freescale-fslc:5.15-2.2.x-imx 212/29910] sound/soc/fsl/fsl_sai.c:
 linux/pm_qos.h is included more than once.
Message-ID: <202404270027.fnfuE6yd-lkp@intel.com>
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
TO: Otavio Salvador <otavio@ossystems.com.br>

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   ebcdbe7ec49f9c3405ee4b89e7ec279e313026f3
commit: 2c3928cd87d3de8462ea7e547487a619c452e81b [212/29910] MLK-13574-2: ASoC: fsl_sai: refine driver for ip upgrade
:::::: branch date: 2 days ago
:::::: commit date: 2 years, 6 months ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404270027.fnfuE6yd-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> sound/soc/fsl/fsl_sai.c: linux/pm_qos.h is included more than once.
>> sound/soc/fsl/fsl_sai.c: linux/pm_runtime.h is included more than once.
>> sound/soc/fsl/fsl_sai.c: linux/of_device.h is included more than once.

vim +14 sound/soc/fsl/fsl_sai.c

     6	
     7	#include <linux/clk.h>
     8	#include <linux/delay.h>
     9	#include <linux/dmaengine.h>
    10	#include <linux/module.h>
    11	#include <linux/of_device.h>
    12	#include <linux/of_address.h>
    13	#include <linux/of_device.h>
  > 14	#include <linux/pm_qos.h>
    15	#include <linux/pm_runtime.h>
    16	#include <linux/regmap.h>
    17	#include <linux/slab.h>
    18	#include <linux/time.h>
  > 19	#include <linux/pm_qos.h>
    20	#include <sound/core.h>
    21	#include <sound/dmaengine_pcm.h>
    22	#include <sound/pcm_params.h>
    23	#include <linux/mfd/syscon.h>
    24	#include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
    25	#include <linux/pm_runtime.h>
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
