Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE01327BFC
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 23:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778195272; cv=none; b=QsvVcHYMMQGSnvO2YKEDFO+V0XrgIGZt64Yq66Qmy8tRr2H1xDD+xuW2HGtR1MPCZq5hAgnSZhMjI3h+h+aceZnDqPV6FQJCcDNvqgcpTt/jiXPyMBcLfCGYMn7lNMmU+2DnTH4S7UjlHSRsAYqn/Z06szrf9nHPctw8BuwWwnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778195272; c=relaxed/simple;
	bh=X/o+9yMS84Ytm7xBARAdhNrxOS7N8Y5fdpQ+LUpAGnk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nkN7E/rz6ctqgNFb0uwwyG6aVVQnfYkPnS2hVJ0otclEGdJXwYYi6S503eTccvZG7gI0wMYJGU3QGLdbkRAhaa/TTtKD7nmoNuhZift48yb/p10XCaEKzC3SjS2ceI9+CMfAbSjGv/kNlULa/wc8xKmI6IwJR9rWfYh36WXisf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mt+UTgmB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mt+UTgmB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778195270; x=1809731270;
  h=date:from:to:cc:subject:message-id;
  bh=X/o+9yMS84Ytm7xBARAdhNrxOS7N8Y5fdpQ+LUpAGnk=;
  b=mt+UTgmBr9LPoXQigV5Vd/m97h3QmKGAgQL73WfwW16d4Yd9Nr+d1ZMP
   86+TTTYlewEzubecWFDsol0HGjil589/GyZqiD2lM/M5EtwsXnxJm4f1I
   v4bBvOZAOY+m2QLgLznrXRkPlXIVsfTsZyHMutdqQUzMiawBJtlukhNkg
   tXSBvOCcdoA9zCGKOBI+fPNa1OEkH7dKw/0RZl5f49mgEmMv/TNJ3NY5J
   lY/sTo8H+fPFmcC/Lcg0jaZeK1AEN4Zu/lt9CKHw6OVY/xvhvbxeBfmaw
   Dh/3vkidALNXa9HR0LtTLL7GEpZSM5frtV/q2zBS19RSQBiUurGs//uAu
   A==;
X-CSE-ConnectionGUID: 1Lde+Cz2SBCQ3XzacvxZUQ==
X-CSE-MsgGUID: S0iH3Z0cQoeKu7IlY64KSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79062513"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="79062513"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 16:07:50 -0700
X-CSE-ConnectionGUID: 4uYkEKa4TE++GJeoQXCMUw==
X-CSE-MsgGUID: 4Gb8mpcuTBSVudBvOLwIJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="235622740"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 May 2026 16:07:48 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL7oo-000000000Xl-21Bk;
	Thu, 07 May 2026 23:07:46 +0000
Date: Fri, 08 May 2026 07:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: FATAL ERROR: Syntax error parsing input tree
Message-ID: <202605080736.KVagSyvb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Michal-Piekos/dt-bindings-timer-allwinner-sun5i-a13-hstimer-add-H616-and-D1/20260507-192013, commit: 11d9dbddad0d7c31df858298cf4715b2a273cd67"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Michal Piekos <michal.piekos@mmpsystems.pl>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Michal-Piekos/dt-bindings-timer-allwinner-sun5i-a13-hstimer-add-H616-and-D1/20260507-192013
head:   f7e2fb14161813e667402e7e9f3a3069b84f5664
commit: 11d9dbddad0d7c31df858298cf4715b2a273cd67 arm: dts: allwinner: d1s-t113: add hstimer node
date:   11 hours ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260508/202605080736.KVagSyvb-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080736.KVagSyvb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605080736.KVagSyvb-lkp@intel.com/

All errors (new ones prefixed by >>):

   Lexical error: arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi:301.18-25 Unexpected 'GIC_SPI'
   Lexical error: arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi:302.11-18 Unexpected 'GIC_SPI'
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
