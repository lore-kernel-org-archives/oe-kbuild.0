Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639FF228C9D
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 01:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766367494; cv=none; b=mEAAwzVmYYDEXwverhIaVPtjkgGyNbLIO6i/m4/Vedl3zH6VtiRA4BxwaMNDS1x0afuG6WAyETWdNLdgvygp4ZX95MNH0nayczX2/lArpv3MpfJuQT9pxph9fULiZOrtmq5aYemxOHQyBLdFQjupL2K9NoKd/Htr9cpb5iCWyoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766367494; c=relaxed/simple;
	bh=d9LKhKdRpANYH4T94mj8rQ2LggZxgXPw1tWYNPcxGcg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RbhJcwNVs+DUaflBToN2AnRFKacQoum6uIkd/Mu6T9zAVU+B/m9pa79vY2lQb9gkU4gaznd1MKdHWxRd2J+F50MU02m64R0ycWVITlihPXZYiZikbmjO0LOf8BUfO9h6R8lK+TkAXSsUBPN5uU51j33lm8kgBZQoksmW7zmfavQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4pVGPKc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4pVGPKc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766367493; x=1797903493;
  h=date:from:to:subject:message-id:mime-version;
  bh=d9LKhKdRpANYH4T94mj8rQ2LggZxgXPw1tWYNPcxGcg=;
  b=D4pVGPKciSt9P/2LrqtAC5WvwNYpnuK8AUoRSwAegXSCRHRG0/jIohom
   m7QQxMh2Ltj2qI6rbpg5CgCaq2oG0QNj5E4Hl9z3MOi5vREazb3D2St7H
   WcREsgBSi8W4RETUcFYziifHigczIan7UxTA8r7Na3iKS9GoGlJw5zwdK
   JXckR4Yk1ycLOnO7L+6bunbBJFhVtW1tH0oyxjY8JWSiOpsOhgKHNIPmk
   sRncvzhqZJilPhOdAAtOikn8TKZVl4I86oHaw1xvSHSQgI2NYY//98oRo
   kKKiyqBY4p34R0fPg07bru8YqxVdc/b9V+PhrdDNK4nz7VDxbXsDzI7eL
   w==;
X-CSE-ConnectionGUID: VzUYPIZcQB6mtGxRw7US9Q==
X-CSE-MsgGUID: X6dTR3uIQ9qh2+7KzsIUFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="71856823"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="71856823"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 17:38:12 -0800
X-CSE-ConnectionGUID: pY7XS97BTeq7MaZ/2MpoSA==
X-CSE-MsgGUID: 7xLrzeLjRMWK/6YhGBEzBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199919851"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 21 Dec 2025 17:38:11 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXUsD-000000005JE-0aAR
	for oe-kbuild@lists.linux.dev;
	Mon, 22 Dec 2025 01:38:09 +0000
Date: Mon, 22 Dec 2025 02:37:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Samuel-Dionne-Riel/drm-panel-backlight-quirks-Add-kernel-parameters-for-quirks/20251222-040726
 1/1] checkpatch: ERROR:GLOBAL_INITIALISERS: do not initialise globals to
 false
Message-ID: <202512220202.QGxgh6oy-lkp@intel.com>
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
TO: "Samuel Dionne-Riel" <samuel@dionne-riel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Samuel-Dionne-Riel/drm-panel-backlight-quirks-Add-kernel-parameters-for-quirks/20251222-040726
head:   e40624ce272f4b80fd064796942d3137cb7a14b7
commit: e40624ce272f4b80fd064796942d3137cb7a14b7 [1/1] drm: panel-backlight-quirks: Add kernel parameters for quirks
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512220202.QGxgh6oy-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:GLOBAL_INITIALISERS: do not initialise globals to false
#64: FILE: drivers/gpu/drm/drm_panel_backlight_quirks.c:22:
+bool param_disable_custom_brightness_curve = false;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
