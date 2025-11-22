Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667DF219A8E
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 00:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763772146; cv=none; b=cHy4nUsU+IKQpwV42KoYpK8Xoth8uBMTc5M2sJIYUldYua7nKfcGUaQ/Np3l8X/wAv6pEqL0sEpHvwIC40JkOoaME+NxKUgJwOJcblrZg8hIF6jr7aBxTHUQrkWDsVodcbGxxWJwE9CaAOuNaE0hhts5uqhrTLhlQD1aQWK0Up4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763772146; c=relaxed/simple;
	bh=wC+HNQryOsuY473Okx9MmVWBCrgGe5jCgXArgY01/cg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b75+r0KzX1iw5q6yx4GchRxNHJ1gg7vw6X9xCUjO7xw+lQywWRyi7p53qu9L2A1FTflyvyUgPfMbyOTAeWcT0JCyZ66mx0TUaNQEvV4I3SkHu9of5ALRQtmj0U+tM3QZDHQhOZA2riVgQWnU1tV3u/Ix1O62Y+9Elsyip497iv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGKcDRl9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGKcDRl9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763772144; x=1795308144;
  h=date:from:to:subject:message-id:mime-version;
  bh=wC+HNQryOsuY473Okx9MmVWBCrgGe5jCgXArgY01/cg=;
  b=QGKcDRl9YI8Fe2ZIceQGwlYP1x0k0LqHWSghMK3V6dBjEq91QmJIaFWw
   yb6l1C5lFbpKGt3MgnCnZMsDWSzHeFGodI37cZa7MKocqVSWFgqtQqU20
   Dlcqh4H5kVRAXDhq2KDH1I9uIzLroFWipqdNZOAHS44AbHz2vBi8pxcUb
   I2132kWLSZ4ftDRsI5a55FH6BcHxAmYqkqrJOpMSB40R30xMAGSwtyMLl
   9mpz89aym684qOOrfECAEof82YEkVgKWKTS81Jzw47K31o30GDmBBoSXs
   eDKkeIZGHDFV9TWM+hlI2VPzpVcHUk8Cd2uYp2ZwoRGbizouCmCCayWp1
   A==;
X-CSE-ConnectionGUID: c0ZwwUgvQvCKihD8v+oUjw==
X-CSE-MsgGUID: CmvVuFfWSTqubth8BJg5wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="77231725"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="77231725"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 16:42:24 -0800
X-CSE-ConnectionGUID: qkV1ngygRd2y1ZN5OrXl/Q==
X-CSE-MsgGUID: x80tSkQgToWw/W+isZFVGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="222458212"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 21 Nov 2025 16:42:23 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMbhk-000000001yd-37oR
	for oe-kbuild@lists.linux.dev;
	Sat, 22 Nov 2025 00:42:20 +0000
Date: Sat, 22 Nov 2025 01:41:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Markus-Probst/rust-Add-trait-to-convert-a-device-reference-to-a-bus-device-reference/20251116-012949
 4/4] checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'type'
Message-ID: <202511220111.fpElH9Rz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Markus Probst <markus.probst@posteo.de>

tree:   https://github.com/intel-lab-lkp/linux/commits/Markus-Probst/rust-Add-trait-to-convert-a-device-reference-to-a-bus-device-reference/20251116-012949
head:   52d5d4a8ec758a1daa8c74da33cbdc0259c1135e
commit: 52d5d4a8ec758a1daa8c74da33cbdc0259c1135e [4/4] rust: leds: add multicolor classdev abstractions
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251122/202511220111.fpElH9Rz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511220111.fpElH9Rz-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'type'
#174: FILE: rust/kernel/led/multicolor.rs:103:
+    type Type = bindings::led_classdev_mc;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
