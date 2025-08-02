Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFD5139D1B
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Aug 2025 02:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754102302; cv=none; b=lRW3XcCI+zzWw2jZIpEJPm+kX1lmlHSvpy13733P/tq4UHl4nuHOiBPvC3U4LCmgLlwU0qpCZqY4i63mz2bm6k/zmqYO7XsMR3H9KUuEgainx8m0rXieSuS5NJfDPByjoHI7y4VCPJCKgurW1tZEWI5Ifc4+KcNF56nyZ5whUnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754102302; c=relaxed/simple;
	bh=lQGTbmLCX8I5in7NjxG39ICnPt1Q/wQoAE2sRkTQeA4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=njU3ED//Lzs8iVD7XiK0kDqX7/aNkAahxcDvBCYUky9VK1gqkRtee3SgYfFWCuOy/Og0pu4S12PxNtCl1w+HPUJl0utH3rz6KNKBE4DNqmWWExTbP2Wc6Ja7HbM60PuIZmxPpmfgVN0iR3df06iyB+SJ2J9q9y6MGrEj3Augs4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jy+MOjvF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jy+MOjvF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754102300; x=1785638300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lQGTbmLCX8I5in7NjxG39ICnPt1Q/wQoAE2sRkTQeA4=;
  b=Jy+MOjvFatTt3QcTS7m3oSOFL1XlsytzuS62ZzsSdhfF7am/enSVrdrh
   UGqiyNS3Qr8kt5CdTv175eJ0vYJYFcirQgXA05kE4VsxR7aW11Aj6atJM
   oUWIwE6j+dy7bA6is5275qkRxp/XVdFkFs5c4iKwU9ajyg6vPu5YjSIp+
   E79WS02lIAFZORfB2MmVFlMp6AQqsm/5dhYQb+YaVMGtNcNThVPItJZip
   XuuC9NqHfhzxDeK8kkT8ruQ2KFYkiR/hMzLU9bMJs/axEOfwZGvwSggId
   NBNVSK/UYsfinEaYmYjpyzAdywC3Crkhmxx9/uvFbiPHb95BWOLfxrBlR
   w==;
X-CSE-ConnectionGUID: ZyKYt2SzQliUX6oibAKDzg==
X-CSE-MsgGUID: +ZaXWTqYRPKknAcWLfPhlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56589961"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56589961"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 19:38:18 -0700
X-CSE-ConnectionGUID: GWwgf0xQQKihS5vhYp5fbQ==
X-CSE-MsgGUID: MNvl1T6gQyGoq3xWtQwR5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="162991224"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Aug 2025 19:38:17 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui28U-00056s-2F;
	Sat, 02 Aug 2025 02:38:14 +0000
Date: Sat, 2 Aug 2025 10:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/parisc/lib/memcpy.c:44 raw_copy_from_user() warn: if statement
 not indented
Message-ID: <202508021047.Mp1T16dT-lkp@intel.com>
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
TO: John David Anglin <dave.anglin@bell.net>
CC: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a6923c06a3b2e2c534ae28c53a7531e76cc95cfa
commit: 91428ca9320edbab1211851d82429d33b9cd73ef parisc: Check region is readable by user in raw_copy_from_user()
date:   7 days ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 days ago
config: parisc-randconfig-r071-20250801 (https://download.01.org/0day-ci/archive/20250802/202508021047.Mp1T16dT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508021047.Mp1T16dT-lkp@intel.com/

smatch warnings:
arch/parisc/lib/memcpy.c:44 raw_copy_from_user() warn: if statement not indented

vim +44 arch/parisc/lib/memcpy.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  32  
f64fd180ec2c0b Al Viro           2017-03-24  33  unsigned long raw_copy_from_user(void *dst, const void __user *src,
9e91db6b4abecd Helge Deller      2016-10-06  34  			       unsigned long len)
^1da177e4c3f41 Linus Torvalds    2005-04-16  35  {
91428ca9320edb John David Anglin 2025-07-21  36  	unsigned long start = (unsigned long) src;
91428ca9320edb John David Anglin 2025-07-21  37  	unsigned long end = start + len;
91428ca9320edb John David Anglin 2025-07-21  38  	unsigned long newlen = len;
91428ca9320edb John David Anglin 2025-07-21  39  
360bd6c658076f Helge Deller      2022-02-17  40  	mtsp(get_user_space(), SR_TEMP1);
360bd6c658076f Helge Deller      2022-02-17  41  	mtsp(get_kernel_space(), SR_TEMP2);
91428ca9320edb John David Anglin 2025-07-21  42  
91428ca9320edb John David Anglin 2025-07-21  43  	/* Check region is user accessible */
91428ca9320edb John David Anglin 2025-07-21 @44  	if (start)
91428ca9320edb John David Anglin 2025-07-21  45  	while (start < end) {
91428ca9320edb John David Anglin 2025-07-21  46  		if (!prober_user(SR_TEMP1, start)) {
91428ca9320edb John David Anglin 2025-07-21  47  			newlen = (start - (unsigned long) src);
91428ca9320edb John David Anglin 2025-07-21  48  			break;
91428ca9320edb John David Anglin 2025-07-21  49  		}
91428ca9320edb John David Anglin 2025-07-21  50  		start += PAGE_SIZE;
91428ca9320edb John David Anglin 2025-07-21  51  		/* align to page boundry which may have different permission */
91428ca9320edb John David Anglin 2025-07-21  52  		start = PAGE_ALIGN_DOWN(start);
91428ca9320edb John David Anglin 2025-07-21  53  	}
91428ca9320edb John David Anglin 2025-07-21  54  	return len - newlen + pa_memcpy(dst, (void __force *)src, newlen);
^1da177e4c3f41 Linus Torvalds    2005-04-16  55  }
f64fd180ec2c0b Al Viro           2017-03-24  56  EXPORT_SYMBOL(raw_copy_from_user);
^1da177e4c3f41 Linus Torvalds    2005-04-16  57  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
