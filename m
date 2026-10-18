Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D623C4446EB
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Oct 2026 07:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309973; cv=none; b=IigX3qpxY05ZRqq71ff9zTwIW8z5D4u88Cuo4viYIcB8UV/vQWhM0LDTIHPOvmWLE9OcbDGNitXQOWmZ0Ql1yEdawyB16IUnVo6K9JyUNkUUfbG5Xp0RAPOu48PVkZRPYuws7j22z/A6VHB4XPH59hmlPMyq/xtA7VNp6eYIVOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309973; c=relaxed/simple;
	bh=M/04VujwLZPY9niVb/Saoq0N1MFfbcIDIK+AAMLMdwI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W9qmxZilfUWT2tvi0cWCHdxqYVpYZa4sqTKIx4ddurYvHSziGEyjVchHHKcgA3VkVMiJU5egYG5s+YLdpF15ff6TsHT51IbM8Ob25zw5//vP7BTBrDDCPAXrhz0aUBqj03iiVed2RqCVwoVysbjbKvGxETe7O22iMziXvfxSW/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJ0WWgFw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJ0WWgFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309971; x=1823845971;
  h=date:from:to:cc:subject:message-id;
  bh=M/04VujwLZPY9niVb/Saoq0N1MFfbcIDIK+AAMLMdwI=;
  b=UJ0WWgFwGt80YxTuJR+cZFnfhJ9bAQV3T3xhh8a2r45W9+BDGlRjOA7S
   J3zMV72Kiwy2mblyU4+464ciFpl6VOs7sgO75fc9fVCZipTiA+L2+2dyF
   VOQlqkR/hKcVyXsSoGqYnecM+U9vEJjiKv47WAWBMeyjh0yhzjiUipm+b
   2v5G+mRorBfbEr+MnrqsVFgvcUv1uRXYiqo5CXCR2Z1OhsrUHyGZQUOCW
   j6C3p4sV5+dI/1qJXyP++tm6hLK2BM/qBQZ3aPRlJxwJFqD120Uiwhmcu
   h2cQhjz5NVNIJ8/JZbX4tmiMh4WDBturkJlMxvFaJOKVJlaGvuJF/glJV
   Q==;
X-CSE-ConnectionGUID: PII7zdiFQR69sENeQVCPvQ==
X-CSE-MsgGUID: gfJeo7WhSey1g8CELFVr3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916701"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916701"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:40 -0700
X-CSE-ConnectionGUID: Tw6W5RxySWusAqPk/Yx1ug==
X-CSE-MsgGUID: 4GE07QLdSOizklhwBBCvIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340819"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:36 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh3-000000004xu-2HLt;
	Sun, 18 Oct 2026 07:52:33 +0000
Date: Sun, 18 Oct 2026 09:46:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/airoha/airoha_eth.c:2139
 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than
 shift
Message-ID: <202610171148.IlMRAA3A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
commit: 7600fb3b41dd6ab65ed61169df1b6099044edf97 net: airoha: Rely __field_prep for non-constant masks
date:   8 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 8 months ago
config: alpha-randconfig-r2201-20261017 (https://download.01.org/0day-ci/archive/20261017/202610171148.IlMRAA3A-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7600fb3b41dd ("net: airoha: Rely __field_prep for non-constant masks")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610171148.IlMRAA3A-lkp@intel.com/

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

23020f04932701 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2024-07-12  2110  
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2111  static int airoha_qdma_set_chan_tx_sched(struct airoha_gdm_port *port,
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2112  					 int channel, enum tx_sched_mode mode,
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2113  					 const u16 *weights, u8 n_weights)
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2114  {
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2115  	int i;
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2116  
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2117  	for (i = 0; i < AIROHA_NUM_TX_RING; i++)
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2118  		airoha_qdma_clear(port->qdma, REG_QUEUE_CLOSE_CFG(channel),
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2119  				  TXQ_DISABLE_CHAN_QUEUE_MASK(channel, i));
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2120  
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2121  	for (i = 0; i < n_weights; i++) {
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2122  		u32 status;
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2123  		int err;
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2124  
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2125  		airoha_qdma_wr(port->qdma, REG_TXWRR_WEIGHT_CFG,
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2126  			       TWRR_RW_CMD_MASK |
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2127  			       FIELD_PREP(TWRR_CHAN_IDX_MASK, channel) |
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2128  			       FIELD_PREP(TWRR_QUEUE_IDX_MASK, i) |
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2129  			       FIELD_PREP(TWRR_VALUE_MASK, weights[i]));
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2130  		err = read_poll_timeout(airoha_qdma_rr, status,
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2131  					status & TWRR_RW_CMD_DONE,
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2132  					USEC_PER_MSEC, 10 * USEC_PER_MSEC,
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2133  					true, port->qdma,
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2134  					REG_TXWRR_WEIGHT_CFG);
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2135  		if (err)
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2136  			return err;
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2137  	}
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2138  
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03 @2139  	airoha_qdma_rmw(port->qdma, REG_CHAN_QOS_MODE(channel >> 3),
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2140  			CHAN_QOS_MODE_MASK(channel),
7600fb3b41dd6a drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-03-04  2141  			__field_prep(CHAN_QOS_MODE_MASK(channel), mode));
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2142  
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2143  	return 0;
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2144  }
20bf7d07c956e5 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2025-01-03  2145  

:::::: The code at line 2139 was first introduced by commit
:::::: 20bf7d07c956e5c7a22d3076c599cbb7a6054917 net: airoha: Add sched ETS offload support

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: Paolo Abeni <pabeni@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
