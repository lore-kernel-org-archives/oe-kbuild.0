Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BBE2D7DF8
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 15:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331366; cv=none; b=ZrO7PZpnbFujmBdmhz8nt77D8baGROiY6inZXyO36ahYT6IrOPyM94EXqRbhrGz15r1Xk1Ak6RQ0Mx6UCoaA+Nv4bVakBlE1ek8+jZHPtxkZyyoVK2LQ7f+lsilQ3dbiQV3EA91svFvX9k4Tl49X8OQYy/lV3IL9ersbwx6MSBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331366; c=relaxed/simple;
	bh=7q5Kk4ytnEBldyROiaX8IUb383jpZdxh3cZ8kafTMCo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s/z+ZxQqHKVOYVgfMZDtEd3kExeOz7MMxi8tLjfXmkCGTPk54qG5qTTbVwWIhkkPeg+itFYLpl/VL4PgjZHs92GbrLJjHZGKd9SUiHtILtup/Tax42wxdTl7MnRgUAlJ/TLbGbtslMvGYOgoLjRWX/QLyrvyojSbaOhDvezEnLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9DFCzji; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9DFCzji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766331365; x=1797867365;
  h=date:from:to:subject:message-id:mime-version;
  bh=7q5Kk4ytnEBldyROiaX8IUb383jpZdxh3cZ8kafTMCo=;
  b=A9DFCzjiVBO/qhPEN5qMCSu93pdoedR3l3BsrdPFVd4AiIuAD4PaQK4S
   6T2wpy4iBuK8RhbTPgZXVMMHEDAvip1fpipdYkLl8e3ofLfzq5JRZBv0n
   ARV+mNMH/qkHnQmqHX3vvJIx/U0GJ+bhnyql3XmTNRmykZja5dgbQmR1c
   Q9xfjdg6c//kwBTEYatw9d/pDfnxkpx8878rF/mEReLwtd7bRYpiJCdaW
   ZUWdFAzVNp89ycZx/PfTVr7DXPYa3i1CbvyFyP7jwud4XSdOjATn5XWZK
   VZFkaS252vMIvOEFFOuFAOXQJ+EAk/Xr85t0CemQEZFAX268YgNgvYDhX
   g==;
X-CSE-ConnectionGUID: 1az3VPdmSQWcQpZ2BPi3rw==
X-CSE-MsgGUID: YSk58aICQhekM/qKuw/HHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67964083"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="67964083"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:36:04 -0800
X-CSE-ConnectionGUID: PfdnOoVBRr68y5I50+542w==
X-CSE-MsgGUID: op6I8ZjCT0GolBKZKvfUWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="203458287"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 21 Dec 2025 07:36:03 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLTV-0000000058C-02X9
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 15:36:01 +0000
Date: Sun, 21 Dec 2025 16:35:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 128/246] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202512211625.aUj0RAS8-lkp@intel.com>
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
TO: Sven Peter <sven@svenpeter.dev>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   a505a983517df0d2df38e87cb1898c518fdf9740
commit: 5f0c8cbe3240fff6a7b74957ae8cc80432ef1153 [128/246] drm: apple: DCP AFK/EPIC support
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211625.aUj0RAS8-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#599: FILE: drivers/gpu/drm/apple/afk.c:554:
+	 * which will contain the real data.
+	*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
