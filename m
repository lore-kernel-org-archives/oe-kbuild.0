Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5417331ED64
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 16:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771432345; cv=none; b=bstYIjIZvguk91Vw6fkLlfpVmrbbCkjuj57Jll7ASWr68yGkxgh+vSNl0DsvU+g8ZkjAZEsM+ZBSPSPG9luI/HWo5InPkMhPavVE+x6aCaYA+lQxqLWQgsb/uhsksn8ZHg3qWcu+cuRyr2g46yCOjCuJqBcRxNw+xRmYuxNs+HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771432345; c=relaxed/simple;
	bh=H1TnRbrSLUiYup62MaRu02yhDBgkO8iWO+IEoM8IDTw=;
	h=Date:From:To:Subject:Message-ID; b=QEb2cCPS0ddpZkSq7cY5vna2kHsQAa2B1oZTLf6la7Q5ZnmJ87glSNQZDq3t3KHL0GIRRdSc+i+MqPffdLl7lFXM1oGQENNp4cvoOclITdiLyUqz5SU1pXrB3ipd1tAt2jNMSPOu/a/otiGzsLtk/RjLBydBbM6EsHkTN24AoD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hE5Y1klC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hE5Y1klC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771432344; x=1802968344;
  h=date:from:to:subject:message-id;
  bh=H1TnRbrSLUiYup62MaRu02yhDBgkO8iWO+IEoM8IDTw=;
  b=hE5Y1klCtJT6TJIixAx1wzpfK7WvK/6DykTOTBMfzyV7rxQfxFELLtap
   luVc2gqxcWwPXpn78Rk7glmIWl2cwoBkrUEXFGB9TBX6P5MpLooGeW+Kx
   R11cDyeZm51B3UWaDiy/0RW54AVv25N1BQ7uwZrIyTZo8Rw6o68L0xcDf
   Bo12W4iiLc44RexyutkaDIyTT/1pLhE6grlWDuZA5IZKTiGLVtSODbCKU
   6FVXOQSOFoBiLsOuEOwR9WIhbEXuKTdFl17ykUVoe2Yx19zJoElnWFG8U
   ciq9076LvPc9c7FuXHHiW2kez8naykPLWlnD/j5r/GSFx5uI8cR/T4EhZ
   A==;
X-CSE-ConnectionGUID: 2aHFNgkcT2qTZENQUECJVg==
X-CSE-MsgGUID: BI3xzzNyRbKfVMh15ShPmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72414429"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="72414429"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 08:32:24 -0800
X-CSE-ConnectionGUID: GB5xqHptTF2RA43u+NSnuw==
X-CSE-MsgGUID: ybjSTDBVR3u1kHkEJbz5EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="218754009"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 18 Feb 2026 08:32:23 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vskTN-000000003fN-1PKc
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Feb 2026 16:32:21 +0000
Date: Wed, 18 Feb 2026 17:32:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jarkko-tpmdd:container 13/18] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202602181740.WVshJ2J9-lkp@intel.com>
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
TO: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   b3e6536d642b70332100b953eda30bb7227ba07c
commit: 743e3df43aaa0cc616c2cf50c8e1053a33e7016a [13/18] containers, vfs: Implement CONTAINER_NS_FS
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260218/202602181740.WVshJ2J9-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#169: FILE: fs/namespace.c:4565:
+				 * requiring to_pathname to be NULL.
+			 */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
