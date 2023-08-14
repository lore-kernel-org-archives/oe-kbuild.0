Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C68339D
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Aug 2023 01:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691976869; x=1723512869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FLDX0jiKSWJ30fpQeJpwE4JnoKX0qPICh7TnbnCiSzg=;
  b=T2RcpmroxyXJo1Y5eWB2JmXx3FzlrYYdk8F80WLQ1h7e03rCBAU70zcU
   U25QFXCynaK6d7oMoBqxr4yaJ+X/RyRUSz/G3sK7NCUnhRpqRMptf0BPX
   y2CdZg0zSYHXy3LPf4jU3oeL3lzjY+U0i7bXXyPzvLt6yEn5oEzpj+70N
   OKvinnxTurNyFTRwtTexJdhMGZ1c4JzPnhJRT68z4tjkZdxhl+8Z3ucu6
   p28JbDqhrN56pzYq0W2S6YO64a0KuOs06TnxVX77RYDrrMw1QwWXK+Zym
   nKj921gNBzYkB5Z9TTVa/aLr0+8PvXQDy1eifZaMUyFMPEoPDzdC+kUJz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="362088726"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="362088726"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 18:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="876776298"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 Aug 2023 18:34:30 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVMTS-0009Ia-1j;
	Mon, 14 Aug 2023 01:34:26 +0000
Date: Mon, 14 Aug 2023 09:33:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [joel-fsi:next 7/19] drivers/fsi/fsi-sbefifo.c:959
 sbefifo_cmd_timeout() warn: check for integer overflow 'timeout'
Message-ID: <202308140956.EfxqdRts-lkp@intel.com>
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
TO: Eddie James <eajames@us.ibm.com>
CC: Joel Stanley <joel@jms.id.au>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/joel/fsi.git next
head:   f432b1cf7820020ada05cf3bef080893ef2bd69a
commit: 19c064defcce7550f9a7027384ae46fda0d27394 [7/19] fsi: sbefifo: Add configurable in-command timeout
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-m021-20230814 (https://download.01.org/0day-ci/archive/20230814/202308140956.EfxqdRts-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308140956.EfxqdRts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308140956.EfxqdRts-lkp@intel.com/

smatch warnings:
drivers/fsi/fsi-sbefifo.c:959 sbefifo_cmd_timeout() warn: check for integer overflow 'timeout'

vim +/timeout +959 drivers/fsi/fsi-sbefifo.c

9f4a8a2d7f9d71 Benjamin Herrenschmidt 2018-05-17  944  
19c064defcce75 Eddie James            2023-06-12  945  static int sbefifo_cmd_timeout(struct sbefifo_user *user, void __user *argp)
19c064defcce75 Eddie James            2023-06-12  946  {
19c064defcce75 Eddie James            2023-06-12  947  	struct device *dev = &user->sbefifo->dev;
19c064defcce75 Eddie James            2023-06-12  948  	u32 timeout;
19c064defcce75 Eddie James            2023-06-12  949  
19c064defcce75 Eddie James            2023-06-12  950  	if (get_user(timeout, (__u32 __user *)argp))
19c064defcce75 Eddie James            2023-06-12  951  		return -EFAULT;
19c064defcce75 Eddie James            2023-06-12  952  
19c064defcce75 Eddie James            2023-06-12  953  	if (timeout == 0) {
19c064defcce75 Eddie James            2023-06-12  954  		user->cmd_timeout_ms = SBEFIFO_TIMEOUT_IN_CMD;
19c064defcce75 Eddie James            2023-06-12  955  		dev_dbg(dev, "Command timeout reset to %us\n", user->cmd_timeout_ms / 1000);
19c064defcce75 Eddie James            2023-06-12  956  		return 0;
19c064defcce75 Eddie James            2023-06-12  957  	}
19c064defcce75 Eddie James            2023-06-12  958  
19c064defcce75 Eddie James            2023-06-12 @959  	user->cmd_timeout_ms = timeout * 1000; /* user timeout is in sec */
19c064defcce75 Eddie James            2023-06-12  960  	dev_dbg(dev, "Command timeout set to %us\n", timeout);
19c064defcce75 Eddie James            2023-06-12  961  	return 0;
19c064defcce75 Eddie James            2023-06-12  962  }
19c064defcce75 Eddie James            2023-06-12  963  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
