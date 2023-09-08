Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFC12108
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Sep 2023 11:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694172304; x=1725708304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rTp3hME0CS3OrqIWHx8Bd270ULdNaICfiaGQCAlY4tI=;
  b=JW9XidqG3WELcH4wrgAWy4njVLfLeapq1eGY2sHJVr71D95pSONtx3AG
   q82e20RdfkH6gofSPTB3aQy/kA8H09TdMQT9fMV0KKo2bpmkmZebUkr1w
   rwvpcAsLlryCXFJQME+OhJiFSD8Xvj4YV+qvZEsXdqXOfdL3Q//h867yz
   g6gaI1IwPDjErK9XsvryQDP/F/RNCgmlXSXYGVf4cuGveFLIp/Ln2sUxP
   tVHKg551ERuyBYm6lt6MynmVT5ry8+Gyfw75/Ovnb0XOgsBUZ1izh16sU
   AftXfxsGv8hEDB1reFTRtme/RjDUsVmuqK7f6S2lbkN2q78FNC7NBwqxK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="357928812"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="357928812"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 04:25:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="745575031"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="745575031"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Sep 2023 04:25:02 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeZbg-0002D5-0T;
	Fri, 08 Sep 2023 11:25:00 +0000
Date: Fri, 8 Sep 2023 19:24:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [qais-yousef:sched-setscheduler-hide 12/12] kernel/kthread.c:1570
 param_get_namefmt() warn: variable dereferenced before check 'param' (see
 line 1567)
Message-ID: <202309081907.lbs9VWMn-lkp@intel.com>
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
TO: Qais Yousef <qyousef@layalina.io>

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   557fb1e21399de5f674beb93fa6793adce124cc2
commit: 557fb1e21399de5f674beb93fa6793adce124cc2 [12/12] kthread: Implement parameter handling logic
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20230907 (https://download.01.org/0day-ci/archive/20230908/202309081907.lbs9VWMn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230908/202309081907.lbs9VWMn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309081907.lbs9VWMn-lkp@intel.com/

smatch warnings:
kernel/kthread.c:1570 param_get_namefmt() warn: variable dereferenced before check 'param' (see line 1567)
kernel/kthread.c:1794 param_set_sched_util_min() warn: ignoring unreachable code.

vim +/param +1570 kernel/kthread.c

4328f6314232c50e Qais Yousef 2023-08-26  1558  
4328f6314232c50e Qais Yousef 2023-08-26  1559  /*
4328f6314232c50e Qais Yousef 2023-08-26  1560   * Kthread sysfs params handling
4328f6314232c50e Qais Yousef 2023-08-26  1561   */
557fb1e21399de5f Qais Yousef 2023-08-27  1562  static int param_get_namefmt(char *buffer, int len,
557fb1e21399de5f Qais Yousef 2023-08-27  1563  			     const char *name, const char *param)
557fb1e21399de5f Qais Yousef 2023-08-27  1564  {
557fb1e21399de5f Qais Yousef 2023-08-27  1565  	int namelen = strlen(name);
557fb1e21399de5f Qais Yousef 2023-08-27  1566  	int kthreadlen = strlen("kthread.");
557fb1e21399de5f Qais Yousef 2023-08-27 @1567  	int paramlen = strlen(param);
557fb1e21399de5f Qais Yousef 2023-08-27  1568  	int size = namelen - kthreadlen - paramlen;
557fb1e21399de5f Qais Yousef 2023-08-27  1569  
557fb1e21399de5f Qais Yousef 2023-08-27 @1570  	if (!namelen || !param || size > len)
557fb1e21399de5f Qais Yousef 2023-08-27  1571  		return -EINVAL;
557fb1e21399de5f Qais Yousef 2023-08-27  1572  
557fb1e21399de5f Qais Yousef 2023-08-27  1573  	strlcpy(buffer, name + kthreadlen, size);
557fb1e21399de5f Qais Yousef 2023-08-27  1574  
557fb1e21399de5f Qais Yousef 2023-08-27  1575  	return 0;
557fb1e21399de5f Qais Yousef 2023-08-27  1576  }
557fb1e21399de5f Qais Yousef 2023-08-27  1577  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
