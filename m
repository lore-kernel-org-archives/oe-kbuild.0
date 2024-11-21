Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983411C8773
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Nov 2024 23:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732233014; cv=none; b=eNtQ+vEnQnnAqzyyF1Uq164ncNASt+mzlJg2yqyzQXLqqI/R72Dx6jXhTGR/8KNavMrylZVFJ4L03M/tCEWWYGsYSdAfCMB1yU4kXJ37/C4FfwdljyZcqW0Qn8USr+jc/xPN0UY0H8vC42YEnfUHKxvSKaZGounOaNxGVPVZ1B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732233014; c=relaxed/simple;
	bh=uizGneWbks294+zeYHQ9obmlEbzcqj5RKqh+XdsbIik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VllfDzc+XgkqZBpvCcvJeB9ZgsN+uvtR3uftt1I3iX8fx+W5jLTGEvMR1jy/dEbk10RizPRpYnXbDthAWpgmbeqALzRHOA+MUQusNPCiM0Bykqmfef8JAfIOf8geK5peV0nYw3AKlqbnX+hkGecR1v943Rfaw/H5kIPmF5ADwCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJ+UCoAB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJ+UCoAB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732233012; x=1763769012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uizGneWbks294+zeYHQ9obmlEbzcqj5RKqh+XdsbIik=;
  b=dJ+UCoABJFPCdPkm+ZaTvEuiBf79ETluohSOjLeRrSLiSgzwV+x1jfZ6
   KAnsWsnBwVQ3jSZDSIYk2/Tx7upSpMWypNh/g9iGB0B65ABQjU8dFGCQv
   CFQQbxg3/JX6HB0MAsgYg5oJbU7fbjWHwdNGzgv0fEZcz8WtvCfr/dgyI
   412XvkVCGB6Z3O4+/3RbkAGv3bABoXr5EiwLHPdUS8g8irhRMt2hCcXy2
   1Oq+V25V8LKlzhWPKUIU6RWPhuLEmjJdMZsucDBRT2sQ0rOSji5hl05yk
   XtOJddsQvht4xPFXB9ivC0e6SxhjitoEWbs6h4CdMSiwG7mjN73yrP9/F
   Q==;
X-CSE-ConnectionGUID: 5Acx+NP2RJOLGFmiUfhcJQ==
X-CSE-MsgGUID: Q1yp8qkeTjqO+oQZ5B1FaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32496439"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="32496439"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 15:50:12 -0800
X-CSE-ConnectionGUID: n+DOzNqlQxiQOL+6XbTXeA==
X-CSE-MsgGUID: Q2gzF9SMTWuZxxxhHeNt6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="95353507"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Nov 2024 15:50:11 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEGw4-0003Tf-1v;
	Thu, 21 Nov 2024 23:50:08 +0000
Date: Fri, 22 Nov 2024 07:49:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [groeck-staging:testing 1/42] drivers/hwmon/hwmon.c:437
 hwmon_attr_show() error: uninitialized symbol 'val'.
Message-ID: <202411220739.a2INGM5p-lkp@intel.com>
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
CC: linux-hwmon@vger.kernel.org
TO: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
head:   8c8865aa3d3c2dabf9a2161d2809eccfeae92645
commit: 2c67fcdff546bc261761a3d66aa165a627b71458 [1/42] hwmon: Introduce 64-bit energy attribute support
:::::: branch date: 3 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20241121 (https://download.01.org/0day-ci/archive/20241122/202411220739.a2INGM5p-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411220739.a2INGM5p-lkp@intel.com/

smatch warnings:
drivers/hwmon/hwmon.c:437 hwmon_attr_show() error: uninitialized symbol 'val'.
drivers/hwmon/hwmon.c:440 hwmon_attr_show() error: uninitialized symbol 'val64'.

vim +/val +437 drivers/hwmon/hwmon.c

d560168b5d0fb4 Guenter Roeck 2015-08-26  422  
d560168b5d0fb4 Guenter Roeck 2015-08-26  423  static ssize_t hwmon_attr_show(struct device *dev,
d560168b5d0fb4 Guenter Roeck 2015-08-26  424  			       struct device_attribute *devattr, char *buf)
d560168b5d0fb4 Guenter Roeck 2015-08-26  425  {
d560168b5d0fb4 Guenter Roeck 2015-08-26  426  	struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
2c67fcdff546bc Guenter Roeck 2024-08-28  427  	s64 val64;
d560168b5d0fb4 Guenter Roeck 2015-08-26  428  	long val;
d560168b5d0fb4 Guenter Roeck 2015-08-26  429  	int ret;
d560168b5d0fb4 Guenter Roeck 2015-08-26  430  
d560168b5d0fb4 Guenter Roeck 2015-08-26  431  	ret = hattr->ops->read(dev, hattr->type, hattr->attr, hattr->index,
2c67fcdff546bc Guenter Roeck 2024-08-28  432  			       hattr->type == hwmon_energy64 ? (long long *)&val64 : &val);
d560168b5d0fb4 Guenter Roeck 2015-08-26  433  	if (ret < 0)
d560168b5d0fb4 Guenter Roeck 2015-08-26  434  		return ret;
d560168b5d0fb4 Guenter Roeck 2015-08-26  435  
2c67fcdff546bc Guenter Roeck 2024-08-28  436  	if (hattr->type != hwmon_energy64)
2c67fcdff546bc Guenter Roeck 2024-08-28 @437  		val64 = val;
2c67fcdff546bc Guenter Roeck 2024-08-28  438  
61b8ab2c5481dc Nicolin Chen  2018-10-09  439  	trace_hwmon_attr_show(hattr->index + hwmon_attr_base(hattr->type),
2c67fcdff546bc Guenter Roeck 2024-08-28 @440  			      hattr->name, val64);
61b8ab2c5481dc Nicolin Chen  2018-10-09  441  
2c67fcdff546bc Guenter Roeck 2024-08-28  442  	return sprintf(buf, "%lld\n", val64);
d560168b5d0fb4 Guenter Roeck 2015-08-26  443  }
d560168b5d0fb4 Guenter Roeck 2015-08-26  444  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
