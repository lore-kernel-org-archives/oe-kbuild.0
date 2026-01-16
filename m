Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06404B665
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 23:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605088; cv=none; b=othU5xj2/A5Pb2uJXaKBIc1jF/4p0QEOJAGoLnTZZGjbY+UgGqGEeoK/JY8i/K/iV9ZfDru1cscQe5+rwuKAUxEfYhRO5rl1+e2Zd33Lr7z/rlRtTQ7fEevr+uSp/Ih9UIbuygCehsWJj96tuIQNdY9z83TwKEa63XVIH/uuV6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605088; c=relaxed/simple;
	bh=6PqptXPKzGcgVXyxpHcXSzlFGm7JcOuvE2V5g4hBupA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W+xLFXNk3xHK8mC1KiCsbGo3u3MxUhlGGd6GL7bNcKJVC+RxkJhYICIVfJ/LqFc+9pROsMWBd11g990WPrmucuS9St90Dh+1tsJ1sA9qHjpMeNKJSLfRJ6Z2XGStweMbwDsTjE8yijw11+yIczh6p/8MwfYWLPOLbkNxfMwvda0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QytQ+xdE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QytQ+xdE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768605088; x=1800141088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6PqptXPKzGcgVXyxpHcXSzlFGm7JcOuvE2V5g4hBupA=;
  b=QytQ+xdEzQKfjEGbzdCJuP0kouBOuCXSLwDx7WY1JUW5iYA29et8zso1
   h6bAfQ5NyL5TRaOxA7tqfYwKwgfZPAgnWk2F2Vp02Sq+6xnjHY3Fc6x23
   p3OtvDb437DsM7YL+rD5fJprHhpck4M2Lsz0iZp485A0Do3l7uA5nN/LR
   5PiN1NgNIkYCpUTHTtx0VpXUrmCd7B+54KhqD/jZoTjoSIDRq2EwBk2e8
   u8PhlAaV18EF/b/g68njSot52wbHrpplGiwnYERq44NtIa6nZhr5Jp5Ot
   Qjltzw3/7tMbxCPVpyWxyij4OxN/jo5pdh9LfA31153StVX+SzXZ2ZSkx
   w==;
X-CSE-ConnectionGUID: p7bL0RbXROG4mCtIVqD9dg==
X-CSE-MsgGUID: IVfoQ4MUQYGHVxlXdQxitg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69656855"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="69656855"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 15:11:27 -0800
X-CSE-ConnectionGUID: F3lfkoQCTYi84gVFq7VboQ==
X-CSE-MsgGUID: yH2CqqtHQn60kqIFgPzhxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="209496740"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Jan 2026 15:11:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgsyR-00000000LKq-0KiT;
	Fri, 16 Jan 2026 23:11:23 +0000
Date: Sat, 17 Jan 2026 07:11:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 3/7] iio: frequency: adf41513: driver implementation
Message-ID: <202601170650.9DHhNLAV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/frequency/adf41513.c:1164:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260116-adf41513-iio-driver-v4-3-dbb7d6782217@analog.com>
References: <20260116-adf41513-iio-driver-v4-3-dbb7d6782217@analog.com>
TO: Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
TO: linux-kernel@vger.kernel.org
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-doc@vger.kernel.org
CC: Jonathan Cameron <jic23@kernel.org>
CC: David Lechner <dlechner@baylibre.com>
CC: Andy Shevchenko <andy@kernel.org>
CC: "Lars-Peter Clausen" <lars@metafoo.de>
CC: Michael Hennerich <Michael.Hennerich@analog.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Rodrigo Alencar <rodrigo.alencar@analog.com>

Hi Rodrigo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b82f3047dae4aba38cb26c55c28444db4d77f521]

url:    https://github.com/intel-lab-lkp/linux/commits/Rodrigo-Alencar-via-B4-Relay/dt-bindings-iio-frequency-add-adf41513/20260116-223525
base:   b82f3047dae4aba38cb26c55c28444db4d77f521
patch link:    https://lore.kernel.org/r/20260116-adf41513-iio-driver-v4-3-dbb7d6782217%40analog.com
patch subject: [PATCH v4 3/7] iio: frequency: adf41513: driver implementation
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: xtensa-randconfig-r121-20260117 (https://download.01.org/0day-ci/archive/20260117/202601170650.9DHhNLAV-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170650.9DHhNLAV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601170650.9DHhNLAV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iio/frequency/adf41513.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   arch/xtensa/include/asm/processor.h:105:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:135:2: sparse: sparse: Unsupported Xtensa ABI
>> drivers/iio/frequency/adf41513.c:1164:1: sparse: sparse: bad integer constant expression
   drivers/iio/frequency/adf41513.c:1164:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/frequency/adf41513.c:1165:1: sparse: sparse: bad integer constant expression
   drivers/iio/frequency/adf41513.c:1165:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/frequency/adf41513.c:1166:1: sparse: sparse: bad integer constant expression
   drivers/iio/frequency/adf41513.c:1166:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/frequency/adf41513.c:1166:1: sparse: sparse: bad integer constant expression
   drivers/iio/frequency/adf41513.c:1166:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +1164 drivers/iio/frequency/adf41513.c

14da095e190eab Rodrigo Alencar 2026-01-16  1163  
14da095e190eab Rodrigo Alencar 2026-01-16 @1164  MODULE_AUTHOR("Rodrigo Alencar <rodrigo.alencar@analog.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
