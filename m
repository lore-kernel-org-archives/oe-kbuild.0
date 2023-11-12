Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908031A289
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Nov 2023 20:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ci5Xc6xy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699822572; x=1731358572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8BqWZYYxbYdiU0BXFPxPi6E/kfe/SK14GAFS3EMA3/A=;
  b=ci5Xc6xyOaSR2jN0cx2g2JStZSPswmDE3vdgqzRMvp1V81qzzEH9EXPR
   wsZKiYccOCU9KtYGrujuDa57pSobw7fPHJ2NcWEtgeJwNcs7knpXFKuIh
   dwUQKnxR7lv74lwlEOnR217kgb1TgKs8taoK4XmFHDKmlEXqVl5lO8/hZ
   P8L0fWfWS3kJ4hqih+kRds/E0myeABegfkXXbgtQWblAmXqdeJybxGDkK
   6FnMHaY9THowDhr6E3gWF5ZOT1B6uT3194JkKspy1Ue5CwrvKwkSXrNdV
   uCJHJ3lT7OTXtld4RAJQ7euW+SkiJB/DO00ulXZMpLbtR1DeH6i0pJ6y6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="390158615"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="390158615"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 12:56:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="881483287"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="881483287"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Nov 2023 12:56:10 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2HV2-000BW4-1l;
	Sun, 12 Nov 2023 20:56:08 +0000
Date: Mon, 13 Nov 2023 04:54:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/broadcom/bnxt/bnxt.c:7654
 bnxt_accumulate_all_stats() error: potentially dereferencing uninitialized
 'ring0_stats'.
Message-ID: <202311130439.ZGMx2oxn-lkp@intel.com>
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
TO: Michael Chan <michael.chan@broadcom.com>
CC: Vasundhara Volam <vasundhara-v.volam@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e257da5715365b853439243f89cf5d8a9d382355
commit: fea6b3335527f41bc729466fb2a95e48a98827ac bnxt_en: Accumulate all counters.
date:   3 years, 4 months ago
:::::: branch date: 67 minutes ago
:::::: commit date: 3 years, 4 months ago
config: i386-randconfig-141-20230912 (https://download.01.org/0day-ci/archive/20231113/202311130439.ZGMx2oxn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231113/202311130439.ZGMx2oxn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311130439.ZGMx2oxn-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/broadcom/bnxt/bnxt.c:7654 bnxt_accumulate_all_stats() error: potentially dereferencing uninitialized 'ring0_stats'.

Old smatch warnings:
drivers/net/ethernet/broadcom/bnxt/bnxt.c:8600 bnxt_request_irq() warn: 'irq->vector' from request_irq() not released on lines: 8600.
drivers/net/ethernet/broadcom/bnxt/bnxt.c:11208 bnxt_init_board() warn: missing error code 'rc'
drivers/net/ethernet/broadcom/bnxt/bnxt.c:12283 bnxt_init_one() warn: missing error code 'rc'

vim +/ring0_stats +7654 drivers/net/ethernet/broadcom/bnxt/bnxt.c

fea6b3335527f41b Michael Chan 2020-07-27  7633  
fea6b3335527f41b Michael Chan 2020-07-27  7634  static void bnxt_accumulate_all_stats(struct bnxt *bp)
fea6b3335527f41b Michael Chan 2020-07-27  7635  {
fea6b3335527f41b Michael Chan 2020-07-27  7636  	struct bnxt_stats_mem *ring0_stats;
fea6b3335527f41b Michael Chan 2020-07-27  7637  	bool ignore_zero = false;
fea6b3335527f41b Michael Chan 2020-07-27  7638  	int i;
fea6b3335527f41b Michael Chan 2020-07-27  7639  
fea6b3335527f41b Michael Chan 2020-07-27  7640  	/* Chip bug.  Counter intermittently becomes 0. */
fea6b3335527f41b Michael Chan 2020-07-27  7641  	if (bp->flags & BNXT_FLAG_CHIP_P5)
fea6b3335527f41b Michael Chan 2020-07-27  7642  		ignore_zero = true;
fea6b3335527f41b Michael Chan 2020-07-27  7643  
fea6b3335527f41b Michael Chan 2020-07-27  7644  	for (i = 0; i < bp->cp_nr_rings; i++) {
fea6b3335527f41b Michael Chan 2020-07-27  7645  		struct bnxt_napi *bnapi = bp->bnapi[i];
fea6b3335527f41b Michael Chan 2020-07-27  7646  		struct bnxt_cp_ring_info *cpr;
fea6b3335527f41b Michael Chan 2020-07-27  7647  		struct bnxt_stats_mem *stats;
fea6b3335527f41b Michael Chan 2020-07-27  7648  
fea6b3335527f41b Michael Chan 2020-07-27  7649  		cpr = &bnapi->cp_ring;
fea6b3335527f41b Michael Chan 2020-07-27  7650  		stats = &cpr->stats;
fea6b3335527f41b Michael Chan 2020-07-27  7651  		if (!i)
fea6b3335527f41b Michael Chan 2020-07-27  7652  			ring0_stats = stats;
fea6b3335527f41b Michael Chan 2020-07-27  7653  		__bnxt_accumulate_stats(stats->hw_stats, stats->sw_stats,
fea6b3335527f41b Michael Chan 2020-07-27 @7654  					ring0_stats->hw_masks,
fea6b3335527f41b Michael Chan 2020-07-27  7655  					ring0_stats->len / 8, ignore_zero);
fea6b3335527f41b Michael Chan 2020-07-27  7656  	}
fea6b3335527f41b Michael Chan 2020-07-27  7657  	if (bp->flags & BNXT_FLAG_PORT_STATS) {
fea6b3335527f41b Michael Chan 2020-07-27  7658  		struct bnxt_stats_mem *stats = &bp->port_stats;
fea6b3335527f41b Michael Chan 2020-07-27  7659  		__le64 *hw_stats = stats->hw_stats;
fea6b3335527f41b Michael Chan 2020-07-27  7660  		u64 *sw_stats = stats->sw_stats;
fea6b3335527f41b Michael Chan 2020-07-27  7661  		u64 *masks = stats->hw_masks;
fea6b3335527f41b Michael Chan 2020-07-27  7662  		int cnt;
fea6b3335527f41b Michael Chan 2020-07-27  7663  
fea6b3335527f41b Michael Chan 2020-07-27  7664  		cnt = sizeof(struct rx_port_stats) / 8;
fea6b3335527f41b Michael Chan 2020-07-27  7665  		__bnxt_accumulate_stats(hw_stats, sw_stats, masks, cnt, false);
fea6b3335527f41b Michael Chan 2020-07-27  7666  
fea6b3335527f41b Michael Chan 2020-07-27  7667  		hw_stats += BNXT_TX_PORT_STATS_BYTE_OFFSET / 8;
fea6b3335527f41b Michael Chan 2020-07-27  7668  		sw_stats += BNXT_TX_PORT_STATS_BYTE_OFFSET / 8;
fea6b3335527f41b Michael Chan 2020-07-27  7669  		masks += BNXT_TX_PORT_STATS_BYTE_OFFSET / 8;
fea6b3335527f41b Michael Chan 2020-07-27  7670  		cnt = sizeof(struct tx_port_stats) / 8;
fea6b3335527f41b Michael Chan 2020-07-27  7671  		__bnxt_accumulate_stats(hw_stats, sw_stats, masks, cnt, false);
fea6b3335527f41b Michael Chan 2020-07-27  7672  	}
fea6b3335527f41b Michael Chan 2020-07-27  7673  	if (bp->flags & BNXT_FLAG_PORT_STATS_EXT) {
fea6b3335527f41b Michael Chan 2020-07-27  7674  		bnxt_accumulate_stats(&bp->rx_port_stats_ext);
fea6b3335527f41b Michael Chan 2020-07-27  7675  		bnxt_accumulate_stats(&bp->tx_port_stats_ext);
fea6b3335527f41b Michael Chan 2020-07-27  7676  	}
fea6b3335527f41b Michael Chan 2020-07-27  7677  }
fea6b3335527f41b Michael Chan 2020-07-27  7678  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
