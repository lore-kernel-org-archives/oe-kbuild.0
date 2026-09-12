Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371B73AC00
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Sep 2026 00:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789171373; cv=none; b=p1lZsSbHIaIMsbjkLB4OhKgEpDvXkNhtUBimYIN3utpP9t0XeZrcKcuBRBaoow4smBnX/fiqhsdTnbH7jzGXg3ZgTliNZC6w07LMu0lI3AW86JJg+0V9zxdYVn2EVsRr0pDKpOMNa6z2/iltdbPnpeVuQcrsLUJJmL1P6F0RAZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789171373; c=relaxed/simple;
	bh=HU43W6t93UHm4I5Z31VepyCnh67b2aQlrBwyTFNk+aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cWpvvnfPx9ifAd3bWnQWsBuPC7e3aSxHtpt6Lkc02xTQzmOSdEbTWhBcZM8lT5HZ4tatggRMGRo67vmmuIiqLqbhwv2bNR1zfQQN8Jhj6WfEOzoktZndFI1ge7pAj16TD9ED28/SKVhhl4T0JbXAzxSaH0ZGF2SNONxg/QG3Ctg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eAbOB0XV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eAbOB0XV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789171372; x=1820707372;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HU43W6t93UHm4I5Z31VepyCnh67b2aQlrBwyTFNk+aQ=;
  b=eAbOB0XVwpCrOd7BbF6yDtwSc98nyqOLt43C/SdOTegQOVIHuNu+2QWE
   xE9DlP4suymBhy0wuwZ3IN2N3fov9gxLbUJPZy/ogmg+6zA2ziQu2PclW
   ix4DFDdb3bwUBroCKFf5r+lTKUj3n0OpjiNSrvyyySF1537CDzg/m8m9x
   CnFePtK8zBLrPLxuunUdbJR4qp14Hrzj+ZqUk6svqf0rqw7calEKaNtQK
   0LPIvWA8VsBSEe9X6yQbXdGLGW7ixBLmPh4ySQ5fJNt+H8SKa2ygBWSM3
   SjZxNTl6LL28Xg6XMeY5LQxx7g0LTBBZUfAhz58IWhuVVARS8/F+U9Fdu
   g==;
X-CSE-ConnectionGUID: 9jNRjsTtRYSrXOZ96KjFPg==
X-CSE-MsgGUID: FnuDMYA9TcKYjOZUJSAA9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89847848"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="89847848"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 17:02:51 -0700
X-CSE-ConnectionGUID: xPenk2DMQRGgrY3ykBVXOQ==
X-CSE-MsgGUID: We1/t0w8RXOEC/6RT5sfWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="269451291"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 11 Sep 2026 17:02:50 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5BCh-000000000vf-34KB;
	Sat, 12 Sep 2026 00:02:47 +0000
Date: Sat, 12 Sep 2026 02:01:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [stefandoesinger-zx297520:dlink 25/132]
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dtb: /soc/spi@140a000: failed
 to match any schema with compatible: ['zte,zx29-spi']
Message-ID: <202609120110.lZ0Fc80y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Stefan D=C3=B6singer" <stefandoesinger@gmail.com>

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   ac919b52585145716ddb9d8154ca104ff2ea271b
commit: 4a5d36f608ba5459e4da4c800e5dc04be6c974fb [25/132] ARM: zte: Add som=
e notes about a (non-flash) SPI controller.
:::::: branch date: 8 days ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-2054-20260909 (https://download.01.org/0day-ci/archi=
ve/20260912/202609120110.lZ0Fc80y-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260912/202609120110.lZ0Fc80y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609120110.lZ0Fc80y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dtb: /soc/spi@140a000: fa=
iled to match any schema with compatible: ['zte,zx29-spi']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
