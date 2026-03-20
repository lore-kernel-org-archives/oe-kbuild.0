Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BF6382F2F
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Mar 2026 09:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773999666; cv=none; b=K5m3MwlF8Aou489KTC/mdU4j7el1yCBTUEejbpdytefvQrBFqwoq4FRbTAAdltNHtGRvlb3La4PghqOsJps0rslPnMSD9f4ep5D4oc4ou8J5hRPM/fwcZc29yEVJuyYjwuUKpsNBgNA/0Or4WbEQuveOKNhj5+1+7lbi2Twa10w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773999666; c=relaxed/simple;
	bh=2pxJjw79lbuFhhPVdFFJpmQxwip+rKISoknPVnMoQbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UkyeW9s6IAlPeHeWO0lMawp/xG0kdUicPBKlkCXsk4pmUJu49Qdq5ys0aXGalkNFI5654247mHQOkEXqgl7vVf5ZDKe1O567qjPrUMZRic8GH322s91Af6WuTOaEUx83rT8jSFzFH2zQq1M2ISrBQiRr/6wxUIhoTWAdJ/2mn+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yf1aubOw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yf1aubOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773999666; x=1805535666;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2pxJjw79lbuFhhPVdFFJpmQxwip+rKISoknPVnMoQbg=;
  b=Yf1aubOw8vYKrtvnQ2Pb2wY2MWkt4Bre3pV2z0xYUKGNhLrQkmwBbGPS
   xQn8YcT983mVAWvXtb3fOo9t9QhNXWxT940S+fKVr/UJyj/68MEn6Gawx
   V89Nx/6p8blINp91QtXUGaNiDFWD7/hyMXgGMFlYFOCZbEe9QBaBAH01B
   w9YhbABZNitcxauXwLHjVz22IezFcj410YaBrYThrrynfKX1A5+7uXamO
   tz/ToMbEA6+YZbZ5NYX/n3hzlmldkoPe8Wt0HTW3nlmDa44FMLAo7sUey
   znK2AwmK4cMFOgdUQzQTUCj/mTUJrXXjfJDz3/dIa1ZVFpRnev07RXWv0
   w==;
X-CSE-ConnectionGUID: UbQW7JLBQeK70NOq3CRDAg==
X-CSE-MsgGUID: GtjDPus4SOGwYtPgsV0dRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86557642"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="86557642"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 02:41:05 -0700
X-CSE-ConnectionGUID: i+92jQxORhuMO5cOO6JVkg==
X-CSE-MsgGUID: 5vmLKy7GRTaien0Mf+4UZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="223222499"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 20 Mar 2026 02:41:03 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3WKv-000000002EF-0Ur8;
	Fri, 20 Mar 2026 09:40:20 +0000
Date: Fri, 20 Mar 2026 17:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 15/25]
 kernel/time/hrtimer.c:1771 __hrtimer_cb_get_time() warn: statement has no
 effect 'ktime_t'
Message-ID: <202603201709.oOu6KQWZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh (Schneider Electric)" <thomas.weissschuh@linutro=
nix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/auxclock-nanosleep
head:   cc3ea8220bbf2776d1d33ef66bf120fd6c27a801
commit: 7924e77c4adaeb5f81b1d76b80f9255ea214b002 [15/25] hrtimer: Add suppo=
rt for auxiliary clocks
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: mips-randconfig-r072-20260320 (https://download.01.org/0day-ci/arch=
ive/20260320/202603201709.oOu6KQWZ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4ab=
b927bacf37f18f6359a41639a6d1b3bffffb5)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603201709.oOu6KQWZ-lkp@intel.com/

smatch warnings:
kernel/time/hrtimer.c:1771 __hrtimer_cb_get_time() warn: statement has no e=
ffect 'ktime_t'

vim +/ktime_t +1771 kernel/time/hrtimer.c

336a9cde10d641e Marc Zyngier                          2016-01-15  1758 =20
009eb5da29a9101 Thomas Wei=C3=9Fschuh                      2025-08-21  1759=
  static ktime_t __hrtimer_cb_get_time(clockid_t clock_id)
009eb5da29a9101 Thomas Wei=C3=9Fschuh                      2025-08-21  1760=
  {
009eb5da29a9101 Thomas Wei=C3=9Fschuh                      2025-08-21  1761=
  	switch (clock_id) {
009eb5da29a9101 Thomas Wei=C3=9Fschuh                      2025-08-21  1762=
  	case CLOCK_MONOTONIC:
009eb5da29a9101 Thomas Wei=C3=9Fschuh                      2025-08-21  1763=
  		return ktime_get();
009eb5da29a9101 Thomas Wei=C3=9Fschuh                      2025-08-21  1764=
  	case CLOCK_REALTIME:
009eb5da29a9101 Thomas Wei=C3=9Fschuh                      2025-08-21  1765=
  		return ktime_get_real();
009eb5da29a9101 Thomas Wei=C3=9Fschuh                      2025-08-21  1766=
  	case CLOCK_BOOTTIME:
009eb5da29a9101 Thomas Wei=C3=9Fschuh                      2025-08-21  1767=
  		return ktime_get_boottime();
009eb5da29a9101 Thomas Wei=C3=9Fschuh                      2025-08-21  1768=
  	case CLOCK_TAI:
009eb5da29a9101 Thomas Wei=C3=9Fschuh                      2025-08-21  1769=
  		return ktime_get_clocktai();
7924e77c4adaeb5 Thomas Wei=C3=9Fschuh (Schneider Electric  2026-03-19  1770=
) 	case CLOCK_AUX ... CLOCK_AUX_LAST:
7924e77c4adaeb5 Thomas Wei=C3=9Fschuh (Schneider Electric  2026-03-19 @1771=
) 		ktime_t kt;
7924e77c4adaeb5 Thomas Wei=C3=9Fschuh (Schneider Electric  2026-03-19  1772=
)=20
7924e77c4adaeb5 Thomas Wei=C3=9Fschuh (Schneider Electric  2026-03-19  1773=
) 		if (!IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS))
7924e77c4adaeb5 Thomas Wei=C3=9Fschuh (Schneider Electric  2026-03-19  1774=
) 			break;
7924e77c4adaeb5 Thomas Wei=C3=9Fschuh (Schneider Electric  2026-03-19  1775=
)=20
7924e77c4adaeb5 Thomas Wei=C3=9Fschuh (Schneider Electric  2026-03-19  1776=
) 		if (ktime_get_aux(clock_id, &kt))
7924e77c4adaeb5 Thomas Wei=C3=9Fschuh (Schneider Electric  2026-03-19  1777=
) 			return kt;
7924e77c4adaeb5 Thomas Wei=C3=9Fschuh (Schneider Electric  2026-03-19  1778=
) 		else
7924e77c4adaeb5 Thomas Wei=C3=9Fschuh (Schneider Electric  2026-03-19  1779=
) 			return KTIME_MIN;
6d1f1c61f755b12 Thomas Wei=C3=9Fschuh (Schneider Electric  2026-02-10  1780=
) 	}
6d1f1c61f755b12 Thomas Wei=C3=9Fschuh (Schneider Electric  2026-02-10  1781=
)=20
009eb5da29a9101 Thomas Wei=C3=9Fschuh                      2025-08-21  1782=
  	WARN(1, "Invalid clockid %d. Using MONOTONIC\n", clock_id);
009eb5da29a9101 Thomas Wei=C3=9Fschuh                      2025-08-21  1783=
  	return ktime_get();
009eb5da29a9101 Thomas Wei=C3=9Fschuh                      2025-08-21  1784=
  }
009eb5da29a9101 Thomas Wei=C3=9Fschuh                      2025-08-21  1785=
 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
