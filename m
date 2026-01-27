Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8ED36E49A
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 19:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542797; cv=none; b=QHWLlHOyW7A8LQkt8rf0OlXSr5pCHsXcL2VE+/eL+zh6r8ZVWKpjPeheBeMg68indWjHuous9jYLnIeCXr3wRxTePc8N6hKBmcM6tKY2clqf5rrhBvX4FckpcQoT/9y/8La0YPHU5zuqSRyvA/3r7zDdENoPZ6H9yxv0za3b8vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542797; c=relaxed/simple;
	bh=Qw5vuYKSGoQBQMT5uDynuPr4e7Ccce3SUMILdM5piVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zwwr0Z095Su1LADlNGgJV4fcueOYecK0zAP8vsiOZnIxZt0JHY0W1zfGyqAA0/6N/PTogSU+idgP4mS37udLbDkLc29W/O8uKpydKUL+pA0eyZAe3j9vNEAPoaPMzEOLSmdd52HXZFlvxmSH7pCE1zEMQHVhFIbAWnrf9lcFuug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnvFIZuh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnvFIZuh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769542795; x=1801078795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qw5vuYKSGoQBQMT5uDynuPr4e7Ccce3SUMILdM5piVg=;
  b=SnvFIZuhqVN0LjrL9Bj5NDntJ1zWrsm+Shsi6C/d6A1D77qjqCd/DY9z
   jYlAaVuaTJdzt7nwYukuc/u0MYXzWtrGxPPyci8TwDXMisDw6rLNQTcWp
   gwDhT+NLmG49pSqatPF+uX3MLmtM4GPn5vwcL1B/T6XdqjtGGJGL6LCa/
   09DusH7l09qfhwNcb4DLVAEVyz1Teq4c+06GO4OmuDyihNnKRGc1yrKym
   RbpxS+alGliYMDE8HntZDvXg1AU4tq8N2iF8dx642bGUd5aKfMfx605vn
   aMqAoA5eRUz0JTXZv63ng7hnCapbhfG5MVyCZDcN3umGVcr6DbA/41Ss4
   A==;
X-CSE-ConnectionGUID: ShsMDBg1Tu6CEuo6z2OQEg==
X-CSE-MsgGUID: s8UI1lKSRpeg+yl1sh4jYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81856554"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81856554"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 11:39:54 -0800
X-CSE-ConnectionGUID: QGwhhmzfSWW0vP6E6Zz7zQ==
X-CSE-MsgGUID: 6Tru3zikTBSGYDEcgJYQ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208124552"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Jan 2026 11:39:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkouk-00000000YtY-0QxU;
	Tue, 27 Jan 2026 19:39:50 +0000
Date: Wed, 28 Jan 2026 03:39:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] i2c: ls2x-v2: Add driver for Loongson-2K0300 I2C
 controller
Message-ID: <202601280349.MOBaEOgK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/i2c/busses/i2c-ls2x-v2.c:543:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <402121da829497fc97f1461c8aaa3a44252c3f06.1769476820.git.zhoubinbin@loongson.cn>
References: <402121da829497fc97f1461c8aaa3a44252c3f06.1769476820.git.zhoubinbin@loongson.cn>
TO: Binbin Zhou <zhoubinbin@loongson.cn>
TO: Binbin Zhou <zhoubb.aaron@gmail.com>
TO: Huacai Chen <chenhuacai@loongson.cn>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Andi Shyti <andi.shyti@kernel.org>
TO: Wolfram Sang <wsa-dev@sang-engineering.com>
TO: Andy Shevchenko <andy@kernel.org>
TO: linux-i2c@vger.kernel.org
CC: Xuerui Wang <kernel@xen0n.name>
CC: loongarch@lists.linux.dev
CC: devicetree@vger.kernel.org

Hi Binbin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 880977fdc7f67923d1904ee23ca75fa1e375ea46]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/dt-bindings-i2c-loongson-ls2x-Add-ls2k0300-i2c-compatible/20260127-105242
base:   880977fdc7f67923d1904ee23ca75fa1e375ea46
patch link:    https://lore.kernel.org/r/402121da829497fc97f1461c8aaa3a44252c3f06.1769476820.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v2 2/2] i2c: ls2x-v2: Add driver for Loongson-2K0300 I2C controller
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: sparc-randconfig-r134-20260127 (https://download.01.org/0day-ci/archive/20260128/202601280349.MOBaEOgK-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280349.MOBaEOgK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601280349.MOBaEOgK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-ls2x-v2.c:543:1: sparse: sparse: bad integer constant expression
   drivers/i2c/busses/i2c-ls2x-v2.c:543:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/i2c/busses/i2c-ls2x-v2.c:544:1: sparse: sparse: bad integer constant expression
   drivers/i2c/busses/i2c-ls2x-v2.c:544:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/i2c/busses/i2c-ls2x-v2.c:545:1: sparse: sparse: bad integer constant expression
   drivers/i2c/busses/i2c-ls2x-v2.c:545:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +543 drivers/i2c/busses/i2c-ls2x-v2.c

25d8aefc85eb4d Binbin Zhou 2026-01-27  542  
25d8aefc85eb4d Binbin Zhou 2026-01-27 @543  MODULE_DESCRIPTION("Loongson-2K0300 I2C bus driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
