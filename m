Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776AE7E2
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Aug 2023 03:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691983242; x=1723519242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S+ouJSm3u+pj9ll/baQxQpthkb2i4b9fCXA+RVEsHeQ=;
  b=AQsa6jhdjhEqIrQkyqe4GAJ559Aocj/sHF61W2ROwDBCwSn0YwhCeI31
   sP5ppRGkgBRa9Y3v1X5mkIfxXcQHYnXwPIpgRTpRvGVIF5Vb+02PrZT3a
   Di9JjSxW5JkHrWojYF0/icWAhXjjNnkDO9c03m6uSqJVNQTjbtbn4g1tb
   JTs6pCayuumFIq0NyKXewdv5qtGSQvfRMPVvtCt9Xz1PFQIt/zG8MB+44
   /bl1ZjHL2UlARif2iIwdpIb5Z3AafiW9iWAdBkP/aN8U4V6uDDaV5ul19
   N4wsHWELUAef4YUw4fEvPDeYo7i5lT2FtZFDTxPPwmnoBjFKZh86amLEZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="362101537"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="362101537"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 20:20:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="733310347"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="733310347"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Aug 2023 20:20:40 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVO8G-0009LU-0F;
	Mon, 14 Aug 2023 03:20:40 +0000
Date: Mon, 14 Aug 2023 11:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [joel-fsi:next 8/19] drivers/fsi/fsi-sbefifo.c:978
 sbefifo_read_timeout() warn: check for integer overflow 'timeout'
Message-ID: <202308141103.lrP14Gl6-lkp@intel.com>
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
TO: Eddie James <eajames@linux.ibm.com>
CC: Joel Stanley <joel@jms.id.au>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/joel/fsi.git next
head:   f432b1cf7820020ada05cf3bef080893ef2bd69a
commit: 2f42220f350049e15df026ad87be36d967102cbf [8/19] fsi: sbefifo: Remove limits on user-specified read timeout
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-m021-20230814 (https://download.01.org/0day-ci/archive/20230814/202308141103.lrP14Gl6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308141103.lrP14Gl6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308141103.lrP14Gl6-lkp@intel.com/

New smatch warnings:
drivers/fsi/fsi-sbefifo.c:978 sbefifo_read_timeout() warn: check for integer overflow 'timeout'

Old smatch warnings:
drivers/fsi/fsi-sbefifo.c:959 sbefifo_cmd_timeout() warn: check for integer overflow 'timeout'

vim +/timeout +978 drivers/fsi/fsi-sbefifo.c

19c064defcce75 Eddie James   2023-06-12  963  
a1dc6308865df7 Amitay Isaacs 2022-01-21  964  static int sbefifo_read_timeout(struct sbefifo_user *user, void __user *argp)
a1dc6308865df7 Amitay Isaacs 2022-01-21  965  {
a1dc6308865df7 Amitay Isaacs 2022-01-21  966  	struct device *dev = &user->sbefifo->dev;
a1dc6308865df7 Amitay Isaacs 2022-01-21  967  	u32 timeout;
a1dc6308865df7 Amitay Isaacs 2022-01-21  968  
a1dc6308865df7 Amitay Isaacs 2022-01-21  969  	if (get_user(timeout, (__u32 __user *)argp))
a1dc6308865df7 Amitay Isaacs 2022-01-21  970  		return -EFAULT;
a1dc6308865df7 Amitay Isaacs 2022-01-21  971  
a1dc6308865df7 Amitay Isaacs 2022-01-21  972  	if (timeout == 0) {
a1dc6308865df7 Amitay Isaacs 2022-01-21  973  		user->read_timeout_ms = SBEFIFO_TIMEOUT_START_RSP;
2f42220f350049 Eddie James   2023-06-12  974  		dev_dbg(dev, "Timeout reset to %us\n", user->read_timeout_ms / 1000);
a1dc6308865df7 Amitay Isaacs 2022-01-21  975  		return 0;
a1dc6308865df7 Amitay Isaacs 2022-01-21  976  	}
a1dc6308865df7 Amitay Isaacs 2022-01-21  977  
a1dc6308865df7 Amitay Isaacs 2022-01-21 @978  	user->read_timeout_ms = timeout * 1000; /* user timeout is in sec */
2f42220f350049 Eddie James   2023-06-12  979  	dev_dbg(dev, "Timeout set to %us\n", timeout);
a1dc6308865df7 Amitay Isaacs 2022-01-21  980  	return 0;
a1dc6308865df7 Amitay Isaacs 2022-01-21  981  }
a1dc6308865df7 Amitay Isaacs 2022-01-21  982  

:::::: The code at line 978 was first introduced by commit
:::::: a1dc6308865df719efb2a2f8a5f0f5979602d267 fsi: sbefifo: Implement FSI_SBEFIFO_READ_TIMEOUT_SECONDS ioctl

:::::: TO: Amitay Isaacs <amitay@ozlabs.org>
:::::: CC: Joel Stanley <joel@jms.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
