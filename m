Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8591E5702
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Feb 2026 21:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771794679; cv=none; b=nGIcXdbIK9JGXBri1/SsRAldLOApgx9BZbvXanLGh8HKqLbfBEefBnemtzVnxwXG+ZfQdVdUmz+9sxirs6LCwskexpCpA7iQeIz7RBjLhrT25xa4kkp0JGN90AWM1qUwMaQUvpsDYP6mUDeJikWZTsatVUTSuOKjABW29KLPn0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771794679; c=relaxed/simple;
	bh=ZtbQq+TktYtlSLJACcNb/8uuqMf2SjUix/Wls3lefDs=;
	h=Date:From:To:Subject:Message-ID; b=Ipjt81tgrpnGek7/K/X08sSuxV4xqQNDethEfOoBWy8Fms5fAeL3qm6M7Zzy0biegPbJrKo5PdwZfHBwxInR1F337O4xoIS7xtsyGsZELMTQpLsParjA+MOpwL12YoGL6cjnGeHoGsnQiENSMv/8ShA06L5tovmLv9h9/obPcG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjzRZUk/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjzRZUk/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771794677; x=1803330677;
  h=date:from:to:subject:message-id;
  bh=ZtbQq+TktYtlSLJACcNb/8uuqMf2SjUix/Wls3lefDs=;
  b=WjzRZUk/7gPnaXWAUVK9JgGM0ANsd9XlY3ONCeN1ZNa/v6ztTbmi/puG
   VAj2ZwXWr6iN/r6K6OepMqRxqlPTG0UAI+OEbRR76rEu3Ft73MnPdA2lN
   oAt9XoOzWOc7cUaxH9UThIMclTemDO03P58SyC2OHdP7F+0l8XgxoScYz
   Uu8V3FwFdfzLX+X1woq3K0BXWBAYx/MzO8fObYfsO60m6duIjfq37Cs4T
   XN6r3khsg7a4qJI+dJATphPyxOyAY4IyvFNEuQ8gkzQu36PMgpvi/tT0v
   p9LmaJEmoGcE7fgrPklOA1IwPTQihLe4m7wt0V74mOxw7FkMVYE/bd4rt
   A==;
X-CSE-ConnectionGUID: 76iD6vu2Riqh4KRoA6+BoA==
X-CSE-MsgGUID: HzSOsLRSRxeOeEnd162+uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72975155"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="72975155"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 13:11:16 -0800
X-CSE-ConnectionGUID: KrfRzdmDSL6PyHTuo3u2Pw==
X-CSE-MsgGUID: cN2cpy9RSUyAZYgXmfPn7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="214469941"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 22 Feb 2026 13:11:15 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuGjR-000000004iD-2EwH
	for oe-kbuild@lists.linux.dev;
	Sun, 22 Feb 2026 21:11:13 +0000
Date: Sun, 22 Feb 2026 22:10:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 1/1] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'unneeded'
Message-ID: <202602222250.ZmV8kNht-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   c1aed1c2a0028f45dcc5d2dafb4b09182e3a3795
commit: c1aed1c2a0028f45dcc5d2dafb4b09182e3a3795 [1/1] fixup! bcachefs: fix O(n^2) eytzinger sort in accounting read
:::::: branch date: 10 minutes ago
:::::: commit date: 10 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260222/202602222250.ZmV8kNht-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'unneeded'
#60: FILE: fs/bcachefs/alloc/accounting.c:1092:
+		 * We want to drop unneeded unneeded accounting deltas early - deltas

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
