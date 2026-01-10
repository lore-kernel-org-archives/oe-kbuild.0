Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBF02AEE1
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 06:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768026755; cv=none; b=O0N5U/T1jftNz/0M1nrWurP0SOkGovQbXv+w7JTsT/BgsmdruWAYJNX7C+iCb04LxgwozadREr3CPOvT2RBW9aEfe+XcyA8BuV3SkpTJLkADSWwGZBfaaa0UzFo4+yi9O/tmmuoqyI0YzTSFESUxbC7gv6RheAdIWe1ewlCTUvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768026755; c=relaxed/simple;
	bh=0mwfyddIgUfD/Ag2iHA1GXzn1o6mh/I+y2X7ruDankU=;
	h=Date:From:To:Subject:Message-ID; b=Rkq4KdywIQSk77EcrXQxaokpYWtjW+LdEihGamWsFXQNVIXl/kPSeBBvaTWSND+EaYlOycRCa3n7KmzRRb9/rZh1r1/T4QUeAcJfFCAAtZxmgw+YOEHApF00EUVn/ybcl0qdJzylrUBFw4ECV6KnrfIldnrQJ2qqeHkRXPnnI30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kMHHUcnm; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kMHHUcnm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768026753; x=1799562753;
  h=date:from:to:subject:message-id;
  bh=0mwfyddIgUfD/Ag2iHA1GXzn1o6mh/I+y2X7ruDankU=;
  b=kMHHUcnmeks3/j79HDewUrRC4rq0qw6VmsQlnHl8vleyYeJyH8mRIcsc
   8y4MF+brekE5UE7gU0CJv27vsHkwXWIqmW1uN82aMTGsgwt82WTSDG9N/
   WJwdQimcaao6wk6VxQOdFFWtF/P2CfVu1jG+uVkjL66Qoe1t7gj3ZFl03
   N34ppriFpHdQAo6jXtPh3MS3cq+RIXnTZ8lHCReewC5wsH020qSzj7AcE
   sPrBMUtsZ7BBm1YYk7FcgFgc59kmJef8K6wtzHm5o2Cp9KuA00OLejU0Q
   haZvSj9OnJfdVMc3S9j9qK+JN/GXiAomNzKjaJ4tyJKleXh0ZrV3ZY9X1
   g==;
X-CSE-ConnectionGUID: CaVSAvpRQWqBDouGLN3Flw==
X-CSE-MsgGUID: iZgPHUE+RVGHLtf2+VgNaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69297812"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69297812"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 22:32:32 -0800
X-CSE-ConnectionGUID: tpgA6ZZbSsO9ELxAdx2xXw==
X-CSE-MsgGUID: CddMEyFZRKOGmcSLqzrqbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="234853583"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 09 Jan 2026 22:32:33 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veSWU-000000002HM-1X9N
	for oe-kbuild@lists.linux.dev;
	Sat, 10 Jan 2026 06:32:30 +0000
Date: Sat, 10 Jan 2026 07:31:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 5/20] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202601100727.80B0UeYC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   4398719b8c5fadb107fd2d4e44637d36a5d5ecc9
commit: e30bfdb1ea0ed6d0407943649768033a07c36a67 [5/20] HID: apple: Bind Apple silicon SPI devices
:::::: branch date: 11 hours ago
:::::: commit date: 5 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20260110/202601100727.80B0UeYC-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#30: FILE: drivers/hid/hid-apple.c:478:
+			switch (hid->product) {
+				case SPI_DEVICE_ID_APPLE_MACBOOK_PRO13_2020:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
