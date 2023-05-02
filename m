Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7453C636
	for <oe-kbuild@lists.linux.dev>; Tue,  2 May 2023 02:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682995393; x=1714531393;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IB76bmWFiA+a+dnxKR0kq1ry/F0CXHTLKcpEfH7nURI=;
  b=j0BHf7h10P8QkPQ1/6htgfqICjWMfZvP/AtyALTbsJMWP7YcdSs1lvwn
   hPFyq6bJI1mGnFJSR90ilGI4nRHHUeTrmC4JaoN7EZhO0B/9oyG7/uKEC
   7k4AVi4ABGrWTzEWG49yywVCKyhAFz4hgYP3MQrqObbQ1+OHS/WpjKydg
   NtEi5nO+olwRHq8Mfl44NNqN0iWc/WmFHA/qKqbCWddF682heWzlJ8Dl+
   rxcboDtsEW7hn9XILEw5TKC1DY8Fgyw5EtuzjMCuexKrGHP9qyPEqrtzm
   Trh1448UqRbsVMJ4vI5TXZcZuOvmlZ5GC7bcBFhIzYo+2wlbnQUm08u1+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="348336331"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="348336331"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 19:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="726573290"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="726573290"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 May 2023 19:43:09 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptfyu-0000mQ-1w;
	Tue, 02 May 2023 02:43:08 +0000
Date: Tue, 2 May 2023 10:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/rt286.c:177 avs_create_dapm_routes()
 warn: potentially one past the end of array 'dr[idx]'
Message-ID: <202305021025.d8tvhQIp-lkp@intel.com>
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
commit: 1d395ee2e19b33a1008acfc7af186f2851b63d01 ASoC: Intel: avs: Add rt286 machine board
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-m001-20230501 (https://download.01.org/0day-ci/archive/20230502/202305021025.d8tvhQIp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305021025.d8tvhQIp-lkp@intel.com/

New smatch warnings:
sound/soc/intel/avs/boards/rt286.c:177 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'

Old smatch warnings:
sound/soc/intel/avs/boards/rt286.c:178 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'
sound/soc/intel/avs/boards/rt286.c:179 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'
sound/soc/intel/avs/boards/rt286.c:179 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'

vim +177 sound/soc/intel/avs/boards/rt286.c

1d395ee2e19b33 Cezary Rojewski 2022-05-11  155  
1d395ee2e19b33 Cezary Rojewski 2022-05-11  156  static int avs_create_dapm_routes(struct device *dev, int ssp_port,
1d395ee2e19b33 Cezary Rojewski 2022-05-11  157  				  struct snd_soc_dapm_route **routes, int *num_routes)
1d395ee2e19b33 Cezary Rojewski 2022-05-11  158  {
1d395ee2e19b33 Cezary Rojewski 2022-05-11  159  	struct snd_soc_dapm_route *dr;
1d395ee2e19b33 Cezary Rojewski 2022-05-11  160  	const int num_base = ARRAY_SIZE(card_base_routes);
1d395ee2e19b33 Cezary Rojewski 2022-05-11  161  	const int num_dr = num_base + 2;
1d395ee2e19b33 Cezary Rojewski 2022-05-11  162  	int idx;
1d395ee2e19b33 Cezary Rojewski 2022-05-11  163  
1d395ee2e19b33 Cezary Rojewski 2022-05-11  164  	dr = devm_kcalloc(dev, num_dr, sizeof(*dr), GFP_KERNEL);
1d395ee2e19b33 Cezary Rojewski 2022-05-11  165  	if (!dr)
1d395ee2e19b33 Cezary Rojewski 2022-05-11  166  		return -ENOMEM;
1d395ee2e19b33 Cezary Rojewski 2022-05-11  167  
1d395ee2e19b33 Cezary Rojewski 2022-05-11  168  	memcpy(dr, card_base_routes, num_base * sizeof(*dr));
1d395ee2e19b33 Cezary Rojewski 2022-05-11  169  
1d395ee2e19b33 Cezary Rojewski 2022-05-11  170  	idx = num_base;
1d395ee2e19b33 Cezary Rojewski 2022-05-11  171  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "AIF1 Playback");
1d395ee2e19b33 Cezary Rojewski 2022-05-11  172  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
1d395ee2e19b33 Cezary Rojewski 2022-05-11  173  	if (!dr[idx].sink || !dr[idx].source)
1d395ee2e19b33 Cezary Rojewski 2022-05-11  174  		return -ENOMEM;
1d395ee2e19b33 Cezary Rojewski 2022-05-11  175  
1d395ee2e19b33 Cezary Rojewski 2022-05-11  176  	idx++;
1d395ee2e19b33 Cezary Rojewski 2022-05-11 @177  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Rx", ssp_port);
1d395ee2e19b33 Cezary Rojewski 2022-05-11  178  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "AIF1 Capture");
1d395ee2e19b33 Cezary Rojewski 2022-05-11  179  	if (!dr[idx].sink || !dr[idx].source)
1d395ee2e19b33 Cezary Rojewski 2022-05-11  180  		return -ENOMEM;
1d395ee2e19b33 Cezary Rojewski 2022-05-11  181  
1d395ee2e19b33 Cezary Rojewski 2022-05-11  182  	*routes = dr;
1d395ee2e19b33 Cezary Rojewski 2022-05-11  183  	*num_routes = num_dr;
1d395ee2e19b33 Cezary Rojewski 2022-05-11  184  
1d395ee2e19b33 Cezary Rojewski 2022-05-11  185  	return 0;
1d395ee2e19b33 Cezary Rojewski 2022-05-11  186  }
1d395ee2e19b33 Cezary Rojewski 2022-05-11  187  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
