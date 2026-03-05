Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72BB246778
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680544; cv=none; b=HMlCKuRawaSHvCbI44Z9ykTSZwZSfx3TEqUcUt/MI3JUNM4J98DJlZ3gNVG6gzQVvsv/mO4T+eZ+5OEv4m8YNNNvgxyyx8U55k/A+FP212twWLCrX7wAhaCzK3wLt4uuT1buY7Pk4I69izR3F6QwaAdHTSfIDf3NuTlqB8BplSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680544; c=relaxed/simple;
	bh=CaT5KUwQCs10XC+Aa8/zi5wcHAPIrT4XPieykFQmOHM=;
	h=Date:From:To:Subject:Message-ID; b=pomrxBSKfL4/Kk+43Bj5ppCCUS537F+af0Z7xjFwaOjxfMEN0uVjMz3vuqwVKqeTRwUmTTQ3tp5VpItviUtl6GKht7cGYfRIfu0DmQx3JVAK0LAR+OtKvJQaMMIgbO0y0rg6JJ38XNamy6ya++e8RQRWYeGuN7vD0V76RsWjb+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SVtNWv+4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVtNWv+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680543; x=1804216543;
  h=date:from:to:subject:message-id;
  bh=CaT5KUwQCs10XC+Aa8/zi5wcHAPIrT4XPieykFQmOHM=;
  b=SVtNWv+4RL6mrECj2+UFXVoWqJqAcG1I7rcXJ8KOoH6wKuyAloE7xFqA
   Fk/DBPfFBsiu/zBpEM21HqaLSL+vfWUrkqeUKxhMh9thPMUTTiYzkF3aT
   aYl5/+4ZFwMnvZibSY1ffMIGgXGHeQsG+rOpnRwu0m1e+0xvdKG5Or0tR
   /vgGXnQbh41cXNFT+IjRFoNS0ib03HPW9MDOP7bn62MvcXPnnqvafkAQD
   eKdHDvKYhFhNI4nIYlExj93nC5dgaXCi42bnLs29K5aMnN/ki9cmIXMA6
   JK3cOzZPVtpTqGniWLaqAIYH8JavdTKXUQc/QFhOywpqvcGLMzR+wDY4F
   w==;
X-CSE-ConnectionGUID: 3sRBLJrJSTaKezMLoyD1Qw==
X-CSE-MsgGUID: VpbXZZ1mSAGpGbOOz34KNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="61330926"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="61330926"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:15:39 -0800
X-CSE-ConnectionGUID: sHJnf1c7QDmxitiBpXShqw==
X-CSE-MsgGUID: 1vvv5LBMQra1QRyyUIM8uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="221446086"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 04 Mar 2026 19:15:39 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzBZ-000000001uX-0Dvc
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:15:37 +0000
Date: Thu, 05 Mar 2026 04:15:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 437/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050427.0hVZqkys-lkp@intel.com>
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
commit: 2614b4a5890fecaf516f6999d51f4316c4faea73 [437/467] tracing/rv: convert remaining fops to read/write iterators
:::::: branch date: 64 minutes ago
:::::: commit date: 64 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050427.0hVZqkys-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#28: FILE: kernel/trace/rv/rv.c:241:
+static ssize_t monitor_enable_read_data(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#47: FILE: kernel/trace/rv/rv.c:365:
+static ssize_t monitor_enable_write_data(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#75: FILE: kernel/trace/rv/rv.c:394:
+static ssize_t monitor_desc_read_data(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#110: FILE: kernel/trace/rv/rv.c:579:
+static ssize_t enabled_monitors_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#142: FILE: kernel/trace/rv/rv.c:663:
+static ssize_t monitoring_on_read_data(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#159: FILE: kernel/trace/rv/rv.c:708:
+static ssize_t monitoring_on_write_data(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#201: FILE: kernel/trace/rv/rv_reactors.c:203:
+static ssize_t monitor_reactors_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#245: FILE: kernel/trace/rv/rv_reactors.c:346:
+static ssize_t reacting_on_read_data(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#262: FILE: kernel/trace/rv/rv_reactors.c:368:
+static ssize_t reacting_on_write_data(struct kiocb *iocb, struct iov_iter *from){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
