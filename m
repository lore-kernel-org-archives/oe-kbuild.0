Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE1126CE2C
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 19:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454626; cv=none; b=sOrKDnS0q8nWRMQLq+8Nzt3Hey3VPmNt7dSg0BLBCogQV4uBs55+30ZNEgixI9vnQVhdN8vmy14bN245lj6Xm0YX230VyLkr8XgTCz4Q4q3v8pqvzZuGp7jQKPSnsQgdcH77h2cch6QSDQ87GhVv/w1NuwA3k1mXu6m5BZ5uCMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454626; c=relaxed/simple;
	bh=WUZ2PCEazUfOUu2RG3gnnLCPTSJvdMtiw5hXIy1rizM=;
	h=Date:From:To:Subject:Message-ID; b=AAclcCOXFSlgSMe+wiLgQTKXl1N3WKd9HOXeFtokIYO/qo/RmomNUSJ6m8cpmL94G0HQNUQoWGzp35FI+wkRZvi4yu+Yro8gxqLo2Zj/9TL1uOX3iHed8pepIJ8VB2FYaAx5nZV+VKd2lJffaiW5MF9mav/iS4KvI9xx3dqFeQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i0ls+9eI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0ls+9eI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769454624; x=1800990624;
  h=date:from:to:subject:message-id;
  bh=WUZ2PCEazUfOUu2RG3gnnLCPTSJvdMtiw5hXIy1rizM=;
  b=i0ls+9eIQVhcOdKYdwviIRVAARnZeiIlOn2hjQoZlqYzcc6sY+KA8Jci
   GBNLmBu8TB0VWl/QxWhJ5CUduJKYTxRTAdc0cuaAhJXZMxSmDnNAhM+1M
   zII+UAAbFKeEwGES866XPJcOlf8CYiClp8nvcPZdBx8c83wLHmlWqwKJA
   ov3IfmkBZJQkVTOg+ypZtRhenI9Q95mtqkbGdzdnUjV5zjzgm8XbNsIZy
   P/Zhj+2XvaXW2zOVbpL/mVwwIO04S63Y7B4QjSJjCF5nxNjHYOb0+iRFT
   9SNwmLGmAHpegff8K/chChz3gQzqwRWcLW2e1D8xWql2NbrN1Q2vLnY6R
   A==;
X-CSE-ConnectionGUID: tij+FmHeR32Bxet97HqFSQ==
X-CSE-MsgGUID: 8CPo6Nq2QcaJ2pudpx6Kbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="69838651"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="69838651"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 11:10:24 -0800
X-CSE-ConnectionGUID: dhhBsuXMTViVq8MwmDRDTw==
X-CSE-MsgGUID: munRGzLHSAq6Eq67J4KRyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="206881384"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 26 Jan 2026 11:10:22 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkRye-000000001Zm-2CwD
	for oe-kbuild@lists.linux.dev;
	Mon, 26 Jan 2026 19:10:20 +0000
Date: Mon, 26 Jan 2026 20:10:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jlelli:upstream/deadline-kselftest-b4 3/7] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude
 claude-sonnet-4-5@20250929'
Message-ID: <202601262046.yeSUZW4z-lkp@intel.com>
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
TO: Juri Lelli <juri.lelli@redhat.com>

tree:   https://github.com/jlelli/linux.git upstream/deadline-kselftest-b4
head:   aea63057473e6e0111adc778d8eb9a897137b840
commit: a12a5f745e9f62414dda09391b9763286ae1b3b6 [3/7] selftests/sched: Add SCHED_DEADLINE utility library
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260126/202601262046.yeSUZW4z-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude claude-sonnet-4-5@20250929'
#49: 
Co-developed-by: Claude claude-sonnet-4-5@20250929

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
