Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1CD185E4A
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Nov 2025 01:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762133045; cv=none; b=sNiiqtFVITNdgm95fBbwtPSGV1rjm0cLiNIDWBXLbxONjRhdixd8QZZN5U8cEcRTQYGpAOz5zeNzj/wPqKjkoBnbOhFhUalAt9iToOTR60J5fpfgsCUAXztlvds12Hl54TjNDeWpxJNxo0NKL9VK0bImuaU0OkQwvmjC3KRKiog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762133045; c=relaxed/simple;
	bh=V4OgRA4TESDA/bgaNSxBjbz4pqEiwXCSSSWV/eJZbcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H13x3G0slFCIEHr5ZevFMwudXzhM6j/1uwsit/17kIhZIOxbUZTzemqaA3yIlrtXJU4csbghV/M5jS6VstHRUySdvUVKgpmp/rn2FiwkczGnJVZDe+9YOGsA6kxPySMsD497QytewieLzMl6p5BfJSyS103kKElhk8bTvWaC2U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RBC8BrLK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RBC8BrLK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762133043; x=1793669043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V4OgRA4TESDA/bgaNSxBjbz4pqEiwXCSSSWV/eJZbcI=;
  b=RBC8BrLK2Jd9YCS2rU0rJNhfxA6U/8/eFdvQDCe7l8UJAbnIxrSxO/EP
   xPZvRyjkgVWbA4ymd+RaiJdYUN8vACiGEFsWxtQmVNgrLu5o8pNstZ/Bx
   ta5Y1POx5GFapn+OIVjc1HaT+qRzRMUBMJB8sgy54aQsqM2pIPZOacmX4
   +gJxztHYesu7gd9wV7RzLcf7Ne/PxVHkZRtmdbzaX3MPkCHktO7oL7XQU
   geZN/o6VrQFoB2HbnzdG800ib530ht/IX4oLtwXgqu8rF+r/t2pwjx++R
   JrHm4suRFsGaQyeQTsct4tcTKCsiTqmkweer4jo/lCLr+l2WlA1MCz3WU
   A==;
X-CSE-ConnectionGUID: OLVEdJjZTBiiynbeBrNgvg==
X-CSE-MsgGUID: NF6mnSGGSkSw0bJeWsdVuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="74809855"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="74809855"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 17:24:02 -0800
X-CSE-ConnectionGUID: KpOCfPDJRvmUy7VUyxJgwA==
X-CSE-MsgGUID: hJs67KphRXa2S5xtSfA4qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="217370988"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 02 Nov 2025 17:24:01 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFjI4-000Pi4-2j;
	Mon, 03 Nov 2025 01:23:54 +0000
Date: Mon, 3 Nov 2025 09:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v6] memory: tegra210: Support interconnect framework
Message-ID: <202511030812.rbcbrDyU-lkp@intel.com>
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
In-Reply-To: <20251027-t210-actmon-p2-v6-1-1c4bd227d676@gmail.com>
References: <20251027-t210-actmon-p2-v6-1-1c4bd227d676@gmail.com>
TO: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
CC: linux-kernel@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: Aaron Kling <webgeek1234@gmail.com>

Hi Aaron,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 211ddde0823f1442e4ad052a2f30f050145ccada]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Kling-via-B4-Relay/memory-tegra210-Support-interconnect-framework/20251028-015017
base:   211ddde0823f1442e4ad052a2f30f050145ccada
patch link:    https://lore.kernel.org/r/20251027-t210-actmon-p2-v6-1-1c4bd227d676%40gmail.com
patch subject: [PATCH v6] memory: tegra210: Support interconnect framework
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-r071-20251102 (https://download.01.org/0day-ci/archive/20251103/202511030812.rbcbrDyU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511030812.rbcbrDyU-lkp@intel.com/

New smatch warnings:
drivers/memory/tegra/tegra210-emc-core.c:1984 tegra210_emc_opp_table_init() warn: passing zero to 'dev_err_probe'
drivers/memory/tegra/tegra210-emc-core.c:1985 tegra210_emc_opp_table_init() warn: missing error code 'err'

Old smatch warnings:
drivers/memory/tegra/tegra210-emc-core.c:1989 tegra210_emc_opp_table_init() warn: passing zero to 'dev_err_probe'
drivers/memory/tegra/tegra210-emc-core.c:1997 tegra210_emc_opp_table_init() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +1984 drivers/memory/tegra/tegra210-emc-core.c

7b344327c279ff Aaron Kling 2025-10-27  1957  
7b344327c279ff Aaron Kling 2025-10-27  1958  static int tegra210_emc_opp_table_init(struct tegra210_emc *emc)
7b344327c279ff Aaron Kling 2025-10-27  1959  {
7b344327c279ff Aaron Kling 2025-10-27  1960  	u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
7b344327c279ff Aaron Kling 2025-10-27  1961  	struct dev_pm_opp *opp;
7b344327c279ff Aaron Kling 2025-10-27  1962  	unsigned long rate;
7b344327c279ff Aaron Kling 2025-10-27  1963  	int opp_token, err, max_opps, i;
7b344327c279ff Aaron Kling 2025-10-27  1964  
7b344327c279ff Aaron Kling 2025-10-27  1965  	err = dev_pm_opp_set_supported_hw(emc->dev, &hw_version, 1);
7b344327c279ff Aaron Kling 2025-10-27  1966  	if (err < 0)
7b344327c279ff Aaron Kling 2025-10-27  1967  		return dev_err_probe(emc->dev, err, "failed to set OPP supported HW\n");
7b344327c279ff Aaron Kling 2025-10-27  1968  
7b344327c279ff Aaron Kling 2025-10-27  1969  	opp_token = err;
7b344327c279ff Aaron Kling 2025-10-27  1970  
7b344327c279ff Aaron Kling 2025-10-27  1971  	err = dev_pm_opp_of_add_table(emc->dev);
7b344327c279ff Aaron Kling 2025-10-27  1972  	if (err) {
7b344327c279ff Aaron Kling 2025-10-27  1973  		if (err == -ENODEV)
7b344327c279ff Aaron Kling 2025-10-27  1974  			dev_err_probe(emc->dev, err,
7b344327c279ff Aaron Kling 2025-10-27  1975  				      "OPP table not found, please update your device tree\n");
7b344327c279ff Aaron Kling 2025-10-27  1976  		else
7b344327c279ff Aaron Kling 2025-10-27  1977  			dev_err_probe(emc->dev, err, "failed to add OPP table\n");
7b344327c279ff Aaron Kling 2025-10-27  1978  
7b344327c279ff Aaron Kling 2025-10-27  1979  		goto put_hw_table;
7b344327c279ff Aaron Kling 2025-10-27  1980  	}
7b344327c279ff Aaron Kling 2025-10-27  1981  
7b344327c279ff Aaron Kling 2025-10-27  1982  	max_opps = dev_pm_opp_get_opp_count(emc->dev);
7b344327c279ff Aaron Kling 2025-10-27  1983  	if (max_opps <= 0) {
7b344327c279ff Aaron Kling 2025-10-27 @1984  		dev_err_probe(emc->dev, err, "Failed to add OPPs\n");
7b344327c279ff Aaron Kling 2025-10-27 @1985  		goto remove_table;
7b344327c279ff Aaron Kling 2025-10-27  1986  	}
7b344327c279ff Aaron Kling 2025-10-27  1987  
7b344327c279ff Aaron Kling 2025-10-27  1988  	if (emc->num_timings != max_opps) {
7b344327c279ff Aaron Kling 2025-10-27  1989  		dev_err_probe(emc->dev, err, "OPP table does not match emc table\n");
7b344327c279ff Aaron Kling 2025-10-27  1990  		goto remove_table;
7b344327c279ff Aaron Kling 2025-10-27  1991  	}
7b344327c279ff Aaron Kling 2025-10-27  1992  
7b344327c279ff Aaron Kling 2025-10-27  1993  	for (i = 0; i < emc->num_timings; i++) {
7b344327c279ff Aaron Kling 2025-10-27  1994  		rate = emc->timings[i].rate * 1000;
7b344327c279ff Aaron Kling 2025-10-27  1995  		opp = dev_pm_opp_find_freq_exact(emc->dev, rate, true);
7b344327c279ff Aaron Kling 2025-10-27  1996  		if (IS_ERR(opp)) {
7b344327c279ff Aaron Kling 2025-10-27  1997  			dev_err_probe(emc->dev, err, "Rate %lu not found in OPP table\n", rate);
7b344327c279ff Aaron Kling 2025-10-27  1998  			goto remove_table;
7b344327c279ff Aaron Kling 2025-10-27  1999  		}
7b344327c279ff Aaron Kling 2025-10-27  2000  
7b344327c279ff Aaron Kling 2025-10-27  2001  		dev_pm_opp_put(opp);
7b344327c279ff Aaron Kling 2025-10-27  2002  	}
7b344327c279ff Aaron Kling 2025-10-27  2003  
7b344327c279ff Aaron Kling 2025-10-27  2004  	dev_info_once(emc->dev, "OPP HW ver. 0x%x, current clock rate %lu MHz\n",
7b344327c279ff Aaron Kling 2025-10-27  2005  		      hw_version, clk_get_rate(emc->clk) / 1000000);
7b344327c279ff Aaron Kling 2025-10-27  2006  
7b344327c279ff Aaron Kling 2025-10-27  2007  	return 0;
7b344327c279ff Aaron Kling 2025-10-27  2008  
7b344327c279ff Aaron Kling 2025-10-27  2009  remove_table:
7b344327c279ff Aaron Kling 2025-10-27  2010  	dev_pm_opp_of_remove_table(emc->dev);
7b344327c279ff Aaron Kling 2025-10-27  2011  put_hw_table:
7b344327c279ff Aaron Kling 2025-10-27  2012  	dev_pm_opp_put_supported_hw(opp_token);
7b344327c279ff Aaron Kling 2025-10-27  2013  
7b344327c279ff Aaron Kling 2025-10-27  2014  	return err;
7b344327c279ff Aaron Kling 2025-10-27  2015  }
7b344327c279ff Aaron Kling 2025-10-27  2016  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
