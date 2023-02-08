Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160492104
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Feb 2023 08:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675845781; x=1707381781;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CJjle0AOEr4pjwtJTDlM9TT1JbkCH8OlZ/vLZ2wwuG4=;
  b=LVEv+Ph/un+QYXBkQY0uKGYvWkccz2RJxJZEzFMc1Ny2y4yu5gnGbPo2
   DRWsHM53alOF7R/Jibz5Q9kmlG8iyiczV563SpQvGf4C41pt33y4M1aNJ
   /3+91W+oigtmVLa/5WispG/7kaX0gYGPUbaw+d3EQhvsprzyunMksrFiK
   LB9rE8+zsfClxYQLnUP5lQpT+fNc8jA6Qi14ds1MxAjr8mK849t3QpHCL
   R3Dzuv6ZWaY9Hu+ky+Cfu+tqU7lrPcMqyE+jkTZq+iJUlKt66p4dXeRct
   gs9p4U6ocv/1I85hvBPoBRpvKlq5UD5AwdOzu2cthaTHMWUep4Ea7S8Ix
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="357133755"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="357133755"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 00:43:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="791125721"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="791125721"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Feb 2023 00:42:58 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPg2b-0004KY-1T;
	Wed, 08 Feb 2023 08:42:57 +0000
Date: Wed, 8 Feb 2023 16:42:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/max98373.c:165 avs_create_dapm_routes()
 warn: potentially one past the end of array 'dr[idx]'
Message-ID: <202302081647.v1gT7qnG-lkp@intel.com>
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
TO: "Amadeusz Sławiński" <amadeuszx.slawinski@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: Cezary Rojewski <cezary.rojewski@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0983f6bf2bfc0789b51ddf7315f644ff4da50acb
commit: 223a0a945821b96f4ccd9940ee975499706e1794 ASoC: Intel: avs: Add max98373 machine board
date:   8 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 months ago
config: microblaze-randconfig-m041-20230206 (https://download.01.org/0day-ci/archive/20230208/202302081647.v1gT7qnG-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
sound/soc/intel/avs/boards/max98373.c:165 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'

Old smatch warnings:
sound/soc/intel/avs/boards/max98373.c:166 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'
sound/soc/intel/avs/boards/max98373.c:167 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'
sound/soc/intel/avs/boards/max98373.c:167 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'

vim +165 sound/soc/intel/avs/boards/max98373.c

223a0a945821b9 Amadeusz Sławiński 2022-05-11  143  
223a0a945821b9 Amadeusz Sławiński 2022-05-11  144  static int avs_create_dapm_routes(struct device *dev, int ssp_port,
223a0a945821b9 Amadeusz Sławiński 2022-05-11  145  				  struct snd_soc_dapm_route **routes, int *num_routes)
223a0a945821b9 Amadeusz Sławiński 2022-05-11  146  {
223a0a945821b9 Amadeusz Sławiński 2022-05-11  147  	struct snd_soc_dapm_route *dr;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  148  	const int num_base = ARRAY_SIZE(card_base_routes);
223a0a945821b9 Amadeusz Sławiński 2022-05-11  149  	const int num_dr = num_base + 2;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  150  	int idx;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  151  
223a0a945821b9 Amadeusz Sławiński 2022-05-11  152  	dr = devm_kcalloc(dev, num_dr, sizeof(*dr), GFP_KERNEL);
223a0a945821b9 Amadeusz Sławiński 2022-05-11  153  	if (!dr)
223a0a945821b9 Amadeusz Sławiński 2022-05-11  154  		return -ENOMEM;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  155  
223a0a945821b9 Amadeusz Sławiński 2022-05-11  156  	memcpy(dr, card_base_routes, num_base * sizeof(*dr));
223a0a945821b9 Amadeusz Sławiński 2022-05-11  157  
223a0a945821b9 Amadeusz Sławiński 2022-05-11  158  	idx = num_base;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  159  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "Left HiFi Playback");
223a0a945821b9 Amadeusz Sławiński 2022-05-11  160  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
223a0a945821b9 Amadeusz Sławiński 2022-05-11  161  	if (!dr[idx].sink || !dr[idx].source)
223a0a945821b9 Amadeusz Sławiński 2022-05-11  162  		return -ENOMEM;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  163  
223a0a945821b9 Amadeusz Sławiński 2022-05-11  164  	idx++;
223a0a945821b9 Amadeusz Sławiński 2022-05-11 @165  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "Right HiFi Playback");
223a0a945821b9 Amadeusz Sławiński 2022-05-11  166  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
223a0a945821b9 Amadeusz Sławiński 2022-05-11  167  	if (!dr[idx].sink || !dr[idx].source)
223a0a945821b9 Amadeusz Sławiński 2022-05-11  168  		return -ENOMEM;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  169  
223a0a945821b9 Amadeusz Sławiński 2022-05-11  170  	*routes = dr;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  171  	*num_routes = num_dr;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  172  
223a0a945821b9 Amadeusz Sławiński 2022-05-11  173  	return 0;
223a0a945821b9 Amadeusz Sławiński 2022-05-11  174  }
223a0a945821b9 Amadeusz Sławiński 2022-05-11  175  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
