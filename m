Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D077E
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jan 2024 00:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9n1YZsA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705190996; x=1736726996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+yZTK361/XH5wqNIYEJ3A1DvuyvM/j7jZAD+o7xpuds=;
  b=L9n1YZsA+E4EsTdcnTbxm+j8Vjeml97if3SEX9HDNcYtY6u3lDssyaEu
   qdBAag+2KOLQY9tgJG1821HASfFuusWGt2kznymG/DRowf6uFCgUvxbvE
   v95kALtKp1+ywr1yy9xucJgersfD6xtNp9mWOs4FMUmO/CwY6YWaGYwe4
   2t2fZLnh0fadiUW4FcgsKGF90U/ebXBUeLx+DHeMSgUgoqFZl8ZXHa/8g
   zsVX9YImJfFHVOIFPpyJlsGWhzADhvRhpC6ck6FK4UgsrgPpLrQefTeRR
   acJewwtOKt+AoyV1twh0CfFlyMyfnb7nvJ/jL40mHRuBzXjZgrBsj7vVk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="389864962"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="389864962"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 16:09:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="817456440"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="817456440"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Jan 2024 16:09:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOo4W-000B24-0n;
	Sun, 14 Jan 2024 00:09:52 +0000
Date: Sun, 14 Jan 2024 08:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/soc/codecs/rtq9128.c:608:12-13: WARNING opportunity for min()
Message-ID: <202401140828.qK3qXIos-lkp@intel.com>
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
TO: ChiYuan Huang <cy_huang@richtek.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   052d534373b7ed33712a63d5e17b2b6cdbce84fd
commit: 736064c64cf3fc51c6090884a9f4efe047f9f616 ASoC: codecs: Add Richtek rtq9128 audio amplifier support
date:   4 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-103-20240114 (https://download.01.org/0day-ci/archive/20240114/202401140828.qK3qXIos-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401140828.qK3qXIos-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/codecs/rtq9128.c:608:12-13: WARNING opportunity for min()
   sound/soc/codecs/rtq9128.c:621:12-13: WARNING opportunity for min()
   sound/soc/codecs/rtq9128.c:478:12-13: WARNING opportunity for min()

vim +608 sound/soc/codecs/rtq9128.c

736064c64cf3fc ChiYuan Huang 2023-09-20  538  
736064c64cf3fc ChiYuan Huang 2023-09-20  539  static int rtq9128_dai_hw_params(struct snd_pcm_substream *stream, struct snd_pcm_hw_params *param,
736064c64cf3fc ChiYuan Huang 2023-09-20  540  				 struct snd_soc_dai *dai)
736064c64cf3fc ChiYuan Huang 2023-09-20  541  {
736064c64cf3fc ChiYuan Huang 2023-09-20  542  	struct rtq9128_data *data = snd_soc_dai_get_drvdata(dai);
736064c64cf3fc ChiYuan Huang 2023-09-20  543  	unsigned int width, slot_width, bitrate, audbit, dolen;
736064c64cf3fc ChiYuan Huang 2023-09-20  544  	struct snd_soc_component *comp = dai->component;
736064c64cf3fc ChiYuan Huang 2023-09-20  545  	struct device *dev = dai->dev;
736064c64cf3fc ChiYuan Huang 2023-09-20  546  	int ret;
736064c64cf3fc ChiYuan Huang 2023-09-20  547  
736064c64cf3fc ChiYuan Huang 2023-09-20  548  	dev_dbg(dev, "%s: width %d\n", __func__, params_width(param));
736064c64cf3fc ChiYuan Huang 2023-09-20  549  
736064c64cf3fc ChiYuan Huang 2023-09-20  550  	switch (width = params_width(param)) {
736064c64cf3fc ChiYuan Huang 2023-09-20  551  	case 16:
736064c64cf3fc ChiYuan Huang 2023-09-20  552  		audbit = 0;
736064c64cf3fc ChiYuan Huang 2023-09-20  553  		break;
736064c64cf3fc ChiYuan Huang 2023-09-20  554  	case 18:
736064c64cf3fc ChiYuan Huang 2023-09-20  555  		audbit = 1;
736064c64cf3fc ChiYuan Huang 2023-09-20  556  		break;
736064c64cf3fc ChiYuan Huang 2023-09-20  557  	case 20:
736064c64cf3fc ChiYuan Huang 2023-09-20  558  		audbit = 2;
736064c64cf3fc ChiYuan Huang 2023-09-20  559  		break;
736064c64cf3fc ChiYuan Huang 2023-09-20  560  	case 24:
736064c64cf3fc ChiYuan Huang 2023-09-20  561  	case 32:
736064c64cf3fc ChiYuan Huang 2023-09-20  562  		audbit = 3;
736064c64cf3fc ChiYuan Huang 2023-09-20  563  		break;
736064c64cf3fc ChiYuan Huang 2023-09-20  564  	default:
736064c64cf3fc ChiYuan Huang 2023-09-20  565  		dev_err(dev, "Unsupported width (%d)\n", width);
736064c64cf3fc ChiYuan Huang 2023-09-20  566  		return -EINVAL;
736064c64cf3fc ChiYuan Huang 2023-09-20  567  	}
736064c64cf3fc ChiYuan Huang 2023-09-20  568  
736064c64cf3fc ChiYuan Huang 2023-09-20  569  	slot_width = params_physical_width(param);
736064c64cf3fc ChiYuan Huang 2023-09-20  570  
736064c64cf3fc ChiYuan Huang 2023-09-20  571  	if (data->tdm_slots) {
736064c64cf3fc ChiYuan Huang 2023-09-20  572  		if (slot_width > data->tdm_slot_width) {
736064c64cf3fc ChiYuan Huang 2023-09-20  573  			dev_err(dev, "slot width is larger than TDM slot width\n");
736064c64cf3fc ChiYuan Huang 2023-09-20  574  			return -EINVAL;
736064c64cf3fc ChiYuan Huang 2023-09-20  575  		}
736064c64cf3fc ChiYuan Huang 2023-09-20  576  
736064c64cf3fc ChiYuan Huang 2023-09-20  577  		/* Check BCK not exceed the maximum supported rate 24.576MHz */
736064c64cf3fc ChiYuan Huang 2023-09-20  578  		bitrate = data->tdm_slots * data->tdm_slot_width * params_rate(param);
736064c64cf3fc ChiYuan Huang 2023-09-20  579  		if (bitrate > 24576000) {
736064c64cf3fc ChiYuan Huang 2023-09-20  580  			dev_err(dev, "bitrate exceed the maximum (%d)\n", bitrate);
736064c64cf3fc ChiYuan Huang 2023-09-20  581  			return -EINVAL;
736064c64cf3fc ChiYuan Huang 2023-09-20  582  		}
736064c64cf3fc ChiYuan Huang 2023-09-20  583  
736064c64cf3fc ChiYuan Huang 2023-09-20  584  		/* If TDM is used, configure slot width as TDM slot witdh */
736064c64cf3fc ChiYuan Huang 2023-09-20  585  		slot_width = data->tdm_slot_width;
736064c64cf3fc ChiYuan Huang 2023-09-20  586  	}
736064c64cf3fc ChiYuan Huang 2023-09-20  587  
736064c64cf3fc ChiYuan Huang 2023-09-20  588  	switch (slot_width) {
736064c64cf3fc ChiYuan Huang 2023-09-20  589  	case 16:
736064c64cf3fc ChiYuan Huang 2023-09-20  590  		dolen = 0;
736064c64cf3fc ChiYuan Huang 2023-09-20  591  		break;
736064c64cf3fc ChiYuan Huang 2023-09-20  592  	case 24:
736064c64cf3fc ChiYuan Huang 2023-09-20  593  		dolen = 1;
736064c64cf3fc ChiYuan Huang 2023-09-20  594  		break;
736064c64cf3fc ChiYuan Huang 2023-09-20  595  	case 32:
736064c64cf3fc ChiYuan Huang 2023-09-20  596  		dolen = 2;
736064c64cf3fc ChiYuan Huang 2023-09-20  597  		break;
736064c64cf3fc ChiYuan Huang 2023-09-20  598  	default:
736064c64cf3fc ChiYuan Huang 2023-09-20  599  		dev_err(dev, "Unsupported slot width (%d)\n", slot_width);
736064c64cf3fc ChiYuan Huang 2023-09-20  600  		return -EINVAL;
736064c64cf3fc ChiYuan Huang 2023-09-20  601  	}
736064c64cf3fc ChiYuan Huang 2023-09-20  602  
736064c64cf3fc ChiYuan Huang 2023-09-20  603  	ret = snd_soc_component_write_field(comp, RTQ9128_REG_I2S_OPT, RTQ9128_AUDBIT_MASK, audbit);
736064c64cf3fc ChiYuan Huang 2023-09-20  604  	if (ret < 0)
736064c64cf3fc ChiYuan Huang 2023-09-20  605  		return ret;
736064c64cf3fc ChiYuan Huang 2023-09-20  606  
736064c64cf3fc ChiYuan Huang 2023-09-20  607  	ret = snd_soc_component_write_field(comp, RTQ9128_REG_SDO_SEL, RTQ9128_DOLEN_MASK, dolen);
736064c64cf3fc ChiYuan Huang 2023-09-20 @608  	return ret < 0 ? ret : 0;
736064c64cf3fc ChiYuan Huang 2023-09-20  609  }
736064c64cf3fc ChiYuan Huang 2023-09-20  610  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
