Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B312110
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 17:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767029530; cv=none; b=dgqIhSboEEKq0/Y5GuFGWcej2dbrE80wlyW194LbSe9XGZrhonyTKxPUEeBKm7bJgAlqlXlD5wV349gRh56uYJQqGILLx5pwrQ58NOfULhdBwhRCSyNg+prFJODP9h0niIh2vDyBD7+79l9F8Dg5Q7HjzuW/K9lijXsxx25ESTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767029530; c=relaxed/simple;
	bh=MLSxFPCXhJwAzxFnOrYQv+uX6oSxrwq9fWlGqAQrqWg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GErf6C9rPqjQEEbX3lnawH2jjVmrBTXDLqV6x7+JsQ0GC9KZqMZfBKxGmT3reYi5V/mbOIzKmSlaKzV+srfvIC4UWUCuUkKJMMAH+0etW6Jg2pDbRKcal+mOk9tbpwjH7eCTEDZVLc3StHwvPL5G+95/iUF7uwuQFX9nQxhsrOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcmvh82J; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcmvh82J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767029528; x=1798565528;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MLSxFPCXhJwAzxFnOrYQv+uX6oSxrwq9fWlGqAQrqWg=;
  b=dcmvh82JSRuS2te2B1iDR3pDzmthzWE5A20p6Rij63C+u9W5VlZ+Fksy
   IYJifakp5LsUOn1OwCv9OFebh//c8JULtaLtavZICE+3umN+D37Cp352s
   lQHE1EHNtRdhIq4HOEKPbGacSOCB3xQpIZjuCdmyzVNh1mTcRWlx0TT/g
   yPsFRgJYHHG3YRhl+vW0Rj7t7dPpu3WYB6LANWs5qCxzHZzqqh+zve33X
   5Ld5nMuJMEMWA4H+L/mLvVgERZQxdNqEka4V1IHbs7k7ZxccKagtVfzk5
   ZfF6SwafkVgebtnXV4/N9XqB9rAMoBsc6OKe8tk/L3+sjAxDKSOWdtMqi
   w==;
X-CSE-ConnectionGUID: KSnbdJm6Rlq/r1uxG1i1vg==
X-CSE-MsgGUID: NrCC/F2eRjiIS27wfAu0iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="72260934"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="72260934"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 09:32:07 -0800
X-CSE-ConnectionGUID: Mb9RLsH8RHaWNlgZbE0JZg==
X-CSE-MsgGUID: m6UlpZPUSVCH0tIre18FAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="201232173"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 29 Dec 2025 09:32:07 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaH6C-000000007oA-3kQ0
	for oe-kbuild@lists.linux.dev;
	Mon, 29 Dec 2025 17:32:04 +0000
Date: Mon, 29 Dec 2025 18:31:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-absolute-reloc 2/28] checkpatch:
 ERROR:GLOBAL_INITIALISERS: do not initialise globals to 0
Message-ID: <202512291806.czK9eRyb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-absolute-reloc
head:   5c4764e2d4c07419b562fc63a13ff84fd5d31c8e
commit: fb173c43442a7cbd17c387cb7222049ded6ad606 [2/28] vdso: development hacks
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251229/202512291806.czK9eRyb-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:GLOBAL_INITIALISERS: do not initialise globals to 0
#67: FILE: arch/x86/mm/fault.c:1048:
+int show_unhandled_signals = 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
