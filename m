Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB6E39E193
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Apr 2026 22:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513793; cv=none; b=JenTs3bJGT+T0EkNXoUYXOtMz5LMRq0r0ywTHb8CwnI5tmPYR1yZ3x7/i9q8mKeWU3Rpbk+kfFvPHuIwLf6irxeQqG4jZ/ZRMda3FDB2iWIpTW0hw1E6Udv1N3c5r8xNJjaPQHss7j49XB7uko2p6iIXEWn5gvDof5V2GjGUm6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513793; c=relaxed/simple;
	bh=qDVnPH9itE5JW0bGYefX6+Lt29+ixsYEEH5pdWLVuQg=;
	h=Date:From:To:Subject:Message-ID; b=NetTZQUozIXy0aB1jujBze+qRNfgmUXbaLqW95OtpdhrLJzhvLCss7nbEg+lo85cD+84+BR1iA1LkxsI87rWyTL3YB8wBqdPYEjoAZ+Ktsk1KIOV41irs6//lGnunHKgRUnw5uPVo2n70BV6iRDLk6YqiCtP/bEieiXDn3bYp/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PHFS5Vps; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHFS5Vps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775513791; x=1807049791;
  h=date:from:to:subject:message-id;
  bh=qDVnPH9itE5JW0bGYefX6+Lt29+ixsYEEH5pdWLVuQg=;
  b=PHFS5VpsT45bW1cw/WdQd2KD0+lwZ9pNHyLPuudsBOharPBQrYReylN/
   phE1i8gcgw2gqapckWqRg7gOj5fIJA50TS4O1GeoJfoCfj4HBFwPBmtjB
   XyEP5wJdxUyeKahInHNQYEYUkLzVviCm70mBUxLClSlMHe10T946snqVM
   Ddih8aI4N0C/6dc1xKTFkQzLJAJAhKkDkg/yx9dBaMv+ycerfYkcSl7fD
   gXB/A7euE9ysEfdMT47r149qxabJU9+/iqmIPcdugRdTjR6o/YvCyCldQ
   rS9cZqrU0ify99XY/j7Gj9U1gOom/5W+OAmBbmEd7LpD9zS0+lgk5DPGF
   A==;
X-CSE-ConnectionGUID: ufQiC17uTcadbJ4rdhdvpg==
X-CSE-MsgGUID: zPw8hgLbSZ+61O3F2dEnWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="75641542"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="75641542"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 15:16:30 -0700
X-CSE-ConnectionGUID: 1cOCUvWwQeiZ2An4pSjD+g==
X-CSE-MsgGUID: WmTHGdYtSZKWAgLRW2d6Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="221413370"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 06 Apr 2026 15:16:29 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9sF9-00000000AAj-0jPG
	for oe-kbuild@lists.linux.dev;
	Mon, 06 Apr 2026 22:16:27 +0000
Date: Tue, 07 Apr 2026 00:16:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 32/51] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'to'
Message-ID: <202604070044.B4kwpnD2-lkp@intel.com>
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
TO: Zach Brown <zab@zabbo.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   9a0627207ad856d2a5eb09f3458afb1e34ac10a3
commit: e8faf8efbd840cf2ae45ee96bdd64d0131fa07ad [32/51] rpdfs: dirty transaction blocks individually
:::::: branch date: 58 minutes ago
:::::: commit date: 5 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260407/202604070044.B4kwpnD2-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'to'
#34: FILE: fs/rpdfs/block.c:1301:
+ * used as we dirty blocks in one transaction to to ensure that they're

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
