Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9949F480967
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 07:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769068304; cv=none; b=Rls2nkauKBI81tJfEamVE553EjJCApMMZMfdfo5Rr1qWSLlntcIiHQyhHWcLr1B9So7sE8hzlOIhn1yoT4czSGd0XwgxGS6lxBwFgjEl6YylvqexakJkORMk2V72m/U96RxZj+MQvdKcIa+TO8L6PdzXxR4i4OE8akcBcoCJaiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769068304; c=relaxed/simple;
	bh=1FxtvHrgr4XLul5DvS9OeBDyfSxfo+4mNhLcCBpIUtE=;
	h=Date:From:To:Subject:Message-ID; b=N8I71yczQb1DTkYcNqadPxybYSuQQKgJeSrd2tGjSiZc8lGWCW6J8fzrJ/hIeNSYvL1LU6S+0kkl23/LpFHr6Xjq/KrNpH42vbPdVBR9G6rZXHtWC245M6pgge/deE/Ju7REIX6cG4tVw1j++3/KDf8dBvJHgechdhZkmywTqAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DpQtFj0b; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpQtFj0b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769068298; x=1800604298;
  h=date:from:to:subject:message-id;
  bh=1FxtvHrgr4XLul5DvS9OeBDyfSxfo+4mNhLcCBpIUtE=;
  b=DpQtFj0b5JNEGnSnHRtiV73QA7VGQuzWDP6EDTM7q1QSPIGH34Q/m6Ox
   /EIwmRmI9nell2MsZYVclGqZ8wkXcK6jiSMo9gKE91EzVWpaSZt+MZWEo
   i3lmIXQjfob8LqAkzCf8FWfdIBF7BbRMik/kXDtAMk0n5MO+O2m/vNwyi
   mBTlQjWwjpnBw6je3b7+evlmG/G+lsoIjYpchMZat0neW6GOhNm9p5Mdu
   8hTpdlONNBgR+vIBrFjqqeAxte3d+MummwcUVsXqE1HOrA7WDU/c1djCJ
   FOJBq530U4yqve0ULH5NHJGf3u9pcx21Y860b+acNxEE+GEzqbO0+CFcq
   w==;
X-CSE-ConnectionGUID: mq4FDisyQQ2NqlsfY3d25Q==
X-CSE-MsgGUID: H+0vzLHxS/mdO1dPfUKIJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80928717"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="80928717"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 23:51:33 -0800
X-CSE-ConnectionGUID: ccPBqvVNTFS+sX+tr8t6aA==
X-CSE-MsgGUID: V2NgB+MrT3iZo7jy1oD0cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="206999190"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 21 Jan 2026 23:51:33 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vipTW-000000000SD-46mR
	for oe-kbuild@lists.linux.dev;
	Thu, 22 Jan 2026 07:51:30 +0000
Date: Thu, 22 Jan 2026 08:50:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 5/5] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'that'
Message-ID: <202601220828.H75UXqef-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   64442598acdae4c1a278f6a6f236492aa73ccfd3
commit: 64442598acdae4c1a278f6a6f236492aa73ccfd3 [5/5] modsign: Enable ML-DSA module signing
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260122/202601220828.H75UXqef-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'that'
#13: 
applied that fix this[1], but it appears that that will only be available

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
