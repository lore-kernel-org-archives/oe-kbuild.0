Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A48328638
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 10:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301339; cv=none; b=aII+wAYeNdOJXDe4C0Pz1ra+yBty+zsEBukYV67Pq1F64mq+c3tWWMsbov9NBybaiU50Ko95FrGxloLg4b1tmSfMsMjVVARXIrRjnCqm5tDCWwlCgw59cjW9+VPI11wv7A7vvq2hQP702gA2oCIMGuEmollNVqwvEFdTsE3y7Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301339; c=relaxed/simple;
	bh=FXKydgwQaTIF0307J3lPPaGvN/kKOJulZrz9ORtnWDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NXeRDKXksrTtJ9tkbzvKrjUYaAphv6BxqkhcMcHD8TCFcuYLleeJFBacT5UaPcWw2XiazObja9h/QEF7VAGxjyrSENx8m4YMaHtaPRYyEintQx2vRc/79xgbyCoVKRWFL3GkVjbm4mHIqCW3JK59M8eaTTlgGmB3/IgLYrvo6RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dex5TuPh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dex5TuPh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768301337; x=1799837337;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FXKydgwQaTIF0307J3lPPaGvN/kKOJulZrz9ORtnWDA=;
  b=dex5TuPhQ8BgtD+AFY56vBj32R9uEwoS8hiO3rZ5KHA/WsItDfZJcbKB
   c7QSzw0dvnhbFUd4F/BddkRzI4oPl+PWn7ZwU+iLDTcwXFrPxiSU4MzlQ
   FtAuderAwyPDmf7AlZNdTMZNeWvzYftPgGxXolrvEnrZ2chOPQXbfSYyK
   t0caloMg7m/Ouz1hGejbGwb1RUr/vseO078MzdjWrYtHcru+KHzB+BA7S
   TV6Tuw44cIhykxz76I+2Mg1ZmlR1hdkxrupv7B70T8vk6zTp64Zc2e2BF
   RnbTJ29432TC3HBJbVEenH0E6hbYT0jnxLc1F1Mk66iIJht7JOa4vC9Bl
   w==;
X-CSE-ConnectionGUID: OeeYyL0IQoC2YULDKVR+yA==
X-CSE-MsgGUID: NRvBotWITmeJ3z7K2+ep3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="92251020"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="92251020"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 02:48:55 -0800
X-CSE-ConnectionGUID: U47DcBK/QwKKxzCLTu00aA==
X-CSE-MsgGUID: dTpwNRRIRrOqAfrEFkvYGw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jan 2026 02:48:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfbxE-00000000Ecg-3Rr7;
	Tue, 13 Jan 2026 10:48:52 +0000
Date: Tue, 13 Jan 2026 18:47:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kunit-kselftests 14/17]
 lib/kunit/kunit-uapi.c:329:1: sparse: sparse: bad integer constant expression
Message-ID: <202601131840.1tTNFrad-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: lib/kunit=
/kunit-uapi.c:329:1: sparse: sparse: bad integer constant expression"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/kunit-kselftests
head:   25364dcd1bffe2d55437fee06c422d3eea69815f
commit: 309f754f627839d741bd67285095729bd41ae32c [14/17] kunit: Introduce U=
API testing framework
:::::: branch date: 2 hours ago
:::::: commit date: 22 hours ago
config: s390-randconfig-r131-20260113 (https://download.01.org/0day-ci/arch=
ive/20260113/202601131840.1tTNFrad-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260113/202601131840.1tTNFrad-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601131840.1tTNFrad-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/kunit/kunit-uapi.c:329:1: sparse: sparse: bad integer constant expre=
ssion
   lib/kunit/kunit-uapi.c:329:1: sparse: sparse: static assertion failed: "=
MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/kunit/kunit-uapi.c:330:1: sparse: sparse: bad integer constant expre=
ssion
   lib/kunit/kunit-uapi.c:330:1: sparse: sparse: static assertion failed: "=
MODULE_INFO(author, ...) contains embedded NUL byte"
   lib/kunit/kunit-uapi.c:331:1: sparse: sparse: bad integer constant expre=
ssion
   lib/kunit/kunit-uapi.c:331:1: sparse: sparse: static assertion failed: "=
MODULE_INFO(file, ...) contains embedded NUL byte"
   lib/kunit/kunit-uapi.c:331:1: sparse: sparse: bad integer constant expre=
ssion
   lib/kunit/kunit-uapi.c:331:1: sparse: sparse: static assertion failed: "=
MODULE_INFO(license, ...) contains embedded NUL byte"

vim +329 lib/kunit/kunit-uapi.c

309f754f627839 Thomas Wei=C3=9Fschuh 2024-10-16  328 =20
309f754f627839 Thomas Wei=C3=9Fschuh 2024-10-16 @329  MODULE_DESCRIPTION("K=
Unit UAPI testing framework");

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
