Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB4E27E7F0
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Dec 2025 18:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765392692; cv=none; b=GVsoFbAZrqsLcVqbw5o343Sq2wdOCjYNctEIzmSRKFAXrrp/Qtm/CdL89kQ4PaDFrPahgY2KrgVtYboAf5nA6ZD/1Io02ZFn1TfU2sT0JvTo2mUF1KVr22IU0G7GwELwHofUP16yPFqhtCvfSHp6YSoAKtqAXBLPmXm1gMfk2zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765392692; c=relaxed/simple;
	bh=kIEWqaDeMPjre29B4Lq0lZOBUbRDw096nT64/eB0DxU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WvnmT8oqZmttDJOH5cdTeWYRIZJtcv56jmnGxdGSBIghwO1piUfWcCPinhCDGEWlfmf97m4dlLSzj499HCen05H30/nMIGyeI1IySNn8IbomSCFKbl7DT3iStFCLcS3oS0bYqPASvDkvCng7ymnc11UJbzZaiazbZ23Llu08V0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bVHLcyUb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bVHLcyUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765392691; x=1796928691;
  h=date:from:to:subject:message-id:mime-version;
  bh=kIEWqaDeMPjre29B4Lq0lZOBUbRDw096nT64/eB0DxU=;
  b=bVHLcyUbeorte2wISN+ItSaRDar3oHa9eMJQHaguyKJIlWCQ/vyYrY65
   T6BqWqBO0OJM/tOFG9EnZh7vtaGASvTgXIiirnV7TnK85R4bDz19qTX8N
   vKq9g7UZBAmqux8dR1r2T7xfiICt+uEx+uEYdWmFInT5+VM9yNLTFaf68
   4CVEUQKOF6Wke+e0hbWkoNyHUM//hXDoqSVmRFxjeDu71la2xFHq/vnpy
   Xfu8Te0kzonPDlz5nBPyHoAIfzD2OMmgNW9wGGu/aT1OC+yLoO9pqcIen
   8225bNMJ+v81bWS8bQy2TrkJsQnFq4yP+Qf+A6jPEs+By1r5y3Yi2iUtP
   Q==;
X-CSE-ConnectionGUID: x04yk2NyS8ucSxNaN0Xdqw==
X-CSE-MsgGUID: RMp5QcvBTVCazL2czXGgww==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="92848914"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="92848914"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 10:51:31 -0800
X-CSE-ConnectionGUID: YVVY8Z0uSlqYOtF3tstbSA==
X-CSE-MsgGUID: CusO6vKARge8ewlDchsHRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="196649628"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 10 Dec 2025 10:51:30 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTPHb-000000000kS-3vOM
	for oe-kbuild@lists.linux.dev;
	Wed, 10 Dec 2025 18:51:27 +0000
Date: Wed, 10 Dec 2025 19:50:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [mingo-tip:WIP.sched/flat 15/26] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'use'
Message-ID: <202512101933.IClHPB21-lkp@intel.com>
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
head:   9d8a22c60fd08f2f4a82aa5d81885e0ab6ad52cd
commit: a8eea218cac8c5c4a4fd963e58c9f6f266a8ac16 [15/26] sched/fair: Introduce and use the vruntime_cmp() and vruntime_op() wrappers for wrapped-signed aritmetics
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251210/202512101933.IClHPB21-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'use'
#30: 
In the vruntime_cmp() and vruntime_op() macros use Use __builtin_strcmp(),

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
