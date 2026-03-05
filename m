Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C32727603C
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680485; cv=none; b=AJirIjyha4QE1eVM65F8KfGVAJgftKsBHvqYBUYTUOEb0fJI4QuLjv3P8jQH/Ii7TjFWzNP1OhH+VAZI7iUwTA1QoSgAjU9JNjjL/QMErx73SKEFF0VyNEjdd1eXLJr6De2xwXPAyluWi5Vmweje79zgMzN3dhVWVRbIlh6Tg4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680485; c=relaxed/simple;
	bh=2udrj/cFs+cdVudYC+/CGAL7afBHR6fNzHpSYy0tyKo=;
	h=Date:From:To:Subject:Message-ID; b=a8nDEIdqL2GuNwV/HfDbKsQ2fuWl2qeeSW6N+l763Zam61eWeSypOQrEyw8UZX30DvhGreRLjpm5Gq+Y4GF1qvHK/cLhgk52mFtSU7Ug5Ipui4qMe0ozOrGrgflm+WbIfTlu1Zf/ZJXD7cwdUtirHYDPFnrDsudYyIkmvVjzhRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W2szQ/6u; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W2szQ/6u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680483; x=1804216483;
  h=date:from:to:subject:message-id;
  bh=2udrj/cFs+cdVudYC+/CGAL7afBHR6fNzHpSYy0tyKo=;
  b=W2szQ/6uIy0+zoZZWwDG+3QEGGNNYf4utPCFG/201dP1PImiGrCYHFNu
   wcuthFFadclWjT44De0wwDS+X8EW06LrxfuYKT3TFyNW3YsPP+uOTRLFQ
   tpdXDZSMIJukP7sv5qGrzmo4bF+8BbYfxqpfBo2OtGLcfG5ojIEF8aZkv
   RveXaTmBYD07HtxGQ2O+D1I2fitTOvHKxokBRtCV21GqlZ4cO1PJFnVKC
   R7LfD4Ivg72C0hqKFvwQ0mf9afTl3M2hMB0aGQPidMF296T5CPo2Nk6Aq
   A0t8ohrALC1I6YXkX2tP5eP26i6frDtZpPxcbfdMoAm5A9iZGujZxBA4A
   A==;
X-CSE-ConnectionGUID: N8uwl9ztRLOG6IG9Yila3g==
X-CSE-MsgGUID: bGfvK+7eRF+I6lfNcGofew==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91328485"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="91328485"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:14:40 -0800
X-CSE-ConnectionGUID: Q9vMcxf8Rc+VSBdr/lKyAg==
X-CSE-MsgGUID: TojAAd9uR6myYER2jFaicw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="249014070"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 04 Mar 2026 19:14:39 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzAa-000000001tp-3Cwm
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:14:36 +0000
Date: Thu, 05 Mar 2026 04:13:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 434/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050427.irKB2VE8-lkp@intel.com>
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
commit: c394a36c710f69584724deec128aa1eec1a45058 [434/467] powerpc/pseries: convert remaining fops to read/write iterators
:::::: branch date: 63 minutes ago
:::::: commit date: 63 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050427.irKB2VE8-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#35: FILE: arch/powerpc/platforms/pseries/htmdump.c:86:
+static ssize_t htmdump_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#74: FILE: arch/powerpc/platforms/pseries/htmdump.c:225:
+static ssize_t htmstatus_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#99: FILE: arch/powerpc/platforms/pseries/htmdump.c:271:
+static ssize_t htminfo_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#117: FILE: arch/powerpc/platforms/pseries/htmdump.c:306:
+static ssize_t htmcaps_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#187: FILE: arch/powerpc/platforms/pseries/papr-indices.c:200:
+static ssize_t papr_indices_handle_read(struct kiocb *iocb, struct iov_iter *to){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
