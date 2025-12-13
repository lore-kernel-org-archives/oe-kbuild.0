Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21C023D7DC
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 15:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765641119; cv=none; b=UW2dUxq23hiLDVVEJRlmRwsPfVYVDTKYUpaOhNyUkv4R0FiuJ8aiI7CCh1MKzpGt5H/K9IPKnezLUCIhM9ctTt3P4KXQ3wswkuWYM/YoeVdZXf1mlxBExt6nUHZjJKE6u9k+o3QVnqaZez8SWyKVmxG6nKXxvLioiKmDR705k1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765641119; c=relaxed/simple;
	bh=VqoTQy9QAxtZXMiOm1T+J94QTfmNrXegyRDaVFNoId8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HY4+EPIVdMKNkiPJtjeqp2w3HysmDJOcusHyHOPkU81egu/JAfRDFtKG5FfutwUlT600RpLRUj7bI0oDFjp9E7dvR2D+MUyJ/G4CUOsuAcqXlrl0Iec4b83CWsdLmRyspaf+S6hCLZ6Z/34g0i6sac+Pz9dkv+BcKtAijMkhX1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k39pFr6P; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k39pFr6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765641118; x=1797177118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VqoTQy9QAxtZXMiOm1T+J94QTfmNrXegyRDaVFNoId8=;
  b=k39pFr6Pzn2LiZGEFkdDATGJH76AeRZlago64+ORIe0KdrwoZvONzYSD
   iEtTLwHIoFmUAKqmdPXc/ZAKfThlsxYtCGjDkDCLjs24klouRQnzzuXG4
   pS7aZAj9S2PIA20xm/UZUIDaqdjWxmaBSLSTSnkPxJHoSewalXMmTv57h
   3kvSIZJJ4P06ASidlQexAvhP8KEnDQyFMr2kKIdrd2wa1WXvhZffPX1Lz
   KhfMCIdjNTqeKEqA2rdkdMTK3kn8O4Ja2te1JZFqocR+luS8u9xm64bkk
   XP82nANpcHQ/9IrIuBKt+21Aib4HoncJsazdIz/XhyX+JqjddUYUxXAWB
   Q==;
X-CSE-ConnectionGUID: WZqxReoWR3qSydZ7C3UuFA==
X-CSE-MsgGUID: UlMjoercS9+lxUpBG5kZUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="55178183"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="55178183"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 07:51:57 -0800
X-CSE-ConnectionGUID: hc0uaN+nT+O+4lFDdTHMRA==
X-CSE-MsgGUID: 0zDt4JhDSeub9TAwTnBEGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197834034"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Dec 2025 07:51:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vURuS-000000007pO-2pnc;
	Sat, 13 Dec 2025 15:51:52 +0000
Date: Sat, 13 Dec 2025 23:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/hwmon/hwmon.c:439 hwmon_attr_show() error: uninitialized
 symbol 'val'.
Message-ID: <202512132327.xOOy0Q1z-lkp@intel.com>
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
TO: Guenter Roeck <linux@roeck-us.net>
CC: Chris Packham <chris.packham@alliedtelesis.co.nz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: 0bcd01f757bc06471c82a137eafee281ef1b6e38 hwmon: Introduce 64-bit energy attribute support
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: powerpc64-randconfig-r071-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132327.xOOy0Q1z-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512132327.xOOy0Q1z-lkp@intel.com/

New smatch warnings:
drivers/hwmon/hwmon.c:439 hwmon_attr_show() error: uninitialized symbol 'val'.

Old smatch warnings:
drivers/hwmon/hwmon.c:442 hwmon_attr_show() error: uninitialized symbol 'val64'.

vim +/val +439 drivers/hwmon/hwmon.c

d560168b5d0fb4 Guenter Roeck 2015-08-26  424  
d560168b5d0fb4 Guenter Roeck 2015-08-26  425  static ssize_t hwmon_attr_show(struct device *dev,
d560168b5d0fb4 Guenter Roeck 2015-08-26  426  			       struct device_attribute *devattr, char *buf)
d560168b5d0fb4 Guenter Roeck 2015-08-26  427  {
d560168b5d0fb4 Guenter Roeck 2015-08-26  428  	struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
0bcd01f757bc06 Guenter Roeck 2024-08-28  429  	s64 val64;
d560168b5d0fb4 Guenter Roeck 2015-08-26  430  	long val;
d560168b5d0fb4 Guenter Roeck 2015-08-26  431  	int ret;
d560168b5d0fb4 Guenter Roeck 2015-08-26  432  
d560168b5d0fb4 Guenter Roeck 2015-08-26  433  	ret = hattr->ops->read(dev, hattr->type, hattr->attr, hattr->index,
0bcd01f757bc06 Guenter Roeck 2024-08-28  434  			       (hattr->type == hwmon_energy64) ? (long *)&val64 : &val);
d560168b5d0fb4 Guenter Roeck 2015-08-26  435  	if (ret < 0)
d560168b5d0fb4 Guenter Roeck 2015-08-26  436  		return ret;
d560168b5d0fb4 Guenter Roeck 2015-08-26  437  
0bcd01f757bc06 Guenter Roeck 2024-08-28  438  	if (hattr->type != hwmon_energy64)
0bcd01f757bc06 Guenter Roeck 2024-08-28 @439  		val64 = val;
0bcd01f757bc06 Guenter Roeck 2024-08-28  440  
61b8ab2c5481dc Nicolin Chen  2018-10-09  441  	trace_hwmon_attr_show(hattr->index + hwmon_attr_base(hattr->type),
0bcd01f757bc06 Guenter Roeck 2024-08-28  442  			      hattr->name, val64);
61b8ab2c5481dc Nicolin Chen  2018-10-09  443  
0bcd01f757bc06 Guenter Roeck 2024-08-28  444  	return sprintf(buf, "%lld\n", val64);
d560168b5d0fb4 Guenter Roeck 2015-08-26  445  }
d560168b5d0fb4 Guenter Roeck 2015-08-26  446  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
