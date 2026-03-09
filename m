Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24646259C9C
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Mar 2026 14:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067532; cv=none; b=PBcaSH0YwpS+dBj+ZcP+Z+4o3DZ9QV8wm3Yzv+JC4l8UFTaR5aiI+kApzb/ra6WYPqK6JMNYiWSHIpew3EXLGUfp219swD6n7TMz2E+7EUXKTksSxsWl6HotFJKRZwLkuynWqYSKELt+YLi55DL06HcdzYxj0drz1aC5GQ5Oc1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067532; c=relaxed/simple;
	bh=H40b+jGJjx2tJz/XOQY3k9U9l3zOnkQkqcG3zZt1s2s=;
	h=Date:From:To:Subject:Message-ID; b=T+TyLH3vY9sVnDdcuWev/PLQUFgdowx5rfA3EFMVBni/2xj8AG5+XC16UR5yZXCIjkwrhPXsNVtFLsmi/Gt4WGz85cxxBIqYUT98ecDXu6C/Xbob/JgDgl/GRSsaplFFr1auY0jb/SQK7ye8VLb1Na9RncNujRP8UlxIcd5IJM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bh1emTxm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bh1emTxm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773067531; x=1804603531;
  h=date:from:to:subject:message-id;
  bh=H40b+jGJjx2tJz/XOQY3k9U9l3zOnkQkqcG3zZt1s2s=;
  b=bh1emTxmyszkL4WwP+Qo3f19kUiVVoV9uajhxRmGCTFF1ON5bZCn8pi0
   Jj3ETwQuT8lYCBAhJ5zOvm/l9Ai9/NRWy9oeSb1uBbZ9pEzUVI5mlWuJ+
   CHyWzcIxprFR7kaW6JWAutKRb+QhPHaYg1OUGTYolHCGYpdkjEOLCzenL
   fyDV5/McrG/8KuRYyjapX+bK7si5xffaZk6UxVS42X5M0pj5g3EMj32w7
   rH+dv4DZDGJcBuKazYjBJmGxC1Zz1HOg3k4d8UbANT9zguxRgA9HfaER3
   Jq/MQGaG5uXLd2Cf2W3yITrVrNQ4bR421+kq5gGf9xIJ+bADWv+Wpb4vg
   Q==;
X-CSE-ConnectionGUID: wTKVC5RYQY6kvRSmdeq7Xw==
X-CSE-MsgGUID: 2dBDAsz/QFiuaeiHu0xzxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73969305"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73969305"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 07:45:30 -0700
X-CSE-ConnectionGUID: 9iBlZ9nMRs6DAQeDuULFdg==
X-CSE-MsgGUID: 2poDTB8kRO2duoJIxNocoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="245723742"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 09 Mar 2026 07:45:30 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzbrL-000000002sT-3ltz
	for oe-kbuild@lists.linux.dev;
	Mon, 09 Mar 2026 14:45:27 +0000
Date: Mon, 09 Mar 2026 15:45:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [brauner-vfs:work.kernel.exit 3/3] checkpatch:
 WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Linus Torvalds
 <torvalds@linux-foundation.org>,', should be: 'Linus Torvalds
 <torvalds@linux-foundation.org>'
Message-ID: <202603091521.nNIVm8rw-lkp@intel.com>
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
TO: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.kernel.exit
head:   20f789e1244c9ee1b1c5d02152db3343b2d65ff0
commit: 20f789e1244c9ee1b1c5d02152db3343b2d65ff0 [3/3] kthread, exit: clean up kernel thread exit paths
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260309/202603091521.nNIVm8rw-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Linus Torvalds <torvalds@linux-foundation.org>,', should be: 'Linus Torvalds <torvalds@linux-foundation.org>'
#29: 
Cc: Linus Torvalds <torvalds@linux-foundation.org>,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
