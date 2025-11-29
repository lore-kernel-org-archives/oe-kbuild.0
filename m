Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7861172623
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 08:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764405071; cv=none; b=VQU9p8Yl9jQt6tJ8MrHb9pS7TCjzaU4+MSWtNlRhZ0I0csikCGqbdyR0eBBfx2+5IYDIwoJsPIEG87P2bslMUlpT8lpIA+1XltBNTdtuwI8PfenC+gV9zKpb+Ove7ZCRB5PPjwp7SHRDE2x/Gt2+rU1XtqUfcU39sqWJuNho2B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764405071; c=relaxed/simple;
	bh=IBlmky0xp3GwFOrzPdN6gmi1E6hHxMD09PFggvEjBuk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gIXM9CxjjBC2MQvHCJdsnYZMZxpaM5X299vQRW/mmR3Pkweb2iP8PFpNZbgXhroRtWC+vqZQ97mnB3sYr2UGbA8f8U0W5wtmr3Y+oM4bszlmeLC39exYRKefNgJJeVfJEKYgjMMhsprpJqjzD3P16qKCLafDyNBkWqfe08iU0p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iqw+9daK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iqw+9daK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764405068; x=1795941068;
  h=date:from:to:subject:message-id:mime-version;
  bh=IBlmky0xp3GwFOrzPdN6gmi1E6hHxMD09PFggvEjBuk=;
  b=Iqw+9daKOxp6k3P02ERvOFR9WyppdV9T1M+6RKr7S4S0aZ2fx93moYD6
   z7sA/7HZm31BLHMdX73BGru886t84kIhqVd8smvsBwuOnmmIMcFFn390y
   N/JmjBpVQyfxHHqyAaEt+u8ACAIk1kRehkc1nK3RDqJ1d/c+gh8KIxVW2
   8lRnnWEe9SLibPcSUi68wn1vvxYkOWxnDj4K4BumS9/InXKCqPFhKB5sY
   9JrboYzpAzCpuZC/4MOMrmZASH0HmbdNqCKYaP7sRNX+bUcm70xSM1fta
   FZGF08rHLRrIMZegNjzrBv5WOgcl+PCFS2IEh4OLV1O6kvG/0OYVV2YFE
   w==;
X-CSE-ConnectionGUID: /Mc2BwgQRruVJLtbXjIHvw==
X-CSE-MsgGUID: qJty68nST0merVmRyqgIJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="70030778"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="70030778"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 00:31:07 -0800
X-CSE-ConnectionGUID: G7fA6n9yRk+OdbvvuMQmmA==
X-CSE-MsgGUID: uvx9NviFQAKOgTnVy/JiwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="197950545"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 29 Nov 2025 00:31:06 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPGMC-000000002HZ-0iQn
	for oe-kbuild@lists.linux.dev;
	Sat, 29 Nov 2025 08:31:04 +0000
Date: Sat, 29 Nov 2025 09:30:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Hithashree-Bojanala/Fix-refcount-bug-in-time-scheduled-paths/20251129-004207
 1/1] checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block comments should align
 the * on each line
Message-ID: <202511290924.GAASbgxO-lkp@intel.com>
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
TO: Hithashree Bojanala <bojanalahithashri@gmail.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Hithashree-Bojanala/Fix-refcount-bug-in-time-scheduled-paths/20251129-004207
head:   8ee530dead6af43832d4ba8c3cb82b1c5ad99be7
commit: 8ee530dead6af43832d4ba8c3cb82b1c5ad99be7 [1/1] Fix refcount bug in time scheduled paths
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511290924.GAASbgxO-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#40: FILE: net/sctp/sm_sideeffect.c:381:
+		/* Always hold a reference when rescheduling inside timer callback
+		* because this callback will put the reference at the end */

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#53: FILE: net/sctp/sm_sideeffect.c:393:
+		/* Always hold a reference when rescheduling inside timer callback
+		* because this callback will put the reference at the end*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
