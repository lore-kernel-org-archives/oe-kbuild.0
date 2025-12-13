Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FE320C029
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 07:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765611869; cv=none; b=XL5Wir28O0G2YGK6/Iw9wCB/K/egjKC8CB7+zKNMYAh1RzuHRygQguNc9/ALfM8saZZKB9hnJbYE04LC01GkNR5dWvyn6Lr+DtNII99u/cAT9JmyE3+oDhhRKVH0Bv7wzySgsEYWLg3sdw9d+96rBcAGfQUaCPVQ9n9g1Pz1cK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765611869; c=relaxed/simple;
	bh=fUtnL/g8TQPI3CWLKoT/dsPzq7cwNdwJXFKxMjZNtn4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e6S5XKNLt2gi97B2LuS7pklFAW3ZnrX1X7xI/Ato7hyXAD0gLFIs30eNXH+692y60kyAgJI9hqIHN9OgWvidcUWWhKw0QVMRuaBCW3cf4VafQIrRrAwgHEb21Jq7mbs/r4ipCMd5nlZnO/+JTo6TTI48wbf9EgNg2zXaY9WBjtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMzdZlBa; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMzdZlBa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765611868; x=1797147868;
  h=date:from:to:subject:message-id:mime-version;
  bh=fUtnL/g8TQPI3CWLKoT/dsPzq7cwNdwJXFKxMjZNtn4=;
  b=UMzdZlBa+WlaoqjaM8G2Q2PQUD4J19OLGO+h05JQ4/ioYPQ8D7im8Nbh
   AwaPpRxjoTecSXoG4bglvG8gyJUIBE0tF/BZCKogv7aKLvizXhNTm6RBZ
   8Jj26SeslzFPfIOSejoq9rvaSb4fQhH9r7oPZ7t9B4bbUv7XKuXrKIPTq
   2iKKjKFXs3jzB/AYYyruvb3xIbTrL7e/0kK73H1aKRqaYpvcljcP7VBYT
   1AXlJl68x3OEj3BGa1MvCn/AMwnSE93vR3r1wltbwiP9vNG5UjQsorDQr
   Zu4ap6pv6yZD8u+fTDpqUAqpEX9jJ45mTmPeipR2vLYvk/DKsAVxqTVDj
   A==;
X-CSE-ConnectionGUID: rQETKFnpSLmah3coF3rBTg==
X-CSE-MsgGUID: gMxLbve3TdCPdiIxHEgQUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78243351"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="78243351"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 23:44:27 -0800
X-CSE-ConnectionGUID: J5W1WHgJQyWQKUR6b7tiJw==
X-CSE-MsgGUID: cc3Q4ug9StiXREaa4pULnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="227934067"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 12 Dec 2025 23:44:27 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUKIi-000000001zU-3YoT
	for oe-kbuild@lists.linux.dev;
	Sat, 13 Dec 2025 07:44:24 +0000
Date: Sat, 13 Dec 2025 08:44:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Johannes-Thumshirn/btrfs-zoned-move-zoned-stats-to-mountstats/20251213-130639
 1/4] checkpatch: WARNING:SPACING: space prohibited before semicolon
Message-ID: <202512130855.jNLZuuND-lkp@intel.com>
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
TO: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Johannes-Thumshirn/btrfs-zoned-move-zoned-stats-to-mountstats/20251213-130639
head:   9f4addc01505cd307f94bdc5f0ced8284ba8984b
commit: 3e9a58df480d64a5c760a7b303476c65168792af [1/4] btrfs: zoned: move zoned stats to mountstats
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251213/202512130855.jNLZuuND-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited before semicolon
#31: FILE: fs/btrfs/super.c:2493:
+		return 0 ;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
