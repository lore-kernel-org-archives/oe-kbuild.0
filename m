Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A133B17C62
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Feb 2024 10:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707733066; cv=none; b=qzrk65bKl9QxpTuq44LLdp1JdPt94+qiVxClDg2QtuqG9t09M49L6QVZh+juRXivnadt034KfDtAWuMP83yKPDxt+E1lqAIJ1TONe4hYxIyEOTPyJvMUc6shepr08rX1vrAgAcRoZPrNloTAVu2ciP0v0L7AtwyslonOn/AFt7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707733066; c=relaxed/simple;
	bh=T2XVbyMhEB+1ZT2mcgf9KQSC9xnSkzxxyBQwvN1dR/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cZTEibNtyR8IQhhDs7WJykyYrVQSaYxmU4t3Qhs/cQl7Gd2fP5aE0lK+cnutiy4n3btJ1X5yL8lCDmDhKcjkD3/J/m0PWnKbbOtrtK7mmzZP4W/vVUpTaMjRnJ3d4w6FOJ85MsRL84C6PLIiXHJpDhVlUv42oiPjGHlSWwyA8VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVpF1VDC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVpF1VDC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707733065; x=1739269065;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=T2XVbyMhEB+1ZT2mcgf9KQSC9xnSkzxxyBQwvN1dR/s=;
  b=XVpF1VDC/JTQowwROExyU6j8N3eKSwaKcb4hKuO/vO6Jvns26HXZ2KyZ
   Ej52MJ/mmvt5AOmmWHOhOGwoYg17tPS1B0nh8jB5Xi3mlU0at1VNb8Du8
   uMjpXGlVKvkH8tSkb06DSjNmiFo8RtNeefdNCfGar9Xp4c/2RCWKSFGA6
   enU8NAomEFRUysr/AhjsN4czow5okkPM7fp8Yx6pn63jY9DCXzxoauYXd
   VTBATHkg7IbbYsEMs34Bf+v5+FRMaDqyumHToRFWRI30N8ATGO/2taLx/
   hp+8mGwXqVxFmtmzYYBelYS4N2RqK85L/o/JxAPqfCOOHCpoX/1GK2Mb8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="5541114"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="5541114"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 02:17:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="40009585"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Feb 2024 02:17:43 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZTNc-00074k-1J;
	Mon, 12 Feb 2024 10:17:40 +0000
Date: Mon, 12 Feb 2024 18:17:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] iio: magnetometer: add a driver for Voltafield
 AF8133J magnetometer
Message-ID: <202402121800.Dk09l1F8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "empty line found in static check configure file"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240211205211.2890931-5-megi@xff.cz>
References: <20240211205211.2890931-5-megi@xff.cz>
TO: "Ondřej Jirman" <megi@xff.cz>
TO: Jonathan Cameron <jic23@kernel.org>
TO: "Lars-Peter Clausen" <lars@metafoo.de>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Andrey Skvortsov <andrej.skvortzov@gmail.com>
CC: Icenowy Zheng <icenowy@aosc.io>
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Dalton Durst <dalton@ubports.com>
CC: Shoji Keita <awaittrot@shjk.jp>
CC: Ondrej Jirman <megi@xff.cz>

Hi Ondřej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on robh/for-next linus/master v6.8-rc4 next-20240212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ond-ej-Jirman/dt-bindings-vendor-prefix-Add-prefix-for-Voltafield/20240212-045510
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240211205211.2890931-5-megi%40xff.cz
patch subject: [PATCH 4/4] iio: magnetometer: add a driver for Voltafield AF8133J magnetometer
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: openrisc-randconfig-r133-20240212 (https://download.01.org/0day-ci/archive/20240212/202402121800.Dk09l1F8-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240212/202402121800.Dk09l1F8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402121800.Dk09l1F8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/magnetometer/af8133j.c:492:25: sparse: sparse: symbol 'af8133j_pm_ops' was not declared. Should it be static?

vim +/af8133j_pm_ops +492 drivers/iio/magnetometer/af8133j.c

5f47c80d82e489 Icenowy Zheng 2024-02-11  491  
5f47c80d82e489 Icenowy Zheng 2024-02-11 @492  const struct dev_pm_ops af8133j_pm_ops = {
5f47c80d82e489 Icenowy Zheng 2024-02-11  493  	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
5f47c80d82e489 Icenowy Zheng 2024-02-11  494  	SET_RUNTIME_PM_OPS(af8133j_runtime_suspend, af8133j_runtime_resume, NULL)
5f47c80d82e489 Icenowy Zheng 2024-02-11  495  };
5f47c80d82e489 Icenowy Zheng 2024-02-11  496  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
