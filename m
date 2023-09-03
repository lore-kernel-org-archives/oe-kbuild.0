Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C954256A
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Sep 2023 17:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693760702; x=1725296702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z/r/zeQTGqgPcLrFD8h6ENw5lpa6itsG22hc9VGfCoU=;
  b=VaQbiAtK3Y/wFXem4amQIbsaW9Fm8k9855fN2vRShkNRgUGxv74poVCM
   OZI8Ve5FGTqlTrkmvGaAFVcw+LU58yMXQSC9ALWZ7MLbq8rc0p6udwXnz
   CS5dllt3BM61M9UfBNRf0xj/edtqpPFlZhixoT8C9L6AzFZG4ERi0BIe0
   FNZYGyvBc0g0NKrEjuijoxNCx0+4OXDsVToVnOgZ8fjJoJl0X+d9CNogZ
   zjhvMwHRalAfj0RGd5M443c63Xjv/arDHQpQwIl4cM3PLXIzTpAQkrpGQ
   1FDeBa0SMJncxR4rk3/yd5cEiNnRj8cZdHyyqZ7su5LNhtSYYpWgH06U8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="361485250"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="361485250"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 10:05:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="806007893"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="806007893"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Sep 2023 10:05:00 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcqWv-0003IR-2Y;
	Sun, 03 Sep 2023 17:04:57 +0000
Date: Mon, 4 Sep 2023 01:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/fsi/fsi-sbefifo.c:959 sbefifo_cmd_timeout() warn: check for
 integer overflow 'timeout'
Message-ID: <202309040138.JEmw4yyx-lkp@intel.com>
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
TO: Eddie James <eajames@us.ibm.com>
CC: Joel Stanley <joel@jms.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   92901222f83d988617aee37680cb29e1a743b5e4
commit: 19c064defcce7550f9a7027384ae46fda0d27394 fsi: sbefifo: Add configurable in-command timeout
date:   4 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-161-20230903 (https://download.01.org/0day-ci/archive/20230904/202309040138.JEmw4yyx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230904/202309040138.JEmw4yyx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309040138.JEmw4yyx-lkp@intel.com/

smatch warnings:
drivers/fsi/fsi-sbefifo.c:959 sbefifo_cmd_timeout() warn: check for integer overflow 'timeout'

vim +/timeout +959 drivers/fsi/fsi-sbefifo.c

9f4a8a2d7f9d710 Benjamin Herrenschmidt 2018-05-17  944  
19c064defcce755 Eddie James            2023-06-12  945  static int sbefifo_cmd_timeout(struct sbefifo_user *user, void __user *argp)
19c064defcce755 Eddie James            2023-06-12  946  {
19c064defcce755 Eddie James            2023-06-12  947  	struct device *dev = &user->sbefifo->dev;
19c064defcce755 Eddie James            2023-06-12  948  	u32 timeout;
19c064defcce755 Eddie James            2023-06-12  949  
19c064defcce755 Eddie James            2023-06-12  950  	if (get_user(timeout, (__u32 __user *)argp))
19c064defcce755 Eddie James            2023-06-12  951  		return -EFAULT;
19c064defcce755 Eddie James            2023-06-12  952  
19c064defcce755 Eddie James            2023-06-12  953  	if (timeout == 0) {
19c064defcce755 Eddie James            2023-06-12  954  		user->cmd_timeout_ms = SBEFIFO_TIMEOUT_IN_CMD;
19c064defcce755 Eddie James            2023-06-12  955  		dev_dbg(dev, "Command timeout reset to %us\n", user->cmd_timeout_ms / 1000);
19c064defcce755 Eddie James            2023-06-12  956  		return 0;
19c064defcce755 Eddie James            2023-06-12  957  	}
19c064defcce755 Eddie James            2023-06-12  958  
19c064defcce755 Eddie James            2023-06-12 @959  	user->cmd_timeout_ms = timeout * 1000; /* user timeout is in sec */
19c064defcce755 Eddie James            2023-06-12  960  	dev_dbg(dev, "Command timeout set to %us\n", timeout);
19c064defcce755 Eddie James            2023-06-12  961  	return 0;
19c064defcce755 Eddie James            2023-06-12  962  }
19c064defcce755 Eddie James            2023-06-12  963  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
