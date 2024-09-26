Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C324D8C8
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Sep 2024 15:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727364924; cv=none; b=bC91MasZe2LJ56JEiwVmPRmARZYazemEqzUQv4o3qeVPG4SWR9hR/4ExMXMxAtwD+zm01g1A6cPRvpGoj/ExLJ62OT2EvPrxmiOm0OZAPUxkjiFmWz8jtrctkMUZlTXz2Me1iX6Pn77CQluTUeDb9QyHQ1Iz+EWf7QycUGN8QR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727364924; c=relaxed/simple;
	bh=Mfr68UR8J+FXxk+xDs608b4lhbOwefNGQD0Y4TQBWIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ks02GCKOzYo9ODNPUxX0EgDkjUo5l5J56vaQukq2zkHxqayulCu/YiwQudvtVgz6qS2PV810afVQzsSy8OmF8oMx5G9y7RVHut4yPlCx6TqdN1zFQ1E1eKhYUrhRncsdMXRt19RaKxDHDNo2MJ24pWTOTj/KxykTvrJL6unxdHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3jFqpmd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3jFqpmd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727364922; x=1758900922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mfr68UR8J+FXxk+xDs608b4lhbOwefNGQD0Y4TQBWIw=;
  b=c3jFqpmdTrtV1WTk7uauYGd6NOFlyBB2yzSRlKXB9uxYJa+7a6+mP6js
   D6FJn4zGlnrJy7lTkSZyRoGFkibfQ69TvDyS04APmswuG5U9qthl6itvI
   9g6RyAVdXr6dc23R+sksFeAQpgWdeFFUW1qZTfbq8JwjAODQS2Fr17VM0
   ALpyYIUTDPsWOs7U9aQW/T+vv42dQPz4ff/nFj0/DxSxnr4kF1jwUF2QN
   jDDY26re1IMXUvCUqeRnZ5OMpEUlLB2ChkayPpas7jZgLkAeBhmmhKfO4
   p0IpCD5kKbZpx0LLbvM9rVJTzfsdxXJSaqMVbG9LiNZxZQPVnxvZrI4J8
   g==;
X-CSE-ConnectionGUID: ldXz7H9zSJWfj2Dw81voCw==
X-CSE-MsgGUID: nAY4oquOSrOSfHynhSP1Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26610140"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="26610140"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 08:35:21 -0700
X-CSE-ConnectionGUID: r3CETWFOT+S2TfF8/jfuTQ==
X-CSE-MsgGUID: Cj6bvPjQSkGQrpGppgr6PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="72284608"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Sep 2024 08:35:21 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stqWU-000Krv-1V;
	Thu, 26 Sep 2024 15:35:18 +0000
Date: Thu, 26 Sep 2024 23:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-4.19.y-cip-rt 160/30000] kernel/sched/swork.c:110:
 warning: Function parameter or member 'sev' not described in 'swork_queue'
Message-ID: <202409262318.QYVJHW2d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "cip tree"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt
head:   f0b0dc3daffc9639872f52dc74ce62bd887d3088
commit: 3283bcfcd3ee79fba657e1d228b923ec23f66b76 [160/30000] work-simple: Simple work queue implemenation
:::::: branch date: 2 days ago
:::::: commit date: 6 years ago
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240926/202409262318.QYVJHW2d-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409262318.QYVJHW2d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409262318.QYVJHW2d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/swork.c:110: warning: Function parameter or member 'sev' not described in 'swork_queue'


vim +110 kernel/sched/swork.c

3283bcfcd3ee79 Daniel Wagner 2014-07-11  101  
3283bcfcd3ee79 Daniel Wagner 2014-07-11  102  /**
3283bcfcd3ee79 Daniel Wagner 2014-07-11  103   * swork_queue - queue swork
3283bcfcd3ee79 Daniel Wagner 2014-07-11  104   *
3283bcfcd3ee79 Daniel Wagner 2014-07-11  105   * Returns %false if @work was already on a queue, %true otherwise.
3283bcfcd3ee79 Daniel Wagner 2014-07-11  106   *
3283bcfcd3ee79 Daniel Wagner 2014-07-11  107   * The work is queued and processed on a random CPU
3283bcfcd3ee79 Daniel Wagner 2014-07-11  108   */
3283bcfcd3ee79 Daniel Wagner 2014-07-11  109  bool swork_queue(struct swork_event *sev)
3283bcfcd3ee79 Daniel Wagner 2014-07-11 @110  {
3283bcfcd3ee79 Daniel Wagner 2014-07-11  111  	unsigned long flags;
3283bcfcd3ee79 Daniel Wagner 2014-07-11  112  
3283bcfcd3ee79 Daniel Wagner 2014-07-11  113  	if (test_and_set_bit(SWORK_EVENT_PENDING, &sev->flags))
3283bcfcd3ee79 Daniel Wagner 2014-07-11  114  		return false;
3283bcfcd3ee79 Daniel Wagner 2014-07-11  115  
3283bcfcd3ee79 Daniel Wagner 2014-07-11  116  	raw_spin_lock_irqsave(&glob_worker->lock, flags);
3283bcfcd3ee79 Daniel Wagner 2014-07-11  117  	list_add_tail(&sev->item, &glob_worker->events);
3283bcfcd3ee79 Daniel Wagner 2014-07-11  118  	raw_spin_unlock_irqrestore(&glob_worker->lock, flags);
3283bcfcd3ee79 Daniel Wagner 2014-07-11  119  
3283bcfcd3ee79 Daniel Wagner 2014-07-11  120  	swake_up_one(&glob_worker->wq);
3283bcfcd3ee79 Daniel Wagner 2014-07-11  121  	return true;
3283bcfcd3ee79 Daniel Wagner 2014-07-11  122  }
3283bcfcd3ee79 Daniel Wagner 2014-07-11  123  EXPORT_SYMBOL_GPL(swork_queue);
3283bcfcd3ee79 Daniel Wagner 2014-07-11  124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
