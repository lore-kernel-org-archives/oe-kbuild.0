Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A024E18C32C
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 15:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734883161; cv=none; b=NpW3M7rQipXQmELOoVxbkh6vI2jisVpN82pdcL74+kledWbSZbkaCZ1gBoI9c+ZZvhYms1+8xW7XGep2HJv8jb7DlFAki+Jdpvcezb8QEg6S9Q49dusX2AhVinMfcZIMtlZ+K6gkoQllsdfJr0P0APf3FPtae7DhYDZuh+j6Og8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734883161; c=relaxed/simple;
	bh=sAWru7C5T/cdRVN/Tc0s3EfZr/WWDxVKLW861UjgtKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FNud6bqju/xS4Shx5kiB3oXDjhwbMbHWBfkuEGkwaDWhPRC/lWKyKoCb5TtlNy4AQdkdDWboMMJlOW5fet9ENuwv5E7UG0TiadEAFz5TrJaJWS9qhH40P96o12Gs+YY4X4YKYIe8CpsBlT/wNR1xkMuVf75x3dfD8Nvxb7Lehd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jd2fpVip; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jd2fpVip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734883160; x=1766419160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sAWru7C5T/cdRVN/Tc0s3EfZr/WWDxVKLW861UjgtKk=;
  b=jd2fpVipOEbFdiVDhycRXuE9gKwbAu2ma2lLQQVxZ1hBLYU7t++yQKz5
   fi+WRyiShenXPVbOb0+N3zn10ssbyZx3pgAHjonxjWfRS8eUS0S1tCt1V
   j5j4oAsZVFXzg6YK5ukaR0LfzxlsygE0667UyQEf3KV109Ej4IZFfU7VN
   6XkyWMOrA/nsv1jLSKcXJl7+1o49P3t6IqkSJX/DyVYoTmPaypO2JWiQa
   tsd7AYPWLs+Oek5EAPDlxh/8xBRcA80WJR4RJJUziBIhQNa7aU1KspZKP
   kjXOQC69wgeikLJiUT6+zHYG0gSvsKs8qU2O3A83jWlAHuv3F5GhhU+ru
   Q==;
X-CSE-ConnectionGUID: S/1EmHMRSZ653ILDbAf1Ig==
X-CSE-MsgGUID: BMB9JxzKRWmWMp3HtnI+Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="45966625"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="45966625"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 07:59:19 -0800
X-CSE-ConnectionGUID: B5muGsnXQYiyD/rhT6wlpg==
X-CSE-MsgGUID: DGYpKlfiRfGWlAzpD1TH2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="99054845"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Dec 2024 07:59:18 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPOMN-00031n-18;
	Sun, 22 Dec 2024 15:59:15 +0000
Date: Sun, 22 Dec 2024 23:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/mediatek/mt8186/mt8186-mt6366.c:1226
 mt8186_mt6366_legacy_probe() error: uninitialized symbol 'ret'.
Message-ID: <202412222338.M8PFCiJh-lkp@intel.com>
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
head:   48f506ad0b683d3e7e794efa60c5785c4fdc86fa
commit: 6ed619b348bf0a490e70dea7a330cf44dc81c16d ASoC: mediatek: mt8186: Unify mt8186-mt6366 machine drivers
date:   8 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-r072-20241219 (https://download.01.org/0day-ci/archive/20241222/202412222338.M8PFCiJh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412222338.M8PFCiJh-lkp@intel.com/

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
