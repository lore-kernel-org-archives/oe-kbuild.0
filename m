Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F0325333F
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Jul 2026 21:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782942970; cv=none; b=ajltFDddwaUfBL7fcGLfpciYp+0j2mgG0NgC/aXgzzNlgghewAETYWiPU0hyHzgpsoCu8NCugBZPI8JemugyL8tKsQ1vpNuOd8Q0ocsWq3XOodDDPjPHBsqdRciWanEeCchn0ewc1i2nTIMV9lFm9GL1tJwkBF/FryUbpHZOJ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782942970; c=relaxed/simple;
	bh=a3PhvwU7mF1dTAycJDw7aFH0iuVfiSodW2QPTYk4j0o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SG6wJ1bDsODW2iLQSqj28KRjW26Wr4Rn8756qzFY8jrlDqHZaxGRKifySObGkocXYXyd1MJv5tDMDBUpwV+NCupsh47x9nuNurI2/4saLyG9/AqlM9P9M5OqQjXnldGaBAUKbSXJ3MPPdd8PARbgVZNLXX7v+IMDk97dgBGe3wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=irmJAeKy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irmJAeKy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782942968; x=1814478968;
  h=date:from:to:cc:subject:message-id;
  bh=a3PhvwU7mF1dTAycJDw7aFH0iuVfiSodW2QPTYk4j0o=;
  b=irmJAeKyako9TeT3Ev2YkttCafdeme3AreN6y0hnXgUXdMlqwpihUsfv
   F7tuBe6IXRx3m5Yzjy0jClmXoqjbduvHLhY8pyMoR1KSKuAXXvn0b2uK5
   e986H2wImKtEw8m5gtBan8pfZ+Bw9sE7DCYr+2icqA1YlP/o7jI5MnK+h
   Zz+x5epMkwU4qGWXYyOV4fnI7Dc6CfRfY6ud0UZQwY7Fybx/iV4vDQmfe
   KNImHGwvdzwVfh5eyZKJESt2ykP1YL92y9VV1Xr8SQqIb8HJkwUtBVn9s
   AqSyzmL0Me+bnVmjSXgoTDN/JRmGd6JJeSudPnn2qPq9JEunI1axqEWbD
   w==;
X-CSE-ConnectionGUID: QYTAP5ozRieZerJtt2yjlA==
X-CSE-MsgGUID: ey0Gq90UR/GEvUmgmQsplg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82803581"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="82803581"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 14:56:07 -0700
X-CSE-ConnectionGUID: WhXaKVJdQ0+D7vfN6mcCxw==
X-CSE-MsgGUID: Uou+8dTbTBaqjjGurXTy3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="256599749"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Jul 2026 14:56:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf2uZ-000000009fH-1pbM;
	Wed, 01 Jul 2026 21:56:03 +0000
Date: Thu, 02 Jul 2026 05:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/airoha/airoha_eth.c:2139
 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than
 shift
Message-ID: <202607020543.QhFmLp46-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   665159e246749578d4e4bfe106ee3b74edcdab18
commit: 7600fb3b41dd6ab65ed61169df1b6099044edf97 net: airoha: Rely __field_prep for non-constant masks
date:   4 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 months ago
config: sh-randconfig-r072-20260702 (https://download.01.org/0day-ci/archive/20260702/202607020543.QhFmLp46-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7600fb3b41dd ("net: airoha: Rely __field_prep for non-constant masks")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607020543.QhFmLp46-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/airoha/airoha_eth.c:2139 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2139 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2139 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2139 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift

Old smatch warnings:
drivers/net/ethernet/airoha/airoha_eth.c:1727 airhoha_set_gdm2_loopback() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1727 airhoha_set_gdm2_loopback() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1727 airhoha_set_gdm2_loopback() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1727 airhoha_set_gdm2_loopback() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1782 airoha_dev_init() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1782 airoha_dev_init() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1782 airoha_dev_init() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1782 airoha_dev_init() warn: subtract is higher precedence than shift

vim +2139 drivers/net/ethernet/airoha/airoha_eth.c

23020f04932701d drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2024-07-12  2110  
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2111  static int airoha_qdma_set_chan_tx_sched(struct airoha_gdm_port *port,
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2112  					 int channel, enum tx_sched_mode mode,
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2113  					 const u16 *weights, u8 n_weights)
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2114  {
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2115  	int i;
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2116  
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2117  	for (i = 0; i < AIROHA_NUM_TX_RING; i++)
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2118  		airoha_qdma_clear(port->qdma, REG_QUEUE_CLOSE_CFG(channel),
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2119  				  TXQ_DISABLE_CHAN_QUEUE_MASK(channel, i));
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2120  
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2121  	for (i = 0; i < n_weights; i++) {
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2122  		u32 status;
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2123  		int err;
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2124  
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2125  		airoha_qdma_wr(port->qdma, REG_TXWRR_WEIGHT_CFG,
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2126  			       TWRR_RW_CMD_MASK |
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2127  			       FIELD_PREP(TWRR_CHAN_IDX_MASK, channel) |
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2128  			       FIELD_PREP(TWRR_QUEUE_IDX_MASK, i) |
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2129  			       FIELD_PREP(TWRR_VALUE_MASK, weights[i]));
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2130  		err = read_poll_timeout(airoha_qdma_rr, status,
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2131  					status & TWRR_RW_CMD_DONE,
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2132  					USEC_PER_MSEC, 10 * USEC_PER_MSEC,
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2133  					true, port->qdma,
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2134  					REG_TXWRR_WEIGHT_CFG);
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2135  		if (err)
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2136  			return err;
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2137  	}
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2138  
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03 @2139  	airoha_qdma_rmw(port->qdma, REG_CHAN_QOS_MODE(channel >> 3),
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2140  			CHAN_QOS_MODE_MASK(channel),
7600fb3b41dd6ab drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-03-04  2141  			__field_prep(CHAN_QOS_MODE_MASK(channel), mode));
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2142  
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2143  	return 0;
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2144  }
20bf7d07c956e5c drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2145  

:::::: The code at line 2139 was first introduced by commit
:::::: 20bf7d07c956e5c7a22d3076c599cbb7a6054917 net: airoha: Add sched ETS offload support

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: Paolo Abeni <pabeni@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
