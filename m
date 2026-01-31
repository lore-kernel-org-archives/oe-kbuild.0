Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFA0218AD4
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 00:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769818289; cv=none; b=KvIPv05lyGjLt9BDsc12w73SY0jXVIxY1frzkKNLcGKOUOkQdhkEYQq6qCDfXxpbzVEns3r/+IoG9OynQzVCt0zTmt3NWXD4LW/6VSZQBtm+F+blp3Mr3RNPOSGWHOe/2ZfvjBtdr7wY4/UCZdJbfKJqc8o7rgPY7A4ruWjNGbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769818289; c=relaxed/simple;
	bh=IBZLreLrgd/IgpOov6h0IC4zhwc1mu8FnY5LS+1OjU8=;
	h=Date:From:To:Subject:Message-ID; b=MnZ0QpoRtu14kI9yxTgtGfBMINh3/+LXFXTz+DROja+KkkRzMU7t7DZzn2IRE9U1u3MHBibWNy63SrIvzrizSM1w05nix1rJELSPmDROm75TnWBPglYqmOb3dt50P+J67WzZubCJdjyIf3Aut0ualHCQSFzcSHiHei8fHXTZ3ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9CDX/02; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9CDX/02"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769818286; x=1801354286;
  h=date:from:to:subject:message-id;
  bh=IBZLreLrgd/IgpOov6h0IC4zhwc1mu8FnY5LS+1OjU8=;
  b=i9CDX/02oUnfPAEl2F06giiLZlmhzUao4IJvu0AA2HX+f+a/qEjvu/o1
   UXi8kWVS/NZOH9g1XwrRPlCxOAvMaOKF0OqJANSPe4kYhIbaLy8H7//2A
   xgER1KxL9MZChcCFlSqUj7mguDL5hzitI9sBCbyNJZ+JnSxZ8tHyUPPKr
   /JOEmt5/rtXoV/dYdB3CmYi1evXxttI2pQa2b7WJt7pt4kYnGL1aW/QB0
   0/yqlaSC03Ise+cduBEI+wUPsV9Wx4oaY3w2WvjY476BcoYKSGmaaLiW0
   j0qeeXVxnUAioU9CFDd7+sSGSEuQmUi8sOLOmIvzB9ug31EXStL5Zok1a
   A==;
X-CSE-ConnectionGUID: 1ddjtv+TSnu/CaBjVqd87Q==
X-CSE-MsgGUID: p/EmPXZ7TEyFJfBAk42F6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70969920"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="70969920"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 16:11:24 -0800
X-CSE-ConnectionGUID: jTH67K9WQpyiWH3VMihmGA==
X-CSE-MsgGUID: EMr9s4KiSq6cGx0dVu6HSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="240245541"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jan 2026 16:11:10 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlyZw-000000002ah-1bGs
	for oe-kbuild@lists.linux.dev;
	Sat, 31 Jan 2026 00:11:08 +0000
Date: Sat, 31 Jan 2026 01:10:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cornelisnetworks:for-upstream-20260130-1 14/23] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'device'
Message-ID: <202601310117.DDG67OO9-lkp@intel.com>
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
commit: 92af0f5bace4b75181d26a6754ea951c4b40de17 [14/23] RDMA/hfi2: Add system core support
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260131/202601310117.DDG67OO9-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'device'
#559: FILE: drivers/infiniband/hw/hfi2/affinity.c:519:
+		 * evenly among devices, then the first device device to be

WARNING:REPEATED_WORD: Possible repeated word: 'by'
#7858: FILE: drivers/infiniband/hw/hfi2/init.c:1943:
+ * It cleans up and frees all data structures set up by
+ * by hfi2_alloc_devdata().

WARNING:REPEATED_WORD: Possible repeated word: 'data'
#9539: FILE: drivers/infiniband/hw/hfi2/msix.c:373:
+ * @dd: valid device data data structure

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
