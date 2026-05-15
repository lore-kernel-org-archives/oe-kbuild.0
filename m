Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297C5372ECA
	for <oe-kbuild@lists.linux.dev>; Fri, 15 May 2026 22:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883833; cv=none; b=C+9Txx4882hEp/SCfcisgkTHDnCJ4xjkKMDC9hz8OHofvBHqyQG5xgL4zoNwL7iPcUNLW4V66qF4z6QqOmfX4i64sdUXiSmH/o+DGZpj0yQcsYAYhAPYf+UOxZ+sp9wjEaTJR/DC69bYpYff4mznCFE8225Chm1U9rQkSBVvd/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883833; c=relaxed/simple;
	bh=wlm+gsrJl8HEpBddUlSdXjGSHmYBJVd1Yqb0t1ZlA5k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aBDLZZskWRnATSUGDZghPPuwksbxvtW6qPfiFOm3n7/IwMgwS5Ln0kedrU9/LPGZnvGD6wu3h9SWqnCLAL4mafPQVQm8Lw6qgBLryGBgYeA1i0oUxevnsztiGn/CLL1g/4MuW4U3SKoJKu5yBCUptVNALSSOdCUTiEH1Am/8XYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nc7e62t4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nc7e62t4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778883831; x=1810419831;
  h=date:from:to:cc:subject:message-id;
  bh=wlm+gsrJl8HEpBddUlSdXjGSHmYBJVd1Yqb0t1ZlA5k=;
  b=nc7e62t4B7YfNZx7WL52k840xQL77A02oItqP2a5YwUJie0Er2mocvNn
   UxahTeLx3XIy7fNrbd4teq0GZt5uXhUCXpSsZLWGra/gR6Y+bVAFLSMyZ
   kJKo3KES5Ku/0+uo9B7KD7Ix8+W/aOe9caR8Oj9VS2GzRgyQ34cI0Jtzg
   /f+eSWq+MOuTyLWs6FyM5mJ29MzSuKeW/n4KxqP+aaAexHArsjk0mx1T8
   sOqpnRt9eey65Se1mSxsq8R8yOKDZyZriOGDt4XyycYe/VxkZ4vgq6Eyi
   Grhe2RIefQaSUq57Z474rJQfPjsqnckKcORTXyIwMlO0npi9JvbRTeYdg
   Q==;
X-CSE-ConnectionGUID: SdLDQTVxTvqVPi4R0bHN2A==
X-CSE-MsgGUID: To/drOxfRjWAE6Q5CV2nkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="83459627"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="83459627"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 15:23:51 -0700
X-CSE-ConnectionGUID: NQ8fFj5vQk2IOhKN51/e/Q==
X-CSE-MsgGUID: doskna3IR3Ow1NyAiF5XaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="238934016"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 May 2026 15:23:51 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO0we-000000000A5-2KB6;
	Fri, 15 May 2026 22:23:48 +0000
Date: Sat, 16 May 2026 06:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lwn:docs-mw 37/42] Warning:
 arch/powerpc/sysdev/fsl_rmu.c:543 Excess function parameter 'mport'
 description in 'fsl_rio_port_write_init'
Message-ID: <202605160639.eHYRcEud-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: Manual check reason: "possibly wrong bisection of lwn change"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-doc@vger.kernel.org
TO: Shuicheng Lin <shuicheng.lin@intel.com>
CC: Jonathan Corbet <corbet@lwn.net>

tree:   git://git.lwn.net/linux.git docs-mw
head:   e27108800bb8a8be08300ce14d532f7225e4c50f
commit: 46d9c16115cf046ce564f0230126cae785f73826 [37/42] scripts/kernel-doc: Detect mismatched inline member documentation tags
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: powerpc64-randconfig-001-20260516 (https://download.01.org/0day-ci/archive/20260516/202605160639.eHYRcEud-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160639.eHYRcEud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605160639.eHYRcEud-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: arch/powerpc/sysdev/fsl_rmu.c:543 function parameter 'pw' not described in 'fsl_rio_port_write_init'
>> Warning: arch/powerpc/sysdev/fsl_rmu.c:543 Excess function parameter 'mport' description in 'fsl_rio_port_write_init'
   Warning: arch/powerpc/sysdev/fsl_rmu.c:1027 function parameter 'dbell' not described in 'fsl_rio_doorbell_init'
>> Warning: arch/powerpc/sysdev/fsl_rmu.c:1027 Excess function parameter 'mport' description in 'fsl_rio_doorbell_init'
   Warning: arch/powerpc/sysdev/fsl_rmu.c:543 function parameter 'pw' not described in 'fsl_rio_port_write_init'
>> Warning: arch/powerpc/sysdev/fsl_rmu.c:543 Excess function parameter 'mport' description in 'fsl_rio_port_write_init'
   Warning: arch/powerpc/sysdev/fsl_rmu.c:1027 function parameter 'dbell' not described in 'fsl_rio_doorbell_init'
>> Warning: arch/powerpc/sysdev/fsl_rmu.c:1027 Excess function parameter 'mport' description in 'fsl_rio_doorbell_init'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
