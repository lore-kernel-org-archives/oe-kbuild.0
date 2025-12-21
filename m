Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8815C221721
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 21:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766353520; cv=none; b=FdYNzyx5meeXMtIRiJeRzR43Op6DbHnNBt+cemMvL85R1KBgkQqaQ1pl7+B20zAEPoVJslbrbLCSsHJVf3u4xuDYsMiu/LeQjVm39uVniy2QRyWfAL8f8vTwVjupSt0BWYeKhUyleFgf93Ng8nO9KYFSYI5/ofFlfuzT5A9a69Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766353520; c=relaxed/simple;
	bh=PuYfu9yXyeFLzhknolNdN8sF42o0zkKURJY86+waLRg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OQdZHscaJh6pGioP80E5dyPA69wbJbSBl7ZBq2CbV2pHJdVyqKsdgavqdX7iw9u9D56+DqsLknJDAUKX4def9EDDPs2UQ6iO/aNe552B/okAvDTJ2Pwd3kVZp24PNshxMgy2o0MS5bRBtrKOwcDUR7AtnuvrCIbdGIkxwf9R5MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dOubOm5T; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dOubOm5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766353518; x=1797889518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PuYfu9yXyeFLzhknolNdN8sF42o0zkKURJY86+waLRg=;
  b=dOubOm5TaiaaYVJ32J911sY491ZMdfgR2xOYlAu3WR0AYkytLZY8YvfB
   nANJhnMXNRnnVeB2tVtiXBE/XqiN50GyKmV97N7KCdnfjHSe0jlXWr24C
   XzyE573xqcawibsSecM5wahDyK3HVVEc/Z/Qfbvi27B5fo1vZpU5ktOFN
   aTmzI0axrHoauNyXH1VdQLEBqsP/63AscIK7TaRKszTIYTzxOHpUDcWAb
   vLa9vzkTvqD0RxzlvF5fp48ILsbmGf7CuGooTuuC2rzXtQAAN4IXqNCs7
   hstYVWpNVK4JPGgomou3D64Ud7Stc1z15nTtXiAvAFvDfcsddoMAOWu54
   w==;
X-CSE-ConnectionGUID: rgirAnp3TQ+As5BzNgunMA==
X-CSE-MsgGUID: wo8ec0/2SDCKvbnhrLrK4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78857246"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="78857246"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 13:45:17 -0800
X-CSE-ConnectionGUID: ug69lzGRT7mM9r5DwVhT+A==
X-CSE-MsgGUID: m+yw1DTtToCn0BQq+mjuBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="230027161"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Dec 2025 13:45:16 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXREo-000000000DJ-1U6X;
	Sun, 21 Dec 2025 21:45:14 +0000
Date: Mon, 22 Dec 2025 05:44:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] regulator: Add rt8092 support
Message-ID: <202512220512.J0Xw0I6r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/regulator/rt8092.c:311:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <d2293c513f396f86e54f9b806fd0195b57db7aae.1766125676.git.cy_huang@richtek.com>
References: <d2293c513f396f86e54f9b806fd0195b57db7aae.1766125676.git.cy_huang@richtek.com>
TO: cy_huang@richtek.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ea1013c1539270e372fc99854bc6e4d94eaeff66]

url:    https://github.com/intel-lab-lkp/linux/commits/cy_huang-richtek-com/dt-bindings-regulator-rt5739-Add-compatible-for-rt8092/20251219-144349
base:   ea1013c1539270e372fc99854bc6e4d94eaeff66
patch link:    https://lore.kernel.org/r/d2293c513f396f86e54f9b806fd0195b57db7aae.1766125676.git.cy_huang%40richtek.com
patch subject: [PATCH 2/2] regulator: Add rt8092 support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: m68k-randconfig-r131-20251221 (https://download.01.org/0day-ci/archive/20251222/202512220512.J0Xw0I6r-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220512.J0Xw0I6r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512220512.J0Xw0I6r-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/regulator/rt8092.c:311:1: sparse: sparse: bad integer constant expression
   drivers/regulator/rt8092.c:311:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/regulator/rt8092.c:312:1: sparse: sparse: bad integer constant expression
   drivers/regulator/rt8092.c:312:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/regulator/rt8092.c:313:1: sparse: sparse: bad integer constant expression
   drivers/regulator/rt8092.c:313:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/regulator/rt8092.c:313:1: sparse: sparse: bad integer constant expression
   drivers/regulator/rt8092.c:313:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +311 drivers/regulator/rt8092.c

799961e22b0bb7 ChiYuan Huang 2025-12-19  310  
799961e22b0bb7 ChiYuan Huang 2025-12-19 @311  MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
