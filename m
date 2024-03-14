Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AFD18E20
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Mar 2024 12:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710420871; cv=none; b=jziA0NxagrFFh/Ot7jUh9l3KhdMSHa4IJ+RElfhWAzpzvf3wbjG7n8QuPBBdoQZpTzgLTxrn3yvHHLvdkty4zFi2yQQp0kCNHkS2hBNDXcLSE1IP/URFwFKaTvksk2BVzQwXTOPePR7QlxRFiudlGTBn2aMWyHacr0nWWLybMwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710420871; c=relaxed/simple;
	bh=WKfboF8odjzS5NLpRm3nleG9W1oVtrr36yhbYeQrAWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NXVjtX6hhj3l9PFNTSE2VZ9lTtV29CEBOQJP6hFFcLqSTiogRaj8bKFZabHkV2+HwrNIhr3TEBq4MHgMtHnYQ+uEe2L8LWIsLDa6pB7ZE+vHmAwmf5FFnjl9tISYsXpwcCHrxqoJplOD/lfBn3bzwfJrR7XBgXLQZqPu9Nawnoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMQ0AlMg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMQ0AlMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710420869; x=1741956869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WKfboF8odjzS5NLpRm3nleG9W1oVtrr36yhbYeQrAWQ=;
  b=NMQ0AlMgiqCRo3/40nJBKC+8GDm8XnexF+CLO19IwxEV8FgiNBbHM81h
   woa2tPXhDmmRH8BErfJCNGy5W9PSU5Z5DWllhDERBUeGZmz32jX/EcFuh
   09dEYlhK53h/okcjeCeWLyQh+4VVQbdtlG5/JDZy+m4m8mB8I7Vw9v2xJ
   011Yooi24V+ZJYOfLJDTPC64w3swz65vPyyiKco7mmBKuyZ/tgyETTnie
   Z7HVoy6ufk2arAmTQvGu1s7qxQ/2LKnQq39GJcxmac/PJCWPjgVKKPxML
   jeA1DWw9pghEGemi9asCf+T1UftKZ8DLp0wz9nr1uXrdFXHMe2vgQFPfC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="9058198"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="9058198"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 05:54:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="16930069"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Mar 2024 05:54:28 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkkbI-000DPZ-36;
	Thu, 14 Mar 2024 12:54:24 +0000
Date: Thu, 14 Mar 2024 20:53:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [plbossart-sound:sdw/disco-2.1 2/9] sound/hda/intel-sdw-acpi.c:93
 sdw_intel_scan_controller() warn: right shifting more than type allows 64 vs
 64
Message-ID: <202403142058.uafdseer-lkp@intel.com>
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
TO: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>

tree:   https://github.com/plbossart/sound sdw/disco-2.1
head:   15df3d8519e6b97c51edaa5a60f43df4b19f44c6
commit: a3edd2e5dde37524d4f5f103b7c1a6974c7eba02 [2/9] ALSA/hda: intel-sdw-acpi: add support for sdw-manager-list property read
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240314 (https://download.01.org/0day-ci/archive/20240314/202403142058.uafdseer-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403142058.uafdseer-lkp@intel.com/

smatch warnings:
sound/hda/intel-sdw-acpi.c:93 sdw_intel_scan_controller() warn: right shifting more than type allows 64 vs 64

vim +93 sound/hda/intel-sdw-acpi.c

08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   53  
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   54  static int
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   55  sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   56  {
ff4865b3c8cd74 Rafael J. Wysocki    2022-01-26   57  	struct acpi_device *adev = acpi_fetch_acpi_dev(info->handle);
a3edd2e5dde375 Pierre-Louis Bossart 2024-03-12   58  	unsigned long list_ul;
a3edd2e5dde375 Pierre-Louis Bossart 2024-03-12   59  	u32 list;
8d44869d3c0769 Pierre-Louis Bossart 2024-03-12   60  	u32 count;
485ddd519fbd89 Peter Ujfalusi       2023-09-12   61  	int ret;
a3edd2e5dde375 Pierre-Louis Bossart 2024-03-12   62  	int i;
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   63  
ff4865b3c8cd74 Rafael J. Wysocki    2022-01-26   64  	if (!adev)
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   65  		return -EINVAL;
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   66  
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   67  	/*
a3edd2e5dde375 Pierre-Louis Bossart 2024-03-12   68  	 * Found controller, find links supported
a3edd2e5dde375 Pierre-Louis Bossart 2024-03-12   69  	 *
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   70  	 * In theory we could check the number of links supported in
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   71  	 * hardware, but in that step we cannot assume SoundWire IP is
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   72  	 * powered.
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   73  	 *
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   74  	 * In addition, if the BIOS doesn't even provide this
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   75  	 * 'master-count' property then all the inits based on link
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   76  	 * masks will fail as well.
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   77  	 *
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   78  	 * We will check the hardware capabilities in the startup() step
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   79  	 */
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   80  
a3edd2e5dde375 Pierre-Louis Bossart 2024-03-12   81  	count = 0;
a3edd2e5dde375 Pierre-Louis Bossart 2024-03-12   82  	ret = fwnode_property_read_u32(acpi_fwnode_handle(adev),
a3edd2e5dde375 Pierre-Louis Bossart 2024-03-12   83  				       "mipi-sdw-manager-list", &list);
a3edd2e5dde375 Pierre-Louis Bossart 2024-03-12   84  	if (ret < 0) {
a3edd2e5dde375 Pierre-Louis Bossart 2024-03-12   85  		ret = fwnode_property_read_u32(acpi_fwnode_handle(adev),
a3edd2e5dde375 Pierre-Louis Bossart 2024-03-12   86  					       "mipi-sdw-master-count", &count);
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   87  		if (ret) {
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   88  			dev_err(&adev->dev,
a3edd2e5dde375 Pierre-Louis Bossart 2024-03-12   89  				"Failed to read mipi-sdw-manager-list or mipi-sdw-master-count: %d\n", ret);
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   90  			return -EINVAL;
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   91  		}
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   92  
a3edd2e5dde375 Pierre-Louis Bossart 2024-03-12  @93  		list = GENMASK(count - 1, 0);
a3edd2e5dde375 Pierre-Louis Bossart 2024-03-12   94  	} else {
a3edd2e5dde375 Pierre-Louis Bossart 2024-03-12   95  		count = hweight32(list);
a3edd2e5dde375 Pierre-Louis Bossart 2024-03-12   96  	}
a3edd2e5dde375 Pierre-Louis Bossart 2024-03-12   97  
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   98  	/* Check count is within bounds */
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01   99  	if (count > SDW_MAX_LINKS) {
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  100  		dev_err(&adev->dev, "Link count %d exceeds max %d\n",
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  101  			count, SDW_MAX_LINKS);
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  102  		return -EINVAL;
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  103  	}
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  104  
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  105  	if (!count) {
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  106  		dev_warn(&adev->dev, "No SoundWire links detected\n");
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  107  		return -EINVAL;
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  108  	}
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  109  	dev_dbg(&adev->dev, "ACPI reports %d SDW Link devices\n", count);
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  110  
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  111  	info->count = count;
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  112  	info->link_mask = 0;
a3edd2e5dde375 Pierre-Louis Bossart 2024-03-12  113  	list_ul = list;
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  114  
a3edd2e5dde375 Pierre-Louis Bossart 2024-03-12  115  	for_each_set_bit(i, &list_ul, SDW_MAX_LINKS) {
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  116  		if (ctrl_link_mask && !(ctrl_link_mask & BIT(i))) {
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  117  			dev_dbg(&adev->dev,
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  118  				"Link %d masked, will not be enabled\n", i);
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  119  			continue;
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  120  		}
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  121  
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  122  		if (!is_link_enabled(acpi_fwnode_handle(adev), i)) {
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  123  			dev_dbg(&adev->dev,
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  124  				"Link %d not selected in firmware\n", i);
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  125  			continue;
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  126  		}
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  127  
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  128  		info->link_mask |= BIT(i);
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  129  	}
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  130  
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  131  	return 0;
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  132  }
08c2a4bc9f2aca Pierre-Louis Bossart 2021-03-01  133  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
