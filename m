Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A810136A027
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 13:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630972; cv=none; b=DGLTvoATH1qLNChOWfia2oFb6m+Zm9hXUFLV5szH77gJhq6cKOM68RrX9wFYoOY0rRCluwhWFCPaXTel/gYoxwm+awZEPVHp38g2FQWf7UitXCkrrvOZal6PAKFcYAQcGszGuLvLSS+7UO50tfr/Uiz/ANBwKsNZ2HszX+rR6ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630972; c=relaxed/simple;
	bh=EauEratwSK/OUDyqUSy6hNSGYWkfiIZtmXCfOUc0/Vw=;
	h=Date:From:To:Subject:Message-ID; b=h/5Nzu1K7KrS2UHTjNAARR9vCkVE+5MqpYt19fcM/yOLdtQkLCjw5IJ+5o5X0aArGTYWsKBItHVARqwhQ472A0ZATz4jtmWeRYElaqgrRH7Jz+/BRaglwwyJxsF4K8lE5MLbrRll0IOMh14Xj1TmPBl2Qcn2Iqxg7j/9k6zpLfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cnduu/uZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cnduu/uZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772630971; x=1804166971;
  h=date:from:to:subject:message-id;
  bh=EauEratwSK/OUDyqUSy6hNSGYWkfiIZtmXCfOUc0/Vw=;
  b=Cnduu/uZ+FsJzBh11q0vS6XFe3CqWqbj7705iJ8NL15zpnyhCcGoIrnh
   vgdkdpgUHOH5MLr6CIszfMD+H6NbR2rUSVO6Qawnqzk1zVPsSG+BeX/s6
   lltkNvtLdOWgENX+7Oy9A6j2NSxvaFWbQ0GnleCODDctVCwRojt7EBmRK
   zL7mEr5yPV0dsYCyHgQZAHMesA5cxKfrc1F3eMWYqcOsid0OlIJ0SCB1d
   uWihG5KqwUHovvrm6wBG54MDJ8XET5IXsvGWeERy7Q2SaXcgerc6xRYBB
   k+awp2o8Z4T4ppxokaz6xYXZjQDB/EHpKbnSm7fgcp73Wuw9noYbbyCYh
   g==;
X-CSE-ConnectionGUID: HtZJF+prTA2oLihAsjRoXQ==
X-CSE-MsgGUID: fwuPEPxvRU+V1jbrxruFRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72714813"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72714813"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:29:29 -0800
X-CSE-ConnectionGUID: PZ2SLCDGTeORyq56DfEu4A==
X-CSE-MsgGUID: ozrmy8wsTQi8FKJ7aM0NQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="241354903"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 05:29:29 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxmI3-000000001hX-0cml
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Mar 2026 13:29:27 +0000
Date: Wed, 04 Mar 2026 14:29:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal:dedup-lsb128 11/11] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'Claude:claude-opus-4-6'
Message-ID: <202603041448.tJuicHO5-lkp@intel.com>
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
TO: Sasha Levin <sashal@kernel.org>

Hi Sasha,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git dedup-lsb128
head:   925cdd8d45fb4adec025cfe8e42abfa0dafa9a46
commit: 925cdd8d45fb4adec025cfe8e42abfa0dafa9a46 [11/11] ARM: unwind: use shared leb128.h for ULEB128 decoding
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603041448.tJuicHO5-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4-6'
#16: 
Assisted-by: Claude:claude-opus-4-6

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
