Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C284F2D8390
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 02:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768615537; cv=none; b=EPMko1jlEANe7dottGiFrogY0/bY6wtXQ5DEuOeaC4OWG6pEwASyUNEMgU+lUdYntDGE5sv1zRBZkycK64ix7GZ+FRHa7j/cP4R3fibOyHFoUrdSrQUEFi0IgcbZbDZlKGEzjVXQr8wbwCZ389dosR/2BLMK8pA2XRs8schjCFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768615537; c=relaxed/simple;
	bh=MSBLUA00mOWAitLLWad/wl4NI7rKPXDIbMml7TZ/+Co=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y9UyyW8qgK8TsFMyvMGUuxqwV03DjL9vTcYASFgQI9Z67lQvvw0fGzu1NkkYioqMa3+S1S/NXdFRDpOjxjb6AgGvLChnxvxN2s8TtVBj1bo9zlvXxrYCrrt7toSXqSfj/TQmDSv5dIMTqdgJ9zSheNp0DTyjjsy8xogJ5Bf103k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h//pa0ea; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h//pa0ea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768615536; x=1800151536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MSBLUA00mOWAitLLWad/wl4NI7rKPXDIbMml7TZ/+Co=;
  b=h//pa0eagil06137BG7/FuQLDwg1XzKH+iXRJnNlhIwydDiVLWc02EAt
   ON92gg4tuYKlDrD80GH2MNgZTKc6SI2TtLBbo7AbWBRfID4O4n1egTQ6z
   ahpx8ob1TYINKnZvgcDvH7/KygCuFXmCntJeme2yJjT+h0SpUS3k0Xgwr
   liajQ7EhtnXThfqtjUG5y7BdNAZCndkEv+HjER1g3ws1NX33UVthOiRHo
   BEO71fvMWwmXXCeW9M+szcWI40uUixRFoJswoHEpmPlb5RhC8MZpstlcU
   jiBDEiEc+VcA+TFgakip5J2QPK6ktzrWBaUg08O7qGF03rym5c6k1+5I8
   g==;
X-CSE-ConnectionGUID: 0sC5GxYjR0O+VUlHFH1uPg==
X-CSE-MsgGUID: ny5pvLO5R7KNqyjnyhuVDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="95403055"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="95403055"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 18:05:34 -0800
X-CSE-ConnectionGUID: htgb130vQI6BXCQkn+SQKA==
X-CSE-MsgGUID: FkakKafgQkKGNliOjlWE1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="228381816"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jan 2026 18:05:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgvgw-00000000LSB-3ZJ2;
	Sat, 17 Jan 2026 02:05:30 +0000
Date: Sat, 17 Jan 2026 10:05:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] i2c: Add FTDI FT4222H USB I2C adapter
Message-ID: <202601170919.bX8GvoZ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/i2c/busses/i2c-ft4222.c:454:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260116101816.1200416-1-flavra@baylibre.com>
References: <20260116101816.1200416-1-flavra@baylibre.com>
TO: Francesco Lavra <flavra@baylibre.com>
TO: Andi Shyti <andi.shyti@kernel.org>
TO: linux-kernel@vger.kernel.org
TO: linux-i2c@vger.kernel.org

Hi Francesco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.19-rc5 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Francesco-Lavra/i2c-Add-FTDI-FT4222H-USB-I2C-adapter/20260116-182103
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20260116101816.1200416-1-flavra%40baylibre.com
patch subject: [PATCH v2] i2c: Add FTDI FT4222H USB I2C adapter
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: xtensa-randconfig-r121-20260117 (https://download.01.org/0day-ci/archive/20260117/202601170919.bX8GvoZ9-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170919.bX8GvoZ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601170919.bX8GvoZ9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/i2c/busses/i2c-ft4222.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/thread_info.h, ...):
   arch/xtensa/include/asm/processor.h:105:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:135:2: sparse: sparse: Unsupported Xtensa ABI
>> drivers/i2c/busses/i2c-ft4222.c:454:1: sparse: sparse: bad integer constant expression
   drivers/i2c/busses/i2c-ft4222.c:454:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> drivers/i2c/busses/i2c-ft4222.c:454:1: sparse: sparse: bad integer constant expression
   drivers/i2c/busses/i2c-ft4222.c:454:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/i2c/busses/i2c-ft4222.c:455:1: sparse: sparse: bad integer constant expression
   drivers/i2c/busses/i2c-ft4222.c:455:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +454 drivers/i2c/busses/i2c-ft4222.c

dc3897f0a6ab4d8 Francesco Lavra 2026-01-16  452  
dc3897f0a6ab4d8 Francesco Lavra 2026-01-16  453  module_usb_driver(ft4222_i2c_usb_driver);
dc3897f0a6ab4d8 Francesco Lavra 2026-01-16 @454  MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
