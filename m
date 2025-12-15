Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF13728CF5E
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 23:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765840145; cv=none; b=tG1fBBSKRsOBj7JkLcE04PS/kels5oQCJGV5/rdKCdAf7pur0zVLnGReGrHBwLlbi/HxpmI+su9CAVHnCcKy+32Xpyi7O3cccgL67xemxGyI4JGcclQmzs+0cLDjIyal+4Ucl9qwtNp0PC63RgOlg622vREEE3mCO0iTg+rWfjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765840145; c=relaxed/simple;
	bh=0K1I7eTFc5xdVEVQ3qle4dFj51t+bRiJUbjut/ogE8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B2k/OOHv9rpiTLn0H2NOWYonPvUUfGFkwZe4Id5nqrMCoROfbAxlFX5CxrIkJkQv0NRiBzCRfVmOhTu4fXrsVbDrrdA3rkO9m8lFQ4Hl2YlFtZTVLYL6YqgUczwwxM+gkEyWqozhOE65hAYBpaKs+AsCYPFFrJhMPQnUQF4jQPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JD+pn5Iz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JD+pn5Iz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765840144; x=1797376144;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0K1I7eTFc5xdVEVQ3qle4dFj51t+bRiJUbjut/ogE8M=;
  b=JD+pn5IzWvwJ47RNDgeEqX7uOy3AtO98Rx+rw6LXJGwpQaFDldl0p91O
   pPQLGrzPPscILdoOT9zpp3rRl47uVMVmH7KJnw+g2pB0UqS0AMqGkl8yo
   455RbvFb9cWzr5cxh0JkqWUYtgGEwrKc0sTxGvkTpUygCfKXjPSS7mPs4
   890AeQlqz0wZTKnNFK12+s0yK/xQPiwvcMsSaEz8qDTa5ai44y4uCglAE
   BErDXCfNKGc0G/n3HZrBZmzxehxNbvepP3fX79EywuNuLQypqldxMWVB2
   1WZavgDG6j3A269sAx+YwaiNA9QqavUD2b7CnPmjG5bhWfHB4M1H6fGFS
   g==;
X-CSE-ConnectionGUID: 4I/dMf3AQa25k4XjzjvP4A==
X-CSE-MsgGUID: +9xQ0ar3QFmrek/DFtTzRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66939531"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="66939531"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 15:09:03 -0800
X-CSE-ConnectionGUID: D0trz7mzSBmDsaL8vRBdtA==
X-CSE-MsgGUID: T0dhr8kIQ/iLaOtyZTIVWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="202259555"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 15 Dec 2025 15:09:02 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVHga-000000002m8-1kQ9;
	Mon, 15 Dec 2025 23:09:00 +0000
Date: Tue, 16 Dec 2025 00:08:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pxa1908-mainline:pxa1908/master 4/13]
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dtb:
 clock-controller@82800 (marvell,pxa1908-apmu): 'reg-names' does not match
 any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202512160039.kqC5z6Bu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Duje Mihanović" <duje@dujemihanovic.xyz>

tree:   https://gitlab.com/pxa1908-mainline/linux pxa1908/master
head:   9e872f85d0ed53d474107764343c245869b95c45
commit: a5bdd1d79efbda3abeeda41c114613dc81796b1e [4/13] Initial GPU support
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-2052-20251215 (https://download.01.org/0day-ci/archive/20251216/202512160039.kqC5z6Bu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160039.kqC5z6Bu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512160039.kqC5z6Bu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dtb: clock-controller@82800 (marvell,pxa1908-apmu): 'reg-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/marvell,pxa1908.yaml
>> arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dtb: clock-controller@82800 (marvell,pxa1908-apmu): reg: [[534528, 1024], [535552, 1024]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/marvell,pxa1908.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
