Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7127A2236FC
	for <oe-kbuild@lists.linux.dev>; Fri,  2 May 2025 22:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746225518; cv=none; b=N9ZSJfXu7Thmz/K+5z23bl8GGWQ7q/SJx5/CTj1BDnsoPDUbwkrnvh/CVypyv677cbdINFea9+uFd/AlQQq0fVGVAOD14Q80RUo82yTz6rYTWQYwLmTcy7FMW5ZTkverfzYtN8s58IamhCjUJ95vC5Mj2vkTaEyq+llUXF8UdOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746225518; c=relaxed/simple;
	bh=dJ83AnaSgh9SQnoh4lCLqR4Fdde0y5MIQ7xStJipM5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PmK1tBJ7CBinFP2asO2DYWK/F0uS6k7sCJvZ67VyI2Zd6GDgiTAWttSnvzabsoDWtFfCfVyNXLjC+zavTxo1MzbhoNKx9EDI3E3dat11vFJx+RVp0Ax/DV15aTRWEsczCa3LLcBEcB3WNULfO2Ewo8n8nbyyaz9hilL3EggG/5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jY3Hs12J; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jY3Hs12J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746225517; x=1777761517;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dJ83AnaSgh9SQnoh4lCLqR4Fdde0y5MIQ7xStJipM5g=;
  b=jY3Hs12J1a+ek6vo/QzJB07IrQz27s39W6Cd/gM5GloTZhGuOz0lcrjk
   rriCIcVN0wmrCiqK0fd5d4lVFmb3zsxuZ4GwglJ7tDmK7VR+F00hhnDDF
   sWlP+BE32dLMS41o+esSJySk+DfKi5j2VrEsA1kerFa8uoVxawszKOd++
   xsuyF7yKMGYOly4EHumaDmhREOaxBjxcdAYIXDVF5xYmc+z8vdSy17ZJw
   Or0+LcHLWNcLohi3VGcJ45l4Hw67Wu4sqlI9O9vATGZDcIBUchW3ahXQz
   p1j2aoDu9PG08cBx5/kwytHsisKbTDC8/+unwSMWZ26YgPU6J/OtKLXtO
   A==;
X-CSE-ConnectionGUID: Y4i4B9fVTDK8FxSYXN2mqQ==
X-CSE-MsgGUID: iOeqnJwoSWSnYwcKw2MZ8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="59303327"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="59303327"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 15:38:33 -0700
X-CSE-ConnectionGUID: v3HfojztTJCKv+HWFoo3kg==
X-CSE-MsgGUID: YTakr/54T7m94l5jOIc7tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="171999087"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2025 15:38:32 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAz1Z-00053O-17;
	Fri, 02 May 2025 22:38:29 +0000
Date: Sat, 3 May 2025 06:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:timers/urgent 3/3] llvm-readelf: warning:
 'arch/riscv/kernel/vdso/hwprobe.o': bitcode files are not supported
Message-ID: <202505030636.3ExDB8O2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/urgent
head:   7aeb1538be5df3efa1d799e5428ac3a0ae802293
commit: 7aeb1538be5df3efa1d799e5428ac3a0ae802293 [3/3] vdso: Reject absolute relocations during build
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: riscv-randconfig-001-20250503 (https://download.01.org/0day-ci/archive/20250503/202505030636.3ExDB8O2-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030636.3ExDB8O2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505030636.3ExDB8O2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> llvm-readelf: warning: 'arch/riscv/kernel/vdso/hwprobe.o': bitcode files are not supported
--
>> llvm-readelf: warning: 'arch/riscv/kernel/vdso/hwprobe.o': bitcode files are not supported

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
