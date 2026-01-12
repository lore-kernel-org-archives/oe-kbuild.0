Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D092D7DF1
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 06:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768197693; cv=none; b=QBpZ68TdWI7ha8jXCP/x8KqENEW+cCXkVwza1t1INSdyn1NFGsyBWxf6mgbpb6YP1xrC34yZwMV5zBki3yab/pkGwmyWchmR71ttStGjNPPdX5WEDZ3NbGvOU90BzFniyetJBYh/P/icz2Gj4nZg+H1ItQH4GebBidGvYRLWzRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768197693; c=relaxed/simple;
	bh=9xtbqcH9ZEPv5M7yFKxvu2gUhFKt3MkQrrVZdThMdSQ=;
	h=Date:From:To:Subject:Message-ID; b=bmieaEGed7Js5mTL9VtmQtIb4T7n0OSWvI8s5yr79Dp5Z08lmFkNcqb9s7PHBw96cs/TtLKWDhIb1cHXF7RnA0jEgj1zRhRbD23IKHCf5vXx+Pa7D/5m0jErKtZHkLyDsC6aexqd8wkfnPrMp4CC8hP1v5E43sKlnFu+1NRDL5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhzXgm2Q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhzXgm2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768197691; x=1799733691;
  h=date:from:to:subject:message-id;
  bh=9xtbqcH9ZEPv5M7yFKxvu2gUhFKt3MkQrrVZdThMdSQ=;
  b=FhzXgm2QXJQf9ixlTGRrnpW3wAirVp0cM1bZIAANqzSCtADBB8BuYVbN
   wqenBzzkBrHlfcEQBytx2x7M5hkRdIFJ4PdnCdviwoxuz7Tg/0TvkSdzb
   OQj0UrjmraVLPTmN6eBbYxcZ2kWFxxPka8+Pj+cURfivyD4vfAUydlIQF
   eNX9h9Chmgz3ENSuWwq895RU4qDxykM9Os4rrWVhtIuJ6JH7G3I064T4w
   gAUIfPqiWXtTOJORvEN39wZ5Hw5cnnZECtShT5sKgmbyG2B4wUpkA1avB
   gDI1JG8pmXMpNG0rRBrqCmtOx+3XY9cBGuJpvx8s2NFZoxGYYhkR4vqnh
   w==;
X-CSE-ConnectionGUID: iBfQc82aToKa2I+vQGiaww==
X-CSE-MsgGUID: bVpWNHehRaihEAZFpMv7gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69623431"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69623431"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 22:01:31 -0800
X-CSE-ConnectionGUID: fjYe1mJ3Tiyqlg3Q7hTuMg==
X-CSE-MsgGUID: G3Qnkp2eQTetNSq2cbcTzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204020541"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 11 Jan 2026 22:01:31 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfAzY-000000000mT-2lT3
	for oe-kbuild@lists.linux.dev;
	Mon, 12 Jan 2026 06:01:28 +0000
Date: Mon, 12 Jan 2026 07:00:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:iomap-fuse-prep 26/34] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202601120704.ZrybT5a3-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-fuse-prep
head:   eae059691c32f9576a0786e2cdc3a8aa4e5edac5
commit: 02aee10c727cc2de83339411fcf2f78e47d87b31 [26/34] xfs: speed up parent pointer operations maybe
:::::: branch date: 42 minutes ago
:::::: commit date: 42 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260112/202601120704.ZrybT5a3-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#57: 
changes are logged with the inode and do not require the the xattr

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
