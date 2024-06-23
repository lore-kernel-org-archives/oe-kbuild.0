Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EBD181BA7
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Jun 2024 13:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719150539; cv=none; b=eDb5eNK/ih60FMkX8QHP55mqg/bUUWwcBbmL7dBjic0xdQy+jiFW3N55WwvwxrTMsFG3OzP3pJSRTf/KgUELdIfELi31vnIFKXoGR6zsNO4+BOTVcUm7B8qCejWI6+w6DxytuBFSTuKqAVxS2lrPbIkDHnXQHZtf7pxC8iw0AU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719150539; c=relaxed/simple;
	bh=FfbTHaIVSCuAWfJ5/JceQuGOut/qnUxQWbNlsuuHYSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WAHLQiPbewQ3BJ2LUrjRE5LqHhfqAFynwM3BFplLaaM+WR8Hfnr05rB9RKU3N/wfwY37lc1p95pFa3fh4QTwHNmgzPrI5UiQAeKuRffMLUMr5kHAXaiy7Z2hniwcaqCXtKBXx7wC+lkEAQ0O1DG2x6Z9vpfX5HASIEmD6bUzOAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BscCCaJv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BscCCaJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719150538; x=1750686538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FfbTHaIVSCuAWfJ5/JceQuGOut/qnUxQWbNlsuuHYSM=;
  b=BscCCaJvrPTjFF4Pl/ZjLRt/YaU+MwATSkvv73hFsGG23DNi7ElauF0p
   wxkub+2xFRSvWuQY/ZAos7RwIk+gb/8NPgjLFG46XXjA1mc3yb12qAJOu
   NEwG86A3PNXkx6ep9CQrujMnQSKl/dRxEKbsJan78a+sSBUkHp79W1BPQ
   wBEa0t0Q+O0oEJEoAXyCFC2mEmItzRfgYeZ6R3xPI8RyV1XOAGr/Igjfh
   0NbkAXBp7DL77BiDdRvFs2ZBIlJpitovVWU+o3XHd6HDCx1CLShpxELNb
   qVA7nKl4lBlWVsOXUZ0Wq7EtjWZCDXFmNUYw6t0Qv0nc+xyQ64RlwNIBF
   g==;
X-CSE-ConnectionGUID: XtAOPTn/R02UidPsM04giQ==
X-CSE-MsgGUID: GG4xgOhDQ1SZe8hVUL+Niw==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="26809579"
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="26809579"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 06:48:57 -0700
X-CSE-ConnectionGUID: S3TSj6RYS8WStrVKP5A4Ow==
X-CSE-MsgGUID: ZzRfpDizT9+WEukbixZRjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="43162607"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jun 2024 06:48:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLNaP-000AWk-2v;
	Sun, 23 Jun 2024 13:48:53 +0000
Date: Sun, 23 Jun 2024 21:48:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/mptcp/ctrl.c:140 proc_available_schedulers() warn: (struct
 ctl_table)->procname cannot be NULL. Expression : tbl.procname
Message-ID: <202406232124.bIt3ZmFi-lkp@intel.com>
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
TO: Gregory Detal <gregory.detal@gmail.com>
CC: mptcp@lists.linux.dev
CC: matthieu.baerts@tessares.net
CC: Jakub Kicinski <kuba@kernel.org>
CC: Mat Martineau <martineau@kernel.org>
CC: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5f583a3162ffd9f7999af76b8ab634ce2dac9f90
commit: 73c900aa3660dae2050af456d1031d098ab4cb1d mptcp: add net.mptcp.available_schedulers
date:   6 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-161-20240623 (https://download.01.org/0day-ci/archive/20240623/202406232124.bIt3ZmFi-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406232124.bIt3ZmFi-lkp@intel.com/

New smatch warnings:
net/mptcp/ctrl.c:140 proc_available_schedulers() warn: (struct ctl_table)->procname cannot be NULL. Expression : tbl.procname
net/mptcp/ctrl.c:140 proc_available_schedulers() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : tbl.proc_handler

Old smatch warnings:
net/mptcp/ctrl.c:121 proc_scheduler() warn: (struct ctl_table)->procname cannot be NULL. Expression : tbl.procname
net/mptcp/ctrl.c:121 proc_scheduler() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : tbl.proc_handler

vim +140 net/mptcp/ctrl.c

6963c508fd7ab6 Gregory Detal 2024-05-06  135  
73c900aa3660da Gregory Detal 2024-05-13  136  static int proc_available_schedulers(struct ctl_table *ctl,
73c900aa3660da Gregory Detal 2024-05-13  137  				     int write, void *buffer,
73c900aa3660da Gregory Detal 2024-05-13  138  				     size_t *lenp, loff_t *ppos)
73c900aa3660da Gregory Detal 2024-05-13  139  {
73c900aa3660da Gregory Detal 2024-05-13 @140  	struct ctl_table tbl = { .maxlen = MPTCP_SCHED_BUF_MAX, };
73c900aa3660da Gregory Detal 2024-05-13  141  	int ret;
73c900aa3660da Gregory Detal 2024-05-13  142  
73c900aa3660da Gregory Detal 2024-05-13  143  	tbl.data = kmalloc(tbl.maxlen, GFP_USER);
73c900aa3660da Gregory Detal 2024-05-13  144  	if (!tbl.data)
73c900aa3660da Gregory Detal 2024-05-13  145  		return -ENOMEM;
73c900aa3660da Gregory Detal 2024-05-13  146  
73c900aa3660da Gregory Detal 2024-05-13  147  	mptcp_get_available_schedulers(tbl.data, MPTCP_SCHED_BUF_MAX);
73c900aa3660da Gregory Detal 2024-05-13  148  	ret = proc_dostring(&tbl, write, buffer, lenp, ppos);
73c900aa3660da Gregory Detal 2024-05-13  149  	kfree(tbl.data);
73c900aa3660da Gregory Detal 2024-05-13  150  
73c900aa3660da Gregory Detal 2024-05-13  151  	return ret;
73c900aa3660da Gregory Detal 2024-05-13  152  }
73c900aa3660da Gregory Detal 2024-05-13  153  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
