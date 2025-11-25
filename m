Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C679B29B8E0
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 21:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764107809; cv=none; b=nPdYGfOy1+MwfFmCxfwWn5cVMhOaMMYh+W9MhHzOHS7a+bNYqVBxQs8hnGUlqAg4FJIlzKYFCQSYVgvC1DpibfRHSxGtr7bW6Bp6GW2esvhPhxDyXW2V+1VZXbqF0MKOCgRIPTeYrpSDQ+fnouS4gQEXAlzLz3N/0HdF3FbwnHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764107809; c=relaxed/simple;
	bh=naK7RUabrq6ldByOJIbv+yvCp+uAdw7SjwAJ/IfdKJ0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e6NYW+nt63geCQU1F/guN8LZXTKhcHiNu1y7h0CalEx8zx6KZKmwm1GjS+bZsQGoz5mO5xqLEzyar4qNLBTc4LQe9iVYIbq68C+9VZLVdfo7uJnC7gt6pBliDhzJB9BPrK690bH8Atkf9S8h33agr4SeloTffyd1tBkKLeP1rqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DtJHca3v; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtJHca3v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764107808; x=1795643808;
  h=date:from:to:subject:message-id:mime-version;
  bh=naK7RUabrq6ldByOJIbv+yvCp+uAdw7SjwAJ/IfdKJ0=;
  b=DtJHca3vyncSzYUEvTthDnBK+hWRNuKATONE7Oh1IUMXvVgQ9y5o+opq
   goch0lH7CFHx3FWo2AtZGnsvG/xtptxz99iVQWxO8xWPGEnl+QR8X2+j8
   stvlTwMRjlGo8ZIjS8rnBjrlqFIdy6ColjFPp4evAqaCyw2hoDm1DwV4k
   tSD3kgmGmrIfxliGKDOOnJ+r3vzOZo99uVe5nNHVo7YJguIFckYsthBud
   kDppeQVqI1O4Z4cLcf+0aU4lSQsb8zBlcjL9BxtmyxbicwXXlN9rU40fm
   bmwpjyxRmtv6RTHdQWngFgGlOJ+O8TXuTfDF97pkeegnPwr+WnhZ/uW4t
   A==;
X-CSE-ConnectionGUID: xe5bVwK3RHS2vnLWLOLA8A==
X-CSE-MsgGUID: MX8VVzDDT1iBZ2BBxsrOGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65139575"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="65139575"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 13:56:46 -0800
X-CSE-ConnectionGUID: wqRnxlfxSIOa71jnOMoKGA==
X-CSE-MsgGUID: P1AjyduqQ02EHdEeSfs89Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="192659372"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 25 Nov 2025 13:56:45 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO11f-000000000ZR-16Zr
	for oe-kbuild@lists.linux.dev;
	Tue, 25 Nov 2025 21:56:43 +0000
Date: Tue, 25 Nov 2025 22:56:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:iomap-fuse-prep 17/26] checkpatch: +#define
 XFS_IOC_MEDIA_ERROR	_IOW ('X', 70, struct xfs_media_error)
Message-ID: <202511252227.HPBs0lqg-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-fuse-prep
head:   3f83b91c6f2ee77a9f0e471c30f0dd9b6e7f7a19
commit: d01e5621744c4014191dc3f77e09c27b3a449e36 [17/26] xfs: add media error reporting ioctl
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251125/202511252227.HPBs0lqg-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#72: FILE: fs/xfs/libxfs/xfs_fs.h:1220:
+#define XFS_IOC_MEDIA_ERROR	_IOW ('X', 70, struct xfs_media_error)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
