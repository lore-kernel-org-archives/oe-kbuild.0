Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFBD274FE3
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680481; cv=none; b=R0JVaXIzJP9y+3koW+KkGiIOd1215jMOM4okMr5JRtTw7A5d3Ef7KbMlz2IofgWVoXYC68YPpTU7tyiZiqwOI+hXXUI+ewkroyVzW3Fyy322Kzks29OUjRRR5KoD795/jJi/xiYxWYBRzi4vDPO37I7nwiPovZr9gbmrFx2RA4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680481; c=relaxed/simple;
	bh=x/Ob8/3ayz0xF0HicSJOuqXV5Ik8Na/vbaKvLewSEmw=;
	h=Date:From:To:Subject:Message-ID; b=ha4vjoS6TKY2QbprxrquPNHMdBar3c+YSuEWm20ehkk+/nqfsJ2oyVwHdgq9P3ss4SJDSSLT6qdplO95L8VXX2g8B2UJ/X263R7boUYc3/STuWMVA+I+paU7KkCc5LDgGXos5EL9alMldsdHxKSkmkr8jRG9hG6eRt0q2Payhh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfdmkI4o; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfdmkI4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680480; x=1804216480;
  h=date:from:to:subject:message-id;
  bh=x/Ob8/3ayz0xF0HicSJOuqXV5Ik8Na/vbaKvLewSEmw=;
  b=TfdmkI4of+nFKJU7PgyNp8770yFXLjmy1Jlqsx/SZanvFrtNZi6oyuoH
   ka+Foxl0SKhl8BEpCnDIu2wcEooYZB5y5daceLEJoFCbVItGsbUsAnXEi
   N6ZNLX7sbbArMXMHv1pENOrYwf3LIg0qvuppEPqJ14xT4P72vCJ0lC2Fa
   czcjsL8NWCtEySsRglNJE8QEjJAsilVAOrVX4IxW8Ql2Ail695NKZcLI1
   qSwSx29GgrRcbklqkdNYJHJ47tTY2HYju7RbUtVaU/gXEvDOZ+hQTlmGK
   BVyh2ir9woGCUC2bB0oKIJt18JkCL3bKt87mnCs2sSRHhQf187gDcw+7q
   Q==;
X-CSE-ConnectionGUID: XQDROrSsRBiux6C73n7H3A==
X-CSE-MsgGUID: qTY75vPfTt6xkeiNtDvSLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91328482"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="91328482"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:14:40 -0800
X-CSE-ConnectionGUID: aIHUSLH/RMW4j26yZeaBgQ==
X-CSE-MsgGUID: gdWciEb+S1ewynHkjCMWlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="249014063"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 04 Mar 2026 19:14:39 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzAa-000000001td-2YWI
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:14:36 +0000
Date: Thu, 05 Mar 2026 04:13:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 430/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050413.I2AHliVt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a
commit: 37b34ae39d0988f7e4e5acb6fd0f6f777f276bfa [430/467] accel: convert remaining fops to read/write iterators
:::::: branch date: 62 minutes ago
:::::: commit date: 62 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050413.I2AHliVt-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#27: FILE: drivers/accel/habanalabs/common/debugfs.c:798:
+static ssize_t hl_memory_scrub(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#41: FILE: drivers/accel/habanalabs/common/debugfs.c:1137:
+static ssize_t hl_data_read32(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#68: FILE: drivers/accel/habanalabs/common/debugfs.c:1163:
+static ssize_t hl_data_write32(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#91: FILE: drivers/accel/habanalabs/common/debugfs.c:1188:
+static ssize_t hl_data_read64(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#118: FILE: drivers/accel/habanalabs/common/debugfs.c:1212:
+static ssize_t hl_data_write64(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#141: FILE: drivers/accel/habanalabs/common/debugfs.c:1236:
+static ssize_t hl_dma_size_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#164: FILE: drivers/accel/habanalabs/common/debugfs.c:1292:
+static ssize_t hl_monitor_dump_trigger(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#187: FILE: drivers/accel/habanalabs/common/debugfs.c:1335:
+static ssize_t hl_get_power_state(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#211: FILE: drivers/accel/habanalabs/common/debugfs.c:1356:
+static ssize_t hl_set_power_state(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#231: FILE: drivers/accel/habanalabs/common/debugfs.c:1385:
+static ssize_t hl_i2c_data_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#258: FILE: drivers/accel/habanalabs/common/debugfs.c:1410:
+static ssize_t hl_i2c_data_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#278: FILE: drivers/accel/habanalabs/common/debugfs.c:1433:
+static ssize_t hl_led0_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#298: FILE: drivers/accel/habanalabs/common/debugfs.c:1451:
+static ssize_t hl_led1_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#318: FILE: drivers/accel/habanalabs/common/debugfs.c:1469:
+static ssize_t hl_led2_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#337: FILE: drivers/accel/habanalabs/common/debugfs.c:1487:
+static ssize_t hl_device_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#348: FILE: drivers/accel/habanalabs/common/debugfs.c:1493:
+static ssize_t hl_device_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#371: FILE: drivers/accel/habanalabs/common/debugfs.c:1524:
+static ssize_t hl_clk_gate_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#378: FILE: drivers/accel/habanalabs/common/debugfs.c:1528:
+static ssize_t hl_clk_gate_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#387: FILE: drivers/accel/habanalabs/common/debugfs.c:1533:
+static ssize_t hl_stop_on_err_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#412: FILE: drivers/accel/habanalabs/common/debugfs.c:1551:
+static ssize_t hl_stop_on_err_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#435: FILE: drivers/accel/habanalabs/common/debugfs.c:1578:
+static ssize_t hl_security_violations_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#448: FILE: drivers/accel/habanalabs/common/debugfs.c:1587:
+static ssize_t hl_state_dump_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#470: FILE: drivers/accel/habanalabs/common/debugfs.c:1601:
+static ssize_t hl_state_dump_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#491: FILE: drivers/accel/habanalabs/common/debugfs.c:1635:
+static ssize_t hl_timeout_locked_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#514: FILE: drivers/accel/habanalabs/common/debugfs.c:1651:
+static ssize_t hl_timeout_locked_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#534: FILE: drivers/accel/habanalabs/common/debugfs.c:1670:
+static ssize_t hl_check_razwi_happened(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#669: FILE: drivers/accel/habanalabs/common/debugfs.c:1799:
+static ssize_t hl_debugfs_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#711: FILE: drivers/accel/ivpu/ivpu_debugfs.c:199:
+static ssize_t fw_log_fops_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#734: FILE: drivers/accel/ivpu/ivpu_debugfs.c:220:
+static ssize_t fw_profiling_freq_fops_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#758: FILE: drivers/accel/ivpu/ivpu_debugfs.c:245:
+static ssize_t fw_trace_destination_mask_fops_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#783: FILE: drivers/accel/ivpu/ivpu_debugfs.c:270:
+static ssize_t fw_trace_hw_comp_mask_fops_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#807: FILE: drivers/accel/ivpu/ivpu_debugfs.c:295:
+static ssize_t fw_trace_level_fops_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#831: FILE: drivers/accel/ivpu/ivpu_debugfs.c:320:
+static ssize_t ivpu_force_recovery_fn(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#854: FILE: drivers/accel/ivpu/ivpu_debugfs.c:423:
+static ssize_t priority_bands_fops_write(struct kiocb *iocb, struct iov_iter *from){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
