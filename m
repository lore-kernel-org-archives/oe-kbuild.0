Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306DD13E02A
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 22:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771282597; cv=none; b=GZAELKAEsJbFn4j6S58J6zkIsTdM2Jk2VH79Yl24e3dXs6tk4Gfa0WO3rRU6EEyzFi69HBVLKXBIMUi/ZXb3BBcmMCTECqPmdDEXIA3Kd+HwLDgADl6XFiDMCiQTijfVdgpP+rftdRRE6HIWWi64ncVvGRhmkHMJN7hZr22aHRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771282597; c=relaxed/simple;
	bh=KOU8/rdJnC0++pTQln+Q632SLPAkCrxO2sb5jRpZHBE=;
	h=Date:From:To:Subject:Message-ID; b=eHBzPDa9MEqhc6oZ386knS52fyojeDN0+PgtGOhXrPwaE6SLFJLNTfl2AoGodZ4mT2dHL28xI0du2iac6aRnfVEzHAShY9vBGENC9NsK5ea2qR1JfILytOFa2Gg2rPe85dtMkxPu4GxRzpuS7rdAOZP81D81z4C2JmhQxdjLjDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eHgxnO5g; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHgxnO5g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771282596; x=1802818596;
  h=date:from:to:subject:message-id;
  bh=KOU8/rdJnC0++pTQln+Q632SLPAkCrxO2sb5jRpZHBE=;
  b=eHgxnO5g4yVXbUv3MTSZOKPGus9V5Z+RmZP+ertKOTWbY5+/1imKCWa1
   hF/2O4uI0UJ6ykEE9kHEL66O37TtHQsHbRm1hxjCOZY4Yia2ZqkIiF/Tj
   HbK5y+TJqx4uMsP4XvjZGKj+8SAJevSpIKFR+ToqtV9NPVkZkC+XqhsbP
   Hwzn6pdCM3p74nJYQ9dgBY3tfqOeO5YFbu4CFxYLtOLxLK2ghX68gQhaR
   pYZ99Wfnd14Js0H8FeiwuzC+CMTLL5eX3tVAsktw1rcqdw95XjH1P/tCM
   /TfR420g3mkoQrozKvHZ8xPcFcSoak4flYi6Tf4ExnWngD8EXZRiPjm7p
   Q==;
X-CSE-ConnectionGUID: ZKNmDXTLS76scjg4v8JNVQ==
X-CSE-MsgGUID: dpviL0ytTfGQmUA7wQj3iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="82688784"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="82688784"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 14:56:35 -0800
X-CSE-ConnectionGUID: Sdzx3BWhRW2o97EsJ3w//Q==
X-CSE-MsgGUID: wUtT0v92Qduk31t5Jb72tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="213013276"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 16 Feb 2026 14:56:34 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs7W4-000000002cz-3Of3
	for oe-kbuild@lists.linux.dev;
	Mon, 16 Feb 2026 22:56:32 +0000
Date: Mon, 16 Feb 2026 23:55:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 24/36] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner
 <tglx@kernel.org'
Message-ID: <202602162338.JJVF3dPB-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   b4fb5671d1c3610e5afbae296e258f8f5cd9d512
commit: 71e83c0f31de33fb0d8798bdc50c64a68c8810e5 [24/36] hrtimer: Optimize for local timers
:::::: branch date: 18 minutes ago
:::::: commit date: 18 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260216/202602162338.JJVF3dPB-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner <tglx@kernel.org'
#24: 
Signed-off-by: Thomas Gleixner <tglx@kernel.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
