Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4352C18A95E
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 03:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734751133; cv=none; b=no1QmbVQwWAMhz8Wo+He7hH3HjUtzziiMMpFO7h/GEseexW4fdbrzfLJ4aC6liyvXl2IEpI3ALqOwBKZD70bifQkAY8yzGDmRyBE7DinTSzWStW4PaM4T4oaRh/kSuyF5zR/ZtKZvEeMmapbzKnLl50cEnC7FlTruDfwRae47MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734751133; c=relaxed/simple;
	bh=/ng+DiKS7l+QFZRhIsFyOiJ/W07P2r1FI9DE2uG8XnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SMg7iCnnH45t4cGbtiNC+ub4ZVO0+sHrndaiYIYqgliKd3O9t1BCbt/1l/jSBP0g6/m4NPiBPZe9iQ4AWIQJ0qiWWE9Co1YVwjlXSZHWP+YpFoQTrFjslodbnNTu7I4Nu+xZYEU4rBAYI6kJSRRwJ5CKiwe4jVS2zgmdNbeM/0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iH7tBFEq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iH7tBFEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734751131; x=1766287131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ng+DiKS7l+QFZRhIsFyOiJ/W07P2r1FI9DE2uG8XnQ=;
  b=iH7tBFEqMV/2pAsE4RCOTC/2ZVFhjb0MANcsJlgt1acla49Mdafzm1D2
   4gRNBxoWeh89nPuHaem0YfQ0/+5sN8gdVSZqc0jzyHjOIND20ius+2yml
   QbVzkEFHWiwUXRCNjQxqSLHmRKgjoEMc5mv7PgdoRll8Xb37opeaBWP9J
   8bvZGjminS+qdv8azn8NKR4oKOg0GVBmlb4mQef+JNc9miRBDe4J4spJK
   719YJWLf1sU0v9JZEB1nFpsHMe5A3nUW8BQ9Yrt6XfcqU8wSeXKHDSTeq
   YjGDJguFM8WCRqjxccM6cW4aV7XPzdKFfna08kVrSB4ffVRF2c7d0hBaU
   A==;
X-CSE-ConnectionGUID: mri/YrVORPuKkWs8q1oLHQ==
X-CSE-MsgGUID: 2VF/izJrTCCIi3kU4z1mpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="46312357"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="46312357"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 19:18:48 -0800
X-CSE-ConnectionGUID: 3K5OIyOhTl60gq9MY+8L6A==
X-CSE-MsgGUID: gbPqVzADSd6YHoz0Y8ihSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="98449280"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2024 19:18:46 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOq0q-0001tJ-1q;
	Sat, 21 Dec 2024 03:18:44 +0000
Date: Sat, 21 Dec 2024 11:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/mediatek/mt8186/mt8186-mt6366.c:1226
 mt8186_mt6366_legacy_probe() error: uninitialized symbol 'ret'.
Message-ID: <202412211126.s6Z5YscP-lkp@intel.com>
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
head:   499551201b5f4fd3c0618a3e95e3d0d15ea18f31
commit: 6ed619b348bf0a490e70dea7a330cf44dc81c16d ASoC: mediatek: mt8186: Unify mt8186-mt6366 machine drivers
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-r072-20241219 (https://download.01.org/0day-ci/archive/20241221/202412211126.s6Z5YscP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412211126.s6Z5YscP-lkp@intel.com/

smatch warnings:
sound/soc/mediatek/mt8186/mt8186-mt6366.c:1226 mt8186_mt6366_legacy_probe() error: uninitialized symbol 'ret'.

vim +/ret +1226 sound/soc/mediatek/mt8186/mt8186-mt6366.c

d88c433831015a4 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c xiazhengqiao               2023-10-19  1179  
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1180  static int mt8186_mt6366_legacy_probe(struct mtk_soc_card_data *soc_card_data)
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1181  {
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1182  	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1183  	struct snd_soc_card *card = card_data->card;
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1184  	struct device *dev = card->dev;
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1185  	struct snd_soc_dai_link *dai_link;
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1186  	struct device_node *headset_codec, *playback_codec;
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1187  	int ret, i;
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1188  
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1189  	playback_codec = of_get_child_by_name(dev->of_node, "playback-codecs");
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1190  	if (!playback_codec)
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1191  		return dev_err_probe(dev, -EINVAL,
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1192  				     "Property 'playback-codecs' missing or invalid\n");
e14657c0f0022e0 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Ajye Huang                 2022-11-02  1193  
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1194  	headset_codec = of_get_child_by_name(dev->of_node, "headset-codec");
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1195  	if (!headset_codec) {
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1196  		of_node_put(playback_codec);
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1197  		return dev_err_probe(dev, -EINVAL,
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1198  				     "Property 'headset-codec' missing or invalid\n");
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1199  	}
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1200  
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1201  	for_each_card_prelinks(card, i, dai_link) {
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1202  		ret = mt8186_mt6366_card_set_be_link(card, dai_link, playback_codec, "I2S3");
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1203  		if (ret) {
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1204  			dev_err_probe(dev, ret, "%s set playback_codec fail\n",
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1205  				      dai_link->name);
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1206  			break;
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1207  		}
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1208  
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1209  		ret = mt8186_mt6366_card_set_be_link(card, dai_link, headset_codec, "I2S0");
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1210  		if (ret) {
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1211  			dev_err_probe(dev, ret, "%s set headset_codec fail\n",
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1212  				      dai_link->name);
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1213  			break;
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1214  		}
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1215  
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1216  		ret = mt8186_mt6366_card_set_be_link(card, dai_link, headset_codec, "I2S1");
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1217  		if (ret) {
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1218  			dev_err_probe(dev, ret, "%s set headset_codec fail\n",
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1219  				      dai_link->name);
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1220  			break;
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1221  		}
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1222  	}
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1223  	of_node_put(headset_codec);
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16  1224  	of_node_put(playback_codec);
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1225  
44a53c8ec9cad02 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c AngeloGioacchino Del Regno 2024-04-16 @1226  	return ret;
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1227  }
0da16e370dd7a17 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1228  

:::::: The code at line 1226 was first introduced by commit
:::::: 44a53c8ec9cad02ce7dfd55094e8d7aeb48eb73c ASoC: mediatek: mt8186: Migrate to mtk_soundcard_common_probe

:::::: TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
