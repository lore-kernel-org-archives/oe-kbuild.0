Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEAF63B5
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Nov 2023 07:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTCxgkS1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700897074; x=1732433074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o2BaaBmcOuH6ZeM3+bsd6cnJJH3qjzNJVBBPeRdu+/Q=;
  b=GTCxgkS1ad4on3FKek66ZNkcXPPoNFksvdbPL97IstPz+dhrMWhz8zSf
   I7eglFsq6V21j87T39FB+cXgAwxvFvHAGk48HgRqyDErKp5BKK9iaWe3M
   lgQBH4B4MI8JD0N8dH8gkwWJ3CLJ3ZrzzHDBkT7eX7R55oy5krL3XLw1j
   EXd0Jj4YNFRLUOBm4UoroUVxVwzlmMEd1F4VEgSIJrOJJahnNTjgU2G5x
   dnePxrS8mcqYdBtyt8P3nxfpW/HGOfhibnVi9COyAoSk+YxW6klauj6Iw
   cUwwCKTwoTm0qjMc9UceMzDQEboQa3yXNSxSBQtrc+Sjl8gLzwnWIxPN3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="372655162"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="372655162"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 23:24:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="1015075369"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="1015075369"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Nov 2023 23:24:30 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6n1g-0003iw-1E;
	Sat, 25 Nov 2023 07:24:28 +0000
Date: Sat, 25 Nov 2023 15:24:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 7/9] thermal: exynos: split initialization of TMU and
 the thermal zone
Message-ID: <202311251257.Fjn3kQH6-lkp@intel.com>
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
In-Reply-To: <20231120145049.310509-8-m.majewski2@samsung.com>
References: <20231120145049.310509-8-m.majewski2@samsung.com>
TO: Mateusz Majewski <m.majewski2@samsung.com>
TO: linux-pm@vger.kernel.org
TO: linux-samsung-soc@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-kernel@vger.kernel.org
CC: Mateusz Majewski <m.majewski2@samsung.com>
CC: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Amit Kucheria <amitk@kernel.org>
CC: Zhang Rui <rui.zhang@intel.com>
CC: Alim Akhtar <alim.akhtar@samsung.com>
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Mark Brown <broonie@kernel.org>
CC: Marek Szyprowski <m.szyprowski@samsung.com>
CC: Lukasz Luba <lukasz.luba@arm.com>

Hi Mateusz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mateusz-Majewski/thermal-exynos-remove-an-unnecessary-field-description/20231120-230641
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20231120145049.310509-8-m.majewski2%40samsung.com
patch subject: [PATCH v5 7/9] thermal: exynos: split initialization of TMU and the thermal zone
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-r081-20231123 (https://download.01.org/0day-ci/archive/20231125/202311251257.Fjn3kQH6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311251257.Fjn3kQH6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311251257.Fjn3kQH6-lkp@intel.com/

smatch warnings:
drivers/thermal/samsung/exynos_tmu.c:1064 exynos_tmu_probe() warn: missing unwind goto?
drivers/thermal/samsung/exynos_tmu.c:1103 exynos_tmu_probe() warn: 'data->clk' from clk_prepare() not released on lines: 1064.
drivers/thermal/samsung/exynos_tmu.c:1103 exynos_tmu_probe() warn: 'data->clk_sec' from clk_prepare() not released on lines: 1064.
drivers/thermal/samsung/exynos_tmu.c:1103 exynos_tmu_probe() warn: 'data->sclk' from clk_prepare_enable() not released on lines: 1064.

vim +1064 drivers/thermal/samsung/exynos_tmu.c

3b6a1a805f3424 drivers/thermal/samsung/exynos_tmu.c Lukasz Majewski          2015-01-23   979  
cebe7373a7e659 drivers/thermal/samsung/exynos_tmu.c Amit Daniel Kachhap      2013-06-24   980  static int exynos_tmu_probe(struct platform_device *pdev)
cebe7373a7e659 drivers/thermal/samsung/exynos_tmu.c Amit Daniel Kachhap      2013-06-24   981  {
3b6a1a805f3424 drivers/thermal/samsung/exynos_tmu.c Lukasz Majewski          2015-01-23   982  	struct exynos_tmu_data *data;
3b6a1a805f3424 drivers/thermal/samsung/exynos_tmu.c Lukasz Majewski          2015-01-23   983  	int ret;
cebe7373a7e659 drivers/thermal/samsung/exynos_tmu.c Amit Daniel Kachhap      2013-06-24   984  
79e093c3fe9de9 drivers/thermal/exynos_thermal.c     Amit Daniel Kachhap      2012-08-16   985  	data = devm_kzalloc(&pdev->dev, sizeof(struct exynos_tmu_data),
79e093c3fe9de9 drivers/thermal/exynos_thermal.c     Amit Daniel Kachhap      2012-08-16   986  					GFP_KERNEL);
2a9675b39ad1af drivers/thermal/samsung/exynos_tmu.c Jingoo Han               2014-05-07   987  	if (!data)
9d97e5c81e15af drivers/hwmon/exynos4_tmu.c          Donggeun Kim             2011-09-07   988  		return -ENOMEM;
9d97e5c81e15af drivers/hwmon/exynos4_tmu.c          Donggeun Kim             2011-09-07   989  
cebe7373a7e659 drivers/thermal/samsung/exynos_tmu.c Amit Daniel Kachhap      2013-06-24   990  	platform_set_drvdata(pdev, data);
cebe7373a7e659 drivers/thermal/samsung/exynos_tmu.c Amit Daniel Kachhap      2013-06-24   991  	mutex_init(&data->lock);
9d97e5c81e15af drivers/hwmon/exynos4_tmu.c          Donggeun Kim             2011-09-07   992  
824ead03b78403 drivers/thermal/samsung/exynos_tmu.c Krzysztof Kozlowski      2015-10-08   993  	/*
824ead03b78403 drivers/thermal/samsung/exynos_tmu.c Krzysztof Kozlowski      2015-10-08   994  	 * Try enabling the regulator if found
824ead03b78403 drivers/thermal/samsung/exynos_tmu.c Krzysztof Kozlowski      2015-10-08   995  	 * TODO: Add regulator as an SOC feature, so that regulator enable
824ead03b78403 drivers/thermal/samsung/exynos_tmu.c Krzysztof Kozlowski      2015-10-08   996  	 * is a compulsory call.
824ead03b78403 drivers/thermal/samsung/exynos_tmu.c Krzysztof Kozlowski      2015-10-08   997  	 */
ef1639e66e72af drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20   998  	ret = devm_regulator_get_enable_optional(&pdev->dev, "vtmu");
b2f20752180f71 drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20   999  	switch (ret) {
ef1639e66e72af drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1000  	case 0:
b2f20752180f71 drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1001  	case -ENODEV:
b2f20752180f71 drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1002  		break;
b2f20752180f71 drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1003  	case -EPROBE_DEFER:
ccb361d2fdda89 drivers/thermal/samsung/exynos_tmu.c Javier Martinez Canillas 2016-02-18  1004  		return -EPROBE_DEFER;
b2f20752180f71 drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1005  	default:
ef1639e66e72af drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1006  		dev_err(&pdev->dev, "Failed to get enabled regulator: %d\n",
b2f20752180f71 drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1007  			ret);
b2f20752180f71 drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1008  		return ret;
b2f20752180f71 drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1009  	}
824ead03b78403 drivers/thermal/samsung/exynos_tmu.c Krzysztof Kozlowski      2015-10-08  1010  
cebe7373a7e659 drivers/thermal/samsung/exynos_tmu.c Amit Daniel Kachhap      2013-06-24  1011  	ret = exynos_map_dt_data(pdev);
cebe7373a7e659 drivers/thermal/samsung/exynos_tmu.c Amit Daniel Kachhap      2013-06-24  1012  	if (ret)
ef1639e66e72af drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1013  		return ret;
9d97e5c81e15af drivers/hwmon/exynos4_tmu.c          Donggeun Kim             2011-09-07  1014  
2a16279c68bcfa drivers/thermal/exynos_thermal.c     Sachin Kamat             2013-04-18  1015  	data->clk = devm_clk_get(&pdev->dev, "tmu_apbif");
9d97e5c81e15af drivers/hwmon/exynos4_tmu.c          Donggeun Kim             2011-09-07  1016  	if (IS_ERR(data->clk)) {
9d97e5c81e15af drivers/hwmon/exynos4_tmu.c          Donggeun Kim             2011-09-07  1017  		dev_err(&pdev->dev, "Failed to get clock\n");
ef1639e66e72af drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1018  		return PTR_ERR(data->clk);
9d97e5c81e15af drivers/hwmon/exynos4_tmu.c          Donggeun Kim             2011-09-07  1019  	}
9d97e5c81e15af drivers/hwmon/exynos4_tmu.c          Donggeun Kim             2011-09-07  1020  
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1021  	data->clk_sec = devm_clk_get(&pdev->dev, "tmu_triminfo_apbif");
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1022  	if (IS_ERR(data->clk_sec)) {
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1023  		if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO) {
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1024  			dev_err(&pdev->dev, "Failed to get triminfo clock\n");
ef1639e66e72af drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1025  			return PTR_ERR(data->clk_sec);
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1026  		}
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1027  	} else {
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1028  		ret = clk_prepare(data->clk_sec);
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1029  		if (ret) {
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1030  			dev_err(&pdev->dev, "Failed to get clock\n");
ef1639e66e72af drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1031  			return ret;
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1032  		}
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1033  	}
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1034  
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1035  	ret = clk_prepare(data->clk);
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1036  	if (ret) {
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1037  		dev_err(&pdev->dev, "Failed to get clock\n");
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1038  		goto err_clk_sec;
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1039  	}
2a16279c68bcfa drivers/thermal/exynos_thermal.c     Sachin Kamat             2013-04-18  1040  
488c7455d74ce0 drivers/thermal/samsung/exynos_tmu.c Chanwoo Choi             2015-03-10  1041  	switch (data->soc) {
488c7455d74ce0 drivers/thermal/samsung/exynos_tmu.c Chanwoo Choi             2015-03-10  1042  	case SOC_ARCH_EXYNOS5433:
488c7455d74ce0 drivers/thermal/samsung/exynos_tmu.c Chanwoo Choi             2015-03-10  1043  	case SOC_ARCH_EXYNOS7:
6c247393cfdd66 drivers/thermal/samsung/exynos_tmu.c Abhilash Kesavan         2015-01-27  1044  		data->sclk = devm_clk_get(&pdev->dev, "tmu_sclk");
6c247393cfdd66 drivers/thermal/samsung/exynos_tmu.c Abhilash Kesavan         2015-01-27  1045  		if (IS_ERR(data->sclk)) {
6c247393cfdd66 drivers/thermal/samsung/exynos_tmu.c Abhilash Kesavan         2015-01-27  1046  			dev_err(&pdev->dev, "Failed to get sclk\n");
02d438f62c05f0 drivers/thermal/samsung/exynos_tmu.c Dan Carpenter            2021-08-10  1047  			ret = PTR_ERR(data->sclk);
6c247393cfdd66 drivers/thermal/samsung/exynos_tmu.c Abhilash Kesavan         2015-01-27  1048  			goto err_clk;
6c247393cfdd66 drivers/thermal/samsung/exynos_tmu.c Abhilash Kesavan         2015-01-27  1049  		} else {
6c247393cfdd66 drivers/thermal/samsung/exynos_tmu.c Abhilash Kesavan         2015-01-27  1050  			ret = clk_prepare_enable(data->sclk);
6c247393cfdd66 drivers/thermal/samsung/exynos_tmu.c Abhilash Kesavan         2015-01-27  1051  			if (ret) {
6c247393cfdd66 drivers/thermal/samsung/exynos_tmu.c Abhilash Kesavan         2015-01-27  1052  				dev_err(&pdev->dev, "Failed to enable sclk\n");
6c247393cfdd66 drivers/thermal/samsung/exynos_tmu.c Abhilash Kesavan         2015-01-27  1053  				goto err_clk;
6c247393cfdd66 drivers/thermal/samsung/exynos_tmu.c Abhilash Kesavan         2015-01-27  1054  			}
6c247393cfdd66 drivers/thermal/samsung/exynos_tmu.c Abhilash Kesavan         2015-01-27  1055  		}
488c7455d74ce0 drivers/thermal/samsung/exynos_tmu.c Chanwoo Choi             2015-03-10  1056  		break;
488c7455d74ce0 drivers/thermal/samsung/exynos_tmu.c Chanwoo Choi             2015-03-10  1057  	default:
488c7455d74ce0 drivers/thermal/samsung/exynos_tmu.c Chanwoo Choi             2015-03-10  1058  		break;
baba1ebb99ba1f drivers/thermal/samsung/exynos_tmu.c Krzysztof Kozlowski      2015-10-08  1059  	}
6c247393cfdd66 drivers/thermal/samsung/exynos_tmu.c Abhilash Kesavan         2015-01-27  1060  
9f72236db6c75b drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1061  	ret = exynos_tmu_initialize(pdev);
9f72236db6c75b drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1062  	if (ret) {
9f72236db6c75b drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1063  		dev_err(&pdev->dev, "Failed to initialize TMU\n");
9f72236db6c75b drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20 @1064  		return ret;
9f72236db6c75b drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1065  	}
9f72236db6c75b drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1066  
7ea98f70c73ea3 drivers/thermal/samsung/exynos_tmu.c Daniel Lezcano           2022-08-05  1067  	data->tzd = devm_thermal_of_zone_register(&pdev->dev, 0, data,
9e4249b4034090 drivers/thermal/samsung/exynos_tmu.c Krzysztof Kozlowski      2015-10-08  1068  						  &exynos_sensor_ops);
9e4249b4034090 drivers/thermal/samsung/exynos_tmu.c Krzysztof Kozlowski      2015-10-08  1069  	if (IS_ERR(data->tzd)) {
9e4249b4034090 drivers/thermal/samsung/exynos_tmu.c Krzysztof Kozlowski      2015-10-08  1070  		ret = PTR_ERR(data->tzd);
82bdde8ecdd7e5 drivers/thermal/samsung/exynos_tmu.c Marek Szyprowski         2020-02-28  1071  		if (ret != -EPROBE_DEFER)
82bdde8ecdd7e5 drivers/thermal/samsung/exynos_tmu.c Marek Szyprowski         2020-02-28  1072  			dev_err(&pdev->dev, "Failed to register sensor: %d\n",
82bdde8ecdd7e5 drivers/thermal/samsung/exynos_tmu.c Marek Szyprowski         2020-02-28  1073  				ret);
9e4249b4034090 drivers/thermal/samsung/exynos_tmu.c Krzysztof Kozlowski      2015-10-08  1074  		goto err_sclk;
9e4249b4034090 drivers/thermal/samsung/exynos_tmu.c Krzysztof Kozlowski      2015-10-08  1075  	}
6c247393cfdd66 drivers/thermal/samsung/exynos_tmu.c Abhilash Kesavan         2015-01-27  1076  
9f72236db6c75b drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1077  	ret = exynos_thermal_zone_configure(pdev);
9d97e5c81e15af drivers/hwmon/exynos4_tmu.c          Donggeun Kim             2011-09-07  1078  	if (ret) {
9f72236db6c75b drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1079  		dev_err(&pdev->dev, "Failed to configure the thermal zone\n");
7ea98f70c73ea3 drivers/thermal/samsung/exynos_tmu.c Daniel Lezcano           2022-08-05  1080  		goto err_sclk;
9d97e5c81e15af drivers/hwmon/exynos4_tmu.c          Donggeun Kim             2011-09-07  1081  	}
9d97e5c81e15af drivers/hwmon/exynos4_tmu.c          Donggeun Kim             2011-09-07  1082  
4147281723b2e6 drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1083  	ret = devm_request_threaded_irq(&pdev->dev, data->irq, NULL,
4147281723b2e6 drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1084  					exynos_tmu_threaded_irq,
4147281723b2e6 drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1085  					IRQF_TRIGGER_RISING
4147281723b2e6 drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1086  						| IRQF_SHARED | IRQF_ONESHOT,
4147281723b2e6 drivers/thermal/samsung/exynos_tmu.c Mateusz Majewski         2023-11-20  1087  					dev_name(&pdev->dev), data);
cebe7373a7e659 drivers/thermal/samsung/exynos_tmu.c Amit Daniel Kachhap      2013-06-24  1088  	if (ret) {
cebe7373a7e659 drivers/thermal/samsung/exynos_tmu.c Amit Daniel Kachhap      2013-06-24  1089  		dev_err(&pdev->dev, "Failed to request irq: %d\n", data->irq);
7ea98f70c73ea3 drivers/thermal/samsung/exynos_tmu.c Daniel Lezcano           2022-08-05  1090  		goto err_sclk;
cebe7373a7e659 drivers/thermal/samsung/exynos_tmu.c Amit Daniel Kachhap      2013-06-24  1091  	}
bbf63be4f33135 drivers/thermal/exynos_thermal.c     Jonghwa Lee              2012-11-21  1092  
3b6a1a805f3424 drivers/thermal/samsung/exynos_tmu.c Lukasz Majewski          2015-01-23  1093  	exynos_tmu_control(pdev, true);
9d97e5c81e15af drivers/hwmon/exynos4_tmu.c          Donggeun Kim             2011-09-07  1094  	return 0;
9e4249b4034090 drivers/thermal/samsung/exynos_tmu.c Krzysztof Kozlowski      2015-10-08  1095  
6c247393cfdd66 drivers/thermal/samsung/exynos_tmu.c Abhilash Kesavan         2015-01-27  1096  err_sclk:
6c247393cfdd66 drivers/thermal/samsung/exynos_tmu.c Abhilash Kesavan         2015-01-27  1097  	clk_disable_unprepare(data->sclk);
9d97e5c81e15af drivers/hwmon/exynos4_tmu.c          Donggeun Kim             2011-09-07  1098  err_clk:
2a16279c68bcfa drivers/thermal/exynos_thermal.c     Sachin Kamat             2013-04-18  1099  	clk_unprepare(data->clk);
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1100  err_clk_sec:
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1101  	if (!IS_ERR(data->clk_sec))
14a11dc7e0dbf4 drivers/thermal/samsung/exynos_tmu.c Naveen Krishna Chatradhi 2013-12-19  1102  		clk_unprepare(data->clk_sec);
9d97e5c81e15af drivers/hwmon/exynos4_tmu.c          Donggeun Kim             2011-09-07 @1103  	return ret;
9d97e5c81e15af drivers/hwmon/exynos4_tmu.c          Donggeun Kim             2011-09-07  1104  }
9d97e5c81e15af drivers/hwmon/exynos4_tmu.c          Donggeun Kim             2011-09-07  1105  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
