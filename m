Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A6B1684B4
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 04:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765687288; cv=none; b=dzqeCFmuAMXLqO1gvSgkj8wgWqbh6u3mzk9WiCbQ3ksiWKwGjBUYA6bZsYJLkr7C9w9kwg/0fTigh3uq5Nz7X9E4dDMCerEyLNbCdu5VUXCFss4WNJgwh+15Rdx4OoTSb/lyNsftSbfGfeXEJIa5AUj5NyA9I5GtpMXgnN8n91g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765687288; c=relaxed/simple;
	bh=PDCTZ1y7xuWXw7VWngtZl6meXTC2MXZTJwrVA4FUwLc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CaCQbpxPGBc1MwVocG0wqa+phBK6tLDGMVroFzy1sFRI7eEFll6VDq/2VyrQCY0qaUAI9G4fOHB3hYjj7rh0GI/hdNvo8VEGts5xeSSFzi4v4D0WIxWYc695Eflwg7abAghy5wG9ZL8zz2Gb6Ux6yYIiLvlQZpkyQTz0M7G2j+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5XplIac; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5XplIac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765687287; x=1797223287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PDCTZ1y7xuWXw7VWngtZl6meXTC2MXZTJwrVA4FUwLc=;
  b=n5XplIacHJ6fp+jD5Qmsvcr3u2Ae79HZO23D2LgPcoTNMZ/d+9RsdN2Z
   ysm9rnri6RCOUBL0JkkGliQNzXXkOeR9+e+xOIzHslHTHIS3p9xboLHT7
   yZZDvGgnfxkUGXiLEEVnVXsyfIsbYcz4cmJIMCoOkGgQPGsamoNoSHvVX
   OYxr/M7z80zwDSHV+t4+o2xgoD9ZUjHQW3oe3TJnLB4pGDophpmK45SDO
   YCO+SluFY2yO1r8BAD0ILP9hn/3mrLPjVbUGwbz2vvL3tX4WW5dtOU/kv
   QVjQt6WPmAxIdEl08oGPJPg3grP4Bl4M1tFZFqWw1QGmzWlUQ/HBvjoOA
   A==;
X-CSE-ConnectionGUID: dN7UurgLTW+BNNrw4WAtHA==
X-CSE-MsgGUID: T8cPgGQUSGafU2/YdqW4Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67507918"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67507918"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 20:41:26 -0800
X-CSE-ConnectionGUID: N5XcxYHdTASbjThn/+GKLg==
X-CSE-MsgGUID: 2WxAbLHNTlKrBQRhYgdazQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="228098221"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Dec 2025 20:41:25 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUdv9-000000008aP-0XdG;
	Sun, 14 Dec 2025 04:41:23 +0000
Date: Sun, 14 Dec 2025 12:40:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/tty/serial/serial_core.c:3004 iomem_base_show() warn:
 argument 3 to %lX specifier is cast from pointer
Message-ID: <202512141210.OEx3x406-lkp@intel.com>
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
TO: Tiwei Bie <tiwei.btw@antgroup.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0dfb36b2dcb666f116ba314e631bd3bc632c44d1
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   7 months ago
:::::: branch date: 74 minutes ago
:::::: commit date: 7 months ago
config: um-randconfig-r072-20251214 (https://download.01.org/0day-ci/archive/20251214/202512141210.OEx3x406-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512141210.OEx3x406-lkp@intel.com/

smatch warnings:
drivers/tty/serial/serial_core.c:3004 iomem_base_show() warn: argument 3 to %lX specifier is cast from pointer

vim +3004 drivers/tty/serial/serial_core.c

373bac4cf4c319 Alan Cox        2012-10-29  2996  
143c02c88d6d3f Andy Shevchenko 2020-02-17  2997  static ssize_t iomem_base_show(struct device *dev,
373bac4cf4c319 Alan Cox        2012-10-29  2998  	struct device_attribute *attr, char *buf)
373bac4cf4c319 Alan Cox        2012-10-29  2999  {
373bac4cf4c319 Alan Cox        2012-10-29  3000  	struct serial_struct tmp;
373bac4cf4c319 Alan Cox        2012-10-29  3001  	struct tty_port *port = dev_get_drvdata(dev);
373bac4cf4c319 Alan Cox        2012-10-29  3002  
373bac4cf4c319 Alan Cox        2012-10-29  3003  	uart_get_info(port, &tmp);
9cfbf7a6416b5f Alex Dewar      2020-08-24 @3004  	return sprintf(buf, "0x%lX\n", (unsigned long)tmp.iomem_base);
373bac4cf4c319 Alan Cox        2012-10-29  3005  }
373bac4cf4c319 Alan Cox        2012-10-29  3006  

:::::: The code at line 3004 was first introduced by commit
:::::: 9cfbf7a6416b5fa2b88ac337d092be82778a0469 serial: core: don't use snprintf() for formatting sysfs attrs

:::::: TO: Alex Dewar <alex.dewar90@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
