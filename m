Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5CC2D94A5
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 04:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766463576; cv=none; b=Vef9r9ucvh9b3rucWa86X9LocG720GfEjNsLEBCbEx/pHN3WdkF9FfcHvMdP1H682k0F1OShDbEqNcyTdXPzkDzjnJIWyT250Y414yCqBcu0DaRhl1Nl4lBgMXOBWjMIM7wMvNOwD9nuZtjEgHc6x4X51uqIHaADL4q3kn0+dFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766463576; c=relaxed/simple;
	bh=vOmLtUQtBSdPYj60C6bvKCFaODnEA4sxmNMABIsRRcA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jalL/X/0/apm5CdauqcQVSPZoGpVhQ0ADl0FmaolF0eLXgmJmbjQaMXgU3b31F05EBopvJGSupBVa/N6DR2k8Z1lKTtYX3QzyGFRzsN3zoL/F71XxMJU1Tw/OcT7Xcz+kjq6aVoEmCyY9bvmwNXeWq8mCQkTMQnkAmrpv3DRIDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jt+mM2aI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jt+mM2aI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766463574; x=1797999574;
  h=date:from:to:subject:message-id:mime-version;
  bh=vOmLtUQtBSdPYj60C6bvKCFaODnEA4sxmNMABIsRRcA=;
  b=Jt+mM2aI0/RfxfXGJOpR8CYfkLs9Pk2QSD13j0nNf4ZvxEzUJtc9OU6a
   8k3eC3XYHWxodYJXsujCzq9v42+C30t0UM909vIZJsBRayMYA8CGekMgE
   M9N+inPH3U3wPe3YdCTDzXbsSsoQlss1sSGTEqTWGHnrfEoSTHvbtx2Nh
   6pedV/PEDTXnvMRBkWd2WumC8uwDwUfB5+774BcMVw5ItOKxMdxvHupBk
   1axoA9nekrNgBSjlr31PyWR3Wa0eawYNE9WWg2CSMz96Xk3ggkmLcNivL
   WIJwAHrgTrT+QZ1TTDxbLkuaqN2rfnE8HTT6PpTeROPwRcV+Ber2Pzl9l
   w==;
X-CSE-ConnectionGUID: AFosb6+nRmqniTLUAiaNOA==
X-CSE-MsgGUID: HbiDuL3iQLmFVq2SeLBxjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68252179"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68252179"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 20:19:33 -0800
X-CSE-ConnectionGUID: i335uIsXT7+CNwCstGznlA==
X-CSE-MsgGUID: HvIK0qa7T3Ogn6BxpRgr8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199715104"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2025 20:19:32 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXtru-000000005mY-3i0g
	for oe-kbuild@lists.linux.dev;
	Tue, 23 Dec 2025 04:19:30 +0000
Date: Tue, 23 Dec 2025 05:19:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 1/242] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202512230541.zKF5yM6r-lkp@intel.com>
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
TO: Alyssa Rosenzweig <alyssa@rosenzweig.io>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   6354e3da260793f90e3288781d8faf8af4807efb
commit: 6d81eb94268dcc3fe7e8aab8e1214b9f8c51c198 [1/242] WIP: drm/apple: Add DCP display driver
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251223/202512230541.zKF5yM6r-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2158: FILE: drivers/gpu/drm/apple/dcpep.h:139:
+ * content.
+  */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
