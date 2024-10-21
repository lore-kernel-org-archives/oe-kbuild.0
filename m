Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0559288D1
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 02:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729477716; cv=none; b=bcM55lSDBMBxLp5hPxF6SWgVFOco+b0YUvdIQGQdYR1h6tfjb057X1cX9uxoVpcZRxr0Mk8fatVzUUE4tpOqm6v9wW5r8YTUMPFlj263hVXwYJIk2ze7P3c+NYknVRpS1ApFmvKtI8kyTyXU77fvvzEW+t89r1qCRGNtpaycXeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729477716; c=relaxed/simple;
	bh=cVdRFPJ9kx2g+ltEZGbdHhPmbd3bSw+w635SDe5bxaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LHzlKv+WYWtSTSKRTouJxsPEceSzFGgFfixz6pVTTQ7N+3uBpFZ5O4GzreizSUri4KRdvNOei2OV2MkmYSsocL3i+AsLngEMg2szcPVMAdyL/EiGsQ51ZW4ME/fqAb0u91qzoslHvcCs4xfGqVll8dVz1sxWvGIR1KH08ukvgW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkbgJGWX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkbgJGWX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729477714; x=1761013714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cVdRFPJ9kx2g+ltEZGbdHhPmbd3bSw+w635SDe5bxaI=;
  b=PkbgJGWX9Kzjq1keF5pH7sBhF2SJAC4SuDPB0rnZCUUk4R7InCwZmtJ0
   CEq+XzmVhvNuA5ugRsMRDQTJvrpxwRj4k8ph6NhaAN18lsoMp7e0/pw3Q
   pw28+UeBtUzckh5bD7/2PfICvi11CV4gYUdkGczDW1x3rUwkZQbDiqSfz
   OVxyctkyH7YJTy8tDsiFxDfnTsBIdfacJqGqHYmT7D5nlznzPIOjY2hKf
   7oNb2CYkhDzb/M7e61fMi3oc/sU9bqELBcubM/ER4upDSWHlBpWshYdw/
   hkUGgfvjOzzkQv6cHujOFwrnaLz/pZ3GoIt3CC6cZmazqnpTbdHk+392o
   Q==;
X-CSE-ConnectionGUID: mCaIgk0JTiyKiBkRoeM06Q==
X-CSE-MsgGUID: 2IcRxYYmR72wCK9vgQkR0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="46438921"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="46438921"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 19:28:33 -0700
X-CSE-ConnectionGUID: K2/uapIOQL++IdXitBgdLg==
X-CSE-MsgGUID: BzXQLnSNTX2oupUyuBwbsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="83375082"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Oct 2024 19:28:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2i9m-000R3X-09;
	Mon, 21 Oct 2024 02:28:30 +0000
Date: Mon, 21 Oct 2024 10:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/mediatek/mt8186/mt8186-mt6366.c:1226
 mt8186_mt6366_legacy_probe() error: uninitialized symbol 'ret'.
Message-ID: <202410211049.qqMi0A07-lkp@intel.com>
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
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   42f7652d3eb527d03665b09edac47f85fb600924
commit: 6ed619b348bf0a490e70dea7a330cf44dc81c16d ASoC: mediatek: mt8186: Unify mt8186-mt6366 machine drivers
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
config: powerpc-randconfig-r072-20241021 (https://download.01.org/0day-ci/archive/20241021/202410211049.qqMi0A07-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410211049.qqMi0A07-lkp@intel.com/

smatch warnings:
sound/soc/mediatek/mt8186/mt8186-mt6366.c:1226 mt8186_mt6366_legacy_probe() error: uninitialized symbol 'ret'.

vim +/ret +1226 sound/soc/mediatek/mt8186/mt8186-mt6366.c

d88c433831015a sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c xiazhengqiao               2023-10-19  1179  
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1180  static int mt8186_mt6366_legacy_probe(struct mtk_soc_card_data *soc_card_data)
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1181  {
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1182  	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1183  	struct snd_soc_card *card = card_data->card;
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1184  	struct device *dev = card->dev;
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1185  	struct snd_soc_dai_link *dai_link;
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1186  	struct device_node *headset_codec, *playback_codec;
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1187  	int ret, i;
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1188  
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1189  	playback_codec = of_get_child_by_name(dev->of_node, "playback-codecs");
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1190  	if (!playback_codec)
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1191  		return dev_err_probe(dev, -EINVAL,
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1192  				     "Property 'playback-codecs' missing or invalid\n");
e14657c0f0022e sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Ajye Huang                 2022-11-02  1193  
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1194  	headset_codec = of_get_child_by_name(dev->of_node, "headset-codec");
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1195  	if (!headset_codec) {
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1196  		of_node_put(playback_codec);
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1197  		return dev_err_probe(dev, -EINVAL,
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1198  				     "Property 'headset-codec' missing or invalid\n");
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1199  	}
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1200  
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1201  	for_each_card_prelinks(card, i, dai_link) {
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1202  		ret = mt8186_mt6366_card_set_be_link(card, dai_link, playback_codec, "I2S3");
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1203  		if (ret) {
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1204  			dev_err_probe(dev, ret, "%s set playback_codec fail\n",
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1205  				      dai_link->name);
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1206  			break;
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1207  		}
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1208  
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1209  		ret = mt8186_mt6366_card_set_be_link(card, dai_link, headset_codec, "I2S0");
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1210  		if (ret) {
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1211  			dev_err_probe(dev, ret, "%s set headset_codec fail\n",
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1212  				      dai_link->name);
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1213  			break;
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1214  		}
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1215  
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1216  		ret = mt8186_mt6366_card_set_be_link(card, dai_link, headset_codec, "I2S1");
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1217  		if (ret) {
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1218  			dev_err_probe(dev, ret, "%s set headset_codec fail\n",
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1219  				      dai_link->name);
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1220  			break;
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1221  		}
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1222  	}
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1223  	of_node_put(headset_codec);
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1224  	of_node_put(playback_codec);
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1225  
44a53c8ec9cad0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16 @1226  	return ret;
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1227  }
0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1228  

:::::: The code at line 1226 was first introduced by commit
:::::: 44a53c8ec9cad02ce7dfd55094e8d7aeb48eb73c ASoC: mediatek: mt8186: Migrate to mtk_soundcard_common_probe

:::::: TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
