Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A53395AE4
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jul 2026 09:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331934; cv=none; b=pyTTU6CirHdb73cGSyCFjIdFPeEj1RNkBiiQYyzRBNhZrXgavenl4fZ4BXu7Rg00jne/VuahxOIXk0gF4Ydvnaz6k9t26Zi2f/nQ/HBCqWggjtje1FNiK6kCJeoTDklUuIEFTejAo9FNWnMXfyLw5eoj9HIYyw+iZX//qee6cBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331934; c=relaxed/simple;
	bh=RKQma/AggrChvciFo2gXNLdBMHwNBC3jWlrmTcpu9OM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X0ytGCrzjxTzqt6Kw0Y3/18IydR1TUnbhKoKZb1hjda7TmjFTmbrpM9s8A+50hDmHD7JkQwYB1OCr4DYGM9pZ0vg+oZRN1owIkvbHKjflc1fT0Gn4fgULZnm014PBzNYN2Ny5oSy8s+OATu9NicvE20V5wlzi7s4Kg4wSc4c1n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/xVHF7O; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/xVHF7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783331929; x=1814867929;
  h=date:from:to:cc:subject:message-id;
  bh=RKQma/AggrChvciFo2gXNLdBMHwNBC3jWlrmTcpu9OM=;
  b=R/xVHF7Ofzf383T3TpoqTYw9sOWJ7/ZefDtnI2mYi3Ktu2iymjjw3QpM
   JA9vy0Ouu7CVwojz9HFf+sjL/BBXb8vWKiwSNmhggg6F6qExVKuhqF04v
   al+YjALbRTmwu56Qo5Zm5/26lwo6CtXG2XRyIW+SL+B+NY57WHue07uqL
   iXKG52BYKPIVUSyRVsbDLQmOhdfUjEXVTE7EMgIgaaAS4svx/ZANgLzep
   KmTOGQ99g+O0AA/7pGgKpNVbH8ooRtEeVvNzT8boXjsPL3O5gczXG+9H1
   lDh4YHs6zCJy7kDM3/c5OhDdFGsDrokupWajiL8MH65WJVxIIJsAZvaWb
   Q==;
X-CSE-ConnectionGUID: NjMrE1NWTkOdDoMIgEtW8g==
X-CSE-MsgGUID: 35lJwn91RNuvHlXmVIAxLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="94565766"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="94565766"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 02:58:47 -0700
X-CSE-ConnectionGUID: KqbCdumnQleSmx/y0jmKdA==
X-CSE-MsgGUID: HE9zi+ZsTsiVxKjnkX+7Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="251929995"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 06 Jul 2026 02:58:47 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgg67-00000000EGB-4BZW;
	Mon, 06 Jul 2026 09:58:44 +0000
Date: Mon, 06 Jul 2026 17:58:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ERROR: modpost: __ex_table+0x1860 references non-executable
 section '.alternative'
Message-ID: <202607061739.uHOS6OcV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Daniel Wagner <wagi@kernel.org>
CC: Jens Axboe <axboe@kernel.dk>
CC: Christoph Hellwig <hch@lst.de>
CC: Hannes Reinecke <hare@suse.de>
CC: Ming Lei <ming.lei@redhat.com>
CC: Chaitanya Kulkarni <kch@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cdeaa50eae8dad34885515f62559ee83e7e8dda
commit: 3f27c1de5df265f9d8edf0cc5d75dc92e328484a blk-mq: add number of queue calc helper
date:   1 year ago
:::::: branch date: 9 hours ago
:::::: commit date: 1 year ago
config: riscv-randconfig-002-20260706 (https://download.01.org/0day-ci/archive/20260706/202607061739.uHOS6OcV-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061739.uHOS6OcV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3f27c1de5df2 ("blk-mq: add number of queue calc helper")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607061739.uHOS6OcV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x114 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x118 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x128 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x134 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x138 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x148 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x154 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x158 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x168 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x174 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x178 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x188 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x194 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x198 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x1a8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x1b4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x1b8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x1c8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x1d4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x1d8 (section: .data) -> .Lpcrel_hi88 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x1e8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x1f4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x1f8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x214 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: failover_lock+0x218 (section: .data) -> .Lpcrel_hi88 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ipv6_route_table_template+0x24 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: udplitev6_prot+0x0 (section: .data) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpc_sysfs_rpc_clnt_groups+0x0 (section: .data) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rxrpc_conn_idle_client_fast_expiry+0xa0 (section: .data) -> sun50i_h6_r_pinctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rxrpc_closed_conn_expiry+0x4 (section: .data) -> sun50i_h6_r_pinctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rxrpc_closed_conn_expiry+0x14 (section: .data) -> sun50i_h6_r_pinctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rxrpc_closed_conn_expiry+0x24 (section: .data) -> sun50i_h6_r_pinctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rxrpc_closed_conn_expiry+0x34 (section: .data) -> sun50i_h6_r_pinctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rxrpc_closed_conn_expiry+0x44 (section: .data) -> sun50i_h6_r_pinctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rxrpc_closed_conn_expiry+0x54 (section: .data) -> sun50i_h6_r_pinctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rxrpc_closed_conn_expiry+0x64 (section: .data) -> sun50i_h6_r_pinctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rxrpc_closed_conn_expiry+0x74 (section: .data) -> sun50i_h6_r_pinctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x9c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0xa8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0xac (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0xc8 (section: .data) -> clk_mt2701_eth_drv_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x13c (section: .data) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x14c (section: .data) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x168 (section: .data) -> clk_mt2701_eth_drv_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x188 (section: .data) -> clk_mt2701_eth_drv_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x1a8 (section: .data) -> clk_mt2701_eth_drv_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x1c8 (section: .data) -> clk_mt2701_eth_drv_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x1e8 (section: .data) -> clk_mt2701_eth_drv_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x208 (section: .data) -> clk_mt2701_eth_drv_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x228 (section: .data) -> clk_mt2701_eth_drv_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x248 (section: .data) -> clk_mt2701_eth_drv_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x268 (section: .data) -> clk_mt2701_eth_drv_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x288 (section: .data) -> clk_mt2701_eth_drv_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x2c8 (section: .data) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x308 (section: .data) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x328 (section: .data) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x3a8 (section: .data) -> clk_mt2701_eth_drv_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x3e8 (section: .data) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x408 (section: .data) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x40c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x41c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x428 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x42c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x448 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x44c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x4ac (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x508 (section: .data) -> clk_mt2701_eth_drv_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x528 (section: .data) -> clk_mt2701_eth_drv_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x5e8 (section: .data) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x14b8 (section: .data) -> clk_mt8173_pericfg_drv_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rate_ctrl_mutex+0x1598 (section: .data) -> clk_mt8173_pericfg_drv_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_pairwise_rekey._rs+0x1c (section: .data) -> clk_mt8173_pericfg_drv_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mfp_test_cases+0x0 (section: .data) -> clkout_top_p4210 (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0x3c (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0x48 (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0x4c (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0x5c (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0x68 (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0x6c (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0x7c (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0x88 (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0x8c (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0x9c (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0xa8 (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0xac (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0xbc (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0xc8 (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0xcc (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0xdc (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0xe8 (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0xec (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0xfc (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0x108 (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0x10c (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0x11c (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0x128 (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_update_nametbl._rs.9+0x12c (section: .data) -> sc9860_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: netlbl_unlhsh_netdev_notifier+0x0 (section: .data) -> sa11x0_dma_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: handshake_api_test_cases+0xa8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1860 (section: __ex_table) -> .L0  (section: .alternative)
>> ERROR: modpost: __ex_table+0x1860 references non-executable section '.alternative'
WARNING: modpost: vmlinux: section mismatch in reference: 0x186c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x186c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1870 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1870 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1878 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1878 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x187c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x187c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1890 (section: __ex_table) -> .L.str.12 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x1890 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18cc (section: __ex_table) -> __initcall__kmod_blacklist__232_359_blacklist_init6 (section: .initcall6.init)
ERROR: modpost: __ex_table+0x18cc references non-executable section '.initcall6.init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18d0 (section: __ex_table) -> blacklist_keyring (section: .bss)
ERROR: modpost: __ex_table+0x18d0 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18d8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18dc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18e4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18e8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18f0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18f4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18fc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1900 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1900 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1908 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1908 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x190c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x190c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1914 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1914 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1918 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1918 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1920 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1920 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1924 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1924 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x192c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x192c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1930 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1930 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1938 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1938 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x193c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x193c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1944 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1944 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1948 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1948 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1950 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1950 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1954 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1954 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x195c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x195c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1960 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1960 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1968 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1968 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x196c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x196c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1974 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1974 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1978 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1978 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1980 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1980 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1984 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1984 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x198c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x198c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1990 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1990 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1998 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1998 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x199c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x199c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19a4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19a8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19bc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19cc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19d4 references non-executable section '.debug_str'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
