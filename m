Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E60267B07
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 02:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772679102; cv=none; b=JVZG+6hQOsb4kG4biM44d0Xhi6LOhLeVV0IgN9kEuPbuoBcEAI/GcE5JfJdGztbDASwV3vS7DGRY7AKydPevlfgs5VCjHDFBD6Pao04jCGChVLg+UPtwm8p0n7qsMpAQnyvKAfGU0wncYsXkOKnb1fMBpzgVIjqjRHNhWMPXcWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772679102; c=relaxed/simple;
	bh=Kfnc86azGH+cwot9kmBnsKJXHGyP38MhUBFAdhb/u/Q=;
	h=Date:From:To:Subject:Message-ID; b=IlgAhbGDwgz0XdJF+KrhVjx2BIi7teCIxorq4hynvcX36D8hh52kgziQVI9mWT2OrT1D84SJOzCxB5sgxBuoKQ9PZ/JE1MBu4S4pnmLBqtZzykUw9y+DIx3d1Fa19ZOAilM3tu5XbRzGZe6TTIEYT/dLvnk9klhvDVhpQSORvHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DahFtYXx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DahFtYXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772679101; x=1804215101;
  h=date:from:to:subject:message-id;
  bh=Kfnc86azGH+cwot9kmBnsKJXHGyP38MhUBFAdhb/u/Q=;
  b=DahFtYXxkP9CjrQcCOOV838AKruB4PHC6VkTb7WtWahu3WWc9+D9fq3b
   jQlsHoLbVMxIX+5TcXec3cdrkzUEQZ1fPby1tbjUS9+cLfPD2ZNv4CZDO
   wdrIgUY+xZV/ySRy0mBA7S0JBIq8vn6WK+/STs40SEtuw6TEswvxkZvhx
   jpF03RrDewuUdzue+nv1ZaMEP6fWF1jDIIx4La2eVQGgtkXhWqi3TUdQ6
   u57x8R95G4SGC2RA5u+5wHn44zNOQnVSmWcrRXL+LAIKoiFqZfxAflRgG
   Yay9zYZrGGoiOGiPUWOUlvsqP8xkU6Tr280KYJhpzRRyX6mOZgRTTtv/G
   g==;
X-CSE-ConnectionGUID: SPsBa+WdSjWKE/yQlogwUw==
X-CSE-MsgGUID: MqhUSfEUQAmzVDWTbZ6FXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73661652"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73661652"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 18:51:37 -0800
X-CSE-ConnectionGUID: 9RKC22feSseFdAEcN2tv1A==
X-CSE-MsgGUID: VMJ7yNUfTzuZA16rGSxdgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="241548372"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 18:51:36 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxyoI-000000001pz-06SS
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 02:51:34 +0000
Date: Thu, 05 Mar 2026 03:51:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 16/467] checkpatch: ERROR:POINTER_LOCATION:
 "foo * bar" should be "foo *bar"
Message-ID: <202603050351.AHnoajNW-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a
commit: 75d39a3ceebf5341f422373a3098aee1d54fb7f1 [16/467] char/nsc_gpio: convert to read/write iterators
:::::: branch date: 37 minutes ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050351.AHnoajNW-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#33: FILE: drivers/char/nsc_gpio.c:105:
+static ssize_t nsc_gpio_read(struct file *file, char __user * buf, size_t len,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#34: FILE: drivers/char/nsc_gpio.c:106:
+			     loff_t * ppos)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
