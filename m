Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F52F39D6D6
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Apr 2026 21:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775163930; cv=none; b=M7nAfohwn/AT5Vay4fNKoH2Qf3yxCUfNfKYEDam+wgQJfnDo4BfW/03KFj1PZMgClxq+t0CiGNm8X1+VusWLuIu643K14VOa17S4rXZw5R3HVMgKb0Q5YFXsUXg0KHaDGQlPY36nZRFhH/KUcxhN/e1vX5P/SkM7XTS0NscxQtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775163930; c=relaxed/simple;
	bh=yDkW+P1LfRVJpFtKshb1oCRCushiAgqu9LXjgbG77fo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=A9YPgidwgNaLz7JolB0n3eh/nhJL2w1nZRg2ZuS3eZKwtuXfXchnO1npocIyIljjw1KUfuXDOKEdFcMOlwSPIOiwWPZixhjwIZqEqNMbjkqMiP7iETRmvnVsLcvOm1RMmDz8rCdWt33aA94QHYINoPdrwgW4tTXJF3QscDJ7CGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAQVHqK4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAQVHqK4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775163927; x=1806699927;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yDkW+P1LfRVJpFtKshb1oCRCushiAgqu9LXjgbG77fo=;
  b=SAQVHqK4oLBs0o9qd7DtT2aVLPnl+tLF7LSZHoSg/I5bvmGlyRyH/bA7
   TsBb82uNbHUo2rRWRcFZgqOygk+LGFXSq91kOktIblYdw2exp0x42V7+A
   yBAol17MGQZjDKE5KqCu429jM56NAE7jKhSzySebBPraqzldTzzqLkhSP
   po6sCkcvK6fopZ9NMuxdjBr/4zZvLNiIz54iizHOUAqhgoJ7MB/he1qD2
   DSV/K0PRAeueRR3ilWKrd1VW0O905oNEzfLhkIn4Zb8zRYZqve0/sss9v
   yiub6FF0MUbur7rBgh8iiKSCdHTuOhJO10NMQsTqU9SW4L6XBopo033VQ
   Q==;
X-CSE-ConnectionGUID: Re1IQj/6QYuzds1A0HyBMQ==
X-CSE-MsgGUID: fQCh8gN9Ssi75Zz/AL0oeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="87624110"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="87624110"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 14:05:26 -0700
X-CSE-ConnectionGUID: J49c0+EgR0Cyj9Gvu7lxNw==
X-CSE-MsgGUID: Kfhp43xfRdWjaUl+zOBWUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="223805113"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 02 Apr 2026 14:05:26 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8PEB-0000000099V-1zLV
	for oe-kbuild@lists.linux.dev;
	Thu, 02 Apr 2026 21:05:23 +0000
Date: Thu, 02 Apr 2026 23:05:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jimc:jump-batch-only 5/5] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202604022239.r3f0Dv0M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "high confidence checkpatch report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>
TO: "=C5=81ukasz Bartosik" <ukaszb@chromium.org>

tree:   https://github.com/jimc/linux.git jump-batch-only
head:   6a8736c5bd10356333070d9339699cf50777ed07
commit: 6a8736c5bd10356333070d9339699cf50777ed07 [5/5] lib/dynamic_debug: a=
dd negation support to queries
:::::: branch date: 63 minutes ago
:::::: commit date: 63 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260402/202604022239.r=
3f0Dv0M-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#12:=20
the logs with virtio activity, and spoiling the the test scenario.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
