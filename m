Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E24363
	for <oe-kbuild@lists.linux.dev>; Tue,  2 May 2023 00:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682986581; x=1714522581;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vY63j3Z8/K8ZYR5jHoBZoa2hm+1hmz5TIc7kfBKwd2o=;
  b=Hhpvj29vDQIaJTotUGFi5NTwfkf8gZIPU2WuXXEg0nI5LPGiWBgOkOrx
   klVqJixSbsIEaUEaQIk1WEUirHN8aq6P1hD5yu45h/h54qny4fSzVuyVv
   50pONs5wGA1E+sQAd/4hqrR/eNh3yw7az/joU8cTUU4Qr+OX5ExUqyLag
   LSTX/pZ2935dp9jpKq2bzeSIUDQEFvbZpbevDoKBw0lGvwRxOUP7llPCl
   yF6CcKt7s7JUV+/aNI+omDdwsxEI2jMcs+fRmuOql8JbZYgZYOxb+mfRa
   bUxHuuVT2QyfG7ReZ9n0GXrX4aV89xLvWfmTtaW4mbj23UK5eUsj6MlEK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="337391418"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="337391418"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 17:16:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="673411513"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="673411513"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 May 2023 17:16:18 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptdgn-0000iO-31;
	Tue, 02 May 2023 00:16:17 +0000
Date: Tue, 2 May 2023 08:15:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/rt274.c:206 avs_create_dapm_routes()
 warn: potentially one past the end of array 'dr[idx]'
Message-ID: <202305020844.CbT3FmN3-lkp@intel.com>
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
head:   c8c655c34e33544aec9d64b660872ab33c29b5f1
commit: e2a4cbf277c4561d01f1aafa3cfafe46bf3feec7 ASoC: Intel: avs: Add rt274 machine board
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-m001-20230501 (https://download.01.org/0day-ci/archive/20230502/202305020844.CbT3FmN3-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305020844.CbT3FmN3-lkp@intel.com/

New smatch warnings:
sound/soc/intel/avs/boards/rt274.c:206 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'

Old smatch warnings:
sound/soc/intel/avs/boards/rt274.c:207 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'
sound/soc/intel/avs/boards/rt274.c:208 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'
sound/soc/intel/avs/boards/rt274.c:208 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'

vim +206 sound/soc/intel/avs/boards/rt274.c

e2a4cbf277c456 Cezary Rojewski 2022-05-11  184  
e2a4cbf277c456 Cezary Rojewski 2022-05-11  185  static int avs_create_dapm_routes(struct device *dev, int ssp_port,
e2a4cbf277c456 Cezary Rojewski 2022-05-11  186  				  struct snd_soc_dapm_route **routes, int *num_routes)
e2a4cbf277c456 Cezary Rojewski 2022-05-11  187  {
e2a4cbf277c456 Cezary Rojewski 2022-05-11  188  	struct snd_soc_dapm_route *dr;
e2a4cbf277c456 Cezary Rojewski 2022-05-11  189  	const int num_base = ARRAY_SIZE(card_base_routes);
e2a4cbf277c456 Cezary Rojewski 2022-05-11  190  	const int num_dr = num_base + 2;
e2a4cbf277c456 Cezary Rojewski 2022-05-11  191  	int idx;
e2a4cbf277c456 Cezary Rojewski 2022-05-11  192  
e2a4cbf277c456 Cezary Rojewski 2022-05-11  193  	dr = devm_kcalloc(dev, num_dr, sizeof(*dr), GFP_KERNEL);
e2a4cbf277c456 Cezary Rojewski 2022-05-11  194  	if (!dr)
e2a4cbf277c456 Cezary Rojewski 2022-05-11  195  		return -ENOMEM;
e2a4cbf277c456 Cezary Rojewski 2022-05-11  196  
e2a4cbf277c456 Cezary Rojewski 2022-05-11  197  	memcpy(dr, card_base_routes, num_base * sizeof(*dr));
e2a4cbf277c456 Cezary Rojewski 2022-05-11  198  
e2a4cbf277c456 Cezary Rojewski 2022-05-11  199  	idx = num_base;
e2a4cbf277c456 Cezary Rojewski 2022-05-11  200  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "AIF1 Playback");
e2a4cbf277c456 Cezary Rojewski 2022-05-11  201  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
e2a4cbf277c456 Cezary Rojewski 2022-05-11  202  	if (!dr[idx].sink || !dr[idx].source)
e2a4cbf277c456 Cezary Rojewski 2022-05-11  203  		return -ENOMEM;
e2a4cbf277c456 Cezary Rojewski 2022-05-11  204  
e2a4cbf277c456 Cezary Rojewski 2022-05-11  205  	idx++;
e2a4cbf277c456 Cezary Rojewski 2022-05-11 @206  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Rx", ssp_port);
e2a4cbf277c456 Cezary Rojewski 2022-05-11  207  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "AIF1 Capture");
e2a4cbf277c456 Cezary Rojewski 2022-05-11  208  	if (!dr[idx].sink || !dr[idx].source)
e2a4cbf277c456 Cezary Rojewski 2022-05-11  209  		return -ENOMEM;
e2a4cbf277c456 Cezary Rojewski 2022-05-11  210  
e2a4cbf277c456 Cezary Rojewski 2022-05-11  211  	*routes = dr;
e2a4cbf277c456 Cezary Rojewski 2022-05-11  212  	*num_routes = num_dr;
e2a4cbf277c456 Cezary Rojewski 2022-05-11  213  
e2a4cbf277c456 Cezary Rojewski 2022-05-11  214  	return 0;
e2a4cbf277c456 Cezary Rojewski 2022-05-11  215  }
e2a4cbf277c456 Cezary Rojewski 2022-05-11  216  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
