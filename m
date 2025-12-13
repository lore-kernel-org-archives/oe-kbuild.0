Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9661420B7E1
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 05:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765602911; cv=none; b=Zleq7mjzQ703/TemT++2397RemEEgBllCcInex80Qoofz7VNE3Uhu2fv00ITTHpdEV3HUJhM1Jc5t5YpSlHkPfVkRPWf1i/N7t4yXiL543PTcpqdzw9knRrmLcstB5P8EgkbyPCQGIpa8RnkNnivEmUv9sf4/ul4OIlEzgObrJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765602911; c=relaxed/simple;
	bh=Hb5YcrGrB0YTTcCo/0/lPtXgDYn09gnhe/ZnMsv42eY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XpYJ49JcFFsI8zNfawZ/7aP1p2JTJ8VggK1Emhlf/DnxWUdLNySF0Mu7SpH79NMXz4buCcI87iEKxS5MNc/Y2emqZD3KRJmOxxcZt3KLxiz6TgrIL0L4H6Fk3JrH1ln4pF2iME83zhvOFLuPT3X9UP0oRqhIMsWEzrCTqmDMMDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h42+C74o; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h42+C74o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765602909; x=1797138909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hb5YcrGrB0YTTcCo/0/lPtXgDYn09gnhe/ZnMsv42eY=;
  b=h42+C74ole2N8R90E9LpdBxjQwOXpn/Btrg0l10jt/G0r97LGljxvPJH
   r+tjBbb57c/ORTzCzdZ/2s52QtI6gjXht4uwqLeiKasbAeMyPEPKcl4TT
   FgWm+f4f7zjUsNgzE0kOtkBmOt7SD2UJRT2vcovKxHB4rj1zPK2+xaU6o
   a1jI/bA0638dKOkT+d8bhPg/PJbquGyAddfuDXc0PqUpCUbYgLGQKgUlK
   XinGubLF/NsHM5Ji5171u3ft1kbcIy4ADyn5DB1NhuYF89zMsGVZGeilx
   89+QWXqFVuLLBBvCzfVv8SDma8SQ4aBSymA4hHqZ5Wrxrjsti9RIHXmPP
   A==;
X-CSE-ConnectionGUID: gGyoKJ/tSGGS3lBvLEF3yA==
X-CSE-MsgGUID: Z3jATGgwQE+UttEl+iZWRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78971158"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="78971158"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 21:15:07 -0800
X-CSE-ConnectionGUID: lHbSFAuyR9mIrYFZGQhTLg==
X-CSE-MsgGUID: THMDCTmhTSij7DOnbxr5ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197319981"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2025 21:15:06 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUHy7-0000000075n-1jpi;
	Sat, 13 Dec 2025 05:14:59 +0000
Date: Sat, 13 Dec 2025 13:14:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/soundwire/bus_type.c:108 sdw_drv_probe() error: Calling
 ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?
Message-ID: <202512131339.LMMvaF5G-lkp@intel.com>
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
TO: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9551a26f17d9445eed497bd7c639d48dfc3c0af4
commit: aab12022b076f0b385b7a9a78e1161bd2df5d1e3 soundwire: bus: Add internal slave ID and use for IRQs
date:   7 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131339.LMMvaF5G-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131339.LMMvaF5G-lkp@intel.com/

smatch warnings:
drivers/soundwire/bus_type.c:108 sdw_drv_probe() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?

vim +/max +108 drivers/soundwire/bus_type.c

9251345dca24b6 Vinod Koul           2017-12-14   80  
9251345dca24b6 Vinod Koul           2017-12-14   81  static int sdw_drv_probe(struct device *dev)
9251345dca24b6 Vinod Koul           2017-12-14   82  {
9251345dca24b6 Vinod Koul           2017-12-14   83  	struct sdw_slave *slave = dev_to_sdw_dev(dev);
9251345dca24b6 Vinod Koul           2017-12-14   84  	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
9251345dca24b6 Vinod Koul           2017-12-14   85  	const struct sdw_device_id *id;
9251345dca24b6 Vinod Koul           2017-12-14   86  	int ret;
9251345dca24b6 Vinod Koul           2017-12-14   87  
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   88  	/*
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   89  	 * fw description is mandatory to bind
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   90  	 */
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   91  	if (!dev->fwnode)
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   92  		return -ENODEV;
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   93  
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   94  	if (!IS_ENABLED(CONFIG_ACPI) && !dev->of_node)
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   95  		return -ENODEV;
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   96  
9251345dca24b6 Vinod Koul           2017-12-14   97  	id = sdw_get_device_id(slave, drv);
9251345dca24b6 Vinod Koul           2017-12-14   98  	if (!id)
9251345dca24b6 Vinod Koul           2017-12-14   99  		return -ENODEV;
9251345dca24b6 Vinod Koul           2017-12-14  100  
9251345dca24b6 Vinod Koul           2017-12-14  101  	/*
9251345dca24b6 Vinod Koul           2017-12-14  102  	 * attach to power domain but don't turn on (last arg)
9251345dca24b6 Vinod Koul           2017-12-14  103  	 */
9251345dca24b6 Vinod Koul           2017-12-14  104  	ret = dev_pm_domain_attach(dev, false);
29ffcc88f2065f Ulf Hansson          2018-04-26  105  	if (ret)
29ffcc88f2065f Ulf Hansson          2018-04-26  106  		return ret;
29ffcc88f2065f Ulf Hansson          2018-04-26  107  
aab12022b076f0 Charles Keepax       2025-04-29 @108  	ret = ida_alloc_max(&slave->bus->slave_ida, SDW_FW_MAX_DEVICES, GFP_KERNEL);
aab12022b076f0 Charles Keepax       2025-04-29  109  	if (ret < 0) {
aab12022b076f0 Charles Keepax       2025-04-29  110  		dev_err(dev, "Failed to allocated ID: %d\n", ret);
aab12022b076f0 Charles Keepax       2025-04-29  111  		return ret;
aab12022b076f0 Charles Keepax       2025-04-29  112  	}
aab12022b076f0 Charles Keepax       2025-04-29  113  	slave->index = ret;
aab12022b076f0 Charles Keepax       2025-04-29  114  
9251345dca24b6 Vinod Koul           2017-12-14  115  	ret = drv->probe(slave, id);
9251345dca24b6 Vinod Koul           2017-12-14  116  	if (ret) {
9251345dca24b6 Vinod Koul           2017-12-14  117  		dev_pm_domain_detach(dev, false);
aab12022b076f0 Charles Keepax       2025-04-29  118  		ida_free(&slave->bus->slave_ida, slave->index);
9251345dca24b6 Vinod Koul           2017-12-14  119  		return ret;
29ffcc88f2065f Ulf Hansson          2018-04-26  120  	}
56d4fe31af77f6 Vinod Koul           2017-12-14  121  
3dca1f89ae3455 Richard Fitzgerald   2023-01-23  122  	mutex_lock(&slave->sdw_dev_lock);
3dca1f89ae3455 Richard Fitzgerald   2023-01-23  123  
56d4fe31af77f6 Vinod Koul           2017-12-14  124  	/* device is probed so let's read the properties now */
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  125  	if (drv->ops && drv->ops->read_prop)
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  126  		drv->ops->read_prop(slave);
56d4fe31af77f6 Vinod Koul           2017-12-14  127  
3b6c4a11bf2b81 Charles Keepax       2023-09-20  128  	if (slave->prop.use_domain_irq)
3b6c4a11bf2b81 Charles Keepax       2023-09-20  129  		sdw_irq_create_mapping(slave);
12a95123bfe1dd Lucas Tanure         2023-08-04  130  
f88c1afe338edb Greg Kroah-Hartman   2024-01-30  131  	/* init the dynamic sysfs attributes we need */
f88c1afe338edb Greg Kroah-Hartman   2024-01-30  132  	ret = sdw_slave_sysfs_dpn_init(slave);
bcac59029955ae Pierre-Louis Bossart 2020-05-19  133  	if (ret < 0)
663229e2425588 Johan Hovold         2024-07-12  134  		dev_warn(dev, "failed to initialise sysfs: %d\n", ret);
bcac59029955ae Pierre-Louis Bossart 2020-05-19  135  
56d4fe31af77f6 Vinod Koul           2017-12-14  136  	/*
56d4fe31af77f6 Vinod Koul           2017-12-14  137  	 * Check for valid clk_stop_timeout, use DisCo worst case value of
56d4fe31af77f6 Vinod Koul           2017-12-14  138  	 * 300ms
56d4fe31af77f6 Vinod Koul           2017-12-14  139  	 *
56d4fe31af77f6 Vinod Koul           2017-12-14  140  	 * TODO: check the timeouts and driver removal case
56d4fe31af77f6 Vinod Koul           2017-12-14  141  	 */
56d4fe31af77f6 Vinod Koul           2017-12-14  142  	if (slave->prop.clk_stop_timeout == 0)
56d4fe31af77f6 Vinod Koul           2017-12-14  143  		slave->prop.clk_stop_timeout = 300;
56d4fe31af77f6 Vinod Koul           2017-12-14  144  
56d4fe31af77f6 Vinod Koul           2017-12-14  145  	slave->bus->clk_stop_timeout = max_t(u32, slave->bus->clk_stop_timeout,
56d4fe31af77f6 Vinod Koul           2017-12-14  146  					     slave->prop.clk_stop_timeout);
56d4fe31af77f6 Vinod Koul           2017-12-14  147  
2140b66b5d3ecf Pierre-Louis Bossart 2020-01-14  148  	slave->probed = true;
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  149  
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  150  	/*
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  151  	 * if the probe happened after the bus was started, notify the codec driver
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  152  	 * of the current hardware status to e.g. start the initialization.
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  153  	 * Errors are only logged as warnings to avoid failing the probe.
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  154  	 */
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  155  	if (drv->ops && drv->ops->update_status) {
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  156  		ret = drv->ops->update_status(slave, slave->status);
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  157  		if (ret < 0)
663229e2425588 Johan Hovold         2024-07-12  158  			dev_warn(dev, "failed to update status at probe: %d\n", ret);
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  159  	}
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  160  
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  161  	mutex_unlock(&slave->sdw_dev_lock);
2140b66b5d3ecf Pierre-Louis Bossart 2020-01-14  162  
2140b66b5d3ecf Pierre-Louis Bossart 2020-01-14  163  	dev_dbg(dev, "probe complete\n");
2140b66b5d3ecf Pierre-Louis Bossart 2020-01-14  164  
56d4fe31af77f6 Vinod Koul           2017-12-14  165  	return 0;
9251345dca24b6 Vinod Koul           2017-12-14  166  }
9251345dca24b6 Vinod Koul           2017-12-14  167  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
