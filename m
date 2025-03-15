Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0171DDC3E
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 08:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742029093; cv=none; b=WtCbXJGKF/QUkYvfyOo/cW+cHAjrV0LH+EZ9VmNv+BX82JCCqb0almnJ4pltSJA8uhTlZ2mqZDpXiOyvew2PPXFF4qPihyOWEyQ0g9YruW4z3UOavlcJwx8AAeVmpnn3fm8TmC5xb+RX+zxl33Ds2epsqAzzq2UVPv3QzRVX4qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742029093; c=relaxed/simple;
	bh=wVcR2HkrYm9CxM4VtI+7fL9qtYwqaXnZvVSCi+CyCRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mIdb2rd1Tixn8cMitv8228Wja7S3dTRDdZijc9fjgonr78CGXYOBsWzoDaG4RYhhgfMIwIvKA7Kf31dTvVhSvUzYHkoig/ms24fASUZEeEXLoBFSfhUI49TLd065n6kgsOHNhbBWQIhip0Ld6VHbKm1klU2OfjpeLVjGiG2O9kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d5uIgbNy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d5uIgbNy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742029090; x=1773565090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wVcR2HkrYm9CxM4VtI+7fL9qtYwqaXnZvVSCi+CyCRc=;
  b=d5uIgbNybQYI6uO9JYwbOy1sVAhCsWGXPhPgJizjH4wP0s4V/pTlT9oB
   djeW0H7P4TOtjJIVLhRZ2ntSd8Q6Zjk4sPqXmb10vr6GPRRUehTy3LbEL
   NQTb1jBsPtLbHH4am3YrU/oBH8xy7Vcg0/9pQb9KO7qqfo8Po0mv32LOp
   WPTKZzlvvfyUISnSy99zmGgJHrFmbX1+MGXfLC0IjEqTHc+QLejAGgHhW
   T3/US/vC9P89ZrFuZ334t/tk5kYRdKAw/DMdGM/wTzQv/QHVU0DCdvcum
   6mmgl7ivyN9xpvTB6acev6fY/MQ3XANeyuSXsAz7aPqO4s/Q3rUo6VSz9
   A==;
X-CSE-ConnectionGUID: /pkIawH1S5uLtoRZgMwSpA==
X-CSE-MsgGUID: lwRj9bnlS+66/Op61kXZsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="53392287"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="53392287"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 01:58:09 -0700
X-CSE-ConnectionGUID: dPILe6VXSIGiLXyl4S8NPg==
X-CSE-MsgGUID: huDM/D/DQhmFKnncw7kRTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="121441300"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 15 Mar 2025 01:58:08 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttNLK-000BBt-0g;
	Sat, 15 Mar 2025 08:58:06 +0000
Date: Sat, 15 Mar 2025 16:58:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/fpga/fpga-region.c:106 fpga_region_program_fpga() warn:
 passing positive error code '(-19),(-16)' to 'PTR_ERR'
Message-ID: <202503151642.N7yJY6s4-lkp@intel.com>
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
TO: Marco Pagani <marpagan@redhat.com>
CC: Xu Yilun <yilun.xu@linux.intel.com>
CC: Russ Weight <russ.weight@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3571e8b091f4270d869dda7a6cc43616c6ad6897
commit: b7c0e1ecee403a43abc89eb3e75672b01ff2ece9 fpga: region: add owner module and take its refcount
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: openrisc-randconfig-r071-20250314 (https://download.01.org/0day-ci/archive/20250315/202503151642.N7yJY6s4-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503151642.N7yJY6s4-lkp@intel.com/

smatch warnings:
drivers/fpga/fpga-region.c:106 fpga_region_program_fpga() warn: passing positive error code '(-19),(-16)' to 'PTR_ERR'

vim +106 drivers/fpga/fpga-region.c

0fa20cdfcc1f688 Alan Tull      2016-11-01   82  
0fa20cdfcc1f688 Alan Tull      2016-11-01   83  /**
0fa20cdfcc1f688 Alan Tull      2016-11-01   84   * fpga_region_program_fpga - program FPGA
917a4304fe48c12 Alan Tull      2018-05-16   85   *
0fa20cdfcc1f688 Alan Tull      2016-11-01   86   * @region: FPGA region
917a4304fe48c12 Alan Tull      2018-05-16   87   *
61c32102391ff38 Alan Tull      2017-11-15   88   * Program an FPGA using fpga image info (region->info).
093a89d4c21701e Alan Tull      2018-04-16   89   * If the region has a get_bridges function, the exclusive reference for the
093a89d4c21701e Alan Tull      2018-04-16   90   * bridges will be held if programming succeeds.  This is intended to prevent
093a89d4c21701e Alan Tull      2018-04-16   91   * reprogramming the region until the caller considers it safe to do so.
093a89d4c21701e Alan Tull      2018-04-16   92   * The caller will need to call fpga_bridges_put() before attempting to
093a89d4c21701e Alan Tull      2018-04-16   93   * reprogram the region.
917a4304fe48c12 Alan Tull      2018-05-16   94   *
baa57b333e01165 Marco Pagani   2023-07-06   95   * Return: 0 for success or negative error code.
0fa20cdfcc1f688 Alan Tull      2016-11-01   96   */
59460a9305458ac Alan Tull      2017-11-15   97  int fpga_region_program_fpga(struct fpga_region *region)
0fa20cdfcc1f688 Alan Tull      2016-11-01   98  {
ebf877a51ad7b65 Alan Tull      2017-11-15   99  	struct device *dev = &region->dev;
61c32102391ff38 Alan Tull      2017-11-15  100  	struct fpga_image_info *info = region->info;
0fa20cdfcc1f688 Alan Tull      2016-11-01  101  	int ret;
0fa20cdfcc1f688 Alan Tull      2016-11-01  102  
0fa20cdfcc1f688 Alan Tull      2016-11-01  103  	region = fpga_region_get(region);
0fa20cdfcc1f688 Alan Tull      2016-11-01  104  	if (IS_ERR(region)) {
c3d971ad32fc19a Alan Tull      2017-11-15  105  		dev_err(dev, "failed to get FPGA region\n");
0fa20cdfcc1f688 Alan Tull      2016-11-01 @106  		return PTR_ERR(region);
0fa20cdfcc1f688 Alan Tull      2016-11-01  107  	}
0fa20cdfcc1f688 Alan Tull      2016-11-01  108  
1df2dd7f587107e Alan Tull      2017-11-15  109  	ret = fpga_mgr_lock(region->mgr);
ebf877a51ad7b65 Alan Tull      2017-11-15  110  	if (ret) {
ebf877a51ad7b65 Alan Tull      2017-11-15  111  		dev_err(dev, "FPGA manager is busy\n");
1df2dd7f587107e Alan Tull      2017-11-15  112  		goto err_put_region;
ebf877a51ad7b65 Alan Tull      2017-11-15  113  	}
ebf877a51ad7b65 Alan Tull      2017-11-15  114  
52a3a7ccce07e73 Alan Tull      2017-11-15  115  	/*
52a3a7ccce07e73 Alan Tull      2017-11-15  116  	 * In some cases, we already have a list of bridges in the
52a3a7ccce07e73 Alan Tull      2017-11-15  117  	 * fpga region struct.  Or we don't have any bridges.
52a3a7ccce07e73 Alan Tull      2017-11-15  118  	 */
52a3a7ccce07e73 Alan Tull      2017-11-15  119  	if (region->get_bridges) {
52a3a7ccce07e73 Alan Tull      2017-11-15  120  		ret = region->get_bridges(region);
0fa20cdfcc1f688 Alan Tull      2016-11-01  121  		if (ret) {
52a3a7ccce07e73 Alan Tull      2017-11-15  122  			dev_err(dev, "failed to get fpga region bridges\n");
ebf877a51ad7b65 Alan Tull      2017-11-15  123  			goto err_unlock_mgr;
0fa20cdfcc1f688 Alan Tull      2016-11-01  124  		}
52a3a7ccce07e73 Alan Tull      2017-11-15  125  	}
0fa20cdfcc1f688 Alan Tull      2016-11-01  126  
0fa20cdfcc1f688 Alan Tull      2016-11-01  127  	ret = fpga_bridges_disable(&region->bridge_list);
0fa20cdfcc1f688 Alan Tull      2016-11-01  128  	if (ret) {
c3d971ad32fc19a Alan Tull      2017-11-15  129  		dev_err(dev, "failed to disable bridges\n");
0fa20cdfcc1f688 Alan Tull      2016-11-01  130  		goto err_put_br;
0fa20cdfcc1f688 Alan Tull      2016-11-01  131  	}
0fa20cdfcc1f688 Alan Tull      2016-11-01  132  
61c32102391ff38 Alan Tull      2017-11-15  133  	ret = fpga_mgr_load(region->mgr, info);
0fa20cdfcc1f688 Alan Tull      2016-11-01  134  	if (ret) {
c3d971ad32fc19a Alan Tull      2017-11-15  135  		dev_err(dev, "failed to load FPGA image\n");
0fa20cdfcc1f688 Alan Tull      2016-11-01  136  		goto err_put_br;
0fa20cdfcc1f688 Alan Tull      2016-11-01  137  	}
0fa20cdfcc1f688 Alan Tull      2016-11-01  138  
0fa20cdfcc1f688 Alan Tull      2016-11-01  139  	ret = fpga_bridges_enable(&region->bridge_list);
0fa20cdfcc1f688 Alan Tull      2016-11-01  140  	if (ret) {
c3d971ad32fc19a Alan Tull      2017-11-15  141  		dev_err(dev, "failed to enable region bridges\n");
0fa20cdfcc1f688 Alan Tull      2016-11-01  142  		goto err_put_br;
0fa20cdfcc1f688 Alan Tull      2016-11-01  143  	}
0fa20cdfcc1f688 Alan Tull      2016-11-01  144  
1df2dd7f587107e Alan Tull      2017-11-15  145  	fpga_mgr_unlock(region->mgr);
0fa20cdfcc1f688 Alan Tull      2016-11-01  146  	fpga_region_put(region);
0fa20cdfcc1f688 Alan Tull      2016-11-01  147  
0fa20cdfcc1f688 Alan Tull      2016-11-01  148  	return 0;
0fa20cdfcc1f688 Alan Tull      2016-11-01  149  
0fa20cdfcc1f688 Alan Tull      2016-11-01  150  err_put_br:
52a3a7ccce07e73 Alan Tull      2017-11-15  151  	if (region->get_bridges)
0fa20cdfcc1f688 Alan Tull      2016-11-01  152  		fpga_bridges_put(&region->bridge_list);
ebf877a51ad7b65 Alan Tull      2017-11-15  153  err_unlock_mgr:
1df2dd7f587107e Alan Tull      2017-11-15  154  	fpga_mgr_unlock(region->mgr);
e73bbf64907c88d Tobias Klauser 2017-04-24  155  err_put_region:
0fa20cdfcc1f688 Alan Tull      2016-11-01  156  	fpga_region_put(region);
0fa20cdfcc1f688 Alan Tull      2016-11-01  157  
0fa20cdfcc1f688 Alan Tull      2016-11-01  158  	return ret;
0fa20cdfcc1f688 Alan Tull      2016-11-01  159  }
59460a9305458ac Alan Tull      2017-11-15  160  EXPORT_SYMBOL_GPL(fpga_region_program_fpga);
0fa20cdfcc1f688 Alan Tull      2016-11-01  161  

:::::: The code at line 106 was first introduced by commit
:::::: 0fa20cdfcc1f68847cdfc47824476301eedc8297 fpga: fpga-region: device tree control for FPGA

:::::: TO: Alan Tull <atull@opensource.altera.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
