Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064023D300E
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Mar 2026 17:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773424335; cv=none; b=GOy+vzVWrECw8+TgZzdz8NmAS++2i/0oof2C4ZwKSiGFSKWdK1d4cE5Fe1WEZv9gLDHO+Bx/CCp7vAb+I1Uu/8bJrzhP0hDbYq9ble+e+z3DhAHRD2CyajbSN+sHhmKQHsRW3YELhBjrVbvkgdc+PQWvHZmk273YzdVyErTJwnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773424335; c=relaxed/simple;
	bh=Z+xQyeOJAVcTLlSWIeGwbMBw+3mRNLZPigczokyr3qk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gyblmA9v3fSh/wA4TaeKVkJwpZWOddyREM5VMtR56WGBmV8yfuV08GNdB1+G1foCGt97uLX1NWVq+gThxIsyTbtyZM6IC2P+88yXOF+omoxtPfFWm5PhbROrn6i8WIh82xrip3R8B67VsnSQLH4vYX51700BEvK+62MJiOSF2iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F15x8xnq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F15x8xnq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773424330; x=1804960330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z+xQyeOJAVcTLlSWIeGwbMBw+3mRNLZPigczokyr3qk=;
  b=F15x8xnq1XIBrXpxmx44Cip9mavK6azCYcTwfXJ6P6QiJoLZtmwMgDTT
   oPvFkaGMWrz8uQJVaaFm/hpjUoFGHGrX0VvCLGMyWr1pgDm5mnlVN9dyb
   HkT3XmzjNkCqeTgmaChsrBlNsXxQz/oreBBNqoxumRKXdn73AwNO2bHJd
   VFSivlgcrR9dDpRiaACKq2a5Ez79NIvUfAooJUDqByFxgeLcLWKHd9lrv
   cd0SP+3OYQViu5ad+29AxpsjVcq2nTb9rAgAwc8Njcfr9cmn1Ii6vc1i3
   4BC2WoSQfUDDa9WHucNNGHE63J6AhIvau/RSXsgaZvoyCga5L25xnwb7i
   Q==;
X-CSE-ConnectionGUID: 8EkYsL33RtaoIgSbykikLw==
X-CSE-MsgGUID: nymVPoGRRK+AbXhyqH+9Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74417043"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74417043"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 10:52:09 -0700
X-CSE-ConnectionGUID: r03K/ngPSRyY/ra2mCdl/A==
X-CSE-MsgGUID: U7K6OoHNQia4WAYAdpYFug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="226220839"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Mar 2026 10:52:08 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w16g9-0000000047j-0bc6;
	Fri, 13 Mar 2026 17:52:05 +0000
Date: Sat, 14 Mar 2026 01:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 24/26] PREEMPT_RT injection
Message-ID: <202603140159.q9J8zmoL-lkp@intel.com>
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
In-Reply-To: <20260310115709.2276203-25-dev@lankhorst.se>
References: <20260310115709.2276203-25-dev@lankhorst.se>
TO: Maarten Lankhorst <dev@lankhorst.se>
TO: intel-xe@lists.freedesktop.org
TO: intel-gfx@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org
CC: Maarten Lankhorst <dev@lankhorst.se>

Hi Maarten,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-i915/for-linux-next]
[also build test WARNING on next-20260311]
[cannot apply to drm-i915/for-linux-next-fixes drm-misc/drm-misc-next drm-xe/drm-xe-next linus/master v7.0-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-vblank_work-Add-methods-to-schedule-vblank_work-in-2-stages/20260310-205630
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260310115709.2276203-25-dev%40lankhorst.se
patch subject: [PATCH v7 24/26] PREEMPT_RT injection
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20260311 (https://download.01.org/0day-ci/archive/20260314/202603140159.q9J8zmoL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603140159.q9J8zmoL-lkp@intel.com/

New smatch warnings:
drivers/char/ipmi/ssif_bmc.c:155 ssif_bmc_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/ipmi/ssif_bmc.c:226 ssif_bmc_write() error: calling 'spin_unlock_irqrestore()' with bogus flags

Old smatch warnings:
drivers/char/ipmi/ssif_bmc.c:163 ssif_bmc_read() error: calling 'spin_unlock_irqrestore()' with bogus flags

vim +155 drivers/char/ipmi/ssif_bmc.c

dd2bc5cc9e2555 Quan Nguyen     2022-10-04  131  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  132  /* Handle SSIF message that will be sent to user */
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  133  static ssize_t ssif_bmc_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  134  {
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  135  	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  136  	struct ipmi_ssif_msg msg;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  137  	unsigned long flags;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  138  	ssize_t ret;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  139  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  140  	spin_lock_irqsave(&ssif_bmc->lock, flags);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  141  	while (!ssif_bmc->request_available) {
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  142  		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  143  		if (file->f_flags & O_NONBLOCK)
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  144  			return -EAGAIN;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  145  		ret = wait_event_interruptible(ssif_bmc->wait_queue,
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  146  					       ssif_bmc->request_available);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  147  		if (ret)
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  148  			return ret;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  149  		spin_lock_irqsave(&ssif_bmc->lock, flags);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  150  	}
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  151  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  152  	if (count < min_t(ssize_t,
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  153  			  sizeof_field(struct ipmi_ssif_msg, len) + ssif_bmc->request.len,
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  154  			  sizeof(struct ipmi_ssif_msg))) {
dd2bc5cc9e2555 Quan Nguyen     2022-10-04 @155  		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  156  		ret = -EINVAL;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  157  	} else {
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  158  		count = min_t(ssize_t,
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  159  			      sizeof_field(struct ipmi_ssif_msg, len) + ssif_bmc->request.len,
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  160  			      sizeof(struct ipmi_ssif_msg));
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  161  		memcpy(&msg, &ssif_bmc->request, count);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  162  		ssif_bmc->request_available = false;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  163  		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  164  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  165  		ret = copy_to_user(buf, &msg, count);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  166  	}
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  167  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  168  	return (ret < 0) ? ret : count;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  169  }
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  170  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  171  /* Handle SSIF message that is written by user */
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  172  static ssize_t ssif_bmc_write(struct file *file, const char __user *buf, size_t count,
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  173  			      loff_t *ppos)
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  174  {
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  175  	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  176  	struct ipmi_ssif_msg msg;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  177  	unsigned long flags;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  178  	ssize_t ret;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  179  
0627cef36145c9 Dan Carpenter   2024-06-14  180  	if (count < sizeof(msg.len) ||
0627cef36145c9 Dan Carpenter   2024-06-14  181  	    count > sizeof(struct ipmi_ssif_msg))
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  182  		return -EINVAL;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  183  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  184  	if (copy_from_user(&msg, buf, count))
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  185  		return -EFAULT;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  186  
0627cef36145c9 Dan Carpenter   2024-06-14  187  	if (!msg.len || msg.len > IPMI_SSIF_PAYLOAD_MAX ||
0627cef36145c9 Dan Carpenter   2024-06-14  188  	    count < sizeof_field(struct ipmi_ssif_msg, len) + msg.len)
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  189  		return -EINVAL;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  190  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  191  	spin_lock_irqsave(&ssif_bmc->lock, flags);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  192  	while (ssif_bmc->response_in_progress) {
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  193  		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  194  		if (file->f_flags & O_NONBLOCK)
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  195  			return -EAGAIN;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  196  		ret = wait_event_interruptible(ssif_bmc->wait_queue,
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  197  					       !ssif_bmc->response_in_progress);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  198  		if (ret)
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  199  			return ret;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  200  		spin_lock_irqsave(&ssif_bmc->lock, flags);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  201  	}
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  202  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  203  	/*
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  204  	 * The write must complete before the response timeout fired, otherwise
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  205  	 * the response is aborted and wait for next request
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  206  	 * Return -EINVAL if the response is aborted
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  207  	 */
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  208  	ret = (ssif_bmc->response_timer_inited) ? 0 : -EINVAL;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  209  	if (ret)
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  210  		goto exit;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  211  
8fa7292fee5c52 Thomas Gleixner 2025-04-05  212  	timer_delete(&ssif_bmc->response_timer);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  213  	ssif_bmc->response_timer_inited = false;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  214  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  215  	memcpy(&ssif_bmc->response, &msg, count);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  216  	ssif_bmc->is_singlepart_read = (msg.len <= MAX_PAYLOAD_PER_TRANSACTION);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  217  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  218  	ssif_bmc->response_in_progress = true;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  219  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  220  	/* ssif_bmc not busy */
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  221  	ssif_bmc->busy = false;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  222  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  223  	/* Clean old request buffer */
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  224  	memset(&ssif_bmc->request, 0, sizeof(struct ipmi_ssif_msg));
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  225  exit:
dd2bc5cc9e2555 Quan Nguyen     2022-10-04 @226  	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  227  
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  228  	return (ret < 0) ? ret : count;
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  229  }
dd2bc5cc9e2555 Quan Nguyen     2022-10-04  230  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
