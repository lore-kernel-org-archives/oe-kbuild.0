Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2528209F43
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Dec 2025 01:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764813341; cv=none; b=ZIGkyCiI0pr2SkS+BKtVrtvV7joDln369MiGkRTv2nQvd7MFZomM5m+3GwyVlD0nkN5LVdEtijLnq+u+Vf7fL8toav4ym4II6TwqH41CY1EfdK7qOJjiOUOJDreAh6WLo+tGkGM3FoXorSUVzxy0kmW9gJFCILOCwilTfT6wWBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764813341; c=relaxed/simple;
	bh=zqPEyYbjAW/FgeJF/DzeWGBwu+U5Li94d4+R8xH51BQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T4JGESFJreF5fiHp6XT4TNtXj7EMNUAsQDgXj2sahLFo8gauVqWojAQxVhkBFFY0pV7y2zJ6mkQFufTmluMO+PGm/6nsBy9UXaF0YLb4KVvclRjgYme7WODW69NDBks3PrYn0pED2v5oM/8+WH3NOf9Pd+TDmLptBoB7YsWzpFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GmF6U4La; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GmF6U4La"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764813340; x=1796349340;
  h=date:from:to:subject:message-id:mime-version;
  bh=zqPEyYbjAW/FgeJF/DzeWGBwu+U5Li94d4+R8xH51BQ=;
  b=GmF6U4La/x8FEaYKbUA0m/QQLY14tGr81nhw0eqHcsHMBFzHPil5h1lA
   0wcV73SrdcdcDma/R13haFkBoAoGjo2GIQKbJJpk0krRNjSnURyl2PPXD
   dX53AvN5LDDLO5e/EyqcVBLz4WczPENsVI/jQo9oDjei1kkCDdSqGl8uL
   3x5ymDA/XrSidszcSugiiyV7hh3kwbF+2s+mnCA1Fn/ut4wRHEJDJF5SL
   1NPy9dPfPItNS+59ugt0vp1v7YiWUx0upYOD2Y4rDuZzOJcAyyXqMZwDY
   9nT1iiPC1/qljh798zdk1Hsh8URfyVWgarN/GLkoSNE5l3DSWwMURhVAx
   Q==;
X-CSE-ConnectionGUID: aD0+Ee0pSqi4/9rTs2sFlw==
X-CSE-MsgGUID: Al34cny0Sm+HmJ8WAAVOFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84426349"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="84426349"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 17:55:39 -0800
X-CSE-ConnectionGUID: nyguwnNfTZKxH3GNDawTOg==
X-CSE-MsgGUID: vPB2nTDeSVuh5bR5FuwgvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="225523000"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 03 Dec 2025 17:55:38 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQyZE-000000000cv-1iDn
	for oe-kbuild@lists.linux.dev;
	Thu, 04 Dec 2025 01:55:36 +0000
Date: Thu, 4 Dec 2025 02:54:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [mingo-tip:WIP.sched/flat 20/31] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'use'
Message-ID: <202512040232.w8wrXVLc-lkp@intel.com>
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
TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.sched/flat
head:   d8048abc1303ce09d2ed220c03377f633bd106e4
commit: 46d58080fc6528da176d22e3754ded31c8d55540 [20/31] sched/fair: Introduce and use the vruntime_cmp() and vruntime_op() wrappers for wrapped-signed aritmetics
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251204/202512040232.w8wrXVLc-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'use'
#30: 
In the vruntime_cmp() and vruntime_op() macros use Use __builtin_strcmp(),

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
