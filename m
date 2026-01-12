Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF55621CC71
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 04:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768191298; cv=none; b=m0v06yWHtnM0wiW/Cman6wDtoMGCO7ZAfZYjBFkT1GSNIwDCz9l/POB+8DYnPlC48nT8AwZfzkaOTsmVD82DRYiYQiarBK24waAEzUG7BScU42LgjboVwe6XbLWqAP8oTeu5rkUXsY/luZZElre9eHGcdKL10YlozD4+CUNkMCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768191298; c=relaxed/simple;
	bh=J6NPQxEBIO9bvUI1Zfy0PBGZ5/flNH08HLf1JWVOZ04=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gjlseXn5r4bhLTDpB2tCk1J5WMQOnuKwDGny08NE3N8tSIG1Z0r32z7ligmadB+8wJZwntaKf7XtUmaddpFX6BTwxQaZgdklVzZx0P0dps67huThDd5Gqh79nSA+ZjyMhZnwdWA4F363u6+iCUMiV6cd6Rpv/9tiTSFB8lctDOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TTRbkodS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TTRbkodS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768191296; x=1799727296;
  h=date:from:to:cc:subject:message-id;
  bh=J6NPQxEBIO9bvUI1Zfy0PBGZ5/flNH08HLf1JWVOZ04=;
  b=TTRbkodSVOJAOWVElUpEDZzDmIyNzZ1GNEWtDOLwIFrz2LTfxtrjKnC3
   FtsH191NNH9u1nbFxkvJ5G9/HGEvmtJZn0CXJko70V9esbATEVLpgcEHA
   VuivMrqgsUi+UfPEvTC2yjtyJ3IKnJFx1llGkyJR+OYVSBqN2mISs9C52
   yl5+cXMKguKu309zKgEWmQi47o+Ie9gZ8AHRz3H+zw/Geuey1R7qkY7kJ
   IAg9t1qnsewB1N66/SqsgRG311dEsDkQoaoa9UxLlYmY6XRsMN4/C+i1n
   f8BZzsa5TbyBhbtsRHcSoE/qlf8F/5mJDOf8OwtMevmLsrcUwNLWMzEwd
   g==;
X-CSE-ConnectionGUID: H70iZL/1SiSpqrevuK37qg==
X-CSE-MsgGUID: B+554zNgTRa1io4qGkKj+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69514382"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69514382"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 20:14:55 -0800
X-CSE-ConnectionGUID: InAweORXSzCeTtMsnfjZaA==
X-CSE-MsgGUID: y/PNw7mWRe+TUELbwBAlUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="241518090"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Jan 2026 20:14:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf9KN-00000000CyI-2PbD;
	Mon, 12 Jan 2026 04:14:51 +0000
Date: Mon, 12 Jan 2026 12:14:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jic23-iio:testing 27/76]
 drivers/iio/pressure/abp2030pa_spi.c:64:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601121248.Bm5MaroM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/pressure/abp2030pa_spi.c:64:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Petre Rodan <petre.rodan@subdimension.ro>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   e0bc6d7e258486c10bb11e31fd4421c134063b1d
commit: 47d323ce1e8934be36ec475b3bed7ad90d15d35d [27/76] iio: pressure: add Honeywell ABP2 driver
:::::: branch date: 15 hours ago
:::::: commit date: 3 weeks ago
config: arc-randconfig-r131-20260111 (https://download.01.org/0day-ci/archive/20260112/202601121248.Bm5MaroM-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121248.Bm5MaroM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601121248.Bm5MaroM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/pressure/abp2030pa_spi.c:64:1: sparse: sparse: bad integer constant expression
   drivers/iio/pressure/abp2030pa_spi.c:64:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/pressure/abp2030pa_spi.c:65:1: sparse: sparse: bad integer constant expression
   drivers/iio/pressure/abp2030pa_spi.c:65:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/pressure/abp2030pa_spi.c:66:1: sparse: sparse: bad integer constant expression
   drivers/iio/pressure/abp2030pa_spi.c:66:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/iio/pressure/abp2030pa_spi.c:67:1: sparse: sparse: bad integer constant expression
   drivers/iio/pressure/abp2030pa_spi.c:67:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
--
>> drivers/iio/pressure/abp2030pa.c:542:1: sparse: sparse: bad integer constant expression
   drivers/iio/pressure/abp2030pa.c:542:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/pressure/abp2030pa.c:543:1: sparse: sparse: bad integer constant expression
   drivers/iio/pressure/abp2030pa.c:543:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/pressure/abp2030pa.c:544:1: sparse: sparse: bad integer constant expression
   drivers/iio/pressure/abp2030pa.c:544:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +64 drivers/iio/pressure/abp2030pa_spi.c

47d323ce1e8934 Petre Rodan 2025-12-07  63  
47d323ce1e8934 Petre Rodan 2025-12-07 @64  MODULE_AUTHOR("Petre Rodan <petre.rodan@subdimension.ro>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
