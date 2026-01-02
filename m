Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409DD149C6F
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jan 2026 10:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767349029; cv=none; b=P+2MYqqyn8kawc+jaTM86fOdjrjE4VuVK9yWguvN7hbf+JwFej54otDdJsxsWnX2aY8nPwXSrkgVfS+JJ7vkea1Z1QzmW6RsMNho8t83CgeZrt1KuSsxRJPWfj69evO0fSTf+oDhaZ79CR7YFM7r7AaCyeokjgE23q5pkG7IvQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767349029; c=relaxed/simple;
	bh=8W0J9qrJj2w4nc1PxD4moTGo4Pe3Xf1UwyjUv6ZoBi0=;
	h=Date:From:To:Subject:Message-ID; b=nQ2HqGlwkMbNOf3YMXgXkt4/ifol/mS088ZNOs0tc4BXaOyFs7JM7soMPAtP812K5H4fSZQJuVO6Y//rKIa99assTGsUII2UyU75I8xRirJyJrf/BOW5cFw0kP4+NCCo4c3oBRcRN+gRm3CTB8vr1JrEU79FxMf2NqeiIP/Qd5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CodZVu5S; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CodZVu5S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767349027; x=1798885027;
  h=date:from:to:subject:message-id;
  bh=8W0J9qrJj2w4nc1PxD4moTGo4Pe3Xf1UwyjUv6ZoBi0=;
  b=CodZVu5SqhgoUdeKynluNena38+0OrKXVCsSNxejXSSnluETIGS9XMMN
   tT3fKNJrA9vVahRtteGUv4kxRMETg2gh+nsa+SO6LktWlOZ+vZIuYsJ9U
   PzOw/xHGScIzlLW6KILx+Z2qOorr7pu+Rbq9yPFR52Id7n/rRE337rzq1
   LcTcTBIJyoY2avPFE0Gx0upRGRgbF+Mo/tFMOe+wRSnA7enTlTgsV8Pmt
   SXUPAdZ6ploqHt5MnrIumrSD9V4JmU1skj5i5ya3RdwIm9idQuFrsQ6N3
   /heD28wsC0ma2ihh+gNshdZAkaqdQOx8YoiJV0yOqJI8ZHzT1d0m5FdF1
   w==;
X-CSE-ConnectionGUID: BUCeVaD8TDKeR6D6UYWHmw==
X-CSE-MsgGUID: NGTATgMcSgenZzJ5rw+xFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67855872"
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; 
   d="scan'208";a="67855872"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 02:17:06 -0800
X-CSE-ConnectionGUID: sYRW81Q2R5au/oMiwaDBlg==
X-CSE-MsgGUID: uYlphz3JQyOUUANBu9VnIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; 
   d="scan'208";a="239239566"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 02 Jan 2026 02:17:06 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbcDP-000000000QD-2iLc
	for oe-kbuild@lists.linux.dev;
	Fri, 02 Jan 2026 10:17:03 +0000
Date: Fri, 02 Jan 2026 11:16:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [brauner-github:work.immutable.rootfs 5/5] checkpatch:
 ERROR:GLOBAL_INITIALISERS: do not initialise globals to false
Message-ID: <202601021154.4VbVsdBD-lkp@intel.com>
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
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.immutable.rootfs
head:   43078f98c21220a81ce07f4bff2b31626582b977
commit: 43078f98c21220a81ce07f4bff2b31626582b977 [5/5] fs: add immutable rootfs
:::::: branch date: 72 minutes ago
:::::: commit date: 72 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260102/202601021154.4VbVsdBD-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:GLOBAL_INITIALISERS: do not initialise globals to false
#79: FILE: fs/namespace.c:78:
+bool immutable_rootfs = false;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
