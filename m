Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1413AC39
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 03:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764388746; cv=none; b=UoWgV4uuJ9Dj0aQDIyZeqR1vqdNUbSNltjrYl2MgiwkQTg4fEgca+cptLv1V0KSGYrL3apmPvEdcoCX6TFkn2CLR32SdBQa2R5c/atMP/e2qcF90f/FYgst4SdPs6eQ34sFr4Vtl15QO4Ke6GmN9v5bAXmCFG+Ks808HBec7bKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764388746; c=relaxed/simple;
	bh=FbwSL41usJpJYg7/Ve4JMfA3awxcBKyuExNuoxKrDUY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nQqxlDLVpuqPUwnETEUKIRzdhiyb+2RGEJCR/Kd6R3g871/a5V95U56EpSXqKO0pic1tyJo/zTAiehrI9Zp7aydrJqVbOUMIhSIEatV+NIKYnMGt8VV/m6DuBovUyaF0Tq8nKnqcrxhiX/EFEsD27RH0my/4+ZVXAQAqNcW1C0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SlDbYqhG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SlDbYqhG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764388744; x=1795924744;
  h=date:from:to:subject:message-id:mime-version;
  bh=FbwSL41usJpJYg7/Ve4JMfA3awxcBKyuExNuoxKrDUY=;
  b=SlDbYqhGR6b9anqI2vw06gVB40el0VuHbp/ZSUM8e82JuxbGh8j1QuRu
   Qrv0k2OgnLfpMcSQOU7zEScjLin9EuSUMRE2PIGazhVcztm6acPRRCwls
   eRzWUG+szIivxo8XZxe9+r2leMG86DelQJDAv2bkUhhCpe1k2Gug5Q7Hf
   j0pCWZ62UmZZEf+xuer2bSYaVWb+G2i24yfz0KwA43TTiC33qt2j+Ipfg
   SJpYRqq3v1EFRB2EC0qZ5mJSSw1TFbhefvGOeB6mreYK+D2E6n0FHM6Qb
   eywwgpm7ikDcrwMjhhs/Co1LlVPxYlq60RKz5mkPdvAZQH+AmcDjpJfvZ
   g==;
X-CSE-ConnectionGUID: FcQftKNyQ3OuM+35pKNRqA==
X-CSE-MsgGUID: JycWqZJsQluHb9gdDUq0Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66571070"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="66571070"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 19:59:03 -0800
X-CSE-ConnectionGUID: FWdy552YQY6iB1I7eTbd4g==
X-CSE-MsgGUID: ycbGHiDSSUyP/Sw64Rlm3Q==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 28 Nov 2025 19:59:03 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPC6v-000000002D7-054E
	for oe-kbuild@lists.linux.dev;
	Sat, 29 Nov 2025 03:59:01 +0000
Date: Sat, 29 Nov 2025 04:58:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-nonmm-unstable 51/57] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'user'
Message-ID: <202511290413.ljxLY6nS-lkp@intel.com>
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
TO: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   4e89eefc44d006d250393abdb62068b63f4e926c
commit: 4a88bb20ebb511de25f82771e4f3df972a4c2fdd [51/57] liveupdate: luo_flb: introduce File-Lifecycle-Bound global state
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511290413.ljxLY6nS-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'user'
#25: 
This patch does not have current user user, but multiple streams depend on

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
