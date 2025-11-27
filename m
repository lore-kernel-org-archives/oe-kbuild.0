Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CD4224AF2
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 18:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764268247; cv=none; b=tSdrYeXEgaOO+s2ImUStwgGACZMD04Ltgm2DCBJJin+U+T+qUQLdtc6GbMLs1FhVX3mPU5KZg+21IrcMb+FsgXsB+AJ/3EPaBLADChQzTihzTSXOM4VHX+2KVS0dhbRu4gY1VcoojBu6/cTNHxYo0YSVC50I8xi5i5ziu6wLJMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764268247; c=relaxed/simple;
	bh=NAKcRux1/zmY+ECNRj/y5X2cqBs0OblXWLYCgz6jZwE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OhOVVEOngRSHJDNagETsCSZnlH6Id3NiizM4SWIbGyrETUH7fC7/xReceAFT2o/LQmufk0/RIQx5Zpg01c+GFrg3Pj5swOoXUDqPqR1/f3V8zOitMnFy+CCPHwWfMP1UhO/VSnvq6tKEVjQAPvmKRCXXYWPXjSxRSXBSRUa2qb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrbQDDol; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrbQDDol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764268245; x=1795804245;
  h=date:from:to:subject:message-id:mime-version;
  bh=NAKcRux1/zmY+ECNRj/y5X2cqBs0OblXWLYCgz6jZwE=;
  b=BrbQDDoler9XgFv/BvDG1o6vVRRxeRKTO30ETr5z4ex1IE93nWp5rWRl
   a7XmaYSpewvmizuShjzGkkC+Pd7uKni0PEgFRJTT29V8EtoRY6FQifrgs
   XiVvOFFKkLwN6IvleBYzRLAInPROP5ayFlRlR12BLnNQ1XWt7UlUCz8Kv
   Q/pUoVYuKQZxKP3hOo7R8x16jW+a1kfEGa6jTwWJWhi70rsAy8ifAl2ad
   Rj1+fxJjKXSJuzU3gL0ubBPUzPWLi14sHFbZy1G3c3K02GAAhwmKN4XSg
   pOD4D543KQpDNX3RWzlYRpg0JeiZJrhK07Heza1PhlDc0voVXprOCQ8GR
   g==;
X-CSE-ConnectionGUID: UJM4ShV9QKC/J/JUT+oxOg==
X-CSE-MsgGUID: 9t2LhcdfQB+v66vZlzbWtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66028149"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="66028149"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 10:30:44 -0800
X-CSE-ConnectionGUID: TZVgcxjGSCCvBfFNlKhlgA==
X-CSE-MsgGUID: W9DvHILKTLO7hqPPMHeKGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="198394745"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 27 Nov 2025 10:30:44 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOglN-000000001oX-3AeF
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 18:30:41 +0000
Date: Thu, 27 Nov 2025 19:29:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cel:nfsv3-xdrgen 58/76] checkpatch: ERROR:SPACING: space required
 before the open parenthesis '('
Message-ID: <202511271931.4AmzBco9-lkp@intel.com>
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
TO: Chuck Lever <chuck.lever@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsv3-xdrgen
head:   87fb634bd9bf1da2f8061853d3942a0d6d04e72c
commit: 6ae0285fb83a798dd6b4afa55fc21640ff185d9d [58/76] NFSD: Use xdrgen XDR functions for NFSv3 GETATTR procedure
:::::: branch date: 2 hours ago
:::::: commit date: 15 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511271931.4AmzBco9-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#101: FILE: fs/nfsd/nfs3proc.c:108:
+	switch(fsid_source(fhp)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
