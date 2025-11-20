Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D447E2DBF78
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Nov 2025 22:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763677620; cv=none; b=ftAu9vt9crIPwIommEhsbv3V44h3wUfrd0oO09OCxAjNjmwd2rjASNCxXmiC9JTDMB0qekd5pyU7rJAKbs2OitIpbzAPi+DjBnKutiR1GbdsfYgbFZJ97ssLrArg5Dyy+XVWAEXsvk2gQVh9zL/UZ4/l4HaNB4KgPXDnzjpVSOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763677620; c=relaxed/simple;
	bh=q9a8y6ZbL40Ysxu7XejLOs24Rqy/Uz5xoymCgXhlu+4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l8aLGXyIRkFWm6KJMBYKi/gB/4vGTJXXKNZ+r2O/QUp2L/p80ysVYF3GWKK/TOQStVusg3zBzA3boBYOXcfKRE8QAv8WP0SrI99Fqoe0Ju47grGCbeGUwxZ8PjDVoQfZdCSGk5ObODCfsQy5HR5anMl7raWdIhH7KlQO+dCFR7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgPOFOTn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgPOFOTn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763677618; x=1795213618;
  h=date:from:to:subject:message-id:mime-version;
  bh=q9a8y6ZbL40Ysxu7XejLOs24Rqy/Uz5xoymCgXhlu+4=;
  b=hgPOFOTnA1uNaH1bTtFoTL6MN1PdFSfuYWB/IUx0FVXqXoQgmGffSZ7k
   g13hiMG6rYZCHXkEQPQ8iA6dbjONBZhjLgXRTQm/Glq4dzpMVzoj4a+ep
   6wwVwn5uhccYG/fuMe9qQ3oUeyRbM9HjA1WlAHVsF4ug0kcOGQlzlHtjw
   Wqe3/25ngMf0UhdSQCtFXvEZ1iS+yqpTncxz1HEn+W9sIThAxhbNp2Go3
   DX27LHHpcsSLXaB4YFG36EDkn5oNSie+f6f86Le1tYiaFZBGnFtswJ2Y9
   a/tcN0VGCsTxIo0Xqjb56lA4L4juRkuu0ELtsSddddO6KwmK+pkGaxQVH
   w==;
X-CSE-ConnectionGUID: T33sBv84QSqEYSqWsoL8Cg==
X-CSE-MsgGUID: jDte+y57TEW34S5luvrjXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77233876"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="77233876"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 14:26:58 -0800
X-CSE-ConnectionGUID: JaTEOtaDQkCEa6JWMhsXuw==
X-CSE-MsgGUID: 0Ol4KlgFTpmYqB2frEoxpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="222442657"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 20 Nov 2025 14:26:57 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMD79-000000001Yt-2b0j
	for oe-kbuild@lists.linux.dev;
	Thu, 20 Nov 2025 22:26:55 +0000
Date: Thu, 20 Nov 2025 23:26:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [brauner-github:work.ovl.cred.guard.prepare 40/53] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202511202336.qTQLAotm-lkp@intel.com>
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
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.ovl.cred.guard.prepare
head:   64676d6627645d999fb10d936a6af2d7fa2a54d7
commit: 5040a02336335d27f7e8cee0eea213bbdfab8bc3 [40/53] ovl: port ovl_copyfile() to cred guard
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251120/202511202336.qTQLAotm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511202336.qTQLAotm-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#48: FILE: fs/overlayfs/file.c:556:
+		switch (op) {
+			case OVL_COPY:
[...]
+			case OVL_CLONE:
[...]
+			case OVL_DEDUPE:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
