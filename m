Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5F01843
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Sep 2023 09:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693734293; x=1725270293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cYJRi/wvpyiikVGTrObhLJcZiS1S5kw+octvyx3jjMk=;
  b=Z4yJPAFCW2KhIw4aoq4586rwzRHrlX7JOSW9XFcm4cos9BucF8xpxSE5
   ooHiPnvUtl+wsllgvdiFQtLwsxYEb8H8TYp1gV6q0fVjAKDcqTxAbSCw5
   G7W8yJlVh4tcS6/zViEOt51bMjZ0vEOosIVhm8xbSFZGWLVO3v9TmAIUF
   FudBcQJJr1u5bNjxHrInCLYAB2N3Z9MuDhMhBugABcl2ril9vSViHuoy6
   3rSV9Q3o9rFkpFasYUKliHVjPT5cYBC5omdIh21xDLozGxHFxIiwKDAjS
   y3dpVEWhEyw47NDKLeMcWTeM76THB+3lz+LmABeAsrxBg6P8vYdw0A1Nt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="440405440"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="440405440"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 02:44:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="810576399"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="810576399"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Sep 2023 02:44:51 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcjez-00034X-2E;
	Sun, 03 Sep 2023 09:44:49 +0000
Date: Sun, 3 Sep 2023 17:43:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/fsi/fsi-sbefifo.c:959 sbefifo_cmd_timeout() warn: check for
 integer overflow 'timeout'
Message-ID: <202309031753.V0mqEEXJ-lkp@intel.com>
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
:::::: branch date: 11 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-161-20230903 (https://download.01.org/0day-ci/archive/20230903/202309031753.V0mqEEXJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230903/202309031753.V0mqEEXJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309031753.V0mqEEXJ-lkp@intel.com/

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
