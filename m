Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBFD301498
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 09:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764581728; cv=none; b=p+drdLqan/drtsU9Iu0QPpiCnidOkZAmgsMpaaxK03kr73AHJeH3iNc0Ecc1zbYKbzW5FLJw5v8RJS44DoqkrLqnl+uRKSUKQ5e4sxt3ntt9YKnZ3vlMX2aI9UAksiCgHsxMIUR8rSEuBz8QYhnFx/J0Pmr9aXVB1F1zFNssiUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764581728; c=relaxed/simple;
	bh=K4bFZ5+2q5Q9LzBg2wUY9aadGIOJQqJLoMBO4hdj5KM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=saSezNAZIB0Skj9Qj9kSH3kO5RQpXy5sM4M8gGUe/cWYE44WyGJ5XLsy0l4daO/Pvn1Upu9bWnIRMo+6gJnYgnykuYNdl1BQlY0GT5lRIqkIYxXjVZwZIIVItzkmRjmIp1mHfBrDZeBeTVjw/gdAYZgVLk9HQJlrcDPPSoHnmPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e9CZgKqj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9CZgKqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764581726; x=1796117726;
  h=date:from:to:subject:message-id:mime-version;
  bh=K4bFZ5+2q5Q9LzBg2wUY9aadGIOJQqJLoMBO4hdj5KM=;
  b=e9CZgKqjSV1gfK1MMkyGYat/0e/gsJEztp3QWjJ1wRiZb17U3m3k1DWm
   5pV684j6mUtlQ3yUP8qtNUE4s7xssVgG1XHK1oXQJK+0vzoM02naqK8+h
   /P3HqSnPp7NfcAG89MSkOKAf4xQB/N6cu6XW/k6WgJpGRZ1B+jrZZl/jH
   XFLJKRlDz6FPHE25VTRteh0MJLwjPj/wzhUZOoKZRPAxWcpis9kEM2KAn
   auXmRCAk2AFJs1xADbI+ydYxDC11Pf7eNUrYLbxrVkUXSyurxKd+9//0/
   CUuyo+AKxG4hy31bAx7cnZJCobX9vUCWWt7Izz+FLcQlr+J9xZaFfF6eW
   w==;
X-CSE-ConnectionGUID: T2DoGnraSBSG00jEr0XMPg==
X-CSE-MsgGUID: RoZp4KzeSM2OsHvRykBmdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66228316"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="66228316"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 01:35:25 -0800
X-CSE-ConnectionGUID: gSUzcC3CRM6zrRRaXiDXSQ==
X-CSE-MsgGUID: W3lzmQe4QpaFBAn9SQ53Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="231325697"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 01 Dec 2025 01:35:22 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ0JW-000000002fR-2I0I
	for oe-kbuild@lists.linux.dev;
	Mon, 01 Dec 2025 09:35:22 +0000
Date: Mon, 1 Dec 2025 10:34:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [mingo-tip:WIP.sched/misc 7/7] checkpatch: WARNING:PRINTF_L: %Ld is
 non-standard C, use %lld
Message-ID: <202512011028.YBNtbGjZ-lkp@intel.com>
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
TO: Ingo Molnar <mingo@kernel.org>

Hi Ingo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.sched/misc
head:   450273d82703a32ac5bb8f35bf19f97a92e39fc8
commit: 450273d82703a32ac5bb8f35bf19f97a92e39fc8 [7/7] sched/fair: Rename cfs_rq::avg_vruntime to ::sum_w_vruntime, and helper functions
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251201/202512011028.YBNtbGjZ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:PRINTF_L: %Ld is non-standard C, use %lld
#51: FILE: kernel/sched/debug.c:831:
+	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "sum_w_vruntime",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
