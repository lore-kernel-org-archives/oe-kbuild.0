Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AE881E
	for <oe-kbuild@lists.linux.dev>; Tue,  2 May 2023 09:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683018742; x=1714554742;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=M838INnTabRNH4eBdtfKZoF/UIpon/keKYdaEdDxC6s=;
  b=PtLnQAiFTWNDv5KqAOPEk53/+GJ+eW0akHORiMBdYHpFXDC2lqa/Z5jd
   32q8E+1aW+2ZAeMtpAfkourOCtN+CuiDxk+WkGzTMJuRqwF8mpP4AUf2R
   mY4H8xmfYSYeV6iTO7A663V/A9Z5lRpWFCPkcIi/LRf/HgIgkbA07aEY8
   mAsuc2pP3miDRJffVGdkhAPF4ZZW0XayNqO0tv1Tbe4e+rbMMhf10rWaK
   DOmH+B5815AmUB2TS5aFlM/z9/TnywGc/nDB88pDHCFn+9lt4Bs5qiOwZ
   wy2Jr+Q8lXdP+/yvmbur69bzBprp7VwjuXgLQ0Hldrzn3BWhf/4QWtysw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="434668206"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="434668206"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 02:12:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="698893866"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="698893866"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 02 May 2023 02:12:20 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptm3X-0000xc-1F;
	Tue, 02 May 2023 09:12:19 +0000
Date: Tue, 2 May 2023 17:11:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/ssm4567.c:184 avs_create_dapm_routes()
 warn: potentially one past the end of array 'dr[idx]'
Message-ID: <202305021738.reRLw0Se-lkp@intel.com>
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
commit: 69ea14efe99b533652255b07a9736a9856f50ea5 ASoC: Intel: avs: Add ssm4567 machine board
date:   11 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-m001-20230501 (https://download.01.org/0day-ci/archive/20230502/202305021738.reRLw0Se-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305021738.reRLw0Se-lkp@intel.com/

New smatch warnings:
sound/soc/intel/avs/boards/ssm4567.c:184 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'

Old smatch warnings:
sound/soc/intel/avs/boards/ssm4567.c:185 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'
sound/soc/intel/avs/boards/ssm4567.c:186 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'
sound/soc/intel/avs/boards/ssm4567.c:186 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'

vim +184 sound/soc/intel/avs/boards/ssm4567.c

69ea14efe99b53 Cezary Rojewski 2022-05-11  162  
69ea14efe99b53 Cezary Rojewski 2022-05-11  163  static int avs_create_dapm_routes(struct device *dev, int ssp_port,
69ea14efe99b53 Cezary Rojewski 2022-05-11  164  				  struct snd_soc_dapm_route **routes, int *num_routes)
69ea14efe99b53 Cezary Rojewski 2022-05-11  165  {
69ea14efe99b53 Cezary Rojewski 2022-05-11  166  	struct snd_soc_dapm_route *dr;
69ea14efe99b53 Cezary Rojewski 2022-05-11  167  	const int num_base = ARRAY_SIZE(card_base_routes);
69ea14efe99b53 Cezary Rojewski 2022-05-11  168  	const int num_dr = num_base + 4;
69ea14efe99b53 Cezary Rojewski 2022-05-11  169  	int idx;
69ea14efe99b53 Cezary Rojewski 2022-05-11  170  
69ea14efe99b53 Cezary Rojewski 2022-05-11  171  	dr = devm_kcalloc(dev, num_dr, sizeof(*dr), GFP_KERNEL);
69ea14efe99b53 Cezary Rojewski 2022-05-11  172  	if (!dr)
69ea14efe99b53 Cezary Rojewski 2022-05-11  173  		return -ENOMEM;
69ea14efe99b53 Cezary Rojewski 2022-05-11  174  
69ea14efe99b53 Cezary Rojewski 2022-05-11  175  	memcpy(dr, card_base_routes, num_base * sizeof(*dr));
69ea14efe99b53 Cezary Rojewski 2022-05-11  176  
69ea14efe99b53 Cezary Rojewski 2022-05-11  177  	idx = num_base;
69ea14efe99b53 Cezary Rojewski 2022-05-11  178  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "Left Playback");
69ea14efe99b53 Cezary Rojewski 2022-05-11  179  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
69ea14efe99b53 Cezary Rojewski 2022-05-11  180  	if (!dr[idx].sink || !dr[idx].source)
69ea14efe99b53 Cezary Rojewski 2022-05-11  181  		return -ENOMEM;
69ea14efe99b53 Cezary Rojewski 2022-05-11  182  
69ea14efe99b53 Cezary Rojewski 2022-05-11  183  	idx++;
69ea14efe99b53 Cezary Rojewski 2022-05-11 @184  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "Right Playback");
69ea14efe99b53 Cezary Rojewski 2022-05-11  185  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
69ea14efe99b53 Cezary Rojewski 2022-05-11  186  	if (!dr[idx].sink || !dr[idx].source)
69ea14efe99b53 Cezary Rojewski 2022-05-11  187  		return -ENOMEM;
69ea14efe99b53 Cezary Rojewski 2022-05-11  188  
69ea14efe99b53 Cezary Rojewski 2022-05-11  189  	idx++;
69ea14efe99b53 Cezary Rojewski 2022-05-11  190  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Rx", ssp_port);
69ea14efe99b53 Cezary Rojewski 2022-05-11  191  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "Left Capture Sense");
69ea14efe99b53 Cezary Rojewski 2022-05-11  192  	if (!dr[idx].sink || !dr[idx].source)
69ea14efe99b53 Cezary Rojewski 2022-05-11  193  		return -ENOMEM;
69ea14efe99b53 Cezary Rojewski 2022-05-11  194  
69ea14efe99b53 Cezary Rojewski 2022-05-11  195  	idx++;
69ea14efe99b53 Cezary Rojewski 2022-05-11  196  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Rx", ssp_port);
69ea14efe99b53 Cezary Rojewski 2022-05-11  197  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "Right Capture Sense");
69ea14efe99b53 Cezary Rojewski 2022-05-11  198  	if (!dr[idx].sink || !dr[idx].source)
69ea14efe99b53 Cezary Rojewski 2022-05-11  199  		return -ENOMEM;
69ea14efe99b53 Cezary Rojewski 2022-05-11  200  
69ea14efe99b53 Cezary Rojewski 2022-05-11  201  	*routes = dr;
69ea14efe99b53 Cezary Rojewski 2022-05-11  202  	*num_routes = num_dr;
69ea14efe99b53 Cezary Rojewski 2022-05-11  203  
69ea14efe99b53 Cezary Rojewski 2022-05-11  204  	return 0;
69ea14efe99b53 Cezary Rojewski 2022-05-11  205  }
69ea14efe99b53 Cezary Rojewski 2022-05-11  206  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
