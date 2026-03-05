Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4172773CA
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680545; cv=none; b=btOal6i7+E6lgWFk7y8CxzuDG9qTtB5/3yIMh8odr1hNK9J/kaOFdD9lWpIiiK+Yu1v8+xMkOgU3Q6H1lX26qlSEJMuEjPvYXFhRAQTgY6QZFHAt6Dvtq/xOFUBiVbD5FMJdoG2N9OFaRoVdwYSCOLx6qoBSana5D6fno6su6CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680545; c=relaxed/simple;
	bh=qYSWb3F62AM7nXukbVMBawG0A8Cma/hahdqbCIm1iXc=;
	h=Date:From:To:Subject:Message-ID; b=q0i3kvQ5LLkt6eEGMa5aJpb+vM2htB4b+UvPoKk9zuoZ832V//DpilFkYZ8NsphT9rZCKBjwwsyVlvesVc5Y+agPygFDbR5gSXZnnjlP8VptLayy/IVtJU5r+5MK34j/eiNAIqouPNGJ0GiNvnR5XCIFyx2o7DjRgQWErsmph0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqTHyPlG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqTHyPlG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680543; x=1804216543;
  h=date:from:to:subject:message-id;
  bh=qYSWb3F62AM7nXukbVMBawG0A8Cma/hahdqbCIm1iXc=;
  b=CqTHyPlG3MTKNV31E37v++wCRU+j1o6hD5I8CrLLm/pbmowzezV0v2QL
   RvlwQuC/uGovkiOfrdRHDdW9pFwJT41GaU/06cJhSlGUQ0dCZdv3OlZ1d
   RRntc0Ng+hwwo2Va9GoiKitrsqfSBMaM5N/qFA9fEmSkwe86P/Hegc0VB
   0z3R99KwBDtv7wu6lil5XxPs3V0wf/vT90OcmVQpak2dh9QLJW1q/d0T0
   A2pbJmHBqtdzOLUZYcxygFEXFhBQY4PpUjHQ1H6/w5bWNBDRB4IafSL8W
   Blw36Cdah1OZ6V9J3CRULN8ykeMYhF23X8hff9s7q+3NALxyG0OqgVbKc
   g==;
X-CSE-ConnectionGUID: JOC25la7SIG7+92lbX/XUA==
X-CSE-MsgGUID: biA8qv2yRLy2ZNsLaYr6AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="61330927"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="61330927"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:15:39 -0800
X-CSE-ConnectionGUID: G9Ft1pKIShKYTfOuBKX3Qg==
X-CSE-MsgGUID: CQY420YkQuu8/ISJyhop8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="221446089"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 04 Mar 2026 19:15:39 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzBZ-000000001ui-1CNn
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:15:37 +0000
Date: Thu, 05 Mar 2026 04:15:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 445/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050405.Vff4wPHM-lkp@intel.com>
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
commit: 76309d43477dc3d8629d49ee00eb5cbb9bfb8230 [445/467] PCI: convert remaining fops to read/write iterators
:::::: branch date: 67 minutes ago
:::::: commit date: 67 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050405.Vff4wPHM-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#37: FILE: drivers/pci/controller/dwc/pcie-designware-debugfs.c:321:
+static ssize_t counter_enable_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#54: FILE: drivers/pci/controller/dwc/pcie-designware-debugfs.c:342:
+static ssize_t counter_enable_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#74: FILE: drivers/pci/controller/dwc/pcie-designware-debugfs.c:382:
+static ssize_t counter_lane_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#91: FILE: drivers/pci/controller/dwc/pcie-designware-debugfs.c:400:
+static ssize_t counter_lane_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#111: FILE: drivers/pci/controller/dwc/pcie-designware-debugfs.c:422:
+static ssize_t counter_value_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#176: FILE: drivers/pci/pcie/ptm.c:318:
+static ssize_t context_update_read(struct kiocb *iocb, struct iov_iter *to){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
