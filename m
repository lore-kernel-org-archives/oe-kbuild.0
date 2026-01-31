Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263593EBF39
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 00:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769817912; cv=none; b=CUIQJPOu1t2I/RxEpj4rxUMU2LWKnozAfcWKOnkXCM85AF80DUagYpilzHLptx7rNlCs7dXzP+f25tbQ7pYpsPfVZM191HtmSf0A/bZO+A61ZWDgge63vctkEjTE7QEndAQRlE1a1DxPzHaTutJ25ThKApvZOwn0c77tsc257eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769817912; c=relaxed/simple;
	bh=ey8XpcW+9unR+GsGhS3yxSvsR2DLeafh6JO1Cwi5Lww=;
	h=Date:From:To:Subject:Message-ID; b=Xo5DCl71UaeUP2uFw+E+oJoz4GdtZC2OiB4rd2H0ZcQ+PrLyXWZTm2fs4Ktgh1U/ojmfGKfDlumrVB1gLocgllN1NpldujatPe81XBRhHe71Ju1IdATBMnByaYWkBLR4gFeHpf+n9ARVQP2N2AYF5s8zIZGnnKB68kV55o6Dag8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T13qlJdF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T13qlJdF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769817911; x=1801353911;
  h=date:from:to:subject:message-id;
  bh=ey8XpcW+9unR+GsGhS3yxSvsR2DLeafh6JO1Cwi5Lww=;
  b=T13qlJdFNE+X9LRymNWaaa+EIwBPX/Y2OyuSHXydDwVQTkk+NDu/H/6e
   0ZfoFOxKU591oaO2G7kcJ20oLbgmrYwUBjSNxcDHHXaKcDoF5L/V4YhHm
   t+k76d9UluNV07Z+6NjTdIBMKE5MbgGcZT+Dgfp8vrZewQont4c2NcuFc
   7a8KBit9oZEYBYJRcnBY7RPs/RoybYRaAAVZHJsAnWjLwUXntpd+x8tyQ
   daFldnqsuluaNqQdhgG7nTi1RzTsdm9wDchApaPxsP4DcwOuZZWYE4gP8
   6eNOoYAYSk35zlYU2Btv45JIgBgxxiZa6Jz4yOKDxTvCkEodxfueFQNzQ
   w==;
X-CSE-ConnectionGUID: MW8rd7fTQHWUPyRdSmEv6g==
X-CSE-MsgGUID: 1wU8gtCdSB+9HiA2yriuBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="81389564"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="81389564"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 16:05:11 -0800
X-CSE-ConnectionGUID: 6oitRkGYStqO4OmLsVxZcQ==
X-CSE-MsgGUID: 7zwppI0nTTuxgj5WU8j76Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="209209731"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 30 Jan 2026 16:05:09 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlyU8-000000002a9-0LIG
	for oe-kbuild@lists.linux.dev;
	Sat, 31 Jan 2026 00:05:08 +0000
Date: Sat, 31 Jan 2026 01:04:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cornelisnetworks:for-upstream-20260130-1 9/23] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202601310128.cIdDaFD9-lkp@intel.com>
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
TO: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream-20260130-1
head:   8613a3fd5b6e088624accc0967f5a063f0dd02eb
commit: 290a1d023e3e0b463ae5794722f03c6b2e3e8854 [9/23] RDMA/hfi2: Add in HW register definition files
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260131/202601310128.cIdDaFD9-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#868: FILE: drivers/infiniband/hw/hfi2/chip.h:826:
+	/*
+	* A special counter that is the aggregate count

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
