Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D581EB58
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 14:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYp1c5tM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699280607; x=1730816607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A/32h18W3pgZtJyUcbCeB6Lng8jj07WoFGNlEa2x6kI=;
  b=eYp1c5tMq89D5xpMMN0ZIJ3U19wP+ePhwPIr8CEJVrEcfmUaUIqQhLr0
   TyiEohwxzkgo3950tatwLsQZG0IAOro5I2BADMXK5znM25Kymqdyxd2TT
   YuBkos1rjM2uUZewuA8l6DWnoAxKgbzB68mXn23mNpCeZU234ZQlyfPHn
   4Jpgt6h160dHhl1vYLLRqHQzL5sE5uZf25TndQaO0hpdA6AR6udm3k8jF
   sfrmhvSK8H0dscs9YWSjGxCvxxpe9aKRxUwYCB/4vN5g4Ar7Zz18mB21N
   +3u6GJ6HtaJwgl0grCrirEfNgkwACKvnSBh/iyyd+nFOMoxiSIx52cwYp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="7914474"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="7914474"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 06:23:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="797316039"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="797316039"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Nov 2023 06:23:25 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r00Ve-0006T6-2m;
	Mon, 06 Nov 2023 14:23:22 +0000
Date: Mon, 6 Nov 2023 22:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/hwtracing/intel_th/gth.c:223 master_attr_store() warn:
 potential spectre issue 'gth->output' [w] (local cap)
Message-ID: <202311062235.kJiUUnvQ-lkp@intel.com>
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
TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Laurent Fert <laurent.fert@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: b27a6a3f97b90f05ed145f553de46d5d9d47d78d intel_th: Add Global Trace Hub driver
date:   8 years ago
:::::: branch date: 11 hours ago
:::::: commit date: 8 years ago
config: x86_64-buildonly-randconfig-r001-20230716 (https://download.01.org/0day-ci/archive/20231106/202311062235.kJiUUnvQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311062235.kJiUUnvQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311062235.kJiUUnvQ-lkp@intel.com/

smatch warnings:
drivers/hwtracing/intel_th/gth.c:223 master_attr_store() warn: potential spectre issue 'gth->output' [w] (local cap)

vim +223 drivers/hwtracing/intel_th/gth.c

b27a6a3f97b90f Alexander Shishkin 2015-09-22  188  
b27a6a3f97b90f Alexander Shishkin 2015-09-22  189  static ssize_t master_attr_store(struct device *dev,
b27a6a3f97b90f Alexander Shishkin 2015-09-22  190  				 struct device_attribute *attr,
b27a6a3f97b90f Alexander Shishkin 2015-09-22  191  				 const char *buf, size_t count)
b27a6a3f97b90f Alexander Shishkin 2015-09-22  192  {
b27a6a3f97b90f Alexander Shishkin 2015-09-22  193  	struct master_attribute *ma =
b27a6a3f97b90f Alexander Shishkin 2015-09-22  194  		container_of(attr, struct master_attribute, attr);
b27a6a3f97b90f Alexander Shishkin 2015-09-22  195  	struct gth_device *gth = ma->gth;
b27a6a3f97b90f Alexander Shishkin 2015-09-22  196  	int old_port, port;
b27a6a3f97b90f Alexander Shishkin 2015-09-22  197  
b27a6a3f97b90f Alexander Shishkin 2015-09-22  198  	if (kstrtoint(buf, 10, &port) < 0)
b27a6a3f97b90f Alexander Shishkin 2015-09-22  199  		return -EINVAL;
b27a6a3f97b90f Alexander Shishkin 2015-09-22  200  
b27a6a3f97b90f Alexander Shishkin 2015-09-22  201  	if (port >= TH_POSSIBLE_OUTPUTS || port < -1)
b27a6a3f97b90f Alexander Shishkin 2015-09-22  202  		return -EINVAL;
b27a6a3f97b90f Alexander Shishkin 2015-09-22  203  
b27a6a3f97b90f Alexander Shishkin 2015-09-22  204  	spin_lock(&gth->gth_lock);
b27a6a3f97b90f Alexander Shishkin 2015-09-22  205  
b27a6a3f97b90f Alexander Shishkin 2015-09-22  206  	/* disconnect from the previous output port, if any */
b27a6a3f97b90f Alexander Shishkin 2015-09-22  207  	old_port = gth->master[ma->master];
b27a6a3f97b90f Alexander Shishkin 2015-09-22  208  	if (old_port >= 0) {
b27a6a3f97b90f Alexander Shishkin 2015-09-22  209  		gth->master[ma->master] = -1;
b27a6a3f97b90f Alexander Shishkin 2015-09-22  210  		clear_bit(ma->master, gth->output[old_port].master);
b27a6a3f97b90f Alexander Shishkin 2015-09-22  211  		if (gth->output[old_port].output->active)
b27a6a3f97b90f Alexander Shishkin 2015-09-22  212  			gth_master_set(gth, ma->master, -1);
b27a6a3f97b90f Alexander Shishkin 2015-09-22  213  	}
b27a6a3f97b90f Alexander Shishkin 2015-09-22  214  
b27a6a3f97b90f Alexander Shishkin 2015-09-22  215  	/* connect to the new output port, if any */
b27a6a3f97b90f Alexander Shishkin 2015-09-22  216  	if (port >= 0) {
b27a6a3f97b90f Alexander Shishkin 2015-09-22  217  		/* check if there's a driver for this port */
b27a6a3f97b90f Alexander Shishkin 2015-09-22  218  		if (!gth->output[port].output) {
b27a6a3f97b90f Alexander Shishkin 2015-09-22  219  			count = -ENODEV;
b27a6a3f97b90f Alexander Shishkin 2015-09-22  220  			goto unlock;
b27a6a3f97b90f Alexander Shishkin 2015-09-22  221  		}
b27a6a3f97b90f Alexander Shishkin 2015-09-22  222  
b27a6a3f97b90f Alexander Shishkin 2015-09-22 @223  		set_bit(ma->master, gth->output[port].master);
b27a6a3f97b90f Alexander Shishkin 2015-09-22  224  
b27a6a3f97b90f Alexander Shishkin 2015-09-22  225  		/* if the port is active, program this setting */
b27a6a3f97b90f Alexander Shishkin 2015-09-22  226  		if (gth->output[port].output->active)
b27a6a3f97b90f Alexander Shishkin 2015-09-22  227  			gth_master_set(gth, ma->master, port);
b27a6a3f97b90f Alexander Shishkin 2015-09-22  228  	}
b27a6a3f97b90f Alexander Shishkin 2015-09-22  229  
b27a6a3f97b90f Alexander Shishkin 2015-09-22  230  	gth->master[ma->master] = port;
b27a6a3f97b90f Alexander Shishkin 2015-09-22  231  
b27a6a3f97b90f Alexander Shishkin 2015-09-22  232  unlock:
b27a6a3f97b90f Alexander Shishkin 2015-09-22  233  	spin_unlock(&gth->gth_lock);
b27a6a3f97b90f Alexander Shishkin 2015-09-22  234  
b27a6a3f97b90f Alexander Shishkin 2015-09-22  235  	return count;
b27a6a3f97b90f Alexander Shishkin 2015-09-22  236  }
b27a6a3f97b90f Alexander Shishkin 2015-09-22  237  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
