Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCC579DD
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Feb 2023 21:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675804415; x=1707340415;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=14P/a2QGK67Mwas30cdJh9JvaEEmdpx3AHQxDbfWtVQ=;
  b=SrX+OZJJQr7crcHoKA6RX8b8GYrpkLXpoglMef7EfJvddCbIfEQFkRBi
   OXBp5Fy+2yjGWpYRDwgnESNrFSUHihOAeo1+PVBAuSL9S/dxwm54clnzT
   BDt8Clbx97HZxhqYInngXxsVd1DTwNLd1F49DlMvD+fWGfJbA5R8/W6be
   VGYZOCCfu9lWb5Vqrf7M/yd93GkLjOZkcpOHr/fPfSesugMhdc8PI2vmg
   rbSJhx18G8jdATDbl6NdRndl/ldNPoyZTebKCdaETf5xWZSh58hEhDJkE
   EcGogwNZkVaiDsD/hVNIZpp0ktFDJqVmcai5154hlWbDWcN8Eok2Ma8i/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="317625448"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="317625448"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 13:13:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="775717258"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="775717258"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2023 13:13:33 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPVHQ-0003ti-2D;
	Tue, 07 Feb 2023 21:13:32 +0000
Date: Wed, 8 Feb 2023 05:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/rt5682.c:229 avs_create_dapm_routes()
 warn: potentially one past the end of array 'dr[idx]'
Message-ID: <202302080536.K751GXhX-lkp@intel.com>
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
head:   513c1a3d3f1982fb850c910937099525b0d35e24
commit: 748102786b3ce0bf402c2dc42386cbfaab71ac39 ASoC: Intel: avs: Add rt5682 machine board
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
config: microblaze-randconfig-m041-20230206 (https://download.01.org/0day-ci/archive/20230208/202302080536.K751GXhX-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

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
