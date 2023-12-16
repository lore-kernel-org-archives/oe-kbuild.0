Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46C820EC
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Dec 2023 03:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FL72cyRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702698000; x=1734234000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GO9GdbMwa+OUpwKIHySY27GM+ivHYxbN8e0tpykHps0=;
  b=FL72cyRcNCVW3NRQwxXeiKxOvvY8nlQtT8YOGOGHNDG8tQ0WhiKZvBPd
   BAPeaKrrubAzMl6SqKLFxGkPZDtKc91H8QFg/buMNPOjyxlF2Pzqz37Ar
   euKkrn268758Skfc/LGWHB5MDTGPe2Fgr9OETDd6938eEKahX4uiy66sy
   zWKRtSZXvZLZcPGChxHx6IXLuUO4RyaOVhoKvC62siwcohcT4I39iAdLA
   BYUSJf6PUpOrb3bhouayDLpYq/zAn0lSHAIvCC+AN4o2pqEGsTKe6pelQ
   MQC9P+3nMMi33avLf2hpB6kaLQ3mXflWyB8rd4aoO084azMgkzz0ZHhur
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="394230228"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="394230228"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 19:40:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="893128266"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="893128266"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 15 Dec 2023 19:39:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rELWv-00016e-0k;
	Sat, 16 Dec 2023 03:39:57 +0000
Date: Sat, 16 Dec 2023 11:39:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: scripts/kernel-doc: sound/ac97/bus.c:192: warning: Function
 parameter or struct member 'drv' not described in
 'snd_ac97_codec_driver_register'
Message-ID: <202312161120.io5hNEzJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3bd7d748816927202268cb335921f7f68b3ca723
commit: 5eab9265759e2fb042aa452931c3d06ab7ab8dae ASoC: PXA: make SND_PXA2XX_SOC_AC97 user-selectable
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: arm-pxa_defconfig (https://download.01.org/0day-ci/archive/20231216/202312161120.io5hNEzJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312161120.io5hNEzJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312161120.io5hNEzJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/kernel-doc: sound/ac97/bus.c:192: warning: Function parameter or struct member 'drv' not described in 'snd_ac97_codec_driver_register'
>> scripts/kernel-doc: sound/ac97/bus.c:192: warning: Excess function parameter 'dev' description in 'snd_ac97_codec_driver_register'
>> scripts/kernel-doc: sound/ac97/bus.c:205: warning: Function parameter or struct member 'drv' not described in 'snd_ac97_codec_driver_unregister'
>> scripts/kernel-doc: sound/ac97/bus.c:205: warning: Excess function parameter 'dev' description in 'snd_ac97_codec_driver_unregister'
>> scripts/kernel-doc: sound/ac97/bus.c:351: warning: Function parameter or struct member 'codecs_pdata' not described in 'snd_ac97_controller_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
