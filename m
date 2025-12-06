Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7C03B8D47
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Dec 2025 22:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765061345; cv=none; b=tAEd+AgQgBsweSnBjgdsEf++JqBmYfVJemFz3C/A4Cy1RGCcjO4a76ZOXWvzgHrKLfUV3pW+lN93VKJ1bn4+iEN9at1strgWK6BshFiXOj2wgpmWMKyVdPj/M9tn5V4aYWyY65HGb0/18hfKbo1i9CInlCK/h2oeBDOUjGXyzQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765061345; c=relaxed/simple;
	bh=OLohKJaMk9RtLItawVXD1e13Eet7q3qWiPmeK3hB2LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Odk7eg1AoKtx3KnjB8OI7BSpI/oBuhT46honkBdT7MZy70hgTtINFX2t0oykUXO5fH7FSQX4W73NCzzC+IZnQIxtIBJ2Q0oQpZp8Co7+6S8ZMBx1SnMXMjYQq7c0FJ01ADt+KpB7hcAB9n/brQfHsWZzFcvdlIqaFTcjTWr9dJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcmr4OH6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcmr4OH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765061343; x=1796597343;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OLohKJaMk9RtLItawVXD1e13Eet7q3qWiPmeK3hB2LQ=;
  b=mcmr4OH66OV4xUX3+kYABHTkbqQYm1iXwe0MPxT9R/RQFa4FtDZVODes
   UylP2F+szw8hfIUF9sHpebe0+NdCifXBE1hAq9DXYOmNEBovraoXkiWOz
   iEeKX96UQAF8SehhprhEXs6oXBLHkavpJGRqDhIJbnqcD60SDmbSmHN8N
   iN0Kb5lzgmDC50Hs1yD5na2aygchcWwDNJxvtltKYmLd1XKV7d19YBbHP
   i/zE16zpKlXQvoBOWnNATQ+1eqv1sQd9TmBCzSRDgzos0gkPS+P/SWKTw
   Cv2rL1Z2jFRFBcfUBQp1bVB8o6fZVlXOwSUHcwzoq+7c0WXVpLCfU+pfO
   A==;
X-CSE-ConnectionGUID: ao6pRuUzRKmkRyEUuAu6mw==
X-CSE-MsgGUID: QrFSmuacQeuz3z+G/wedvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="67220016"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="67220016"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 14:49:02 -0800
X-CSE-ConnectionGUID: Cfhdz280Qsmo87iKgRq5EQ==
X-CSE-MsgGUID: KkmnCKlNRPyj/ldr4pm03w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="200044226"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 06 Dec 2025 14:49:01 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vS15H-0000000018z-33Hj;
	Sat, 06 Dec 2025 22:48:59 +0000
Date: Sat, 6 Dec 2025 23:48:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12302/13567]
 tools/testing/selftests/vfio/lib/include/../../../kselftest.h:53:10: fatal
 error: errno.h: No such file or directory
Message-ID: <202512062357.ZDDNQpUy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Matlack <dmatlack@google.com>
CC: Alex Williamson <alex@shazbot.org>
CC: Alex Mastro <amastro@fb.com>
CC: Raghavendra Rao Ananta <rananta@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6987d58a9cbc5bd57c983baa514474a86c945d56
commit: 6c74d9830d8b10d51ce3c55d38e8babf23899c89 [12302/13567] vfio: selftests: Eliminate overly chatty logging
:::::: branch date: 2 days ago
:::::: commit date: 8 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251206/202512062357.ZDDNQpUy-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512062357.ZDDNQpUy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512062357.ZDDNQpUy-lkp@intel.com/

Note: the linux-next/master HEAD 6987d58a9cbc5bd57c983baa514474a86c945d56 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from tools/testing/selftests/vfio/lib/vfio_pci_driver.c:2:
>> tools/testing/selftests/vfio/lib/include/../../../kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.


vim +53 tools/testing/selftests/vfio/lib/include/../../../kselftest.h

7fb2c3ea28bf7b Shuah Khan     2014-10-03  51  
9e38be732da8fe Mark Brown     2023-04-06  52  #ifndef NOLIBC
fc2e634e997d84 Aleksa Sarai   2019-07-20 @53  #include <errno.h>
7fb2c3ea28bf7b Shuah Khan     2014-10-03  54  #include <stdlib.h>
7fb2c3ea28bf7b Shuah Khan     2014-10-03  55  #include <unistd.h>
151b2732111f07 Paul Elder     2017-06-28  56  #include <stdarg.h>
f2662ec26b26ad André Almeida  2025-09-17  57  #include <stdbool.h>
907f33028871fa Mark Brown     2023-09-28  58  #include <string.h>
a18261d71bbc62 Tycho Andersen 2019-01-18  59  #include <stdio.h>
6d029c25b71f2d Oleg Nesterov  2024-04-09  60  #include <sys/utsname.h>
9e38be732da8fe Mark Brown     2023-04-06  61  #endif
7fb2c3ea28bf7b Shuah Khan     2014-10-03  62  

:::::: The code at line 53 was first introduced by commit
:::::: fc2e634e997d84f2610a482b500865ef2c04fcde kselftest: save-and-restore errno to allow for %m formatting

:::::: TO: Aleksa Sarai <cyphar@cyphar.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
