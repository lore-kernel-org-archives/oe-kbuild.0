Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE15313537
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 19:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764186570; cv=none; b=Z2zqT9KsWr4+b0PQ66pFP0t6HFx/zl2q4HyfHuC97FoGLI8YVdz0EawSAI9dKJyZZzQ3oFdaR5ZmltBgMdb4h4TuqfjKyYn4lMiCVILkffJlEPbJLhV8maDEN37oYxPfiFunAMRmuCG8J2rM1vu/bhtQCwWocUioeeQ3IEzKef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764186570; c=relaxed/simple;
	bh=fpd+QM/sDB0QTtjDyTm5JTOHaAnL4M/W6hfWjyUzfRA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YbTCvGuteAboqSvqlp+nCBwZe0oRYp60lIWC1xhnCrZFR7I6X7b145VpftySIf727151XGFOb8vdkN0+mkO85289lz9JU4UyQk/Ci6qOXH2FGOJ0uCHpIdGv1k/j5CIPFZx69K3LVTyLme330+gZWedgsEPzKRGpS+AczkUK1Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxFZTIOO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxFZTIOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764186569; x=1795722569;
  h=date:from:to:subject:message-id:mime-version;
  bh=fpd+QM/sDB0QTtjDyTm5JTOHaAnL4M/W6hfWjyUzfRA=;
  b=mxFZTIOOg/kCS1ot7slpuSJ7crXNl1pniaV2ZeEps8lvOJhrWFegnlAr
   /nPkl1VSpHg3RhBo/hN4rQRDIds1ik2Cz4kePeJt/0vEK+ondeTzSsL/D
   mqNp2+ODr2ewUMj2NxR1MxtyISvRfKAvz01r6I/E39qf/IFO9imWDWRGw
   AXov2hAZ9ufK/BU+wEVt+rc3VIUc4sP7GPYDEcxWDdTz38rKMZovXJd/B
   M++eI0dFISNvzXsUj9thJ9kKo+8NUMj40v3voUe4bIFYyVNx+A3bymfLn
   thqeojnXFwcSyAscE8VaR1a5cLOXLDxlXU0rbkcntPRrZyW93Dcg8nF7q
   Q==;
X-CSE-ConnectionGUID: jmjXasVMSiukmPT0C+0Vsg==
X-CSE-MsgGUID: 7gEwG61SSNWhv8mjPEuZEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77339516"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="77339516"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 11:49:26 -0800
X-CSE-ConnectionGUID: 5XwKQwaVRqePN4XdG5+JhA==
X-CSE-MsgGUID: BEa/Nb3/T1S1PqE0HFqWoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="223994773"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2025 11:49:26 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOLVz-000000001Ph-2MiI
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 19:49:23 +0000
Date: Wed, 26 Nov 2025 20:48:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 672/999] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202511262022.kNeZKxi3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   e336760f1aaba6ace6f898616fd9234c99fd82fd
commit: b715146063133aefd7b8088356ab782584d83c55 [672/999] bcachefs: str_hash_dup_entries()
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262022.kNeZKxi3-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#57: FILE: fs/bcachefs/fs/str_hash.c:245:
+	switch (ret) {
+		case 0:
[...]
+		case 1:
[...]
+		case 2:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
