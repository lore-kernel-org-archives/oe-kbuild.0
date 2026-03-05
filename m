Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD812773CA
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680485; cv=none; b=h9KNQDn1SyxZLOKHgjA2Fwt+IhslDigzzxUPrfIZAo+dEBAeOILaLap3Si1HyGUjakzXlfiTDSReVZMgwXEfhyTtO1Vnl82N1bw2M4219OmOZazlE6+1zxdyafy3CIfy0+HYneSEx909xZ/PwYdYCBYdVtuQEzZCXeBN70kFsGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680485; c=relaxed/simple;
	bh=YUsovx7mDVqICQDcOdEVd6JVZTDfvOP1+qKy9A6giOw=;
	h=Date:From:To:Subject:Message-ID; b=k5/LdKYuBDyrLzSYm2/SI1YmpZ8M/zP8DfohKHjLzp9Ag1GjVYdlSOd7RttavvpW+ZlRHbBhqy3DOIzXXDFeYRI0F2b3SIPbOX/f+xZJJ62SBj6qQlc12Ceiv598B+l8ugaWWj/8HLi57DnALjnIYDnpo9ikcz19ukJJdC8Rhd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwpPAZ6j; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwpPAZ6j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680484; x=1804216484;
  h=date:from:to:subject:message-id;
  bh=YUsovx7mDVqICQDcOdEVd6JVZTDfvOP1+qKy9A6giOw=;
  b=bwpPAZ6jllYaAImVWza4Q6iFTnfW7ZrsgL1J2QLcK3Ni8mjZrdp5IqUT
   4OU2hxtDfYoFMN3++NYG+7s2RqM4bDiNlPb1DdDqaphkBcmC2LnI/Y/dp
   MY+7joRWuSDh09e4Mvg8qcilF+de0mVtWa3y2KiYO324UNkuozc+dcYKC
   CCVgVPIc1A17+q7dcAHZBKSfzAufHItNx57LOZeMGiIJOAQ9Mey2r44m/
   CBKxQDNa79IlAtWPWcEH1NGyVBPawQcvTo/kgX29aZ1mIL3ZjVxEQA+lh
   CYq/yt5YGcRWThTGeR6arojI1qhTaguhp2udgquyrGaPC7otbWke5C1TH
   A==;
X-CSE-ConnectionGUID: Y8vVufsTSji5fn49feaAfg==
X-CSE-MsgGUID: XGRV9OYzQgmmKF+ZKEeQVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91328487"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="91328487"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:14:40 -0800
X-CSE-ConnectionGUID: hIgq2qe9R6KWqUNgV7B7UA==
X-CSE-MsgGUID: PcZEFoIyToiWqH1jBX4Udw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="249014067"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 04 Mar 2026 19:14:39 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzAa-000000001tf-2jmt
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:14:36 +0000
Date: Thu, 05 Mar 2026 04:13:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 431/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050432.MkvSF8QK-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a
commit: 989a9bcd326ba483542957975c3ecc5baa4df6d7 [431/467] scsi: convert remaining fops to read/write iterators
:::::: branch date: 62 minutes ago
:::::: commit date: 62 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050432.MkvSF8QK-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#36: FILE: drivers/scsi/lpfc/lpfc_debugfs.c:2382:
+static ssize_t lpfc_debugfs_dif_err_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#67: FILE: drivers/scsi/lpfc/lpfc_debugfs.c:2584:
+static ssize_t lpfc_debugfs_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#133: FILE: drivers/scsi/lpfc/lpfc_debugfs.c:3324:
+static ssize_t lpfc_idiag_pcicfg_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#174: FILE: drivers/scsi/lpfc/lpfc_debugfs.c:3442:
+static ssize_t lpfc_idiag_pcicfg_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#189: FILE: drivers/scsi/lpfc/lpfc_debugfs.c:3614:
+static ssize_t lpfc_idiag_baracc_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#230: FILE: drivers/scsi/lpfc/lpfc_debugfs.c:3762:
+static ssize_t lpfc_idiag_baracc_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#245: FILE: drivers/scsi/lpfc/lpfc_debugfs.c:4065:
+static ssize_t lpfc_idiag_queinfo_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#285: FILE: drivers/scsi/lpfc/lpfc_debugfs.c:4271:
+static ssize_t lpfc_idiag_queacc_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#326: FILE: drivers/scsi/lpfc/lpfc_debugfs.c:4345:
+static ssize_t lpfc_idiag_queacc_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#341: FILE: drivers/scsi/lpfc/lpfc_debugfs.c:4640:
+static ssize_t lpfc_idiag_drbacc_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#373: FILE: drivers/scsi/lpfc/lpfc_debugfs.c:4693:
+static ssize_t lpfc_idiag_drbacc_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#388: FILE: drivers/scsi/lpfc/lpfc_debugfs.c:4853:
+static ssize_t lpfc_idiag_ctlacc_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#420: FILE: drivers/scsi/lpfc/lpfc_debugfs.c:4903:
+static ssize_t lpfc_idiag_ctlacc_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#435: FILE: drivers/scsi/lpfc/lpfc_debugfs.c:5042:
+static ssize_t lpfc_idiag_mbxacc_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#467: FILE: drivers/scsi/lpfc/lpfc_debugfs.c:5084:
+static ssize_t lpfc_idiag_mbxacc_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#482: FILE: drivers/scsi/lpfc/lpfc_debugfs.c:5356:
+static ssize_t lpfc_idiag_extacc_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#497: FILE: drivers/scsi/lpfc/lpfc_debugfs.c:5400:
+static ssize_t lpfc_idiag_extacc_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#529: FILE: drivers/scsi/lpfc/lpfc_debugfs.c:5455:
+static ssize_t lpfc_cgn_buffer_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#552: FILE: drivers/scsi/lpfc/lpfc_debugfs.c:5544:
+static ssize_t lpfc_rx_monitor_read(struct kiocb *iocb, struct iov_iter *to){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
