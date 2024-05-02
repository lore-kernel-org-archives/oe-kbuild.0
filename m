Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1CB1CA81
	for <oe-kbuild@lists.linux.dev>; Thu,  2 May 2024 05:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714627588; cv=none; b=E0yVWYmGHL/eoAV/F8KxLVL62xZGKsAKmhHMik0tVO0a7ehsnRICXhJfRm73mWwBZRv7pcJoeUH+xNvjRo2j69Ua7kfEq23woI5Ta/dxeVzwvyMqCabbEuWUrsL8qN4HJt86WPjInDYDh04fxJcMI1JjYhk6aI2OZ1Du5lmYVns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714627588; c=relaxed/simple;
	bh=fJp5wJkAVSnAZN+7p5tbbevDs9AULpF6tuHAt2BBAxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pWE/z2NnQIs7Ex2D4mDqRjH4RdtFgCB2lbIVJqKvgVvBLHsHsitcVuTklDbS72I06J3KbofZfhyXE/0xQ0ak5hh/cLx2kaf+u/eoasys2q1+v9fDZ9rntZ8y+F+W70seaBsxES8FkSx13uw+c3tY6VoiiX9nlA2U4fYJVPcVdHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5KvJs7Y; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5KvJs7Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714627585; x=1746163585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fJp5wJkAVSnAZN+7p5tbbevDs9AULpF6tuHAt2BBAxc=;
  b=M5KvJs7YyEsvW8PilfXyKmueNg6pzjgoF3sBFjYXxYXBAY35pKX5uoGE
   bski7Pn98Zwbp5gbDggUGxEtbttSFzgoXk5urJM9GnDgysK3doFtvKES9
   vIpznn5PZhSyWpXAA6KAaDu/IJy+Un1jnUCN1tjorb1yOvjrhs3jBg5n4
   FW7bjUupZ6vOPvEv0kcN+OWwnfC/n/CSItfd8XHI2unoGFfdORMMNFOWn
   Mf03L/jo0DmSRD1amyhWRhWTsxPlOtHO0fj9P9/MiLduRdaPmQkBduQz8
   H9WhWQSxHO0C5UkTctEwZvt9IPryWDEAoUi98+h2uTdFBE2NOBKwbT664
   A==;
X-CSE-ConnectionGUID: A0C8XRm6SC6fJXb9+jAeig==
X-CSE-MsgGUID: WuyFiu7HS7KAs3LQTEquVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10310734"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10310734"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 22:26:25 -0700
X-CSE-ConnectionGUID: 9YyDsY8DQzmgHc08coKvPA==
X-CSE-MsgGUID: qnkixoTvS+eGwwHmWtEmyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="64452537"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 May 2024 22:26:24 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2Oxa-000AQS-05;
	Thu, 02 May 2024 05:26:22 +0000
Date: Thu, 2 May 2024 13:25:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-5.15 9/14] dtbs_check: make[3]: ***
 [scripts/Makefile.lib:374:
 arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dt.yaml] Error
 1
Message-ID: <202405021347.vOexG1gG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dt.yaml] Error 1"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   e931c5c3244d7ebba8856dc6aed54a5d1a85975e
commit: e9bf0d6e98d2633afef620f4d8cb76ececfb393b [9/14] CHROMIUM: arm64: dts: mt8186: Add veluza board
:::::: branch date: 12 hours ago
:::::: commit date: 30 hours ago
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
dtschema version: 2024.4
reproduce: (https://download.01.org/0day-ci/archive/20240502/202405021347.vOexG1gG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405021347.vOexG1gG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dt.yaml'
>> make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dt.yaml] Error 1
>> make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131077.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131077.dt.yaml'
>> make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dt.yaml] Error 1
>> make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio-sku0.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio-sku0.dt.yaml'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
