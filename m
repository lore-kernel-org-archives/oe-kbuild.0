Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E8FC8D1
	for <oe-kbuild@lists.linux.dev>; Thu, 16 May 2024 22:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715900023; cv=none; b=tgKrKFBeC+S8aDQKwe2+KXhdagotIiJbWBar7KMi9fzNzerYy89mcvO0Jzh0MoZzIo13ikp89tTyV5i1CTJqRLBl0LcDuSG41unMwV1/+5hadXvEDbGnbhOciOK7HbTGH9vl4zUbq4W0ioC/Obrpu0Y3FKuKBjrgsPGr6TwVucY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715900023; c=relaxed/simple;
	bh=HCXO1n9U362C7qyX3K7X+rbzlxnkU4amiKzn5F8yDH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XMq6irEQM+LO9XteLH3VRZLQx8kehnc/CX3vrT6XEuLfYSfAPX5ohuH8mq7DzC/n+NOcajgIXvCtTe+JhX6o/fe2j7jUZP+g/1au6R/DEundp/EFnAOAQsLFtZSfmcX6N0a73PVOqjmfSRjZ58V6r0MXee3uox7HVFiv4mKl8bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gt1q16y0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gt1q16y0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715900021; x=1747436021;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HCXO1n9U362C7qyX3K7X+rbzlxnkU4amiKzn5F8yDH0=;
  b=gt1q16y09rQcLiYoa35OxcJ2BZxK5D9ctO8zoz8NjOlIxUX9gsMiq3nX
   kX6rNJZas+1XxBnfRO+xjWr/s6UWCWARknPRVeIPQK4T7USHa6/LUPvxI
   TvqGnz2p47PymEYQQF6eIdkyaubXGhMMsbuhFOrr5KT0p44jC9LJKzc2Q
   rcLSzDPShgh9uCpMVh2gbUyJmnpjSJplRAgCVuHyin7ukwfYgpFmvRs75
   XBViOr6z/rAM5GvuDTiTXOcaNgBzO5N9rAJ7/4xvH4lMSBQKgamy6FBAz
   Ba9eA+EL7AAEbGPdtR8j/+iF+disBgITYqwLhTxIW8URSdwJK5/UFGJMv
   g==;
X-CSE-ConnectionGUID: DPw/8L6wR6W77wb5n9pH1g==
X-CSE-MsgGUID: cwAUZknFReacZoudm9ajaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29569976"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; 
   d="scan'208";a="29569976"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 15:53:40 -0700
X-CSE-ConnectionGUID: KfaTDoI8SN6+nv8xNspnXw==
X-CSE-MsgGUID: Uabe3yPLTXiZcsxXbgA3eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; 
   d="scan'208";a="31599645"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 May 2024 15:53:39 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7jyi-000Exb-1i;
	Thu, 16 May 2024 22:53:36 +0000
Date: Fri, 17 May 2024 06:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/thermal/mediatek/auxadc_thermal.c:1297 mtk_thermal_probe()
 warn: 'apmixed_base' from of_iomap() not released on lines: 1248,1253,1291.
Message-ID: <202405170635.pJsuzHsw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Ricardo Cañuelo" <ricardo.canuelo@collabora.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea5f6ad9ad9645733b72ab53a98e719b460d36a6
commit: 86edac7d3888c715fe3a81bd61f3617ecfe2e1dd Revert "thermal/drivers/mediatek: Use devm_of_iomap to avoid resource leak in mtk_thermal_probe"
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: alpha-randconfig-r081-20240516 (https://download.01.org/0day-ci/archive/20240517/202405170635.pJsuzHsw-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405170635.pJsuzHsw-lkp@intel.com/

smatch warnings:
drivers/thermal/mediatek/auxadc_thermal.c:1297 mtk_thermal_probe() warn: 'apmixed_base' from of_iomap() not released on lines: 1248,1253,1291.
drivers/thermal/mediatek/auxadc_thermal.c:1297 mtk_thermal_probe() warn: 'auxadc_base' from of_iomap() not released on lines: 1232,1238,1248,1253,1291.

vim +/apmixed_base +1297 drivers/thermal/mediatek/auxadc_thermal.c

89945047b1666c drivers/thermal/mtk_thermal.c             Henry Yen                 2020-04-30  1191  
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1192  static int mtk_thermal_probe(struct platform_device *pdev)
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1193  {
bd9403943d7d19 drivers/thermal/mtk_thermal.c             Michael Kao               2019-02-01  1194  	int ret, i, ctrl_id;
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1195  	struct device_node *auxadc, *apmixedsys, *np = pdev->dev.of_node;
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1196  	struct mtk_thermal *mt;
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1197  	u64 auxadc_phys_base, apmixed_phys_base;
1f6b0889d0ea03 drivers/thermal/mtk_thermal.c             Axel Lin                  2016-09-07  1198  	struct thermal_zone_device *tzdev;
89945047b1666c drivers/thermal/mtk_thermal.c             Henry Yen                 2020-04-30  1199  	void __iomem *apmixed_base, *auxadc_base;
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1200  
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1201  	mt = devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1202  	if (!mt)
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1203  		return -ENOMEM;
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1204  
9efc58dfa14a20 drivers/thermal/mtk_thermal.c             Ryder Lee                 2018-04-16  1205  	mt->conf = of_device_get_match_data(&pdev->dev);
b7cf0053738c54 drivers/thermal/mtk_thermal.c             dawei.chien@mediatek.com  2016-08-18  1206  
f7f6d3713282a2 drivers/thermal/mtk_thermal.c             ye xingchen               2023-01-18  1207  	mt->thermal_base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1208  	if (IS_ERR(mt->thermal_base))
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1209  		return PTR_ERR(mt->thermal_base);
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1210  
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1211  	ret = mtk_thermal_get_calibration_data(&pdev->dev, mt);
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1212  	if (ret)
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1213  		return ret;
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1214  
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1215  	mutex_init(&mt->lock);
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1216  
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1217  	mt->dev = &pdev->dev;
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1218  
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1219  	auxadc = of_parse_phandle(np, "mediatek,auxadc", 0);
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1220  	if (!auxadc) {
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1221  		dev_err(&pdev->dev, "missing auxadc node\n");
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1222  		return -ENODEV;
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1223  	}
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1224  
86edac7d3888c7 drivers/thermal/mediatek/auxadc_thermal.c Ricardo Cañuelo           2023-05-25  1225  	auxadc_base = of_iomap(auxadc, 0);
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1226  	auxadc_phys_base = of_get_phys_base(auxadc);
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1227  
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1228  	of_node_put(auxadc);
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1229  
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1230  	if (auxadc_phys_base == OF_BAD_ADDR) {
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1231  		dev_err(&pdev->dev, "Can't get auxadc phys address\n");
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1232  		return -EINVAL;
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1233  	}
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1234  
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1235  	apmixedsys = of_parse_phandle(np, "mediatek,apmixedsys", 0);
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1236  	if (!apmixedsys) {
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1237  		dev_err(&pdev->dev, "missing apmixedsys node\n");
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1238  		return -ENODEV;
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1239  	}
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1240  
86edac7d3888c7 drivers/thermal/mediatek/auxadc_thermal.c Ricardo Cañuelo           2023-05-25  1241  	apmixed_base = of_iomap(apmixedsys, 0);
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1242  	apmixed_phys_base = of_get_phys_base(apmixedsys);
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1243  
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1244  	of_node_put(apmixedsys);
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1245  
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1246  	if (apmixed_phys_base == OF_BAD_ADDR) {
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1247  		dev_err(&pdev->dev, "Can't get auxadc phys address\n");
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1248  		return -EINVAL;
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1249  	}
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1250  
703456ba76e944 drivers/thermal/mtk_thermal.c             Fabien Parent             2020-10-21  1251  	ret = device_reset_optional(&pdev->dev);
6760f3f74e72d6 drivers/thermal/mtk_thermal.c             Louis Yu                  2017-08-01  1252  	if (ret)
6760f3f74e72d6 drivers/thermal/mtk_thermal.c             Louis Yu                  2017-08-01  1253  		return ret;
6760f3f74e72d6 drivers/thermal/mtk_thermal.c             Louis Yu                  2017-08-01  1254  
a3e9a9a5971164 drivers/thermal/mediatek/auxadc_thermal.c Kang Chen                 2023-04-19  1255  	mt->clk_auxadc = devm_clk_get_enabled(&pdev->dev, "auxadc");
a3e9a9a5971164 drivers/thermal/mediatek/auxadc_thermal.c Kang Chen                 2023-04-19  1256  	if (IS_ERR(mt->clk_auxadc)) {
a3e9a9a5971164 drivers/thermal/mediatek/auxadc_thermal.c Kang Chen                 2023-04-19  1257  		ret = PTR_ERR(mt->clk_auxadc);
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1258  		dev_err(&pdev->dev, "Can't enable auxadc clk: %d\n", ret);
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1259  		return ret;
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1260  	}
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1261  
a3e9a9a5971164 drivers/thermal/mediatek/auxadc_thermal.c Kang Chen                 2023-04-19  1262  	mt->clk_peri_therm = devm_clk_get_enabled(&pdev->dev, "therm");
a3e9a9a5971164 drivers/thermal/mediatek/auxadc_thermal.c Kang Chen                 2023-04-19  1263  	if (IS_ERR(mt->clk_peri_therm)) {
a3e9a9a5971164 drivers/thermal/mediatek/auxadc_thermal.c Kang Chen                 2023-04-19  1264  		ret = PTR_ERR(mt->clk_peri_therm);
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1265  		dev_err(&pdev->dev, "Can't enable peri clk: %d\n", ret);
a3e9a9a5971164 drivers/thermal/mediatek/auxadc_thermal.c Kang Chen                 2023-04-19  1266  		return ret;
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1267  	}
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1268  
33140e668b1020 drivers/thermal/mediatek/auxadc_thermal.c Markus Schneider-Pargmann 2023-01-27  1269  	mtk_thermal_turn_on_buffer(mt, apmixed_base);
33140e668b1020 drivers/thermal/mediatek/auxadc_thermal.c Markus Schneider-Pargmann 2023-01-27  1270  
33140e668b1020 drivers/thermal/mediatek/auxadc_thermal.c Markus Schneider-Pargmann 2023-01-27  1271  	if (mt->conf->version != MTK_THERMAL_V2)
89945047b1666c drivers/thermal/mtk_thermal.c             Henry Yen                 2020-04-30  1272  		mtk_thermal_release_periodic_ts(mt, auxadc_base);
89945047b1666c drivers/thermal/mtk_thermal.c             Henry Yen                 2020-04-30  1273  
4f2ee0aa2e7062 drivers/thermal/mtk_thermal.c             Daniel Golle              2023-01-18  1274  	if (mt->conf->version == MTK_THERMAL_V1)
4f2ee0aa2e7062 drivers/thermal/mtk_thermal.c             Daniel Golle              2023-01-18  1275  		mt->raw_to_mcelsius = raw_to_mcelsius_v1;
248da1fc8418c7 drivers/thermal/mtk_thermal.c             Daniel Golle              2023-01-18  1276  	else if (mt->conf->version == MTK_THERMAL_V2)
4f2ee0aa2e7062 drivers/thermal/mtk_thermal.c             Daniel Golle              2023-01-18  1277  		mt->raw_to_mcelsius = raw_to_mcelsius_v2;
248da1fc8418c7 drivers/thermal/mtk_thermal.c             Daniel Golle              2023-01-18  1278  	else
248da1fc8418c7 drivers/thermal/mtk_thermal.c             Daniel Golle              2023-01-18  1279  		mt->raw_to_mcelsius = raw_to_mcelsius_v3;
4f2ee0aa2e7062 drivers/thermal/mtk_thermal.c             Daniel Golle              2023-01-18  1280  
bd9403943d7d19 drivers/thermal/mtk_thermal.c             Michael Kao               2019-02-01  1281  	for (ctrl_id = 0; ctrl_id < mt->conf->num_controller ; ctrl_id++)
b7cf0053738c54 drivers/thermal/mtk_thermal.c             dawei.chien@mediatek.com  2016-08-18  1282  		for (i = 0; i < mt->conf->num_banks; i++)
eb4fc33eb26807 drivers/thermal/mtk_thermal.c             Eduardo Valentin          2016-02-18  1283  			mtk_thermal_init_bank(mt, i, apmixed_phys_base,
bd9403943d7d19 drivers/thermal/mtk_thermal.c             Michael Kao               2019-02-01  1284  					      auxadc_phys_base, ctrl_id);
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1285  
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1286  	platform_set_drvdata(pdev, mt);
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1287  
ab7e865db9a54a drivers/thermal/mtk_thermal.c             Daniel Lezcano            2022-08-05  1288  	tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1289  					      &mtk_thermal_ops);
a3e9a9a5971164 drivers/thermal/mediatek/auxadc_thermal.c Kang Chen                 2023-04-19  1290  	if (IS_ERR(tzdev))
a3e9a9a5971164 drivers/thermal/mediatek/auxadc_thermal.c Kang Chen                 2023-04-19  1291  		return PTR_ERR(tzdev);
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1292  
4a16c190f761cb drivers/thermal/mediatek/auxadc_thermal.c Daniel Lezcano            2023-03-01  1293  	ret = devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
24e21d9f40ec3f drivers/thermal/mtk_thermal.c             Frank Wunderlich          2021-06-08  1294  	if (ret)
24e21d9f40ec3f drivers/thermal/mtk_thermal.c             Frank Wunderlich          2021-06-08  1295  		dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
24e21d9f40ec3f drivers/thermal/mtk_thermal.c             Frank Wunderlich          2021-06-08  1296  
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30 @1297  	return 0;
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1298  }
a92db1c8089e82 drivers/thermal/mtk_thermal.c             Sascha Hauer              2015-11-30  1299  

:::::: The code at line 1297 was first introduced by commit
:::::: a92db1c8089e82b7524545d15b6d6ee6cee67965 thermal: Add Mediatek thermal controller support

:::::: TO: Sascha Hauer <s.hauer@pengutronix.de>
:::::: CC: Eduardo Valentin <edubezval@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
