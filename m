Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F76DF42
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Dec 2024 03:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733025483; cv=none; b=bDYPfBfgBpI3+UdWujg7+AzQDl5nHUve/14NSuUZxqOj/gDFOqBHl/N0pC4vtnBxTjcsATgSzuU6agMipLrbSPECSWKPJiF63hDrg836veAHmXMHEfBLQM0ohswTxGFzwuPtsgvbqdQ2hBu0/RFbyKVFlPi2n/jsBkEXTFnSNwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733025483; c=relaxed/simple;
	bh=QAL9eUVq2umAVjahLdn6eyxGPAYkyWNG4uUHOJkewUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QAlTSySUfE2NPCNVlX5vkIv3NNIVYVg4pRj4FAct+i9rSp8zwa4HwdAyXyOWr3qhnVOGENR5YLSc+uwbYvL4NUpKIsu9gIqyots9lHsQdW9yUh7XP6gQNbT32o7yHM5EJ/JrskkTQp930g6GAkznSuHV+3lV6quco5qQWw7xZZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bFl1VDdF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bFl1VDdF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733025481; x=1764561481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QAL9eUVq2umAVjahLdn6eyxGPAYkyWNG4uUHOJkewUo=;
  b=bFl1VDdF1uNdLY+Zi21myMUQxvxNe4jWUpXKredrICDrb5LoesFJqJJs
   8+7aJrhkyypIDk/EAqRVkEoF4nZMBCjv6IKlgkx1ds2fkLy6s1sz3l+mH
   SHWWkSm7PS7X5afX3PXwEVJD1dXun/uq2QoFIB6Z+38Jg44QOfvPd9fF9
   PgMWcuzptGoxyC4LVTe2Mgto4177N9UcNBmCQPf/VmugbKSqd0mVf6gfO
   i2WTEtAkNFuo5JuJU9L6f7cRp4jnOAo1ZoKAwuFNI366HenVhwMID626c
   r8s+HQZtQO97GEhU6w3tbrV4PALlKl0r2FL6wN80knL1tX+Hv+DNeJfr4
   A==;
X-CSE-ConnectionGUID: x4XZBeBtR9O/+AN9QKyuvQ==
X-CSE-MsgGUID: 8hxb5z0VQbqj3Bf8zwStfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="36067653"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="36067653"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 19:58:00 -0800
X-CSE-ConnectionGUID: hxKkqsDPRzypH3MtXDbpOQ==
X-CSE-MsgGUID: rTmUAldARdO59C0iITeXmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="116060272"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 30 Nov 2024 19:57:59 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHb5o-0001DL-2u;
	Sun, 01 Dec 2024 03:57:56 +0000
Date: Sun, 1 Dec 2024 11:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/hwmon/pmbus/isl68137.c:339:1-23: WARNING: Function
 "for_each_child_of_node" should have of_node_put() before return around line
 345.
Message-ID: <202412011149.SmOjljY5-lkp@intel.com>
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
TO: Grant Peltier <grantpeltier93@gmail.com>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a
commit: 3996187f80a0e24bff1959609065d49041cf648d hwmon: (pmbus/isl68137) add support for voltage divider on Vout
date:   2 weeks ago
:::::: branch date: 85 minutes ago
:::::: commit date: 2 weeks ago
config: openrisc-randconfig-r052-20241201 (https://download.01.org/0day-ci/archive/20241201/202412011149.SmOjljY5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412011149.SmOjljY5-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/hwmon/pmbus/isl68137.c:339:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 345.

vim +/for_each_child_of_node +339 drivers/hwmon/pmbus/isl68137.c

3996187f80a0e2 Grant Peltier 2024-11-12  331  
3996187f80a0e2 Grant Peltier 2024-11-12  332  static int isl68137_probe_from_dt(struct device *dev,
3996187f80a0e2 Grant Peltier 2024-11-12  333  				  struct isl68137_data *data)
3996187f80a0e2 Grant Peltier 2024-11-12  334  {
3996187f80a0e2 Grant Peltier 2024-11-12  335  	const struct device_node *np = dev->of_node;
3996187f80a0e2 Grant Peltier 2024-11-12  336  	struct device_node *child;
3996187f80a0e2 Grant Peltier 2024-11-12  337  	int err;
3996187f80a0e2 Grant Peltier 2024-11-12  338  
3996187f80a0e2 Grant Peltier 2024-11-12 @339  	for_each_child_of_node(np, child) {
3996187f80a0e2 Grant Peltier 2024-11-12  340  		if (strcmp(child->name, "channel"))
3996187f80a0e2 Grant Peltier 2024-11-12  341  			continue;
3996187f80a0e2 Grant Peltier 2024-11-12  342  
3996187f80a0e2 Grant Peltier 2024-11-12  343  		err = isl68137_probe_child_from_dt(dev, child, data);
3996187f80a0e2 Grant Peltier 2024-11-12  344  		if (err)
3996187f80a0e2 Grant Peltier 2024-11-12 @345  			return err;
3996187f80a0e2 Grant Peltier 2024-11-12  346  	}
3996187f80a0e2 Grant Peltier 2024-11-12  347  
3996187f80a0e2 Grant Peltier 2024-11-12  348  	return 0;
3996187f80a0e2 Grant Peltier 2024-11-12  349  }
3996187f80a0e2 Grant Peltier 2024-11-12  350  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
