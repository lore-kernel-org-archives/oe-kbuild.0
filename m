Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3246719CC0C
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 06:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769235475; cv=none; b=hWva+tDUQj9GqwKl2a1ERGp79rLhNCel8Wg7bWa6Kui6Mm2pPjkkzoY1a0cJxt6GZX1ETuNDV0U3rJug37oY6qjqkavtRNInR+7VgD29bOAgO4uIpKOyyjSimQKdyo3ZQKe4C8hZcEFvXSKFKCwS0eeEhzjfCZeclq876KjkyyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769235475; c=relaxed/simple;
	bh=PLOJnqr/PpIHh2w2vQPaKCj/QA1J+z/et9cX64Hfj14=;
	h=Date:From:To:Subject:Message-ID; b=qa/F9YalZZW7JsKjMaWxFZYCpvb5n+j+cDGI6Q1aoNjV47NuESVY/X9hZKUGDw+yi45MHjeFbKcuFbDOLVuakIqdBaZ/ASJ8IPzkBdxYlZZcquBbQnhcitXm0/2+qBvjwRan5rggx49FKnM4Ww80BTyJEvYlyTjsyq/EqwXp5H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BU4TVT3D; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BU4TVT3D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769235473; x=1800771473;
  h=date:from:to:subject:message-id;
  bh=PLOJnqr/PpIHh2w2vQPaKCj/QA1J+z/et9cX64Hfj14=;
  b=BU4TVT3DQr71uvmuublrkYq1OHMl186yqxlvUVmLapOICIp5HAK/0G5X
   fKHJwI/EG0w6eWdOOiMncS6Ylxn1lSOoMifp2AUoIUehCG+//iYDkS7lW
   KsDVkEUvNcwC/qEsTLG6i9lRPd8w++OSyy3M0cWzFjsjcuBGiDAGu9oJi
   CK2ZoUtBTxXjEPSbN4mNEE26tS+U3mut6CDnAuN/Wz96FQFqqofLPwjaY
   +6id2dD7ZBZsaodRbGsgM8CybLe7hFXp21uGKIWuXj2s7h61URvu5cjpP
   72v/QBx4uXyFoIBfUb0X+vaT7x1L+Q1D7hpEv55fGLLIAs1FgBTJGU+Tl
   g==;
X-CSE-ConnectionGUID: lhoxj8V5QTOlyWX5MsTivw==
X-CSE-MsgGUID: n24CDmJgRKmxm3MFL4iREw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="95946715"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="95946715"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 22:17:52 -0800
X-CSE-ConnectionGUID: B0Ji7jvvQNip5xPKX1hVAw==
X-CSE-MsgGUID: VXONLy2iQxODPxnbgsTqVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207453390"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jan 2026 22:17:52 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjWxx-000000000td-3JYN
	for oe-kbuild@lists.linux.dev;
	Sat, 24 Jan 2026 06:17:49 +0000
Date: Sat, 24 Jan 2026 07:17:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [agd5f:drm-next-6.20 3/49] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202601240709.TGjsiLdg-lkp@intel.com>
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
TO: "Jesse.Zhang" <Jesse.Zhang@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-6.20
head:   1412482b714358ffa30d38fd3dd0b05795163648
commit: fc3336be9c6297282dd7968a597166b212cb0dc0 [3/49] drm/amd/amdgpu: Add independent hang detect work for user queue fence
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260124/202601240709.TGjsiLdg-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#68: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c:176:
+ * to check if the fence is still pending after the timeout period.
+*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
