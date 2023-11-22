Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8E4BE45
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 04:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnHTLCR7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700626023; x=1732162023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4NVGvwXeyd/QRt5ptn0wSyhlqGBXXtycrg3TXKG1AzM=;
  b=gnHTLCR7Y/yQJKAjcHICNiksyFmQuVZBJzB283Pbp5w5YgWONQhmopqF
   90nzBwmqEmx/acBku3+yM2FkfiC8QnGmnLTBEoCknlnty6uMdKypbKIH8
   B/lOt/eD2LDAbJuAtI0D3uyESP9fvG6227YBeTJYw3SGMqHPmQnyCDYnl
   cg5MCV9TbYiHxg7fVMTYnbQkOaE5ZT3jvE6BiP/mp7fYCIt3pnaxWTUT9
   C22OuXUG19ramKcSDgIonctlX4maoAH9kfwRFBt/LHROvEbRWUGIB5ek1
   msTa3tT3BeKxGlaZJ86t4cFCst9/DUKtbCOZ9aF6eMxh1v3a/ADdrGBsv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="389128203"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="389128203"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 20:07:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="795964611"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="795964611"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Nov 2023 20:07:01 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5eU4-0008co-21;
	Wed, 22 Nov 2023 04:05:48 +0000
Date: Wed, 22 Nov 2023 12:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v9 3/3] media: i2c: Introduce a driver for the Techwell
 TW9900 decoder
Message-ID: <202311221134.0i9KavRs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <dc65a89e7803782a75bf663158e031356ef7cb1a.1700235276.git.mehdi.djait@bootlin.com>
References: <dc65a89e7803782a75bf663158e031356ef7cb1a.1700235276.git.mehdi.djait@bootlin.com>
TO: Mehdi Djait <mehdi.djait@bootlin.com>
TO: mchehab@kernel.org
TO: heiko@sntech.de
TO: hverkuil-cisco@xs4all.nl
TO: laurent.pinchart@ideasonboard.com
TO: krzysztof.kozlowski+dt@linaro.org
TO: robh+dt@kernel.org
TO: conor+dt@kernel.org
CC: linux-media@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: thomas.petazzoni@bootlin.com
CC: alexandre.belloni@bootlin.com
CC: maxime.chevallier@bootlin.com
CC: paul.kocialkowski@bootlin.com
CC: Mehdi Djait <mehdi.djait@bootlin.com>

Hi Mehdi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on robh/for-next linuxtv-media-stage/master linus/master v6.7-rc2 next-20231121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mehdi-Djait/dt-bindings-vendor-prefixes-Add-techwell-vendor-prefix/20231117-234411
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/dc65a89e7803782a75bf663158e031356ef7cb1a.1700235276.git.mehdi.djait%40bootlin.com
patch subject: [PATCH v9 3/3] media: i2c: Introduce a driver for the Techwell TW9900 decoder
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: powerpc-randconfig-r071-20231122 (https://download.01.org/0day-ci/archive/20231122/202311221134.0i9KavRs-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311221134.0i9KavRs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311221134.0i9KavRs-lkp@intel.com/

New smatch warnings:
drivers/media/i2c/tw9900.c:628 tw9900_runtime_resume() warn: inconsistent returns '&tw9900->mutex'.

Old smatch warnings:
drivers/media/i2c/tw9900.c:348 tw9900_s_std() error: uninitialized symbol 'mode'.

vim +628 drivers/media/i2c/tw9900.c

cf24af11e0a74c Mehdi Djait 2023-11-17  596  
cf24af11e0a74c Mehdi Djait 2023-11-17  597  static int tw9900_runtime_resume(struct device *dev)
cf24af11e0a74c Mehdi Djait 2023-11-17  598  {
cf24af11e0a74c Mehdi Djait 2023-11-17  599  	struct i2c_client *client = to_i2c_client(dev);
cf24af11e0a74c Mehdi Djait 2023-11-17  600  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
cf24af11e0a74c Mehdi Djait 2023-11-17  601  	struct tw9900 *tw9900 = to_tw9900(sd);
cf24af11e0a74c Mehdi Djait 2023-11-17  602  	int ret;
cf24af11e0a74c Mehdi Djait 2023-11-17  603  
cf24af11e0a74c Mehdi Djait 2023-11-17  604  	mutex_lock(&tw9900->mutex);
cf24af11e0a74c Mehdi Djait 2023-11-17  605  
cf24af11e0a74c Mehdi Djait 2023-11-17  606  	if (tw9900->reset_gpio)
cf24af11e0a74c Mehdi Djait 2023-11-17  607  		gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
cf24af11e0a74c Mehdi Djait 2023-11-17  608  
cf24af11e0a74c Mehdi Djait 2023-11-17  609  	ret = regulator_enable(tw9900->regulator);
cf24af11e0a74c Mehdi Djait 2023-11-17  610  	if (ret < 0)
cf24af11e0a74c Mehdi Djait 2023-11-17  611  		return ret;
cf24af11e0a74c Mehdi Djait 2023-11-17  612  
cf24af11e0a74c Mehdi Djait 2023-11-17  613  	usleep_range(50000, 52000);
cf24af11e0a74c Mehdi Djait 2023-11-17  614  
cf24af11e0a74c Mehdi Djait 2023-11-17  615  	if (tw9900->reset_gpio)
cf24af11e0a74c Mehdi Djait 2023-11-17  616  		gpiod_set_value_cansleep(tw9900->reset_gpio, 0);
cf24af11e0a74c Mehdi Djait 2023-11-17  617  
cf24af11e0a74c Mehdi Djait 2023-11-17  618  	usleep_range(1000, 2000);
cf24af11e0a74c Mehdi Djait 2023-11-17  619  
cf24af11e0a74c Mehdi Djait 2023-11-17  620  	ret = tw9900_write_array(tw9900->client, tw9900_init_regs,
cf24af11e0a74c Mehdi Djait 2023-11-17  621  				 ARRAY_SIZE(tw9900_init_regs));
cf24af11e0a74c Mehdi Djait 2023-11-17  622  
cf24af11e0a74c Mehdi Djait 2023-11-17  623  	mutex_unlock(&tw9900->mutex);
cf24af11e0a74c Mehdi Djait 2023-11-17  624  
cf24af11e0a74c Mehdi Djait 2023-11-17  625  	/* This sleep is needed for the Horizontal Sync PLL to lock. */
cf24af11e0a74c Mehdi Djait 2023-11-17  626  	msleep(300);
cf24af11e0a74c Mehdi Djait 2023-11-17  627  
cf24af11e0a74c Mehdi Djait 2023-11-17 @628  	return ret;
cf24af11e0a74c Mehdi Djait 2023-11-17  629  }
cf24af11e0a74c Mehdi Djait 2023-11-17  630  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
