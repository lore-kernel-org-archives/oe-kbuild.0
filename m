Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6BD36C0C9
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 15:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094971; cv=none; b=CSvMFW73ywlKdTOL7Gv9+NS5+waRISKm8IDYDRlqW7GXGuyeBhwtCLcet4LGDTERzU7QB2b5mesBvb3h9Qy3mCfGDlOfVchielnjJ/6jfuRm3t5HnXnTuEvgshwCyTm+A4IrqknBWw4IsmPzptNcdbN62iH9Y21M3Jras31TtVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094971; c=relaxed/simple;
	bh=WZZtVyMLI2YAx1TR0kc0a4/Fb+MCvvrjuwJO7JSJmuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=owYGoEeNOkT8VXTKcNxo0FPSKfTk1zFk7wp+r4dbj5QJYqtUeD4j+Lzq7iNG0bNCBu2aIauh6Epti8+2pHTru9Pj/WWibST0guMrmlEqdk4agHmPZbriHfQ/MjjW2llMvbKxB30H0Fp6/n1a79F32UExleIOGF57YwTtQxYHbVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJDRm1nd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJDRm1nd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769094968; x=1800630968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WZZtVyMLI2YAx1TR0kc0a4/Fb+MCvvrjuwJO7JSJmuM=;
  b=MJDRm1nde95JOYi/4PY9hJ/Qm2Nu8AYRfLWS03orU3zkR78VMuKASaV6
   fukamjGYCsdFlXunLJgfMmKpF9k3e9/dQJGZC6X36w3WVUkVoIf8Mib6H
   m0WopgVSdpCNT1nH9r/giBru1kAvYcn4wSh7B4Ijj7kSys5qpPFeyFU43
   yUeYG2HLxtKKGagykr/zbIoP+XKLgFKFD0R7ITwvWpaRCtq5I7jeKMN/p
   cB411YjTDR5qqkbzyjLGv4++rPpTFloB9FY9mM9+mfzS3YzHk8StciqHy
   ePuFgeEu5EH99B1+MF9CxESDxC9Ph527ZjA/zTL6/5rYsqVHByM+lcKi9
   Q==;
X-CSE-ConnectionGUID: H6rJQ27hT76uasGCU7m6qA==
X-CSE-MsgGUID: I7L4YKtqTuCQ/56LGO8a3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70504752"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="70504752"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:16:07 -0800
X-CSE-ConnectionGUID: pUEJP7HNTAG1hYIHCNyDhw==
X-CSE-MsgGUID: 7ps68a/aSKKv7hoE+lYgOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="211615660"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jan 2026 07:16:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viwPj-00000000Sx0-3s26;
	Thu, 22 Jan 2026 15:16:03 +0000
Date: Thu, 22 Jan 2026 23:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/4] i2c: add Andes I2C driver support
Message-ID: <202601222235.v6MYfKJs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/i2c/busses/i2c-andes.c:339:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260122-atciic100-v2-2-7559136d07cf@andestech.com>
References: <20260122-atciic100-v2-2-7559136d07cf@andestech.com>
TO: "Ben Zong-You Xie via B4 Relay" <devnull+ben717.andestech.com@kernel.org>
TO: Andi Shyti <andi.shyti@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Paul Walmsley <pjw@kernel.org>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Alexandre Ghiti <alex@ghiti.fr>
CC: linux-i2c@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: "Ben Zong-You Xie" <ben717@andestech.com>

Hi Ben,

kernel test robot noticed the following build warnings:

[auto build test WARNING on aa5804b8fb64f446260cee45e7e8a722ac7ca839]

url:    https://github.com/intel-lab-lkp/linux/commits/Ben-Zong-You-Xie-via-B4-Relay/dt-bindings-i2c-add-support-for-AE350-I2C-controller/20260122-115843
base:   aa5804b8fb64f446260cee45e7e8a722ac7ca839
patch link:    https://lore.kernel.org/r/20260122-atciic100-v2-2-7559136d07cf%40andestech.com
patch subject: [PATCH v2 2/4] i2c: add Andes I2C driver support
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: mips-randconfig-r133-20260122 (https://download.01.org/0day-ci/archive/20260122/202601222235.v6MYfKJs-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601222235.v6MYfKJs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601222235.v6MYfKJs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-andes.c:339:1: sparse: sparse: bad integer constant expression
   drivers/i2c/busses/i2c-andes.c:339:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/i2c/busses/i2c-andes.c:340:1: sparse: sparse: bad integer constant expression
   drivers/i2c/busses/i2c-andes.c:340:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/i2c/busses/i2c-andes.c:341:1: sparse: sparse: bad integer constant expression
   drivers/i2c/busses/i2c-andes.c:341:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/i2c/busses/i2c-andes.c:341:1: sparse: sparse: bad integer constant expression
   drivers/i2c/busses/i2c-andes.c:341:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +339 drivers/i2c/busses/i2c-andes.c

d73a2e5b4946bf Ben Zong-You Xie 2026-01-22  338  
d73a2e5b4946bf Ben Zong-You Xie 2026-01-22 @339  MODULE_AUTHOR("Ben Zong-You Xie <ben717@andestech.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
