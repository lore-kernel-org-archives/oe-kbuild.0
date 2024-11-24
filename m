Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377AC1CF7A2
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Nov 2024 13:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732454364; cv=none; b=JXE1cKNqzdTtFV4zIRV/CTl3/RNyM8KC0qme6+DKMht4sS545ESpsl8S6R3tPFazMLS2cd/q7ax+URJlTEFR7Ek6coLaqHUS3Ab0RcPdgCw7CkUudnV4GTFNtu01+ghJaiCpTycRMCLax9TtaO+4jGdSWTu/aaFYFJk0l6qV2F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732454364; c=relaxed/simple;
	bh=hQlhOxqdJS1Yrtg3s2AfT6lrJcj7J9k9gtbOOmXwRb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fhc0lusl1JKBfo4osGpdTwZvLpGG48+njIIOw+9BvlVGumV58QDyVIsOsClIuDBRqB4sihB4YCpkzrMukArz1lxs7EXFPWzgqgaagwduR3GJEh9rwalcj0fXdd8MXK/xGbX/ROiv93/yHurcfHhteYi+aLYHTVhgJxbogmW2NrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5MYVEXp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5MYVEXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732454362; x=1763990362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hQlhOxqdJS1Yrtg3s2AfT6lrJcj7J9k9gtbOOmXwRb8=;
  b=m5MYVEXpbZjJ/1r6cANr39sQV6HCmSWHDJltIujBU53Z1pqS5eh9chTR
   9EJnrqD+th0Ti3QUUW1/5QiqEF6KaI2kGbCe+01NCvTjfBQRAuf14y8DP
   k9Y6aqhyTfPG+KJ+4G3mPH5Zbf6SrZObdjSvxl7UzDh1AlmE/RqCChmei
   XUakeUTHvPk/tpx1q51D6Y18ASGxr6mFVvB8G3JCUb6VhOfVM+7cEcwkU
   g1BPt+JHGp5g7BudqFxo8b6WJDXQGXbar5+8OJy+QpXUaWQ9KHvPyQKtB
   hfY8pXFRpQJ95d/i8Ys40DPH2Yz+eSlBA1FVAuLP3RZXsDe/Fe3Cky4vg
   A==;
X-CSE-ConnectionGUID: McFMyl9KQ5u4eYAcafMLJw==
X-CSE-MsgGUID: PmF91W7TQnaTHBChQV2pkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="43210736"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="43210736"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 05:19:22 -0800
X-CSE-ConnectionGUID: mHMb0/4wQ1+VLQSujEejfA==
X-CSE-MsgGUID: xylt5K4bQe6F6XT+qUEuPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="91205382"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Nov 2024 05:19:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFCWE-0004zZ-1m;
	Sun, 24 Nov 2024 13:19:18 +0000
Date: Sun, 24 Nov 2024 21:19:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tnguy-next-queue:dev-queue 16/69]
 drivers/net/ethernet/intel/ice/devlink/health.c:95
 ice_tx_hang_reporter_dump() warn: variable dereferenced before check 'event'
 (see line 93)
Message-ID: <202411242101.qlvmbfLB-lkp@intel.com>
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
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
TO: Przemek Kitszel <przemyslaw.kitszel@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Igor Bagnucki <igor.bagnucki@intel.com>
CC: Wojciech Drewek <wojciech.drewek@intel.com>
CC: Simon Horman <horms@kernel.org>
CC: Mateusz Polchlopek <mateusz.polchlopek@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   4b8b07968dc902d751d23a775c1a02220db267c9
commit: 9f889e8ffb48536622852fbe2501dc8b75887239 [16/69] ice: dump ethtool stats and skb by Tx hang devlink health reporter
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: microblaze-randconfig-r072-20241124 (https://download.01.org/0day-ci/archive/20241124/202411242101.qlvmbfLB-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411242101.qlvmbfLB-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/ice/devlink/health.c:95 ice_tx_hang_reporter_dump() warn: variable dereferenced before check 'event' (see line 93)

vim +/event +95 drivers/net/ethernet/intel/ice/devlink/health.c

f19878b2a2e6e4 Przemek Kitszel 2024-09-30   85  
f19878b2a2e6e4 Przemek Kitszel 2024-09-30   86  static int ice_tx_hang_reporter_dump(struct devlink_health_reporter *reporter,
f19878b2a2e6e4 Przemek Kitszel 2024-09-30   87  				     struct devlink_fmsg *fmsg, void *priv_ctx,
f19878b2a2e6e4 Przemek Kitszel 2024-09-30   88  				     struct netlink_ext_ack *extack)
f19878b2a2e6e4 Przemek Kitszel 2024-09-30   89  {
f19878b2a2e6e4 Przemek Kitszel 2024-09-30   90  	struct ice_tx_hang_event *event = priv_ctx;
9f889e8ffb4853 Przemek Kitszel 2024-09-30   91  	struct sk_buff *skb;
9f889e8ffb4853 Przemek Kitszel 2024-09-30   92  
9f889e8ffb4853 Przemek Kitszel 2024-09-30  @93  	skb = event->tx_ring->tx_buf->skb;
f19878b2a2e6e4 Przemek Kitszel 2024-09-30   94  
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  @95  	if (!event)
f19878b2a2e6e4 Przemek Kitszel 2024-09-30   96  		return 0;
f19878b2a2e6e4 Przemek Kitszel 2024-09-30   97  
f19878b2a2e6e4 Przemek Kitszel 2024-09-30   98  	devlink_fmsg_obj_nest_start(fmsg);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30   99  	ICE_DEVLINK_FMSG_PUT_FIELD(fmsg, event, head);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  100  	ICE_DEVLINK_FMSG_PUT_FIELD(fmsg, event, intr);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  101  	ICE_DEVLINK_FMSG_PUT_FIELD(fmsg, event, vsi_num);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  102  	ICE_DEVLINK_FMSG_PUT_FIELD(fmsg, event, queue);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  103  	ICE_DEVLINK_FMSG_PUT_FIELD(fmsg, event, next_to_clean);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  104  	ICE_DEVLINK_FMSG_PUT_FIELD(fmsg, event, next_to_use);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  105  	devlink_fmsg_put(fmsg, "irq-mapping", event->tx_ring->q_vector->name);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  106  	ice_fmsg_put_ptr(fmsg, "desc-ptr", event->tx_ring->desc);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  107  	ice_fmsg_put_ptr(fmsg, "dma-ptr", (void *)(long)event->tx_ring->dma);
9f889e8ffb4853 Przemek Kitszel 2024-09-30  108  	ice_fmsg_put_ptr(fmsg, "skb-ptr", skb);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  109  	devlink_fmsg_binary_pair_put(fmsg, "desc", event->tx_ring->desc,
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  110  				     event->tx_ring->count * sizeof(struct ice_tx_desc));
9f889e8ffb4853 Przemek Kitszel 2024-09-30  111  	devlink_fmsg_dump_skb(fmsg, skb);
9f889e8ffb4853 Przemek Kitszel 2024-09-30  112  	ice_dump_ethtool_stats_to_fmsg(fmsg, event->tx_ring->vsi->netdev);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  113  	devlink_fmsg_obj_nest_end(fmsg);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  114  
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  115  	return 0;
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  116  }
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  117  

:::::: The code at line 95 was first introduced by commit
:::::: f19878b2a2e6e402b0913afb2642dc05b1a9f5ba ice: add Tx hang devlink health reporter

:::::: TO: Przemek Kitszel <przemyslaw.kitszel@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
