Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E3626D4E5
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 16:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765643886; cv=none; b=n55QvyzbcFblpApETnh2c1Vmh2hyD199OXbs+WGCJYw+Dw5/dFxLD34Jnkpd0m3wsMQ25t3Ryad7i7vmnw+uvREzJ4x3IO7WtUeh0TqDVxwFjjSiepnoDpYNU+JMskiKHamVoI/URhoq7w4A4IikJta/CcbttpTHwAVk9n2fBLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765643886; c=relaxed/simple;
	bh=kpYxQ/k0bNuhRCDyHK1ByqbocudprNuytFOcGozETGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gd/aQxI4KlHZkFZdzVx6+FXotiEHj8r8vRMxdaDd6mJzV8JNbdW3zzh6bwNjJBEODDPL/ZmX0kiBmdXF+wFva1AH0MbpvYZ16F5BHmlr6w00MRQh6sZynMDecMNbsMndKo56LrN2R7H/FVlcwaGzLJswjCvXwaphU/fNKnhZKSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sy5v2xVl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sy5v2xVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765643885; x=1797179885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kpYxQ/k0bNuhRCDyHK1ByqbocudprNuytFOcGozETGQ=;
  b=Sy5v2xVloApqySXgS+wH2BTkUli9IfkfKi/UafrGw8px8vd0VHzzTJk4
   hkYkbQ6Kj8Qw+U3Y2U9HbUkBgV32K9mButURfDF0Td4fs/wo2tD8iFXdp
   +dYKLwKTNGEnJIZ80TsYKh1s2+vDT6N16j96E3FKCFukNDXdp3BtTN5bl
   LW6F7uFp+ZEYWSD3slboFrCVb1Nturk16XOEhFO9i3QMdZI8g8Kefg0Jo
   sCWO4CFb5u2oB3YO5r797CTvcUIJoL9Cp9fMnBAEJ8ZN0/r00j+vzCJTT
   kDqV7bJ4ub4rKCRPqRkgBFpkPygtPWKPXeDjYepi2WOffozOfTUP7pthS
   w==;
X-CSE-ConnectionGUID: By6TyhcPTKyj0eNmbOlj6g==
X-CSE-MsgGUID: NXz3n/hAQyWzz49p7pdRww==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67656598"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67656598"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 08:38:04 -0800
X-CSE-ConnectionGUID: /hhZACY/TsKI2/z2AZ0uyg==
X-CSE-MsgGUID: u8VHEB7wQp6epbvfV1t0iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="234730216"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Dec 2025 08:38:02 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUSd6-000000007vT-1O69;
	Sat, 13 Dec 2025 16:38:00 +0000
Date: Sun, 14 Dec 2025 00:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [litex-hub:litex-rebase 3/15] drivers/spi/spi-litespi.c:200:1:
 sparse: sparse: bad integer constant expression
Message-ID: <202512140028.IQBNHpu8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/spi/spi-litespi.c:200:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Filip Kokosinski <fkokosinski@internships.antmicro.com>
CC: Gabriel Somlo <gsomlo@gmail.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   bf1103a7647b9e371007e1f7d02827190e619900
commit: ec2cd6393ed1ce1f080ec2c75b7c835a19e2433e [3/15] LiteX: driver for LiteSPI
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: alpha-randconfig-r112-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140028.IQBNHpu8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140028.IQBNHpu8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512140028.IQBNHpu8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi-litespi.c:200:1: sparse: sparse: bad integer constant expression
   drivers/spi/spi-litespi.c:200:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/spi/spi-litespi.c:201:1: sparse: sparse: bad integer constant expression
   drivers/spi/spi-litespi.c:201:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/spi/spi-litespi.c:202:1: sparse: sparse: bad integer constant expression
   drivers/spi/spi-litespi.c:202:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"

vim +200 drivers/spi/spi-litespi.c

ec2cd6393ed1ce Filip Kokosinski 2020-12-22  199  
ec2cd6393ed1ce Filip Kokosinski 2020-12-22 @200  MODULE_AUTHOR("Antmicro Ltd <www.antmicro.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
