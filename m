Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D03528F8
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 12:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YB80nEcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701607613; x=1733143613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1XulPQPnoNjbjAnac0pkHZTuwM9QE+Hw4C0xZprlWpw=;
  b=YB80nEcuZxFj1r5fP4/dKhvFzeUR1it9PpJCDeTzgQQpnRU0tfLeng4k
   RFgaDPCltqVZoTNR7K3CmiPghgEo2yBYKDWTVVTTYSv94c+kiCIS9T9zJ
   pIUiG7kMGMof2YMXQCqANGax3O10roL+YSzL+A9yjGiq5CmByT/OqYPmI
   zgIFlChUIY0gI9KFeKCqrpnawfMYydBzwIx8OrWi5YcPy6FLorEjcJVpp
   d4gOLrZz7BKsHjoq79AgcV2k82XH+mfTjq65zaST0tW9ZwXqK0rgzUFTH
   u3v8QGEG3tyasdCjizgIffJ/nwTu30jBnAlUQVN62ZObj12swPdjH9MQJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="479844408"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="479844408"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 04:46:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="18301118"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 03 Dec 2023 04:46:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9lrp-0006ei-1W;
	Sun, 03 Dec 2023 12:46:45 +0000
Date: Sun, 3 Dec 2023 20:46:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/skylake/bxt-sst.c:249 bxt_load_base_firmware() warn:
 'ctx->fw' from request_firmware() not released on lines: 244.
Message-ID: <202312032058.Psgksmac-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Cezary Rojewski <cezary.rojewski@intel.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: 1b99d50b9709a2cddaba4a7faf1862b4f7bec865 ASoC: Intel: Skylake: Compile when any configuration is selected
date:   2 years, 9 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 2 years, 9 months ago
config: x86_64-randconfig-161-20231108 (https://download.01.org/0day-ci/archive/20231203/202312032058.Psgksmac-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312032058.Psgksmac-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312032058.Psgksmac-lkp@intel.com/

New smatch warnings:
sound/soc/intel/skylake/bxt-sst.c:249 bxt_load_base_firmware() warn: 'ctx->fw' from request_firmware() not released on lines: 244.
sound/soc/intel/skylake/skl-sst-utils.c:410 skl_prepare_lib_load() warn: 'linfo->fw' from request_firmware() not released on lines: 403.

Old smatch warnings:
sound/soc/intel/skylake/bxt-sst.c:202 bxt_load_base_firmware() error: we previously assumed 'ctx->fw' could be null (see line 187)
sound/soc/intel/skylake/skl-sst-utils.c:406 skl_prepare_lib_load() error: we previously assumed 'linfo->fw' could be null (see line 390)

vim +249 sound/soc/intel/skylake/bxt-sst.c

92eb4f62cbac02 Jeeja KP             2016-03-11  180  
92eb4f62cbac02 Jeeja KP             2016-03-11  181  static int bxt_load_base_firmware(struct sst_dsp *ctx)
92eb4f62cbac02 Jeeja KP             2016-03-11  182  {
bf242d19d5549d Vinod Koul           2016-05-30  183  	struct firmware stripped_fw;
bcc2a2dc3ba8c3 Cezary Rojewski      2019-07-23  184  	struct skl_dev *skl = ctx->thread_context;
7d3f91dc1e4db1 Jeeja KP             2017-02-17  185  	int ret, i;
92eb4f62cbac02 Jeeja KP             2016-03-11  186  
31d648f051fe82 Jeeja KP             2017-02-17  187  	if (ctx->fw == NULL) {
fdfa82ee1435dc Vinod Koul           2016-05-30  188  		ret = request_firmware(&ctx->fw, ctx->fw_name, ctx->dev);
92eb4f62cbac02 Jeeja KP             2016-03-11  189  		if (ret < 0) {
92eb4f62cbac02 Jeeja KP             2016-03-11  190  			dev_err(ctx->dev, "Request firmware failed %d\n", ret);
31d648f051fe82 Jeeja KP             2017-02-17  191  			return ret;
31d648f051fe82 Jeeja KP             2017-02-17  192  		}
92eb4f62cbac02 Jeeja KP             2016-03-11  193  	}
bf242d19d5549d Vinod Koul           2016-05-30  194  
0bdd6d8bedffdb Vinod Koul           2016-07-26  195  	/* prase uuids on first boot */
0bdd6d8bedffdb Vinod Koul           2016-07-26  196  	if (skl->is_first_boot) {
a8e2c19efd5d27 Senthilnathan Veppur 2016-07-26  197  		ret = snd_skl_parse_uuids(ctx, ctx->fw, BXT_ADSP_FW_BIN_HDR_OFFSET, 0);
3467a64dded3bc Vinod Koul           2016-05-30  198  		if (ret < 0)
3467a64dded3bc Vinod Koul           2016-05-30  199  			goto sst_load_base_firmware_failed;
0bdd6d8bedffdb Vinod Koul           2016-07-26  200  	}
bf242d19d5549d Vinod Koul           2016-05-30  201  
bf242d19d5549d Vinod Koul           2016-05-30  202  	stripped_fw.data = ctx->fw->data;
bf242d19d5549d Vinod Koul           2016-05-30  203  	stripped_fw.size = ctx->fw->size;
bf242d19d5549d Vinod Koul           2016-05-30  204  	skl_dsp_strip_extended_manifest(&stripped_fw);
bf242d19d5549d Vinod Koul           2016-05-30  205  
7d3f91dc1e4db1 Jeeja KP             2017-02-17  206  
7d3f91dc1e4db1 Jeeja KP             2017-02-17  207  	for (i = 0; i < BXT_FW_ROM_INIT_RETRY; i++) {
bf242d19d5549d Vinod Koul           2016-05-30  208  		ret = sst_bxt_prepare_fw(ctx, stripped_fw.data, stripped_fw.size);
7d3f91dc1e4db1 Jeeja KP             2017-02-17  209  		if (ret == 0)
7d3f91dc1e4db1 Jeeja KP             2017-02-17  210  			break;
7d3f91dc1e4db1 Jeeja KP             2017-02-17  211  	}
7d3f91dc1e4db1 Jeeja KP             2017-02-17  212  
92eb4f62cbac02 Jeeja KP             2016-03-11  213  	if (ret < 0) {
2023576dd74c9a Senthilnathan Veppur 2016-06-13  214  		dev_err(ctx->dev, "Error code=0x%x: FW status=0x%x\n",
2023576dd74c9a Senthilnathan Veppur 2016-06-13  215  			sst_dsp_shim_read(ctx, BXT_ADSP_ERROR_CODE),
2023576dd74c9a Senthilnathan Veppur 2016-06-13  216  			sst_dsp_shim_read(ctx, BXT_ADSP_FW_STATUS));
2023576dd74c9a Senthilnathan Veppur 2016-06-13  217  
92eb4f62cbac02 Jeeja KP             2016-03-11  218  		dev_err(ctx->dev, "Core En/ROM load fail:%d\n", ret);
92eb4f62cbac02 Jeeja KP             2016-03-11  219  		goto sst_load_base_firmware_failed;
92eb4f62cbac02 Jeeja KP             2016-03-11  220  	}
92eb4f62cbac02 Jeeja KP             2016-03-11  221  
92eb4f62cbac02 Jeeja KP             2016-03-11  222  	ret = sst_transfer_fw_host_dma(ctx);
92eb4f62cbac02 Jeeja KP             2016-03-11  223  	if (ret < 0) {
92eb4f62cbac02 Jeeja KP             2016-03-11  224  		dev_err(ctx->dev, "Transfer firmware failed %d\n", ret);
92eb4f62cbac02 Jeeja KP             2016-03-11  225  		dev_info(ctx->dev, "Error code=0x%x: FW status=0x%x\n",
92eb4f62cbac02 Jeeja KP             2016-03-11  226  			sst_dsp_shim_read(ctx, BXT_ADSP_ERROR_CODE),
92eb4f62cbac02 Jeeja KP             2016-03-11  227  			sst_dsp_shim_read(ctx, BXT_ADSP_FW_STATUS));
92eb4f62cbac02 Jeeja KP             2016-03-11  228  
052f103c89aa8f Jayachandran B       2016-06-21  229  		skl_dsp_disable_core(ctx, SKL_DSP_CORE0_MASK);
92eb4f62cbac02 Jeeja KP             2016-03-11  230  	} else {
92eb4f62cbac02 Jeeja KP             2016-03-11  231  		dev_dbg(ctx->dev, "Firmware download successful\n");
92eb4f62cbac02 Jeeja KP             2016-03-11  232  		ret = wait_event_timeout(skl->boot_wait, skl->boot_complete,
92eb4f62cbac02 Jeeja KP             2016-03-11  233  					msecs_to_jiffies(SKL_IPC_BOOT_MSECS));
92eb4f62cbac02 Jeeja KP             2016-03-11  234  		if (ret == 0) {
92eb4f62cbac02 Jeeja KP             2016-03-11  235  			dev_err(ctx->dev, "DSP boot fail, FW Ready timeout\n");
052f103c89aa8f Jayachandran B       2016-06-21  236  			skl_dsp_disable_core(ctx, SKL_DSP_CORE0_MASK);
92eb4f62cbac02 Jeeja KP             2016-03-11  237  			ret = -EIO;
92eb4f62cbac02 Jeeja KP             2016-03-11  238  		} else {
92eb4f62cbac02 Jeeja KP             2016-03-11  239  			ret = 0;
1665c177abf403 Jayachandran B       2016-06-13  240  			skl->fw_loaded = true;
92eb4f62cbac02 Jeeja KP             2016-03-11  241  		}
92eb4f62cbac02 Jeeja KP             2016-03-11  242  	}
92eb4f62cbac02 Jeeja KP             2016-03-11  243  
31d648f051fe82 Jeeja KP             2017-02-17  244  	return ret;
31d648f051fe82 Jeeja KP             2017-02-17  245  
92eb4f62cbac02 Jeeja KP             2016-03-11  246  sst_load_base_firmware_failed:
fdfa82ee1435dc Vinod Koul           2016-05-30  247  	release_firmware(ctx->fw);
31d648f051fe82 Jeeja KP             2017-02-17  248  	ctx->fw = NULL;
92eb4f62cbac02 Jeeja KP             2016-03-11 @249  	return ret;
92eb4f62cbac02 Jeeja KP             2016-03-11  250  }
92eb4f62cbac02 Jeeja KP             2016-03-11  251  

:::::: The code at line 249 was first introduced by commit
:::::: 92eb4f62cbac0211e43ee4a6715ee2ea43167e88 ASoC: Intel: Bxtn: Add Broxton DSP support

:::::: TO: Jeeja KP <jeeja.kp@intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
