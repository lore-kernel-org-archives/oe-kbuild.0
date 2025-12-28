Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEEF27B347
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Dec 2025 07:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766906584; cv=none; b=hOuuQB36/cDVWbogrzpAeY5NVqYhH80CqByY2Q51VehYZ4AMd9GfmhRZlueD5PGF9+TUgluP9f7B7Iy5yTEx7TdU1QJrS5gum1LrXVYhEnN7aJBuo8Aer+VrG5o1AzdosZwjDLGSS7i7s+DW5+l34HBO0qaWqD45Y+cnfjQhv/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766906584; c=relaxed/simple;
	bh=LJGOByQumbDFNBn7rpYCB8csPHvuoag/Rx56fGY7Eho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OOrY5zz9TUrvEBSIHxw4usm9AC9ZsUw8CjHPxCe/wrx+mqMpc7/SVTCt+OLXqyQq6sbPEHAygBz21952Ceql+/jGThCZhSnDvx0gmpfJfsEhLI3a4eCjpN68Tsm75yyCS3Yy3pSYx0sgeo61i9biOP9owvG8s6MXZAzueIaWhV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mTWJ3ejt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mTWJ3ejt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766906582; x=1798442582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LJGOByQumbDFNBn7rpYCB8csPHvuoag/Rx56fGY7Eho=;
  b=mTWJ3ejtVgEcL1hBVsbX1rIyPfyv+Yzd6Yh/g6p2kFHuOt0JGw9OkyGp
   6jTJSTssFUTM4Y0yqU18GmAJPZJepG5D2B896nOX48s/hLym63smCjSXV
   LBLyg5YYXrIIDkcNKACPibOttUQlagdK2kUmxnZ6Gs0BB4z/SLyOE0Tc7
   Xr6qRMsuIwt/615A0adrPqwsheucI/3RM186thETFBjWzXsPB+Rw12Kes
   ZbDmgJB5me9wTQ5VInClIRF3KIAsPIM2XkRWAvqEq6v48IeUXjYWMaw15
   Kk9w0iyVY3VnCVFxhegfGfqlnHoLbar8jZIlCHIJYihutKQKd5SR/v2Gg
   g==;
X-CSE-ConnectionGUID: UdGkv34cT5C/QksjCufJwQ==
X-CSE-MsgGUID: lOMn7GXaRKiwVqxgyXI2fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="67765632"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="67765632"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 23:23:00 -0800
X-CSE-ConnectionGUID: Z8TANvcrTqGw3kJOupP1qw==
X-CSE-MsgGUID: Ere5aqmqS4OUZsQL3lRzeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="200401064"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 Dec 2025 23:22:59 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZl72-000000006KP-0Qgi;
	Sun, 28 Dec 2025 07:22:51 +0000
Date: Sun, 28 Dec 2025 15:21:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 2/2] gpio: add gpio-line-mux driver
Message-ID: <202512281559.Hjhqxef8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpio/gpio-line-mux.c:124:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251227180134.1262138-3-jelonek.jonas@gmail.com>
References: <20251227180134.1262138-3-jelonek.jonas@gmail.com>
TO: Jonas Jelonek <jelonek.jonas@gmail.com>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Peter Rosin <peda@axentia.se>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Thomas Richard <thomas.richard@bootlin.com>
CC: Jonas Jelonek <jelonek.jonas@gmail.com>

Hi Jonas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 48befae0d6eee275c3e30d1cd45f39d6ba011e19]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonas-Jelonek/dt-bindings-gpio-add-gpio-line-mux-controller/20251228-020456
base:   48befae0d6eee275c3e30d1cd45f39d6ba011e19
patch link:    https://lore.kernel.org/r/20251227180134.1262138-3-jelonek.jonas%40gmail.com
patch subject: [PATCH v7 2/2] gpio: add gpio-line-mux driver
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm-randconfig-r111-20251228 (https://download.01.org/0day-ci/archive/20251228/202512281559.Hjhqxef8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512281559.Hjhqxef8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512281559.Hjhqxef8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-line-mux.c:124:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-line-mux.c:124:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpio/gpio-line-mux.c:125:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-line-mux.c:125:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpio/gpio-line-mux.c:126:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-line-mux.c:126:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/gpio/gpio-line-mux.c:126:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-line-mux.c:126:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +124 drivers/gpio/gpio-line-mux.c

d3f4c6fe71bad5 Jonas Jelonek 2025-12-27  123  
d3f4c6fe71bad5 Jonas Jelonek 2025-12-27 @124  MODULE_AUTHOR("Jonas Jelonek <jelonek.jonas@gmail.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
