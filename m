Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF152E2DDD
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Jun 2026 02:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782439661; cv=none; b=rZJK0JSe+9IzQFvyqZoSMC29wZgN4GnrHhp8tN+IDxjvp9kX08iE980xjBOdl2Vxto7BJRdCpuoaxF8ohENx4B6b172bXK6QB0Ki7marSr93Q5Q8LioZ270BZTzrN3PRSRYLy5IKIRucggaIdrDPfB0Ip9vxrnwiS/f10shNs9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782439661; c=relaxed/simple;
	bh=qwchQr5o2MnGOxb3yKIKqVX24TFnYoOdoTt/bszxKTc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RAw76y4ZTcCbpBXigMUrulEeVcepnQudQQ6WXJgy30Za7iN/dGo4YFLjMWk1VO8Zne9Vr8A0BgvYTsIWCChJNbNMU8mflXXO8P8WQLmKlSJyZqh4HMS7p2L/JsSuIeZcdwqwq1YjyPaXwUStW1vrcDKSksnRPL46PU2afzUmky4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZVMzAro; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZVMzAro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782439659; x=1813975659;
  h=date:from:to:cc:subject:message-id;
  bh=qwchQr5o2MnGOxb3yKIKqVX24TFnYoOdoTt/bszxKTc=;
  b=VZVMzAroZXLQqy2DDCnZyjvVnIHBdxauUb0ueuyzA9O9xgpnHWadrJ06
   x8Q0pBPFwGEAA3i4N7OaafTm4ji1cGEshiQBmJMbMFaOt2fzRPMWdnCKV
   L1mNGYvn2vz+oh4n5TPwO/DOjJleL2QukAWpb6UFXDCl5fAaAO3x8xAdk
   S6ONqON4ITvudRncetm87EH3cutnedq291/g/mVKd3u4kzoep++chLhqA
   BXqYP+fPDgR8eaciC86yBJ5qvHfu9AOIyxVeyt8W9D1wGL3iNN5RYYm91
   zZLeEhH1ZT3dVEDHuyNIXR/JwQ0w48/dgI5ot7euSX+Fhyxs0ybLOQTDR
   A==;
X-CSE-ConnectionGUID: IAaSIsJFQcWKkRRXERXhxQ==
X-CSE-MsgGUID: 4tYxs4+5STiilkaP+AaGPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="86912907"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="86912907"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 19:07:39 -0700
X-CSE-ConnectionGUID: uZh64j7+RiaR94TTdjKnrA==
X-CSE-MsgGUID: pORa1uGWTnWa2XVH7GcJ9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="247248511"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 25 Jun 2026 19:07:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcvyb-000000004jR-3hTs;
	Fri, 26 Jun 2026 02:07:29 +0000
Date: Fri, 26 Jun 2026 10:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11086/15425]
 drivers/char/ipmi/ssif_bmc.c:158 ssif_bmc_read() error: calling
 'spin_unlock_irqrestore()' with bogus flags
Message-ID: <202606261001.a4rYzg2M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   30ffa8de54e5cc80d93fd211ca134d1764a7011f
commit: e07d10ed0f238d3f4a8276932a36fe1f74775621 [11086/15425] lib/Kconfig.debug: enable CONFIG_PREEMPT_RT for syzbot kernels.
:::::: branch date: 9 hours ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-r073-20260624 (https://download.01.org/0day-ci/archive/20260626/202606261001.a4rYzg2M-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606261001.a4rYzg2M-lkp@intel.com/

New smatch warnings:
drivers/char/ipmi/ssif_bmc.c:158 ssif_bmc_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/ipmi/ssif_bmc.c:231 ssif_bmc_write() error: calling 'spin_unlock_irqrestore()' with bogus flags

Old smatch warnings:
drivers/char/ipmi/ssif_bmc.c:166 ssif_bmc_read() error: calling 'spin_unlock_irqrestore()' with bogus flags

vim +158 drivers/char/ipmi/ssif_bmc.c

dd2bc5cc9e2555 Quan Nguyen     2022-10-04  134  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  135  /* Handle SSIF message that will be sent to user */
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  136  static ssize_t ssif_bmc_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  137  {
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  138  	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  139  	struct ipmi_ssif_msg msg;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  140  	unsigned long flags;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  141  	ssize_t ret;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  142  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  143  	spin_lock_irqsave(&ssif_bmc->lock, flags);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  144  	while (!ssif_bmc->request_available) {
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  145  		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  146  		if (file->f_flags & O_NONBLOCK)
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  147  			return -EAGAIN;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  148  		ret = wait_event_interruptible(ssif_bmc->wait_queue,
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  149  					       ssif_bmc->request_available);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  150  		if (ret)
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  151  			return ret;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  152  		spin_lock_irqsave(&ssif_bmc->lock, flags);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  153  	}
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  154  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  155  	if (count < min_t(ssize_t,
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  156  			  sizeof_field(struct ipmi_ssif_msg, len) + ssif_bmc->request.len,
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  157  			  sizeof(struct ipmi_ssif_msg))) {
dd2bc5cc9e2555 Quan Nguyen     2022-10-04 @158  		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  159  		ret = -EINVAL;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  160  	} else {
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  161  		count = min_t(ssize_t,
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  162  			      sizeof_field(struct ipmi_ssif_msg, len) + ssif_bmc->request.len,
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  163  			      sizeof(struct ipmi_ssif_msg));
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  164  		memcpy(&msg, &ssif_bmc->request, count);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  165  		ssif_bmc->request_available = false;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  166  		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  167  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  168  		ret = copy_to_user(buf, &msg, count);
ea641be7a4faee Jian Zhang      2026-04-03  169  		if (ret > 0)
ea641be7a4faee Jian Zhang      2026-04-03  170  			ret = -EFAULT;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  171  	}
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  172  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  173  	return (ret < 0) ? ret : count;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  174  }
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  175  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  176  /* Handle SSIF message that is written by user */
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  177  static ssize_t ssif_bmc_write(struct file *file, const char __user *buf, size_t count,
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  178  			      loff_t *ppos)
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  179  {
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  180  	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  181  	struct ipmi_ssif_msg msg;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  182  	unsigned long flags;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  183  	ssize_t ret;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  184  
0627cef36145c9 Dan Carpenter   2024-06-14  185  	if (count < sizeof(msg.len) ||
0627cef36145c9 Dan Carpenter   2024-06-14  186  	    count > sizeof(struct ipmi_ssif_msg))
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  187  		return -EINVAL;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  188  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  189  	if (copy_from_user(&msg, buf, count))
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  190  		return -EFAULT;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  191  
0627cef36145c9 Dan Carpenter   2024-06-14  192  	if (!msg.len || msg.len > IPMI_SSIF_PAYLOAD_MAX ||
0627cef36145c9 Dan Carpenter   2024-06-14  193  	    count < sizeof_field(struct ipmi_ssif_msg, len) + msg.len)
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  194  		return -EINVAL;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  195  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  196  	spin_lock_irqsave(&ssif_bmc->lock, flags);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  197  	while (ssif_bmc->response_in_progress) {
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  198  		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  199  		if (file->f_flags & O_NONBLOCK)
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  200  			return -EAGAIN;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  201  		ret = wait_event_interruptible(ssif_bmc->wait_queue,
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  202  					       !ssif_bmc->response_in_progress);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  203  		if (ret)
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  204  			return ret;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  205  		spin_lock_irqsave(&ssif_bmc->lock, flags);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  206  	}
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  207  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  208  	/*
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  209  	 * The write must complete before the response timeout fired, otherwise
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  210  	 * the response is aborted and wait for next request
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  211  	 * Return -EINVAL if the response is aborted
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  212  	 */
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  213  	ret = (ssif_bmc->response_timer_inited) ? 0 : -EINVAL;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  214  	if (ret)
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  215  		goto exit;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  216  
8fa7292fee5c52 Thomas Gleixner 2025-04-05  217  	timer_delete(&ssif_bmc->response_timer);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  218  	ssif_bmc->response_timer_inited = false;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  219  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  220  	memcpy(&ssif_bmc->response, &msg, count);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  221  	ssif_bmc->is_singlepart_read = (msg.len <= MAX_PAYLOAD_PER_TRANSACTION);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  222  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  223  	ssif_bmc->response_in_progress = true;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  224  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  225  	/* ssif_bmc not busy */
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  226  	ssif_bmc->busy = false;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  227  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  228  	/* Clean old request buffer */
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  229  	memset(&ssif_bmc->request, 0, sizeof(struct ipmi_ssif_msg));
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  230  exit:
dd2bc5cc9e2555 Quan Nguyen     2022-10-04 @231  	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  232  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  233  	return (ret < 0) ? ret : count;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  234  }
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  235  

:::::: The code at line 158 was first introduced by commit
:::::: dd2bc5cc9e25554546f16661f8de1dcb8033dde0 ipmi: ssif_bmc: Add SSIF BMC driver

:::::: TO: Quan Nguyen <quan@os.amperecomputing.com>
:::::: CC: Corey Minyard <cminyard@mvista.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
