Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFD43112C4
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 22:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767047403; cv=none; b=hZlp5KRO1zD6CitHqk5gzp/QXz39f+TRnkXK/Zgrk2Cl+lwoZRYai7zTsWfLmyd4KjJKrnYLHtD5IaXc9wRf7FQPK/Nb4CfN3yIM1s2dtshFWqv1xmxgWcl6p2Ff5aadHrVEAf9IvrVOLYkIOw7gNYStakcp/DSfMX2xp0JfcJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767047403; c=relaxed/simple;
	bh=xz2p6/ecccY2VpghYoUyfm4sKyv6oajx4V6OgGNHGaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QSgmx83ePajMl3D53SZ7X+n0uBqOAb8jweensaBqLXxS33oF4QwxU34jreneb8UEZWtwGAfa2KPG5w7Pa0xDIYsjnQT2PfYiBWo08PZVfXxDEgalx7oAbPm4vAKMn6UdfdZjTM/d5DuZcXAZi77hqmW5qJ4lMGisgqI16KwvI0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2/4fMnJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2/4fMnJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767047401; x=1798583401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xz2p6/ecccY2VpghYoUyfm4sKyv6oajx4V6OgGNHGaM=;
  b=I2/4fMnJgHLbTkyT98okaQQ8oZarPKpBpPQS116SY8lwf54f9rGYVrSA
   UTT3L0CNtTOteFlyJiV2bgTxMb1eEZ5j5zZOSHykFjfxarxUIYUVI2Gf2
   SY99AkzZIDTmWCehMHyllwHVYBNjMeTzvAd59UKVgT60kQbDV8LemZaiU
   c+zVMIXALA+PCQ0ODc9150407LzCBGdpBHghqVQ5qF9kgyQJ0JzdrF/wE
   fc6+CPyHpa4eExd0MuznhsCkZ/eT82aRoe93Dk/5E7M07iRG1mGfWSAW3
   m4hNfA63yaWi3lTu2BbkVnBmlcISz1wrK+keg13nFFx0z9FMtOmbYgMjP
   Q==;
X-CSE-ConnectionGUID: pRQk5GulRmuL8mAHYdwwfQ==
X-CSE-MsgGUID: +goYLNQ8Q8WMhgHXGtVTbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="86227813"
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="86227813"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 14:30:00 -0800
X-CSE-ConnectionGUID: 6kUm5BkoS9yA7g/4c6tMyQ==
X-CSE-MsgGUID: YT3w9RE4R6KpV7DNBdwoEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="201027728"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 Dec 2025 14:29:59 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaLji-0000000085V-2r5S;
	Mon, 29 Dec 2025 22:29:36 +0000
Date: Tue, 30 Dec 2025 06:28:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] hwmon: it87: describe per-chip temperature resources
Message-ID: <202512300415.VRCQoZYs-lkp@intel.com>
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
In-Reply-To: <20251226203021.27244-1-yahoo@perenite.com>
References: <20251226203021.27244-1-yahoo@perenite.com>
TO: "benoit.masson" <yahoo@perenite.com>
TO: jdelvare@suse.com
TO: linux@roeck-us.net
CC: linux-hwmon@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: "benoit.masson" <yahoo@perenite.com>

Hi benoit.masson,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.19-rc3 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/benoit-masson/hwmon-it87-describe-per-chip-temperature-resources/20251227-043108
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20251226203021.27244-1-yahoo%40perenite.com
patch subject: [PATCH] hwmon: it87: describe per-chip temperature resources
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20251229 (https://download.01.org/0day-ci/archive/20251230/202512300415.VRCQoZYs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512300415.VRCQoZYs-lkp@intel.com/

smatch warnings:
drivers/hwmon/it87.c:1694 show_pwm_temp_map() warn: variable dereferenced before IS_ERR check 'data' (see line 1691)

vim +/data +1694 drivers/hwmon/it87.c

c962024e306ed5 Guenter Roeck  2015-04-04  1684  
94ac7ee616809d Jean Delvare   2010-03-05  1685  static ssize_t show_pwm_temp_map(struct device *dev,
94ac7ee616809d Jean Delvare   2010-03-05  1686  				 struct device_attribute *attr, char *buf)
94ac7ee616809d Jean Delvare   2010-03-05  1687  {
94ac7ee616809d Jean Delvare   2010-03-05  1688  	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
94ac7ee616809d Jean Delvare   2010-03-05  1689  	struct it87_data *data = it87_update_device(dev);
c962024e306ed5 Guenter Roeck  2015-04-04  1690  	int nr = sensor_attr->index;
542f1e57c17849 benoit.masson  2025-12-26 @1691  	u8 num_map = data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
94ac7ee616809d Jean Delvare   2010-03-05  1692  	int map;
94ac7ee616809d Jean Delvare   2010-03-05  1693  
0282ba4a4fe6c8 Frank Crawford 2023-04-16 @1694  	if (IS_ERR(data))
0282ba4a4fe6c8 Frank Crawford 2023-04-16  1695  		return PTR_ERR(data);
0282ba4a4fe6c8 Frank Crawford 2023-04-16  1696  
0624d861983c2c Guenter Roeck  2015-04-06  1697  	map = data->pwm_temp_map[nr];
542f1e57c17849 benoit.masson  2025-12-26  1698  	if (map >= num_map)
94ac7ee616809d Jean Delvare   2010-03-05  1699  		map = 0;	/* Should never happen */
542f1e57c17849 benoit.masson  2025-12-26  1700  	if (nr >= num_map)	/* pwm channels 3..6 map to temp4..6 */
542f1e57c17849 benoit.masson  2025-12-26  1701  		map += num_map;
0624d861983c2c Guenter Roeck  2015-04-06  1702  
0624d861983c2c Guenter Roeck  2015-04-06  1703  	return sprintf(buf, "%d\n", (int)BIT(map));
94ac7ee616809d Jean Delvare   2010-03-05  1704  }
c962024e306ed5 Guenter Roeck  2015-04-04  1705  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
