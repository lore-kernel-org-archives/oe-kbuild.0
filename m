Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8FE23AA
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Sep 2023 20:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693771273; x=1725307273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZAwYjJ0f3eIauXBbTCP5XynjfoiSy52M5/F599O3zEM=;
  b=UOsoM76Yqly9pHianRt8NM7JkJ+auF05aQQ5bPNCd5X8P34xOH0Juz1v
   R29FfNYSwYNvNiyJMJI42olESNuJPgapo1gFYOCHaXc8MPYWJDpa0N0Iv
   8d2QCf98nsd3/tTAmPgv0BW9VDgpW/R1cDf3YEozzE/IRKgRXq1C+2H4+
   fm/w8eAWzQ0xiZfZAg2I+60gYtn8kltcx1rMYIH8b5r4aToxubbExwa06
   xHl8/5sbqFeO/IiMxzXVACGL5psOnjPOZherrzHVovrS90bHTgTQBxKWk
   drQxuKtOVzxsriHrML+TzD0UdQG2HW8yZzQnt+lGPHd4/hSTFqvQnqKPQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="375375322"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="375375322"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 13:01:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="740529725"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="740529725"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Sep 2023 13:01:11 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qctHQ-0003Nn-1f;
	Sun, 03 Sep 2023 20:01:08 +0000
Date: Mon, 4 Sep 2023 04:00:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/fsi/fsi-sbefifo.c:978 sbefifo_read_timeout() warn: check for
 integer overflow 'timeout'
Message-ID: <202309040358.zesZbC9D-lkp@intel.com>
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
TO: Eddie James <eajames@linux.ibm.com>
CC: Joel Stanley <joel@jms.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   708283abf896dd4853e673cc8cba70acaf9bf4ea
commit: 2f42220f350049e15df026ad87be36d967102cbf fsi: sbefifo: Remove limits on user-specified read timeout
date:   4 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-161-20230903 (https://download.01.org/0day-ci/archive/20230904/202309040358.zesZbC9D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230904/202309040358.zesZbC9D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309040358.zesZbC9D-lkp@intel.com/

New smatch warnings:
drivers/fsi/fsi-sbefifo.c:978 sbefifo_read_timeout() warn: check for integer overflow 'timeout'

Old smatch warnings:
drivers/fsi/fsi-sbefifo.c:959 sbefifo_cmd_timeout() warn: check for integer overflow 'timeout'

vim +/timeout +978 drivers/fsi/fsi-sbefifo.c

19c064defcce755 Eddie James   2023-06-12  963  
a1dc6308865df71 Amitay Isaacs 2022-01-21  964  static int sbefifo_read_timeout(struct sbefifo_user *user, void __user *argp)
a1dc6308865df71 Amitay Isaacs 2022-01-21  965  {
a1dc6308865df71 Amitay Isaacs 2022-01-21  966  	struct device *dev = &user->sbefifo->dev;
a1dc6308865df71 Amitay Isaacs 2022-01-21  967  	u32 timeout;
a1dc6308865df71 Amitay Isaacs 2022-01-21  968  
a1dc6308865df71 Amitay Isaacs 2022-01-21  969  	if (get_user(timeout, (__u32 __user *)argp))
a1dc6308865df71 Amitay Isaacs 2022-01-21  970  		return -EFAULT;
a1dc6308865df71 Amitay Isaacs 2022-01-21  971  
a1dc6308865df71 Amitay Isaacs 2022-01-21  972  	if (timeout == 0) {
a1dc6308865df71 Amitay Isaacs 2022-01-21  973  		user->read_timeout_ms = SBEFIFO_TIMEOUT_START_RSP;
2f42220f350049e Eddie James   2023-06-12  974  		dev_dbg(dev, "Timeout reset to %us\n", user->read_timeout_ms / 1000);
a1dc6308865df71 Amitay Isaacs 2022-01-21  975  		return 0;
a1dc6308865df71 Amitay Isaacs 2022-01-21  976  	}
a1dc6308865df71 Amitay Isaacs 2022-01-21  977  
a1dc6308865df71 Amitay Isaacs 2022-01-21 @978  	user->read_timeout_ms = timeout * 1000; /* user timeout is in sec */
2f42220f350049e Eddie James   2023-06-12  979  	dev_dbg(dev, "Timeout set to %us\n", timeout);
a1dc6308865df71 Amitay Isaacs 2022-01-21  980  	return 0;
a1dc6308865df71 Amitay Isaacs 2022-01-21  981  }
a1dc6308865df71 Amitay Isaacs 2022-01-21  982  

:::::: The code at line 978 was first introduced by commit
:::::: a1dc6308865df719efb2a2f8a5f0f5979602d267 fsi: sbefifo: Implement FSI_SBEFIFO_READ_TIMEOUT_SECONDS ioctl

:::::: TO: Amitay Isaacs <amitay@ozlabs.org>
:::::: CC: Joel Stanley <joel@jms.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
