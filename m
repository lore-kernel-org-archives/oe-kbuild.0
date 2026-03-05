Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31B7275AE4
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680483; cv=none; b=TGKaZXPr8wBnLb61PcAbLR6hDtLnrZ2bgLme7LYu0tNFJCCeGSDZknLFRLDpb23ld6yioMDk7qDvo2VIhxIlGF/NOQEhY2PwWPpANovR4BFaOIhWwdwhjlvxTP9SMcgKH8SNZzvkywE64+yggTsnfaCJr/XiLfMNteJ67xgAcwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680483; c=relaxed/simple;
	bh=8tN037V5aLBKK3u6s0kauYtWVW49JpN75ATmmyGgNmM=;
	h=Date:From:To:Subject:Message-ID; b=MLuw1PxajnsleYq6cbNocpaNN5NFPHXoovXPekBfUR/onBNNrqkWuxRDbkaoMv82jFCtPNfl/h5tPO6b7rRA4gdq3v29PCywgrIsoq8hshYOsSXJWI0maFj5Litev/NL+Fd+Jd7wnSO7y/nM2G1/GkaFk3GDPDq06wNLH5po/Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fY55VhsT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fY55VhsT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680482; x=1804216482;
  h=date:from:to:subject:message-id;
  bh=8tN037V5aLBKK3u6s0kauYtWVW49JpN75ATmmyGgNmM=;
  b=fY55VhsTJmitosa9XT/d10aq1qQwZzlFPvPrU7/Ihbo5Gb6cmkRTwqgo
   7x2DG+ljvqyeYBd75Y0nZVMlEeJC3k4TUEf4LVPtPe2gNt9K4QpJySj05
   nFNschzMdPQufHDNz5HJ3J8PS4KAAzUss5OXl9hl8uKvXuMivV2iCIH4W
   xcbQnQDd1kD0sVHdnaBZJR05UrKXukS93Qjcm5+QpT/Q4HCDWLoilakSv
   YU8cCgGA6TWre2zVRLR2GTQF1w2Uat3KBunEaQ7hM/KXXMF5NbF8but7k
   iVmEornqTfK/KIOJ/lJ+wkpKOVZ81aVSfaRbwISuvdGd0L48lNc3ByGjh
   A==;
X-CSE-ConnectionGUID: b67b1z0hSnGk0pYM1PQrzw==
X-CSE-MsgGUID: saXVo+8ZSjCuIQwW3/L8VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91148718"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="91148718"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:14:40 -0800
X-CSE-ConnectionGUID: fvHLC+tjQHmr6Q7xbs55HQ==
X-CSE-MsgGUID: Oj/2GpmaQzigMuhXDc9rxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="241555232"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 19:14:39 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzAa-000000001tX-21sw
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:14:36 +0000
Date: Thu, 05 Mar 2026 04:13:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 427/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050419.5D7aqFSa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a
commit: 8da5c824809582a41d3974a65fac17b329f27cb4 [427/467] wireless: ath12k: convert remaining fops to read/write iterators
:::::: branch date: 61 minutes ago
:::::: commit date: 61 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050419.5D7aqFSa-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#28: FILE: drivers/net/wireless/ath/ath12k/debugfs.c:36:
+static ssize_t ath12k_read_simulate_fw_crash(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#43: FILE: drivers/net/wireless/ath/ath12k/debugfs.c:44:
+static ssize_t ath12k_write_simulate_fw_crash(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#88: FILE: drivers/net/wireless/ath/ath12k/debugfs.c:100:
+static ssize_t ath12k_write_tpc_stats_type(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#108: FILE: drivers/net/wireless/ath/ath12k/debugfs.c:775:
+static ssize_t ath12k_read_tpc_stats(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#139: FILE: drivers/net/wireless/ath/ath12k/debugfs.c:803:
+static ssize_t ath12k_write_extd_rx_stats(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#161: FILE: drivers/net/wireless/ath/ath12k/debugfs.c:871:
+static ssize_t ath12k_read_extd_rx_stats(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#191: FILE: drivers/net/wireless/ath/ath12k/debugfs.c:981:
+static ssize_t ath12k_read_link_stats(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#216: FILE: drivers/net/wireless/ath/ath12k/debugfs.c:1006:
+static ssize_t ath12k_debugfs_dump_device_dp_stats(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#246: FILE: drivers/net/wireless/ath/ath12k/debugfs.c:1285:
+static ssize_t ath12k_read_vdev_stats(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#271: FILE: drivers/net/wireless/ath/ath12k/debugfs.c:1349:
+static ssize_t ath12k_read_bcn_stats(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#296: FILE: drivers/net/wireless/ath/ath12k/debugfs.c:1407:
+static ssize_t ath12k_read_pdev_stats(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#325: FILE: drivers/net/wireless/ath/ath12k/debugfs_sta.c:139:
+static ssize_t ath12k_dbg_sta_dump_rx_stats(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#352: FILE: drivers/net/wireless/ath/ath12k/debugfs_sta.c:250:
+static ssize_t ath12k_dbg_sta_reset_rx_stats(struct kiocb *iocb, struct iov_iter *from){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
