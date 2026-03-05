Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B460F27816C
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680481; cv=none; b=hHeSgPu/S0nuSKL5fA8CNwq4LEIykbVtp66GIg/vCj5pvSnHz+vuLDcjn0rvp48fQWO7MX2LB4Je7UnTDnENukdDlT+aB7Vyqoj25PL35D0kz65kf9rnO4q1XIirlWR+9N3Z+uHm6RpvOZM9TB6y8n5mK0fTDwEGHLcJyvVPPy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680481; c=relaxed/simple;
	bh=VzZCpln7QIuAPg6E84cQvwqCU8tW6RbQuvw6IiZ3RF8=;
	h=Date:From:To:Subject:Message-ID; b=F7avbe2BG+qvVIFqLf/F4s7UgBHgyEM0HJ+bhgLJseUdSLqZmMm0A7fYM3BTDHmQ/wewZhue5bIxqj/+4zjRnUUu3Ody6ySmBn/lzLqxmSczEy2FBh3GU5QjYmTOG8qqXK4fApvMfhl7EnBoFr2/cUg0urSGSiFRGNzeJNN/HRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZ5ovpTu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZ5ovpTu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680480; x=1804216480;
  h=date:from:to:subject:message-id;
  bh=VzZCpln7QIuAPg6E84cQvwqCU8tW6RbQuvw6IiZ3RF8=;
  b=OZ5ovpTubXt78nX9PRz5uFPJpFsUa5iXCdA3uE+Mk6DuBo5K/Dmo4+uY
   Q2esC9ePQ/aReRTxE544fv8Zl6l5cz+001NLECOSb9ujix37qJcgWEcGo
   okJ/KFlVefqKFBwlRIkbHdx997RPhSDCttGcgq50bl+87T95iQo6tBSrg
   De2bkr8wXc1GU7g11+2AsDbCsiR47D5sSo94V6+FaxTToCVnyNbVmTpd1
   pzwKfZ89e90zmcqjl5VRRw105HRaO/w0EEDrV85B/tlLFfa3jq3yyPaFv
   A6KrDiIa+v31wDXsYnKjHhbPSCWs1ZjCXMYksyqkttzFN9eRfQdr1YXGF
   Q==;
X-CSE-ConnectionGUID: 4wirMIWHR6m/04kJS5mb5g==
X-CSE-MsgGUID: edzcixZJSOaOgWU2BnWPBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91148716"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="91148716"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:14:39 -0800
X-CSE-ConnectionGUID: sH+MTsYhR86g3bdaug8gCg==
X-CSE-MsgGUID: Q1SZnBrhQ2e453ahxV0GhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="241555231"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 19:14:39 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzAa-000000001tZ-2CEn
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:14:36 +0000
Date: Thu, 05 Mar 2026 04:13:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 428/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050428.KESRr5nJ-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a
commit: 5ec2de99e4b6091980251b2d76390a0846e2b0cc [428/467] wireless: ath11k: convert cfr fops to read/write iterators
:::::: branch date: 61 minutes ago
:::::: commit date: 61 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050428.KESRr5nJ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#24: FILE: drivers/net/wireless/ath/ath11k/cfr.c:632:
+static ssize_t ath11k_read_file_enable_cfr(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#42: FILE: drivers/net/wireless/ath/ath11k/cfr.c:644:
+static ssize_t ath11k_write_file_enable_cfr(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#71: FILE: drivers/net/wireless/ath/ath11k/cfr.c:685:
+static ssize_t ath11k_write_file_cfr_unassoc(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#95: FILE: drivers/net/wireless/ath/ath11k/cfr.c:765:
+static ssize_t ath11k_read_file_cfr_unassoc(struct kiocb *iocb, struct iov_iter *to){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
