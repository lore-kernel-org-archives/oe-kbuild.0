Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C17652
	for <oe-kbuild@lists.linux.dev>; Tue,  2 May 2023 04:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683003441; x=1714539441;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UGSCJhDFiuHuZRujrEPjbdpIadTymFQr6L+faaLcuNw=;
  b=JnHq72o49+3Hv4+3lNmxuENRMsdsCYVlruuhnLdAJiPQDAT8+h2L34m5
   uXe7ebQRWWnN6xCKtcsdh3nnAAp1QHXno3MTeNVrwe1aIqsEFmlJNpLWt
   JeDFvlaUQEi5SgxKkglHLFj0iKwb8IMRWG3NkeTPiROLA2EhP0BPePUYg
   gu3M9FopQ47iaMGgbOf4jOq+CpEOsfc8auRlg31iSQaEY5Gbp8unAksCs
   3PipDGc8ocKoSROecZeAhoAMtMgbqoU/Z2CUfLz7bp938JqkXXR2OYDw4
   olU06FVi0OMv1MSjvLYFPviEpsE4r+o95MbgFX+5u6VJ5Mkg+0uNPt33L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="411441432"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="411441432"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 21:57:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="785530998"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="785530998"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 May 2023 21:57:17 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pti4e-0000qa-0Q;
	Tue, 02 May 2023 04:57:12 +0000
Date: Tue, 2 May 2023 12:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/rt5682.c:229 avs_create_dapm_routes()
 warn: potentially one past the end of array 'dr[idx]'
Message-ID: <202305021252.sP4dSXpJ-lkp@intel.com>
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
commit: 748102786b3ce0bf402c2dc42386cbfaab71ac39 ASoC: Intel: avs: Add rt5682 machine board
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-m001-20230501 (https://download.01.org/0day-ci/archive/20230502/202305021252.sP4dSXpJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305021252.sP4dSXpJ-lkp@intel.com/

New smatch warnings:
sound/soc/intel/avs/boards/rt5682.c:229 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'

Old smatch warnings:
sound/soc/intel/avs/boards/rt5682.c:230 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'
sound/soc/intel/avs/boards/rt5682.c:231 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'
sound/soc/intel/avs/boards/rt5682.c:231 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'

vim +229 sound/soc/intel/avs/boards/rt5682.c

748102786b3ce0 Cezary Rojewski 2022-05-11  207  
748102786b3ce0 Cezary Rojewski 2022-05-11  208  static int avs_create_dapm_routes(struct device *dev, int ssp_port,
748102786b3ce0 Cezary Rojewski 2022-05-11  209  				  struct snd_soc_dapm_route **routes, int *num_routes)
748102786b3ce0 Cezary Rojewski 2022-05-11  210  {
748102786b3ce0 Cezary Rojewski 2022-05-11  211  	struct snd_soc_dapm_route *dr;
748102786b3ce0 Cezary Rojewski 2022-05-11  212  	const int num_base = ARRAY_SIZE(card_base_routes);
748102786b3ce0 Cezary Rojewski 2022-05-11  213  	const int num_dr = num_base + 2;
748102786b3ce0 Cezary Rojewski 2022-05-11  214  	int idx;
748102786b3ce0 Cezary Rojewski 2022-05-11  215  
748102786b3ce0 Cezary Rojewski 2022-05-11  216  	dr = devm_kcalloc(dev, num_dr, sizeof(*dr), GFP_KERNEL);
748102786b3ce0 Cezary Rojewski 2022-05-11  217  	if (!dr)
748102786b3ce0 Cezary Rojewski 2022-05-11  218  		return -ENOMEM;
748102786b3ce0 Cezary Rojewski 2022-05-11  219  
748102786b3ce0 Cezary Rojewski 2022-05-11  220  	memcpy(dr, card_base_routes, num_base * sizeof(*dr));
748102786b3ce0 Cezary Rojewski 2022-05-11  221  
748102786b3ce0 Cezary Rojewski 2022-05-11  222  	idx = num_base;
748102786b3ce0 Cezary Rojewski 2022-05-11  223  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "AIF1 Playback");
748102786b3ce0 Cezary Rojewski 2022-05-11  224  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
748102786b3ce0 Cezary Rojewski 2022-05-11  225  	if (!dr[idx].sink || !dr[idx].source)
748102786b3ce0 Cezary Rojewski 2022-05-11  226  		return -ENOMEM;
748102786b3ce0 Cezary Rojewski 2022-05-11  227  
748102786b3ce0 Cezary Rojewski 2022-05-11  228  	idx++;
748102786b3ce0 Cezary Rojewski 2022-05-11 @229  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Rx", ssp_port);
748102786b3ce0 Cezary Rojewski 2022-05-11  230  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "AIF1 Capture");
748102786b3ce0 Cezary Rojewski 2022-05-11  231  	if (!dr[idx].sink || !dr[idx].source)
748102786b3ce0 Cezary Rojewski 2022-05-11  232  		return -ENOMEM;
748102786b3ce0 Cezary Rojewski 2022-05-11  233  
748102786b3ce0 Cezary Rojewski 2022-05-11  234  	*routes = dr;
748102786b3ce0 Cezary Rojewski 2022-05-11  235  	*num_routes = num_dr;
748102786b3ce0 Cezary Rojewski 2022-05-11  236  
748102786b3ce0 Cezary Rojewski 2022-05-11  237  	return 0;
748102786b3ce0 Cezary Rojewski 2022-05-11  238  }
748102786b3ce0 Cezary Rojewski 2022-05-11  239  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
