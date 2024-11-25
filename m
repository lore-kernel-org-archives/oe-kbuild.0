Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8CA1B4126
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Nov 2024 16:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732553672; cv=none; b=cbh+mN9aIFGmzpTVYfz7qEZ4Fzrt7vzWUp/yUAtcU1G34gx7TbofOlIlWAS1fHEdo6Kz8aPkhNAJlyWuN1QJSVwlVzRcb0WoYHSICPAqzKSvmjoeXXYbbNhJNE4vzMfsqu0HNx8uUNwETdP9v5bSuMEaaBkZ1jiHBZIWBApFru8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732553672; c=relaxed/simple;
	bh=fX3Csva23ZIBR5FPxveOl0TLPopoOLs5DXe63GrEc0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gXu9XZR9pkARreCVyMw3B0ognFDXN7rMjtwyHSfI4VyW/DjVzfYFkAbkf5M2cRYsy/4T44moxHItMR8/LFDjJznsX6+26I/c070sILu7iBsDN6HAUXiqpdi6gpRsAwk5WspTdCuICuKjIOD02AMZV4t0qOnlBXRft5K2rE+zkPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bh9Tnim/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bh9Tnim/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732553671; x=1764089671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fX3Csva23ZIBR5FPxveOl0TLPopoOLs5DXe63GrEc0A=;
  b=bh9Tnim/31ZDY5uaCbEfhzcXjeGXBa+gmiW+Dr4bwsw45j7a1gdWWOsK
   v33LB28m5seOrhyJHIXl4Y0U9bt4PgAdTMinHvL5+fknd3XxUFYkzFeHt
   O4MY+w3oq3MeZNSUF74KSJkPhNzayECRMlsuH28dMCYkvDqAa1NuhIMfD
   UnGeWSMCkgQ9NYgiLO5q3LAe5G5uHSqtk7OHZ+yEJCdXygAqN9wG3CW3e
   p8g2tG1L2jmVl9Dq51QGXqW5tz2Br5TL1UOeb784nSJfEKdO5LNQGrfya
   NrqQ9Z5G7qwPf406FhAipwvm6EcuK99iMaQakBXcJ4CJQPft066wnAkcJ
   w==;
X-CSE-ConnectionGUID: X1qN67ILRoyvckM88AlYNA==
X-CSE-MsgGUID: Nt/LdPpnThCmMoaL7yiERQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32038019"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="32038019"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 08:54:30 -0800
X-CSE-ConnectionGUID: XtsnDGsKQxOwDmJxcGOSAw==
X-CSE-MsgGUID: H10VM5nRSWipBYu3gqrZ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="91744500"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2024 08:54:28 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFcLy-0006cQ-1G;
	Mon, 25 Nov 2024 16:54:26 +0000
Date: Tue, 26 Nov 2024 00:54:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/mediatek/mt8186/mt8186-mt6366.c:1226
 mt8186_mt6366_legacy_probe() error: uninitialized symbol 'ret'.
Message-ID: <202411260022.ZX2fugDA-lkp@intel.com>
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
head:   9f16d5e6f220661f73b36a4be1b21575651d8833
commit: 6ed619b348bf0a490e70dea7a330cf44dc81c16d ASoC: mediatek: mt8186: Unify mt8186-mt6366 machine drivers
date:   7 months ago
:::::: branch date: 2 days ago
:::::: commit date: 7 months ago
config: hexagon-randconfig-r072-20241125 (https://download.01.org/0day-ci/archive/20241126/202411260022.ZX2fugDA-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411260022.ZX2fugDA-lkp@intel.com/

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
