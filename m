Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B878C6EB4F
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Dec 2023 12:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXyvNhKp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703162575; x=1734698575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d3jY2A5FbunJ4fqU4LsfeMo3sOFNF+Uym9lg/b6MIgY=;
  b=dXyvNhKpzziKFbmypjUeVqjAcGys6d/3AIpELnYGSjX9ccmRP98RnxjY
   onRKM5KME+Bj+8OUPrrQM5tLaSKLyqqSTMCkJbQcocCm3Is8+VMWlRClT
   wFWC0fiITL+N090LSYNkYCk0fwjkgSwOg95lsKkLqcimuIjjq4h51U73U
   w7d6TOWKT+pTwTGhg4PdLgOeD3WW/T7d1rJhrcwwg95MnxY5tolq8xCRf
   zZ1sEHKFdHTm14jDlCo3QatHNn0mzlXO7hwYzKI4rHzoKSALbBAAcHDwR
   cMqyCM3xaPriw12oDHd5i9ohKo6jFI+dRZ694Hi2JL+kJ9RraUk94VV7B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427119902"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="427119902"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 04:42:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="1023845384"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="1023845384"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 21 Dec 2023 04:42:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGIO1-0008Kp-0W;
	Thu, 21 Dec 2023 12:42:49 +0000
Date: Thu, 21 Dec 2023 20:42:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 9258/9925] drivers/w1/masters/ds2490.c:650:16-18:
 WARNING opportunity for min()
Message-ID: <202312212000.QlTBZ0dW-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Marc Ferland <marc.ferland@sonatest.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   857647efa9be89a13cf8963c7e167fab062b28bb
commit: d605ba72e9c04efc35fcf225df59d4ccb1d4061f [9258/9925] w1: ds2490: support block sizes larger than 128 bytes in ds_read_block
:::::: branch date: 2 hours ago
:::::: commit date: 28 hours ago
config: arm64-randconfig-r062-20231221 (https://download.01.org/0day-ci/archive/20231221/202312212000.QlTBZ0dW-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7022a24771c8404f847abb226735a3ae21794426)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312212000.QlTBZ0dW-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/w1/masters/ds2490.c:650:16-18: WARNING opportunity for min()

vim +650 drivers/w1/masters/ds2490.c

^1da177e4c3f41 drivers/w1/dscore.c         Linus Torvalds 2005-04-16  641  
d605ba72e9c04e drivers/w1/masters/ds2490.c Marc Ferland   2023-12-18  642  static int ds_read_block(struct ds_device *dev, u8 *buf, int len)
d605ba72e9c04e drivers/w1/masters/ds2490.c Marc Ferland   2023-12-18  643  {
d605ba72e9c04e drivers/w1/masters/ds2490.c Marc Ferland   2023-12-18  644  	int err, to_read, rem = len;
d605ba72e9c04e drivers/w1/masters/ds2490.c Marc Ferland   2023-12-18  645  
d605ba72e9c04e drivers/w1/masters/ds2490.c Marc Ferland   2023-12-18  646  	if (len > 64 * 1024)
d605ba72e9c04e drivers/w1/masters/ds2490.c Marc Ferland   2023-12-18  647  		return -E2BIG;
d605ba72e9c04e drivers/w1/masters/ds2490.c Marc Ferland   2023-12-18  648  
d605ba72e9c04e drivers/w1/masters/ds2490.c Marc Ferland   2023-12-18  649  	do {
d605ba72e9c04e drivers/w1/masters/ds2490.c Marc Ferland   2023-12-18 @650  		to_read = rem <= FIFO_SIZE ? rem : FIFO_SIZE;
d605ba72e9c04e drivers/w1/masters/ds2490.c Marc Ferland   2023-12-18  651  		err = read_block_chunk(dev, &buf[len - rem], to_read);
d605ba72e9c04e drivers/w1/masters/ds2490.c Marc Ferland   2023-12-18  652  		if (err < 0)
d605ba72e9c04e drivers/w1/masters/ds2490.c Marc Ferland   2023-12-18  653  			return err;
d605ba72e9c04e drivers/w1/masters/ds2490.c Marc Ferland   2023-12-18  654  		rem -= to_read;
d605ba72e9c04e drivers/w1/masters/ds2490.c Marc Ferland   2023-12-18  655  	} while (rem);
d605ba72e9c04e drivers/w1/masters/ds2490.c Marc Ferland   2023-12-18  656  
d605ba72e9c04e drivers/w1/masters/ds2490.c Marc Ferland   2023-12-18  657  	return err;
d605ba72e9c04e drivers/w1/masters/ds2490.c Marc Ferland   2023-12-18  658  }
d605ba72e9c04e drivers/w1/masters/ds2490.c Marc Ferland   2023-12-18  659  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
