Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ABE26CE2C
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 19:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454628; cv=none; b=DmFsE0C/4NbP8AGZkQGvgeQ6SI0k7cldYznKSc9J87NCMhmu2o/Hvw7xzQYe2eanfYwpHxPt/VjCMw/aw0GhzkawGFVuUXl2hvNqvDOLbK5y4jukI/ocqGYX1nTQZE2/RthXzgMuPh5DRc2VW4XVe9L9d1j8bOAX/KeFSGr3cfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454628; c=relaxed/simple;
	bh=NO5PSo1W7a+c95+aMauYSepmrKtPIaBet/2WjSrDhYI=;
	h=Date:From:To:Subject:Message-ID; b=KXB9RirFCcqkQu1wOGpF0CnlnNUcie7l02yDbFwR9l9Hwe725r8HHE0LINxw13hoBtsBtagxAypKpkcOTV433qZqB6VWQ5Mr0aPhXgKGccOjGK08FsIibLkylJeT0swMVHurwN/2fyIg2NA2N98qQi1bdO2x4KdHGdIBPuvJ9/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/qyxHN7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/qyxHN7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769454627; x=1800990627;
  h=date:from:to:subject:message-id;
  bh=NO5PSo1W7a+c95+aMauYSepmrKtPIaBet/2WjSrDhYI=;
  b=S/qyxHN7c1vpmA69iSkqg+lkKqVtO/nkegs4wFXYT96SRrKVff/MTkiU
   XMpF/E0GG032ydBVkT+mRaT+zzso/2rQxxLNLlPAXU6wOwCThvPVqNkxu
   Xs2WfNckEWXNUF7o1nfwhYIZ2hrUChuhty/IHiLp8A6n+KYAlC8Pm7EOn
   oEXJbnxulzWYaqWOWnLczVVONfNpVBFmQcHJmSKAw71xzxoNL5wuoKvyK
   EiGdU3YLigAl+f7W03JuO8+up9ooG08r+PGzTx94q+Fl9xLPUafw+D3iz
   iBr3mjo+JFs7CbCE4XnOkP3FWfDrwTLqX491HYwmeZEnElw0Dw6uCaAsm
   g==;
X-CSE-ConnectionGUID: Rj9wh2ngSRalNgUoqWYA8g==
X-CSE-MsgGUID: cQarj9n1SUKienE/Qm+OiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="69838653"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="69838653"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 11:10:24 -0800
X-CSE-ConnectionGUID: OH3qTQkQS0ibS/A1vH0Qvw==
X-CSE-MsgGUID: i8bIDpnGRB6jyb+jI0CcHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="206881386"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 26 Jan 2026 11:10:23 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkRye-000000001Zj-21iv
	for oe-kbuild@lists.linux.dev;
	Mon, 26 Jan 2026 19:10:20 +0000
Date: Mon, 26 Jan 2026 20:09:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jlelli:upstream/deadline-kselftest-b4 2/7] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude
 claude-sonnet-4-5@20250929'
Message-ID: <202601262034.fi7iDVjP-lkp@intel.com>
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
TO: Juri Lelli <juri.lelli@redhat.com>

tree:   https://github.com/jlelli/linux.git upstream/deadline-kselftest-b4
head:   aea63057473e6e0111adc778d8eb9a897137b840
commit: 259ffebdc63f7e8edcf72f80b62560125644ffde [2/7] selftests/sched: Add SCHED_DEADLINE test framework infrastructure
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260126/202601262034.fi7iDVjP-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude claude-sonnet-4-5@20250929'
#30: 
Co-developed-by: Claude claude-sonnet-4-5@20250929

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
