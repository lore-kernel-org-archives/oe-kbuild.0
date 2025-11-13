Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5902C324705
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069360; cv=none; b=FQcd/qYnNzO/XNzOzNtXruzTbyXragg6zMn9xC70egWgiemSj8f8/ycJ6XnJ0QVDg5QOBtxIiWe/Jqn8ZvW4Aee1baaKw54OL6zpMpvrr2CT0yWeFdC6EijThGZBIlComPGOCVd/INdatSxXLbj2oAixzcK3eLU/APOW+3cBwzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069360; c=relaxed/simple;
	bh=hFXnE54YRRbzALfRcC7/dAVz8L2yTdU4FESfhqE8pIA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nsW0nqPu7SdEy/Q9vScXHhQtmICB6uDkahfqdOrL9+VcswlcADHRLAYLzFhWiuX0JoziucGKl1I369QHrB4UUzrLUh5HgwQCR0+yJqcJ7Kfdg6knqoqSFZlDBnrM1BuH9lk6+SThCBrFQnTIGeg7uy8pc16BkCozMoxr1h9QU0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXw78FkN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXw78FkN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069359; x=1794605359;
  h=date:from:to:subject:message-id:mime-version;
  bh=hFXnE54YRRbzALfRcC7/dAVz8L2yTdU4FESfhqE8pIA=;
  b=LXw78FkNYW1J0W/emwJSuRXASkWYWotHHS7RI/26nuIjtT5GOj6UkT5W
   5zgWgwFgqRDbxV0DXzA02Ut7unmpMkhmyRIpQGRWZZx3ZRW83ZYtUWzIZ
   XgNjR5Cqn/YXoWTohXTFNmgGzdBzMeQPcc9o0zr78rql6RfYvdQKAx4zB
   li2FX2p5yqMCxs4sC7gTwDHxl0sJwbOAIWpXsBdBikPTlohdFpB3YgpaE
   A9ELRl3FJUt+b4TqDECmMIvpTsWhO2UaqVtXR5SS7Et0cOFf6nD9SM/70
   CUa7k5ZW6h0dMj5fxG/q5nIjfPkBvA88YH9IUiEcx6thK0zPip53I/3FU
   w==;
X-CSE-ConnectionGUID: jN/95EXlQCq9OS/PLXo8Bg==
X-CSE-MsgGUID: 6Jd204PLSf+Uc74ArB1eLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="90637561"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="90637561"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:29:17 -0800
X-CSE-ConnectionGUID: uz/DkxFbRpms7Jie7QhYhw==
X-CSE-MsgGUID: kcclqUi+TdGZz4KD+Wg++w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189244555"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 13 Nov 2025 13:29:17 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJesU-000000001Ae-46jJ
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:29:14 +0000
Date: Thu, 13 Nov 2025 22:28:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 845/867] checkpatch: ERROR:SPACING: space
 required after that ',' (ctx:VxO)
Message-ID: <202511132014.SSf6qJM2-lkp@intel.com>
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

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   d6f7060a241d49e7821348ad12081f19d3581b92
commit: 463dd6744558757e5667fae2d5da73c918424f1b [845/867] bcachefs: REBALANCE_SCAN_pending
:::::: branch date: 3 hours ago
:::::: commit date: 20 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511132014.SSf6qJM2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511132014.SSf6qJM2-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxO)
#40: FILE: fs/bcachefs/alloc/disk_groups.c:477:
+	scoped_guard(mutex,&c->sb_lock) {
 	                  ^

ERROR:SPACING: space required before that '&' (ctx:OxV)
#40: FILE: fs/bcachefs/alloc/disk_groups.c:477:
+	scoped_guard(mutex,&c->sb_lock) {
 	                   ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
