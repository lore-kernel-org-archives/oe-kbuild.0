Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A680D7E
	for <oe-kbuild@lists.linux.dev>; Tue,  2 May 2023 07:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683011417; x=1714547417;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JBZ+98/YjzewjlxHzrjQc5IyiCfaRVwhu4iwAkWfx+8=;
  b=Yn7HIkBi1OtHahJ3Dd2hVE8oyAVmcX3uR87FM36UmfHxdMuoS6vKiSMG
   caTNqFFZJksK5lftz5iLhNbieSO0OvMAPZN3CMBvZpg0BpwNtFJFwfdbp
   oRKT+Zp1me9/MH1zLu74Bnhspe3IDizLZnK+Xd9dVCyec3hrBelUgmzV1
   9pYgBO9K9pWDluwgfYgAPlIMoWQQpSO7scEzk+0RTNRTuxG7LZUKBPn2b
   OUkeGc6ZIGqoF+cRqsIE3ZQpiazIPgyAqhI+O6qGIoi/vdCuYud8rHUoF
   FDbHI5uGQBGpMe2k/MWvZkrsuSzsbtMy6iwxLg0W5BhsFHrjp/BRcJWfh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="348377114"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="348377114"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 00:10:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="785568985"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="785568985"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 May 2023 00:10:15 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptk9O-0000tk-2z;
	Tue, 02 May 2023 07:10:14 +0000
Date: Tue, 2 May 2023 15:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/nau8825.c:239 avs_create_dapm_routes()
 warn: potentially one past the end of array 'dr[idx]'
Message-ID: <202305021525.NMqOVcXo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Cezary Rojewski <cezary.rojewski@intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Amadeusz Sławiński" <amadeuszx.slawinski@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   865fdb08197e657c59e74a35fa32362b12397f58
commit: 32ee40b5590081a6b38a55e4ab16b47085f93afe ASoC: Intel: avs: Add nau8825 machine board
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-m001-20230501 (https://download.01.org/0day-ci/archive/20230502/202305021525.NMqOVcXo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305021525.NMqOVcXo-lkp@intel.com/

New smatch warnings:
sound/soc/intel/avs/boards/nau8825.c:239 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'

Old smatch warnings:
sound/soc/intel/avs/boards/nau8825.c:240 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'
sound/soc/intel/avs/boards/nau8825.c:241 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'
sound/soc/intel/avs/boards/nau8825.c:241 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'

vim +239 sound/soc/intel/avs/boards/nau8825.c

32ee40b5590081 Cezary Rojewski 2022-05-11  217  
32ee40b5590081 Cezary Rojewski 2022-05-11  218  static int avs_create_dapm_routes(struct device *dev, int ssp_port,
32ee40b5590081 Cezary Rojewski 2022-05-11  219  				  struct snd_soc_dapm_route **routes, int *num_routes)
32ee40b5590081 Cezary Rojewski 2022-05-11  220  {
32ee40b5590081 Cezary Rojewski 2022-05-11  221  	struct snd_soc_dapm_route *dr;
32ee40b5590081 Cezary Rojewski 2022-05-11  222  	const int num_base = ARRAY_SIZE(card_base_routes);
32ee40b5590081 Cezary Rojewski 2022-05-11  223  	const int num_dr = num_base + 2;
32ee40b5590081 Cezary Rojewski 2022-05-11  224  	int idx;
32ee40b5590081 Cezary Rojewski 2022-05-11  225  
32ee40b5590081 Cezary Rojewski 2022-05-11  226  	dr = devm_kcalloc(dev, num_dr, sizeof(*dr), GFP_KERNEL);
32ee40b5590081 Cezary Rojewski 2022-05-11  227  	if (!dr)
32ee40b5590081 Cezary Rojewski 2022-05-11  228  		return -ENOMEM;
32ee40b5590081 Cezary Rojewski 2022-05-11  229  
32ee40b5590081 Cezary Rojewski 2022-05-11  230  	memcpy(dr, card_base_routes, num_base * sizeof(*dr));
32ee40b5590081 Cezary Rojewski 2022-05-11  231  
32ee40b5590081 Cezary Rojewski 2022-05-11  232  	idx = num_base;
32ee40b5590081 Cezary Rojewski 2022-05-11  233  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "Playback");
32ee40b5590081 Cezary Rojewski 2022-05-11  234  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
32ee40b5590081 Cezary Rojewski 2022-05-11  235  	if (!dr[idx].sink || !dr[idx].source)
32ee40b5590081 Cezary Rojewski 2022-05-11  236  		return -ENOMEM;
32ee40b5590081 Cezary Rojewski 2022-05-11  237  
32ee40b5590081 Cezary Rojewski 2022-05-11  238  	idx++;
32ee40b5590081 Cezary Rojewski 2022-05-11 @239  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Rx", ssp_port);
32ee40b5590081 Cezary Rojewski 2022-05-11  240  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "Capture");
32ee40b5590081 Cezary Rojewski 2022-05-11  241  	if (!dr[idx].sink || !dr[idx].source)
32ee40b5590081 Cezary Rojewski 2022-05-11  242  		return -ENOMEM;
32ee40b5590081 Cezary Rojewski 2022-05-11  243  
32ee40b5590081 Cezary Rojewski 2022-05-11  244  	*routes = dr;
32ee40b5590081 Cezary Rojewski 2022-05-11  245  	*num_routes = num_dr;
32ee40b5590081 Cezary Rojewski 2022-05-11  246  
32ee40b5590081 Cezary Rojewski 2022-05-11  247  	return 0;
32ee40b5590081 Cezary Rojewski 2022-05-11  248  }
32ee40b5590081 Cezary Rojewski 2022-05-11  249  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
