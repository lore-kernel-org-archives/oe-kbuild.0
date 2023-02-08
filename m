Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA90388
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Feb 2023 02:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675824714; x=1707360714;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Q4YB9VeSoauM2JwA//+VNOTHzWUKhA8D2r/+uZ2iruY=;
  b=CsBV/ZVJtYQx0CLsXtvB9ouDuQAPmix7oVB73EMUsSpYW8DyHlXQ7f0h
   oIej8WWH8Sgx9d0bxxA5MfAsDteyIiL8gsxpgmTl/x6vSIrjGLSNpAtDh
   f68TFNKPWMbq5xdDcXQJE7APF76xNB1fbkyzx+ffRJCkR8EiUJtrQgbty
   Qyr2P1UAdpQhz6R/EUNWJLuPPK26oPeJnp6wg4wiVBRarnu7e9yeRWGlG
   jsqiSZ2zSnzC7T7SQESUTDnezFQWODN7oueYDj4W7dW+LiDABCd29BNBL
   o8NIsqLcfGFhGpWY18MU84m7DsFCaXMz4JNGh/2YUYE81cJSLVwASvFme
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="330984863"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="330984863"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 18:51:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="809777123"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="809777123"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2023 18:51:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPaYj-00046g-2M;
	Wed, 08 Feb 2023 02:51:45 +0000
Date: Wed, 8 Feb 2023 10:51:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/ssm4567.c:184 avs_create_dapm_routes()
 warn: potentially one past the end of array 'dr[idx]'
Message-ID: <202302081052.kHTRUF9m-lkp@intel.com>
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
head:   0983f6bf2bfc0789b51ddf7315f644ff4da50acb
commit: 69ea14efe99b533652255b07a9736a9856f50ea5 ASoC: Intel: avs: Add ssm4567 machine board
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: microblaze-randconfig-m041-20230206 (https://download.01.org/0day-ci/archive/20230208/202302081052.kHTRUF9m-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
sound/soc/intel/avs/boards/ssm4567.c:184 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'

Old smatch warnings:
sound/soc/intel/avs/boards/ssm4567.c:185 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'
sound/soc/intel/avs/boards/ssm4567.c:186 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'
sound/soc/intel/avs/boards/ssm4567.c:186 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'

vim +184 sound/soc/intel/avs/boards/ssm4567.c

69ea14efe99b533 Cezary Rojewski 2022-05-11  162  
69ea14efe99b533 Cezary Rojewski 2022-05-11  163  static int avs_create_dapm_routes(struct device *dev, int ssp_port,
69ea14efe99b533 Cezary Rojewski 2022-05-11  164  				  struct snd_soc_dapm_route **routes, int *num_routes)
69ea14efe99b533 Cezary Rojewski 2022-05-11  165  {
69ea14efe99b533 Cezary Rojewski 2022-05-11  166  	struct snd_soc_dapm_route *dr;
69ea14efe99b533 Cezary Rojewski 2022-05-11  167  	const int num_base = ARRAY_SIZE(card_base_routes);
69ea14efe99b533 Cezary Rojewski 2022-05-11  168  	const int num_dr = num_base + 4;
69ea14efe99b533 Cezary Rojewski 2022-05-11  169  	int idx;
69ea14efe99b533 Cezary Rojewski 2022-05-11  170  
69ea14efe99b533 Cezary Rojewski 2022-05-11  171  	dr = devm_kcalloc(dev, num_dr, sizeof(*dr), GFP_KERNEL);
69ea14efe99b533 Cezary Rojewski 2022-05-11  172  	if (!dr)
69ea14efe99b533 Cezary Rojewski 2022-05-11  173  		return -ENOMEM;
69ea14efe99b533 Cezary Rojewski 2022-05-11  174  
69ea14efe99b533 Cezary Rojewski 2022-05-11  175  	memcpy(dr, card_base_routes, num_base * sizeof(*dr));
69ea14efe99b533 Cezary Rojewski 2022-05-11  176  
69ea14efe99b533 Cezary Rojewski 2022-05-11  177  	idx = num_base;
69ea14efe99b533 Cezary Rojewski 2022-05-11  178  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "Left Playback");
69ea14efe99b533 Cezary Rojewski 2022-05-11  179  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
69ea14efe99b533 Cezary Rojewski 2022-05-11  180  	if (!dr[idx].sink || !dr[idx].source)
69ea14efe99b533 Cezary Rojewski 2022-05-11  181  		return -ENOMEM;
69ea14efe99b533 Cezary Rojewski 2022-05-11  182  
69ea14efe99b533 Cezary Rojewski 2022-05-11  183  	idx++;
69ea14efe99b533 Cezary Rojewski 2022-05-11 @184  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "Right Playback");
69ea14efe99b533 Cezary Rojewski 2022-05-11  185  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
69ea14efe99b533 Cezary Rojewski 2022-05-11  186  	if (!dr[idx].sink || !dr[idx].source)
69ea14efe99b533 Cezary Rojewski 2022-05-11  187  		return -ENOMEM;
69ea14efe99b533 Cezary Rojewski 2022-05-11  188  
69ea14efe99b533 Cezary Rojewski 2022-05-11  189  	idx++;
69ea14efe99b533 Cezary Rojewski 2022-05-11  190  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Rx", ssp_port);
69ea14efe99b533 Cezary Rojewski 2022-05-11  191  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "Left Capture Sense");
69ea14efe99b533 Cezary Rojewski 2022-05-11  192  	if (!dr[idx].sink || !dr[idx].source)
69ea14efe99b533 Cezary Rojewski 2022-05-11  193  		return -ENOMEM;
69ea14efe99b533 Cezary Rojewski 2022-05-11  194  
69ea14efe99b533 Cezary Rojewski 2022-05-11  195  	idx++;
69ea14efe99b533 Cezary Rojewski 2022-05-11  196  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Rx", ssp_port);
69ea14efe99b533 Cezary Rojewski 2022-05-11  197  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "Right Capture Sense");
69ea14efe99b533 Cezary Rojewski 2022-05-11  198  	if (!dr[idx].sink || !dr[idx].source)
69ea14efe99b533 Cezary Rojewski 2022-05-11  199  		return -ENOMEM;
69ea14efe99b533 Cezary Rojewski 2022-05-11  200  
69ea14efe99b533 Cezary Rojewski 2022-05-11  201  	*routes = dr;
69ea14efe99b533 Cezary Rojewski 2022-05-11  202  	*num_routes = num_dr;
69ea14efe99b533 Cezary Rojewski 2022-05-11  203  
69ea14efe99b533 Cezary Rojewski 2022-05-11  204  	return 0;
69ea14efe99b533 Cezary Rojewski 2022-05-11  205  }
69ea14efe99b533 Cezary Rojewski 2022-05-11  206  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
