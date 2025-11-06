Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27984D531
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Nov 2025 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762434607; cv=none; b=qtEC1Gl+jCEbAZDSFdgs3d0DbT7gW8YgoJclPx2XleVROSb5F+RKUoCc2BYqDsBXV7edcldWkJlEm5E/OBuTTkx7l5kmyPuiAt5Nt760U1sEnxxNEQGhNoqPt44kRFVTF0SaeyfezGmloq2OTqhigQQQfEoaXJ2DxkRQwdtP8bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762434607; c=relaxed/simple;
	bh=6SV7JtssF8q8QjBgfKDXdp7k08MTrfAdisiaxbATDbs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ipk0E46DZqp8yocLADMQ4l5Y5GpxSMJWqS87hCpg7HIi4XL+BrRYo0U+ZhcNSMr02yX6vx54CndD5gX4FacsFbqltjuC+eVM3FcAab78/JjaycXX08MxcnoTZb5LS5CAOSQXTWAMNwcFmEd36BG2G+o3/rk6fTb0Hb3Dy6JUkIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CH4oAC1m; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CH4oAC1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762434606; x=1793970606;
  h=date:from:to:subject:message-id:mime-version;
  bh=6SV7JtssF8q8QjBgfKDXdp7k08MTrfAdisiaxbATDbs=;
  b=CH4oAC1mtEJki/i0zg7mhpUcCcYsrAjQhNDUFWUYJpw8Rx/6fbLS9HQ3
   YfyLhdVS+Q5SGhI/+XkmsNhxYnUqXgxfVPNr10KXeTv7c4H34l4JpqlQb
   BuKuJoNns0RrXRfJDrn938rSpxVsX7KTzw+NSd4pY4u2Q4/svHLvMjE6U
   U219G3n5DQWbAl6ETkpMCAlSCxrmAzxHtXYSATzgx9CZvQdm73XliUy4J
   +wfvqcGoHh6FsNQ2EtkQ4bNvwRVkLYcOzBzoJhCj+hIq4z3NNcgD2tUIR
   L4sJgwSotfUBuZr34pkqO3bSl13zTTJHdvISQAOQjJwDGXkoT07QfnOcu
   Q==;
X-CSE-ConnectionGUID: nEXK++g/RO67xJoz04ebrw==
X-CSE-MsgGUID: WHdvfabUTCOvytVoGxONgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64719321"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="64719321"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 05:10:05 -0800
X-CSE-ConnectionGUID: iFtK709ITAKzGyVyS/uObA==
X-CSE-MsgGUID: NIdWTBWtTnyiUEHAhA50Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="192923111"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 06 Nov 2025 05:10:06 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vGzkZ-000000002zm-0HWR
	for oe-kbuild@lists.linux.dev;
	Thu, 06 Nov 2025 13:10:03 +0000
Date: Thu, 6 Nov 2025 14:09:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [viro-vfs:untested.efivarfs 14/54] checkpatch: WARNING: Possible
 repeated word: 'in'
Message-ID: <202511061423.PwiwrOeW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git untested.efivarfs
head:   36051c77301534759fd96e906ea11c5d09bdf81f
commit: b77f12500f1a5085f851c24e0b0bc5c73f53272f [14/54] convert mqueue
reproduce: (https://download.01.org/0day-ci/archive/20251106/202511061423.PwiwrOeW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061423.PwiwrOeW-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'in'
#7: 
persistent in in mqueue_create_attr() and discardable in mqueue_unlink()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
