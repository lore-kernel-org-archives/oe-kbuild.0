Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1967D152799
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jul 2024 08:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720512380; cv=none; b=e6bmBddauCKDEr4mTU1ICpemnUAQLvtbVdFd5hJil5ZRnNVHnCsbKfYctl44Vo374gW+DlunsIS9RYvt3g4idW1dGPHKDVBGwnjaSudGtCVyAzh3MM8TSvGWXfqXe7/sPejs4hzlMOaqDgmPYUwYI0d6h6RGXlyVrPIck6Ocgoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720512380; c=relaxed/simple;
	bh=4sVQZ5/SidDuPAmSm05+NSQyIguVRDURV8O8Q4QppXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GnW5ihGxjboRdg8gAYIljuI2xdXykI4BZCcwRNNUAl2jmxQq9UOlhjf8gYzVIZgSU0d0///acamoz4MwGYez0kwtXTlNH1N61AEISc3e+L6xMtO1l/abgl3RPx9eK+T/Bj5C0ws3trHke8r8WHSsOhzU6eDaf3PEBaLA2zIP9TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0dCk0oH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0dCk0oH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720512378; x=1752048378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4sVQZ5/SidDuPAmSm05+NSQyIguVRDURV8O8Q4QppXs=;
  b=P0dCk0oHcbMyD5loyQFl5gYGFNyUHsqiLsnefjTL24OZ3RNhfe5RND4u
   j2tfq/eQl7xisxoviecvQBlczaLMqg7/WugzMwYXULtrmDDgu0Z7TtpDI
   neu2JOr+FMwlkYgawTfXjlwE9HgNRNUUhamV1uq7hQkGtww876HpsYoXt
   sGw9Pf+dztM9qEP/cqPHIG74S2Fi7yMiiSxSpV+O9Ptf+KMBkJfHBCCwz
   Dop4LDJsiAgn8Xu32TuoxGX5pjGmVLTAAgWVvYhvyqSueHGZoN6CAZgva
   Zq1tZC//aZCDG4KBO8ICVPkGXpfRhNqBG2Zbei31tOZuBQEl40ase5Jk7
   g==;
X-CSE-ConnectionGUID: /0CZkphYTwKrny6dMfwzjA==
X-CSE-MsgGUID: zcxoXhIAQZqxTj90kvlR1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="28350024"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="28350024"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 01:06:18 -0700
X-CSE-ConnectionGUID: +nL3muyhTcW60Gpx7G3dlQ==
X-CSE-MsgGUID: HaKfNhagRkWkpv6pgC7Ilg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="47662589"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jul 2024 01:06:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR5ra-000WSg-1m;
	Tue, 09 Jul 2024 08:06:14 +0000
Date: Tue, 9 Jul 2024 16:06:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-6.1.y-cip 42/44]
 arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: regulator2: Unevaluated
 properties are not allowed ('gpios' was unexpected)
Message-ID: <202407091604.rtMOdBI4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
TO: Pavel Machek <pavel@denx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip
head:   36ec072fc37c836df41fdb600a933321aa4804bd
commit: efeb25827b057a3fe1c229136954f249e443f5fd [42/44] arm64: dts: renesas: rzg3s-smarc-som: Enable SDHI2
:::::: branch date: 24 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-051-20240708 (https://download.01.org/0day-ci/archive/20240709/202407091604.rtMOdBI4-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091604.rtMOdBI4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407091604.rtMOdBI4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: regulator0: Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: regulator2: Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
