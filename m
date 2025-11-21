Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1172FD7D3
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 10:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763721432; cv=none; b=J4Feqh75GGRyFqFvhFb7RiC+TUoimnzeu2QDBjVkBpRtbiPDPVbAU8fF9/Uu+HAeYe8Wsse71kiuVsoRGGHq1v8oVx6TYYbdd/FMLvLSG/38FI+49Mp+uPgvyGunPY/orhGhx4nQebbBqdySXA7DLa5CycpgmSSTNvYYGx6w6T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763721432; c=relaxed/simple;
	bh=yFUg6y61LPIUtw173oZbKKjMCFZTm94lvmviTiudbqY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BDR3JWC8uOBuyRu0bEXuAdOo6TZI0AEUKYe2uviD9Vqi9/ZIk2Soz+x6J9j9Pi1KAg5uahX9uTNDqP46mb7nGl83RyrVCrgixBSzwmmNdodZmDVLJTDgY7VMyj6Vw2NVZrDRd7GV2VcnkVBsE+dosnE6FGcUr6rwQ+9cNqVnMpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpjvOTdo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpjvOTdo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763721431; x=1795257431;
  h=date:from:to:subject:message-id:mime-version;
  bh=yFUg6y61LPIUtw173oZbKKjMCFZTm94lvmviTiudbqY=;
  b=cpjvOTdoRX2fhyhhkHtRueASSXkszDEphefFVTmTzOKJXqJ37ieyEL+9
   z4QDO/M7unAsDbb2+g6pzCz0jbXRXP0bp8KAQYcVg1lNiSfpvutcoRUty
   OY7phcJcRr3zp+/j81TMBCXb0AXvxMPvgEN5aID6HVKih3OMbPv6YkXWE
   a0i1fEBgC5FxBt+95wQHXhhx4d0hA5V+K7RW9UCkP/EPaqJc3SXHmUgh0
   xvGlhfOZQ266EUewutBCcWIHfWP5qeNB0+KkAzVboY80CyjVS8YgjmOwz
   +lYiz3y6Ac0jNpL4bzentds7oy1Sc0tds+t28JaNWjkbRXdk02lJnaEZ4
   g==;
X-CSE-ConnectionGUID: wtpvfwNpS7GXHHe/x3r+fw==
X-CSE-MsgGUID: lqvI1a8cQNKGlgdMRIYNLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="91292875"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="91292875"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 02:37:10 -0800
X-CSE-ConnectionGUID: E5QuL22hS6+O6tJJXK40Wg==
X-CSE-MsgGUID: U1eZrKJXReO/QtQcDxnmvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191451412"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 21 Nov 2025 02:37:09 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMOVn-000000001l8-1eSL
	for oe-kbuild@lists.linux.dev;
	Fri, 21 Nov 2025 10:37:07 +0000
Date: Fri, 21 Nov 2025 11:36:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [trace:trace/for-next 8/28] checkpatch: WARNING:MINMAX: min() should
 probably be min_t(unsigned int, ret, buf_size)
Message-ID: <202511211103.QPbp2OEY-lkp@intel.com>
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
TO: Steven Rostedt <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   bc089c47250e8923892873809471e54e05919d80
commit: 299ea67e6a2b3d0d4b707f45b8c66d8b4bbbf2c6 [8/28] tracing: Add a config and syscall_user_buf_size file to limit amount written
:::::: branch date: 7 days ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251121/202511211103.QPbp2OEY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511211103.QPbp2OEY-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:MINMAX: min() should probably be min_t(unsigned int, ret, buf_size)
#283: FILE: kernel/trace/trace_syscalls.c:587:
+			ret = min((unsigned int)ret, buf_size);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
