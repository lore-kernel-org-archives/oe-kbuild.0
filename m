Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3431F38F930
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 11:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774524263; cv=none; b=QIGFVyrPcSSFsLRjVk3nrRpNyUqVirprK2a2PyGDuFVp+KA1wx0xIoZ14WXte2E66AR0ElhMSomH0apzMvEqFSHgEgLJvCRDeBsDuxNn7mHSMMPfPE2PzLx8dX10yAesdZPBOfBkbAOqTLePF4rHezDjaLBrehE9Vg2SQP2xL60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774524263; c=relaxed/simple;
	bh=OMxCbt/Ams0vAutv80Zct6fevpIihNou4B1W0rcDFGY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OIuf5/jH+9LisdZQrklz4RTu9v1NCiXDAo+2lHVXtzEPjysbHl+EbblQnfr/Tr2fjut9rJG0Ed/yI1gjGIredZLUT7ts5woZfE6W+S3G5M8tDuE7rWVRDetuoFpPuyieZtoq9OsJXIp3/tjqdC/XQ3cK5Scyp3wjmXZW+4B+KZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VN3bPYFb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VN3bPYFb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774524262; x=1806060262;
  h=date:from:to:cc:subject:message-id;
  bh=OMxCbt/Ams0vAutv80Zct6fevpIihNou4B1W0rcDFGY=;
  b=VN3bPYFbrWQ0usqLv1mGxoj9I/V9Gbj2+cPWd03Ze4wDRH3NLzY5KveE
   zz/f4gsOYrC0sEohgszwIWXGow7SR+XW1EEd4u/AdytTOCrl+R1CDhi1W
   V/mWC7EGA895OMaInIUkQV2rMMlfLCKfu5U5/0em720WY1UNZVF6MygqB
   UWRIFQHEngn0ZptLEy4If7mbhRkbf+phcspioNEieR2STjAuOnm6rjmoZ
   OSLjYabXuWBPQHXQoMPRjiAr3/zjLjm1uAUzhs3H0BCgfLIvD+LxzMNBs
   NQuNkc4JUD9gOsQXp4Kfju7bS2zFes2yMNCPxDPaU4ejWDvC3RtNJ8jcz
   Q==;
X-CSE-ConnectionGUID: QpQVYGUtSOm27CQHKfQOfg==
X-CSE-MsgGUID: g2hXTV+uTnuEXo7m3tAWng==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86657319"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="86657319"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 04:24:21 -0700
X-CSE-ConnectionGUID: i2JHu22wS2CRoa2LY3jgjA==
X-CSE-MsgGUID: V3GYV2etTbK7u1clT09oyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="226618790"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Mar 2026 04:24:20 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5ip0-000000008nJ-066k;
	Thu, 26 Mar 2026 11:24:18 +0000
Date: Thu, 26 Mar 2026 19:24:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 496/525] drivers/acpi/proc.c:100
 acpi_system_write_wakeup_device() warn: potential spectre issue 'strbuf' [w]
Message-ID: <202603261940.bDKprUrW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   d5f290ca006c2bdabff8aa383fd3cf9cf9194259
commit: 231ea82faf415697c02c65ecb06a61d77a0953be [496/525] ACPI: convert proc_write to ->proc_write_iter()
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-161-20260326 (https://download.01.org/0day-ci/archive/20260326/202603261940.bDKprUrW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603261940.bDKprUrW-lkp@intel.com/

smatch warnings:
drivers/acpi/proc.c:100 acpi_system_write_wakeup_device() warn: potential spectre issue 'strbuf' [w]

vim +/strbuf +100 drivers/acpi/proc.c

76acae04c89228 drivers/acpi/sleep/proc.c Rafael J. Wysocki 2008-10-03   86  
^1da177e4c3f41 drivers/acpi/sleep/proc.c Linus Torvalds    2005-04-16   87  static ssize_t
231ea82faf4156 drivers/acpi/proc.c       Jens Axboe        2026-03-18   88  acpi_system_write_wakeup_device(struct kiocb *iocb, struct iov_iter *from)
^1da177e4c3f41 drivers/acpi/sleep/proc.c Linus Torvalds    2005-04-16   89  {
07761a4cd43c1d drivers/acpi/proc.c       chenqiwu          2020-02-23   90  	struct acpi_device *dev, *tmp;
231ea82faf4156 drivers/acpi/proc.c       Jens Axboe        2026-03-18   91  	size_t count = iov_iter_count(from);
^1da177e4c3f41 drivers/acpi/sleep/proc.c Linus Torvalds    2005-04-16   92  	char strbuf[5];
^1da177e4c3f41 drivers/acpi/sleep/proc.c Linus Torvalds    2005-04-16   93  	char str[5] = "";
^1da177e4c3f41 drivers/acpi/sleep/proc.c Linus Torvalds    2005-04-16   94  
05bce79e6d24ee drivers/acpi/proc.c       Cyril Roelandt    2012-11-22   95  	if (count > 4)
05bce79e6d24ee drivers/acpi/proc.c       Cyril Roelandt    2012-11-22   96  		count = 4;
^1da177e4c3f41 drivers/acpi/sleep/proc.c Linus Torvalds    2005-04-16   97  
231ea82faf4156 drivers/acpi/proc.c       Jens Axboe        2026-03-18   98  	if (!copy_from_iter_full(strbuf, count, from))
^1da177e4c3f41 drivers/acpi/sleep/proc.c Linus Torvalds    2005-04-16   99  		return -EFAULT;
05bce79e6d24ee drivers/acpi/proc.c       Cyril Roelandt    2012-11-22 @100  	strbuf[count] = '\0';
^1da177e4c3f41 drivers/acpi/sleep/proc.c Linus Torvalds    2005-04-16  101  	sscanf(strbuf, "%s", str);
^1da177e4c3f41 drivers/acpi/sleep/proc.c Linus Torvalds    2005-04-16  102  
9090589d87506c drivers/acpi/proc.c       Shaohua Li        2009-04-07  103  	mutex_lock(&acpi_device_lock);
07761a4cd43c1d drivers/acpi/proc.c       chenqiwu          2020-02-23  104  	list_for_each_entry_safe(dev, tmp, &acpi_wakeup_device_list,
07761a4cd43c1d drivers/acpi/proc.c       chenqiwu          2020-02-23  105  				 wakeup_list) {
^1da177e4c3f41 drivers/acpi/sleep/proc.c Linus Torvalds    2005-04-16  106  		if (!dev->wakeup.flags.valid)
^1da177e4c3f41 drivers/acpi/sleep/proc.c Linus Torvalds    2005-04-16  107  			continue;
^1da177e4c3f41 drivers/acpi/sleep/proc.c Linus Torvalds    2005-04-16  108  
^1da177e4c3f41 drivers/acpi/sleep/proc.c Linus Torvalds    2005-04-16  109  		if (!strncmp(dev->pnp.bus_id, str, 4)) {
f2b56bc808addb drivers/acpi/proc.c       Rafael J. Wysocki 2011-01-06  110  			if (device_can_wakeup(&dev->dev)) {
f2b56bc808addb drivers/acpi/proc.c       Rafael J. Wysocki 2011-01-06  111  				bool enable = !device_may_wakeup(&dev->dev);
f2b56bc808addb drivers/acpi/proc.c       Rafael J. Wysocki 2011-01-06  112  				device_set_wakeup_enable(&dev->dev, enable);
f2b56bc808addb drivers/acpi/proc.c       Rafael J. Wysocki 2011-01-06  113  			} else {
76acae04c89228 drivers/acpi/sleep/proc.c Rafael J. Wysocki 2008-10-03  114  				physical_device_enable_wakeup(dev);
f2b56bc808addb drivers/acpi/proc.c       Rafael J. Wysocki 2011-01-06  115  			}
b014f4f1aad3f2 drivers/acpi/proc.c       Rafael J. Wysocki 2011-01-06  116  			break;
^1da177e4c3f41 drivers/acpi/sleep/proc.c Linus Torvalds    2005-04-16  117  		}
^1da177e4c3f41 drivers/acpi/sleep/proc.c Linus Torvalds    2005-04-16  118  	}
9090589d87506c drivers/acpi/proc.c       Shaohua Li        2009-04-07  119  	mutex_unlock(&acpi_device_lock);
^1da177e4c3f41 drivers/acpi/sleep/proc.c Linus Torvalds    2005-04-16  120  	return count;
^1da177e4c3f41 drivers/acpi/sleep/proc.c Linus Torvalds    2005-04-16  121  }
^1da177e4c3f41 drivers/acpi/sleep/proc.c Linus Torvalds    2005-04-16  122  

:::::: The code at line 100 was first introduced by commit
:::::: 05bce79e6d24ee6eb2beddf0f6314358404d472f ACPI: drop unnecessary local variable from acpi_system_write_wakeup_device()

:::::: TO: Cyril Roelandt <tipecaml@gmail.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
