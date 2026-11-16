Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823161;
	b=N9W4Tls2AQKZ0eJangyjvqRmLXAdwjyNKTnQMjx7uW4hxGnGec3mVeqWn3gUADF/s2gD
	 2h64QdXqp1LMVUXFToR661ElG1HKfQhN93wfdKUfGkRqMGZTamkhWIdD4XATqn724JLjA
	 inG8ud0rSLnZ5Jv0bedtBNugJZoj24NAy4QlKDKJ/EoQfG2Oa62oRv7HBG8FrHFQWpmay
	 iYH9c9So9Hj+WIoig7+WEOHl8l3S4yU1pWTMgSITFyyv52AOzuoRIhRK+2938v3goDn8U
	 fyiSBxmVkQEENJMZSyOPrc6/HYEOJFz4xiywTPlOJmmEW+Ghwzf7Om6p7rF+g7q7Rvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823161;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kDlCzXF5ZEbdYvuoy87Ei/DY4HeciirkRxeSKMFVkxY=;
	b=FBibkBwARdx6nfSUYATGQIgqnx1bgH4ievT/prYeUX1IRb1QButRYNaz0pPKRRjgW6TH
	 wySDBIt+lNE6rori/HSqJqKMZ0b46vIUwQTHmbnW1p/z3hd0owlWK8/OYhzVK0q2rAULw
	 H2Tcfvx+5BIUN7PVAKnVjhb0/sdCdOqTrvwa/v3Ox50iaWjpG7VLYGNe/fXiIjHwPBGaQ
	 sdP4OQeLsemSTkTo+d1cWcTO7AXpAve0DDcQlrnms5Z2AaIFGjuPrieCGxRLdbmHCMpE/
	 ZreG6qNYjU0NF7PGf9c8iHDw/qRAIdnkqQS2fRWRQnk7Cnrs5siVT7R2hxnv5N9b7PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="gBFKIKY/";
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32A7606A331
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 09:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B32A7606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gBFKIKY/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794823161; x=1826359161;
  h=date:from:to:cc:subject:message-id;
  bh=yS624CZht3hRVSjvqOLKgbDThGQXH0bu/lZJ5wMH17c=;
  b=gBFKIKY/5T0C9rVKJigWUbKEHhJKtAibSnS9AjCMy6TlKz8zBlk57Eq0
   Y7dL2pYofCQyWIF2m/YLTadcEeifSxNClWdP7B4vTuQwUz6hNQFunLagK
   URHAL2Faxo5uX4Xo8IpT8OUGJuJTkAuiDU8bb4Hpplu+8V0Wy5DOkULsH
   uEsDwOmcUuYvWnxTsJNGYQQQD85AbjGC8Jg4/vFzWv0F49PS12OKb6ZYi
   EIsS4gAeWAzKnQQ6nZ5ojbX53X5SdV1kwRTOmcDcAwMcBeyLCIDPf0KyU
   xoO5Q7p9raxNJmmfBNjw42sjmynKPXKgdzgEn9+nfx4Z9pS7xyobIBx8A
   A==;
X-CSE-ConnectionGUID: sr+vzIteTJ6GAE3g/hOy4w==
X-CSE-MsgGUID: nniKCh53TYSpP136Kna/Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3551223"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3551223"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:59:21 -0800
X-CSE-ConnectionGUID: lBu9hwMLSe66UFFGPzcH9g==
X-CSE-MsgGUID: /9zqHYJ3Q7e5nqTbTPXqqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9399295"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 16 Nov 2026 01:59:19 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xStUa-000000002ex-44SH;
	Mon, 16 Nov 2026 09:59:16 +0000
Date: Mon, 16 Nov 2026 10:58:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android17-6.18-lts 7/7] /usr/bin/ld:
 tools/testing/selftests/vfio/lib/vfio_pci_driver.o:undefined reference to
 `ioat_ops'
Message-ID: <202611161055.IOLqrwIQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi David,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-lts
head:   44c4d19047cd3c9c51c6fa3930c35844b10b5f9a
commit: 2223587df5c5e935cc6f973f62a9608eef81bec8 [7/7] vfio: selftests: Add driver for Intel CBDMA
:::::: branch date: 18 hours ago
:::::: commit date: 1 year, 3 months ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261116/202611161055.IOLqrwIQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611161055.IOLqrwIQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2223587df5c5 ("vfio: selftests: Add driver for Intel CBDMA")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611161055.IOLqrwIQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /usr/bin/ld: tools/testing/selftests/vfio/lib/vfio_pci_driver.o:(.data.rel+0x0): undefined reference to `ioat_ops'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
