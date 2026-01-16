Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381993321DE
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 01:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768527854; cv=none; b=T/cINOK0xl8xfUQFC+GiLdkdKm16EZx4oxgrl7riRc9FylYTKE3cgdoPdeC5c/nw+soyvQUNQvfSumbH09YXmweY0cpsdsenMw1/wwonqibJPocyvpzHoMR3owwIMvD62knOzfVrL2OTPVjUoD9ARi3+8+TyIo8LWX7Kt3a8gTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768527854; c=relaxed/simple;
	bh=Na4hVXaUH8nm4uWClq0PylnCKCsWQ0J3+CODwqB6R6s=;
	h=Date:From:To:Subject:Message-ID; b=EarhJrlPVuZfURH8kDjMYNUXU7T3Dh55hVMAHGuivbd4Xoaetd1hFe6sLK0wkTu2E5QgfMIl4fUAhKd7rAJPsH88JK1tdi0inbrD08mtVIVd0R8EnaY5xuf9wXLW4lsNXhGRQqzs0MysLGIPJHc43RzOMqhHtpaJyLdc9cyNlG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fuknbfqt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fuknbfqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768527852; x=1800063852;
  h=date:from:to:subject:message-id;
  bh=Na4hVXaUH8nm4uWClq0PylnCKCsWQ0J3+CODwqB6R6s=;
  b=FuknbfqtxjqlFXXDZPu7guMt4aXRr1SGVB3BURe+X3CNeVa6ge4v5GzU
   i/sJzuMpi4avZlFYBWBrw+3YmjgCW+MiAiXdTRiB2troYV6wVXuEoNbgr
   WzVE+htJy2qBXlwVKXw8WNtr6L6gk8gIGilmJgPMfCwv/wOzYQ0VHoKaK
   0521eekbpxbGR62L9iAWSIJNMBVDLw1H4jA6S+ngicpX5XrEoWl8j7FOY
   rvSHCavzOnHBkE8i3SnHCscqfSN+GMDC/KffXHnfjqYJ8VNpoHs4S9SYw
   Cqda9u2JdL6ZKtEqFDJ1BZil7YHpR5WeUX4lsMDKjXYqxIskBPq4W38iM
   g==;
X-CSE-ConnectionGUID: tU6CICKZQSW9SBlt/bsdVQ==
X-CSE-MsgGUID: QxlCRqG8R9KDb/I0N7ch5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="68855292"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="68855292"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 17:44:10 -0800
X-CSE-ConnectionGUID: 8q97JJeSQJaTVCWcOHdKhQ==
X-CSE-MsgGUID: 0Hd+GDSHTrCJmR2jmn06Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="209610049"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 15 Jan 2026 17:44:10 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgYsh-000000001gj-3akC
	for oe-kbuild@lists.linux.dev;
	Fri, 16 Jan 2026 01:44:07 +0000
Date: Fri, 16 Jan 2026 02:43:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:iomap-fuse-prep 27/34] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202601160253.hUHVaMSF-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-fuse-prep
head:   32f48d48c21139cf1c8b2101e507f127fe08f94b
commit: f350b9488e59ab620ebba1b186b8d0de0a6cd29a [27/34] xfs: speed up parent pointer operations when possible
:::::: branch date: 37 minutes ago
:::::: commit date: 37 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260116/202601160253.hUHVaMSF-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#57: 
changes are logged with the inode and do not require the the xattr

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
