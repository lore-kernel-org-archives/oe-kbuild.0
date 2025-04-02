Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ABD231C9C
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Apr 2025 10:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743590074; cv=none; b=JLHcrEXXZBG5jz2xV89GfqKk1U7tDzHwp24Miwo21azYBKBj7y90cjp98wzqtSGmYm+Jo95teXcjOSoFKFWTQ/7KSnfsdH1bQxQj6B6nmrB0We+4sHXxOwQ/ZsE+XSK1xPdwk6urlIPdI3W04OloQ/p1dGPo3DPAwCny9P9pyso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743590074; c=relaxed/simple;
	bh=c+lxDUrHeKDm52vGjNsquXm6SxISgJdN6Q9a/uZiNnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=urtSn7vwgyH8rKOw1QE/ucz399leOZz4idbwozXt4W7ub/F53G4NCjfmW7+sxrWbgom3n8kX4xeDZ4jf/64XS8VxFqFvxhe8hkwbVPSTE3qHmEKO/26VQj52vhHznQiqyeJbsqR0+5MhZLhKzgi3hs+aPBUIaq23l1cy7LZcM+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O2B3Prb7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O2B3Prb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743590073; x=1775126073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c+lxDUrHeKDm52vGjNsquXm6SxISgJdN6Q9a/uZiNnQ=;
  b=O2B3Prb7uUZpTYxAqN7j6bCLB/vb+bNBsTzrcdfHddngxy9fEcmThS4c
   TnVdZwUJ3uTUDRbI+nys4x45n/Jx0G3vHE9ssbNqOR4Nz/FfGcpJ197/L
   hsUFu+gTjIj9NMhca2Jtv6RFDlL6Q/mxA/c34GjUlB2/zZUL6cprO4wmh
   XtzNW5PgzzSA/bQv+TbpFWl+fx7E/H48Ov54qeJCszQl1IMJMBeVh5igF
   Ur6wDR4dPBRTQQZjMsqs2p2gPLokqHCo5wfuq73tV/P1c4Ti1m2ximUXt
   GQf4OXkR86Ly9oDNQtrEg+3DoVahilsZXbmFnAj/waXs8+rjb0vngeTvq
   g==;
X-CSE-ConnectionGUID: JF4evfkdSwiaIvH+Jbmexg==
X-CSE-MsgGUID: 6+CY6FeTRnCV++SASu6VaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44094127"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; 
   d="scan'208";a="44094127"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 03:34:32 -0700
X-CSE-ConnectionGUID: /83In/CoSAywOA65G/SpOw==
X-CSE-MsgGUID: hgLuzZRJSYOUmvJ5iy3RZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; 
   d="scan'208";a="126638005"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 02 Apr 2025 03:34:31 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzvQS-000AdA-22;
	Wed, 02 Apr 2025 10:34:28 +0000
Date: Wed, 2 Apr 2025 18:34:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1672
 _dpu_encoder_trigger_start() warn: variable dereferenced before check 'phys'
 (see line 1670)
Message-ID: <202504021825.IW2340OS-lkp@intel.com>
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
TO: Jessica Zhang <quic_jesszhan@quicinc.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
commit: 8144d17a81d9ea742be5a02da62f5a7b2a8f95c1 drm/msm/dpu: Skip trigger flush and start for CWB
date:   4 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-r073-20250402 (https://download.01.org/0day-ci/archive/20250402/202504021825.IW2340OS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504021825.IW2340OS-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1672 _dpu_encoder_trigger_start() warn: variable dereferenced before check 'phys' (see line 1670)
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1814 _dpu_encoder_kickoff_phys() error: we previously assumed 'dpu_enc->cur_master' could be null (see line 1807)

vim +/phys +1672 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1663  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1664  /**
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1665   * _dpu_encoder_trigger_start - trigger start for a physical encoder
cca5ff947c7c6e Lee Jones         2020-11-23  1666   * @phys: Pointer to physical encoder structure
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1667   */
58fba464eaeff6 Sean Paul         2018-09-20  1668  static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1669  {
8144d17a81d9ea Jessica Zhang     2025-02-14 @1670  	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
8144d17a81d9ea Jessica Zhang     2025-02-14  1671  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27 @1672  	if (!phys) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1673  		DPU_ERROR("invalid argument(s)\n");
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1674  		return;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1675  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1676  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1677  	if (!phys->hw_pp) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1678  		DPU_ERROR("invalid pingpong hw\n");
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1679  		return;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1680  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1681  
8144d17a81d9ea Jessica Zhang     2025-02-14  1682  	if (phys->parent->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
8144d17a81d9ea Jessica Zhang     2025-02-14  1683  	    dpu_enc->cwb_mask) {
8144d17a81d9ea Jessica Zhang     2025-02-14  1684  		DPU_DEBUG("encoder %d CWB enabled, skipping\n", DRMID(phys->parent));
8144d17a81d9ea Jessica Zhang     2025-02-14  1685  		return;
8144d17a81d9ea Jessica Zhang     2025-02-14  1686  	}
8144d17a81d9ea Jessica Zhang     2025-02-14  1687  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1688  	if (phys->ops.trigger_start && phys->enable_state != DPU_ENC_DISABLED)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1689  		phys->ops.trigger_start(phys);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1690  }
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1691  
86313a9cd15233 Dmitry Baryshkov  2024-11-02  1692  /**
86313a9cd15233 Dmitry Baryshkov  2024-11-02  1693   * dpu_encoder_helper_trigger_start - control start helper function
86313a9cd15233 Dmitry Baryshkov  2024-11-02  1694   *	This helper function may be optionally specified by physical
86313a9cd15233 Dmitry Baryshkov  2024-11-02  1695   *	encoders if they require ctl_start triggering.
86313a9cd15233 Dmitry Baryshkov  2024-11-02  1696   * @phys_enc: Pointer to physical encoder structure
86313a9cd15233 Dmitry Baryshkov  2024-11-02  1697   */
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1698  void dpu_encoder_helper_trigger_start(struct dpu_encoder_phys *phys_enc)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1699  {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1700  	struct dpu_hw_ctl *ctl;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1701  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1702  	ctl = phys_enc->hw_ctl;
99beed68c3c72e Drew Davenport    2019-12-06  1703  	if (ctl->ops.trigger_start) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1704  		ctl->ops.trigger_start(ctl);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1705  		trace_dpu_enc_trigger_start(DRMID(phys_enc->parent), ctl->idx);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1706  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1707  }
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1708  
fba33cae6aa3ea Jordan Crouse     2018-07-26  1709  static int dpu_encoder_helper_wait_event_timeout(
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1710  		int32_t drm_id,
5a9d50150c2cd2 Dmitry Baryshkov  2023-08-02  1711  		unsigned int irq_idx,
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1712  		struct dpu_encoder_wait_info *info)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1713  {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1714  	int rc = 0;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1715  	s64 expected_time = ktime_to_ms(ktime_get()) + info->timeout_ms;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1716  	s64 jiffies = msecs_to_jiffies(info->timeout_ms);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1717  	s64 time;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1718  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1719  	do {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1720  		rc = wait_event_timeout(*(info->wq),
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1721  				atomic_read(info->atomic_cnt) == 0, jiffies);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1722  		time = ktime_to_ms(ktime_get());
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1723  
6be6ece92050fe Dmitry Baryshkov  2023-08-02  1724  		trace_dpu_enc_wait_event_timeout(drm_id,
6be6ece92050fe Dmitry Baryshkov  2023-08-02  1725  						 DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx),
6be6ece92050fe Dmitry Baryshkov  2023-08-02  1726  						 rc, time,
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1727  						 expected_time,
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1728  						 atomic_read(info->atomic_cnt));
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1729  	/* If we timed out, counter is valid and time is less, wait again */
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1730  	} while (atomic_read(info->atomic_cnt) && (rc == 0) &&
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1731  			(time < expected_time));
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1732  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1733  	return rc;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1734  }
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1735  
01b09d53ad5b7e Sean Paul         2018-09-20  1736  static void dpu_encoder_helper_hw_reset(struct dpu_encoder_phys *phys_enc)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1737  {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1738  	struct dpu_encoder_virt *dpu_enc;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1739  	struct dpu_hw_ctl *ctl;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1740  	int rc;
2ec5b3dc18bab1 Abhinav Kumar     2021-04-16  1741  	struct drm_encoder *drm_enc;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1742  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1743  	dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1744  	ctl = phys_enc->hw_ctl;
2ec5b3dc18bab1 Abhinav Kumar     2021-04-16  1745  	drm_enc = phys_enc->parent;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1746  
99beed68c3c72e Drew Davenport    2019-12-06  1747  	if (!ctl->ops.reset)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1748  		return;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1749  
2ec5b3dc18bab1 Abhinav Kumar     2021-04-16  1750  	DRM_DEBUG_KMS("id:%u ctl %d reset\n", DRMID(drm_enc),
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1751  		      ctl->idx);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1752  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1753  	rc = ctl->ops.reset(ctl);
2ec5b3dc18bab1 Abhinav Kumar     2021-04-16  1754  	if (rc) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1755  		DPU_ERROR_ENC(dpu_enc, "ctl %d reset failure\n",  ctl->idx);
2ec5b3dc18bab1 Abhinav Kumar     2021-04-16  1756  		msm_disp_snapshot_state(drm_enc->dev);
2ec5b3dc18bab1 Abhinav Kumar     2021-04-16  1757  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1758  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1759  	phys_enc->enable_state = DPU_ENC_ENABLED;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1760  }
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1761  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1762  /**
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1763   * _dpu_encoder_kickoff_phys - handle physical encoder kickoff
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1764   *	Iterate through the physical encoders and perform consolidated flush
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1765   *	and/or control start triggering as needed. This is done in the virtual
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1766   *	encoder rather than the individual physical ones in order to handle
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1767   *	use cases that require visibility into multiple physical encoders at
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1768   *	a time.
cca5ff947c7c6e Lee Jones         2020-11-23  1769   * @dpu_enc: Pointer to virtual encoder structure
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1770   */
b4bb9f15b44392 Rob Clark         2019-08-29  1771  static void _dpu_encoder_kickoff_phys(struct dpu_encoder_virt *dpu_enc)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1772  {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1773  	struct dpu_hw_ctl *ctl;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1774  	uint32_t i, pending_flush;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1775  	unsigned long lock_flags;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1776  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1777  	pending_flush = 0x0;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1778  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1779  	/* update pending counts and trigger kickoff ctl flush atomically */
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1780  	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1781  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1782  	/* don't perform flush/start operations for slave encoders */
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1783  	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1784  		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1785  
b6fadcade62704 Drew Davenport    2019-12-06  1786  		if (phys->enable_state == DPU_ENC_DISABLED)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1787  			continue;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1788  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1789  		ctl = phys->hw_ctl;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1790  
f98baa3109cea4 Sean Paul         2019-01-30  1791  		/*
f98baa3109cea4 Sean Paul         2019-01-30  1792  		 * This is cleared in frame_done worker, which isn't invoked
f98baa3109cea4 Sean Paul         2019-01-30  1793  		 * for async commits. So don't set this for async, since it'll
f98baa3109cea4 Sean Paul         2019-01-30  1794  		 * roll over to the next commit.
f98baa3109cea4 Sean Paul         2019-01-30  1795  		 */
b4bb9f15b44392 Rob Clark         2019-08-29  1796  		if (phys->split_role != ENC_ROLE_SLAVE)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1797  			set_bit(i, dpu_enc->frame_busy_mask);
f98baa3109cea4 Sean Paul         2019-01-30  1798  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1799  		if (!phys->ops.needs_single_flush ||
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1800  				!phys->ops.needs_single_flush(phys))
b4bb9f15b44392 Rob Clark         2019-08-29  1801  			_dpu_encoder_trigger_flush(&dpu_enc->base, phys, 0x0);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1802  		else if (ctl->ops.get_pending_flush)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1803  			pending_flush |= ctl->ops.get_pending_flush(ctl);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1804  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1805  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1806  	/* for split flush, combine pending flush masks and send to master */
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27 @1807  	if (pending_flush && dpu_enc->cur_master) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1808  		_dpu_encoder_trigger_flush(
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1809  				&dpu_enc->base,
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1810  				dpu_enc->cur_master,
b4bb9f15b44392 Rob Clark         2019-08-29  1811  				pending_flush);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1812  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1813  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27 @1814  	_dpu_encoder_trigger_start(dpu_enc->cur_master);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1815  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1816  	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1817  }
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1818  

:::::: The code at line 1672 was first introduced by commit
:::::: 25fdd5933e4c0f5fe2ea5cd59994f8ac5fbe90ef drm/msm: Add SDM845 DPU support

:::::: TO: Jeykumar Sankaran <jsanka@codeaurora.org>
:::::: CC: Sean Paul <seanpaul@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
