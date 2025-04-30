Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D8A226CF7
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Apr 2025 22:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053651; cv=none; b=nX2bRy9alUeXnr7CIBhWJy/DU+fXji4qpFJ2YtsJV0k9FkLlk9mFFhXR9mI3w/Q81/5VNSPpaQbQFxa9toVFSUmxW3cgspxGEpXNajhrau61bQZJWXOmnTxGcopHVB57NGqOy3f76+ES/vRtRUw7CTERzkuLywqg0tEYRQSosOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053651; c=relaxed/simple;
	bh=rfHIWqYrwcl+ZksD69OfmFHK/gxMDtilkJY0vzRKPsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jd3gtcWXgwqEtEYOCK08XyUWxJf2QUKo1qt+zPsEFHyfWQZOB6RKTmdtIVwTsTdSeCnsSijsm1umQjUB8puqdhBtCCewl84Z8HO9Fi7j4E0W0jmhs4zDv7nGLTtDdFa22vUytqS0BP5nuJQ5DwpH/DsqxFKM9g5RL0dhTklIXcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AeAo/b3W; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AeAo/b3W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746053648; x=1777589648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rfHIWqYrwcl+ZksD69OfmFHK/gxMDtilkJY0vzRKPsE=;
  b=AeAo/b3W3RGpAGQRSlRMoRjd0AQpWj7IrwQwx5ke8dfLaJt0BVSkx/wZ
   texCnJKEfV3t8ZUlFdtF+Dv3FXSipqrlNkF/POWy5uATCrGlKBONjMx1i
   ZrIpLuF4TmTLlZKdu9ULMnCWUrPiF/AgoEB8WgqorMvyts9YBIETyvBpD
   BZLlUkPsdWXS2NWxSsvTZKF1GxMYN+rxATmykdsGKBbwkhE2RMTSB3X3l
   UwEsSVYOMyKANvZK7TufhBaO/35FcZgXvIYwmtcfeUWB++Gog8DnsiyKm
   t2ApqDFzMHMEe2VkmYVpFHz+su6QyqdB1hgTQzyPbd8Wnke51mtt8jULz
   g==;
X-CSE-ConnectionGUID: r5sbEPEeShWvx7NzQ7liCw==
X-CSE-MsgGUID: JNI/c43rRb6HGekagD6SqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="51551607"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="51551607"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 15:54:07 -0700
X-CSE-ConnectionGUID: Y07HlKC/Qte/IFc1K3dA6A==
X-CSE-MsgGUID: gAsXGZS9QXmGqY7OgrFE+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="134147084"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Apr 2025 15:54:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAGJW-0003ov-14;
	Wed, 30 Apr 2025 22:54:02 +0000
Date: Thu, 1 May 2025 06:53:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [char-misc:char-misc-testing 2/2]
 drivers/misc/misc_minor_kunit.c:285: undefined reference to
 `kunit_binary_assert_format'
Message-ID: <202505010644.axUCdnxn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
head:   20acf4dd46e4c0905676ad2a1d9a32041469893f
commit: 20acf4dd46e4c0905676ad2a1d9a32041469893f [2/2] char: misc: make miscdevice unit test built-in only
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: arm64-randconfig-001-20250501 (https://download.01.org/0day-ci/archive/20250501/202505010644.axUCdnxn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505010644.axUCdnxn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505010644.axUCdnxn-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_minor':
>> drivers/misc/misc_minor_kunit.c:285: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> drivers/misc/misc_minor_kunit.c:285:(.text+0x12c): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:285: undefined reference to `kunit_binary_assert_format'
>> aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:285: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:282: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:282:(.text+0x17c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:282: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:282: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:281: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:281:(.text+0x1b0): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:281: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:281: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_twice':
   drivers/misc/misc_minor_kunit.c:253: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:253:(.text+0x27c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:253: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:253: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:259: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:259:(.text+0x2f0): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:259: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:259: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:258: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:258:(.text+0x358): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:258: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:258: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:259: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:252: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:252:(.text+0x3dc): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:252: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:252: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:253: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: in function `kunit_misc_dynamic_minor':
   drivers/misc/misc_minor_kunit.c:53: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:53:(.text+0x4fc): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:53: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:53: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: in function `kunit_static_minor':
   drivers/misc/misc_minor_kunit.c:43: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:43:(.text+0x5d8): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:43: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:43: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:44: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:44:(.text+0x630): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:44: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:44: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: in function `kunit_dynamic_minor':
   drivers/misc/misc_minor_kunit.c:33: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:33:(.text+0x70c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:33: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:33: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:34: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:34:(.text+0x760): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:34: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:34: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_find_minors':
>> drivers/misc/misc_minor_kunit.c:99: undefined reference to `kunit_log_append'
>> aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:115: undefined reference to `kunit_log_append'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:131: undefined reference to `kunit_log_append'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:147: undefined reference to `kunit_log_append'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_error':
   drivers/misc/misc_minor_kunit.c:409: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:409:(.text+0xb98): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:409: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:409: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:403: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:403:(.text+0xc08): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:403: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:403: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:408: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:408:(.text+0xc5c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:408: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:408: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:409: undefined reference to `__kunit_do_failed_assertion'
>> aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:400: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_unary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:400:(.text+0xcf0): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:400: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:400: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:399: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:399:(.text+0xd30): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:399: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:399: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_name_leak':
   drivers/misc/misc_minor_kunit.c:357: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:357:(.text+0xf54): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:357: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:357: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:365: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:365:(.text+0xfb4): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:365: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:365: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:366: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_unary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:366:(.text+0x1008): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:366: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:366: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:367: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:367:(.text+0x1060): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:367: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:367: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:351: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_unary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:351:(.text+0x1098): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:351: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:351: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:343: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:343:(.text+0x10dc): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:343: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:343: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:344: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_unary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:344:(.text+0x1124): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:344: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:344: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:350: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:350:(.text+0x1184): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:350: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:350: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_name':
   drivers/misc/misc_minor_kunit.c:311: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:311:(.text+0x12c4): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:311: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:311: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:308: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_unary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:308:(.text+0x1314): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:308: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:308: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:307: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:307:(.text+0x1354): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:307: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:307: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_can_open':
>> drivers/misc/misc_minor_kunit.c:192: undefined reference to `kunit_fail_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_fail_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> drivers/misc/misc_minor_kunit.c:192:(.init.text+0xf8): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:192: undefined reference to `kunit_fail_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:192: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:188: undefined reference to `kunit_fail_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_fail_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:188:(.init.text+0x13c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:188: undefined reference to `kunit_fail_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:188: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_conflict_reverse':
>> drivers/misc/misc_minor_kunit.c:605: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_unary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:605:(.init.text+0x334): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:605: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:605: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:587: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:587:(.init.text+0x36c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:587: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:587: undefined reference to `__kunit_do_failed_assertion'
>> aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:587: undefined reference to `__kunit_abort'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:593: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:593:(.init.text+0x3ac): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:593: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:593: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:594: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:594:(.init.text+0x3e4): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:594: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:594: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:588: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_unary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:588:(.init.text+0x41c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:588: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:588: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:603: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:603:(.init.text+0x460): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:603: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:603: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:604: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:604:(.init.text+0x494): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:604: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:604: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_conflict':
   drivers/misc/misc_minor_kunit.c:560: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:560:(.init.text+0x5f4): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:560: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:560: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:551: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:551:(.init.text+0x638): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:551: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:551: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:551: undefined reference to `__kunit_abort'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:552: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_unary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:552:(.init.text+0x67c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:552: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:552: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_dynamic_basic':
   drivers/misc/misc_minor_kunit.c:232: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_unary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:232:(.init.text+0x7c0): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:232: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:232: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:231: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:231:(.init.text+0x800): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:231: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:231: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_static_basic':
   drivers/misc/misc_minor_kunit.c:213: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:213:(.init.text+0x8cc): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:213: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:213: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:212: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:212:(.init.text+0x948): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:212: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:212: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:213: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_collision_reverse':
   drivers/misc/misc_minor_kunit.c:518: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_unary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:518:(.init.text+0xa2c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:518: undefined reference to `kunit_unary_assert_format'
>> aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:507: undefined reference to `kunit_kmalloc_array'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:518: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:526: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:526:(.init.text+0xb6c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:526: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:526: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:525: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:525:(.init.text+0xc24): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:525: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:525: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:526: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:521: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:521:(.init.text+0xcc0): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:521: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:521: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_collision':
>> drivers/misc/misc_minor_kunit.c:466: undefined reference to `kunit_kmalloc_array'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:482: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_unary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:482:(.init.text+0xdb4): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:482: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:482: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:472: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:472:(.init.text+0xf24): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:472: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:472: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:472: undefined reference to `__kunit_abort'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:473: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:473:(.init.text+0xf68): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:473: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:473: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:493: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:493:(.init.text+0xfac): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:493: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:493: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_dynamic_only_range':
   drivers/misc/misc_minor_kunit.c:443: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_unary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:443:(.init.text+0x1014): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:423: undefined reference to `kunit_kmalloc_array'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:443: undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:443: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:439: undefined reference to `kunit_fail_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_fail_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:439:(.init.text+0x11b8): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:439: undefined reference to `kunit_fail_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:439: undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:452: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/misc/misc_minor_kunit.c:452:(.init.text+0x11ec): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:452: undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/misc/misc_minor_kunit.c:452: undefined reference to `__kunit_do_failed_assertion'


vim +285 drivers/misc/misc_minor_kunit.c

45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23   82  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23   83  static int miscdev_find_minors(struct kunit_suite *suite)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23   84  {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23   85  	int ret;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23   86  	struct miscdevice miscstat = {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23   87  		.name = "miscstat",
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23   88  	};
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23   89  	int i;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23   90  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23   91  	for (i = 15; i >= 0; i--) {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23   92  		miscstat.minor = i;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23   93  		ret = misc_register(&miscstat);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23   94  		if (ret == 0)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23   95  			break;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23   96  	}
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23   97  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23   98  	if (ret == 0) {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  @99  		kunit_info(suite, "found misc device minor %d available\n",
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  100  				miscstat.minor);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  101  		miscdev_test_ranges[0].minor = miscstat.minor;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  102  		misc_deregister(&miscstat);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  103  	} else {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  104  		return ret;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  105  	}
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  106  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  107  	for (i = 128; i < MISC_DYNAMIC_MINOR; i++) {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  108  		miscstat.minor = i;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  109  		ret = misc_register(&miscstat);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  110  		if (ret == 0)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  111  			break;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  112  	}
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  113  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  114  	if (ret == 0) {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23 @115  		kunit_info(suite, "found misc device minor %d available\n",
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  116  				miscstat.minor);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  117  		miscdev_test_ranges[1].minor = miscstat.minor;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  118  		misc_deregister(&miscstat);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  119  	} else {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  120  		return ret;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  121  	}
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  122  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  123  	for (i = 0; i < miscdev_test_ranges[0].minor; i++) {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  124  		miscstat.minor = i;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  125  		ret = misc_register(&miscstat);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  126  		if (ret == 0)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  127  			break;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  128  	}
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  129  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  130  	if (ret == 0) {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  131  		kunit_info(suite, "found misc device minor %d available\n",
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  132  			miscstat.minor);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  133  		miscdev_test_ranges[2].minor = miscstat.minor;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  134  		misc_deregister(&miscstat);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  135  	} else {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  136  		return ret;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  137  	}
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  138  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  139  	for (i = MISC_DYNAMIC_MINOR - 1; i > miscdev_test_ranges[1].minor; i--) {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  140  		miscstat.minor = i;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  141  		ret = misc_register(&miscstat);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  142  		if (ret == 0)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  143  			break;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  144  	}
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  145  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  146  	if (ret == 0) {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  147  		kunit_info(suite, "found misc device minor %d available\n",
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  148  			miscstat.minor);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  149  		miscdev_test_ranges[3].minor = miscstat.minor;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  150  		misc_deregister(&miscstat);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  151  	}
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  152  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  153  	return ret;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  154  }
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  155  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  156  static bool is_valid_dynamic_minor(int minor)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  157  {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  158  	if (minor < 0)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  159  		return false;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  160  	if (minor == MISC_DYNAMIC_MINOR)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  161  		return false;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  162  	if (minor >= 0 && minor <= 15)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  163  		return false;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  164  	if (minor >= 128 && minor < MISC_DYNAMIC_MINOR)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  165  		return false;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  166  	return true;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  167  }
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  168  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  169  static int miscdev_test_open(struct inode *inode, struct file *file)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  170  {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  171  	return 0;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  172  }
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  173  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  174  static const struct file_operations miscdev_test_fops = {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  175  	.open	= miscdev_test_open,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  176  };
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  177  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  178  static void __init miscdev_test_can_open(struct kunit *test, struct miscdevice *misc)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  179  {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  180  	int ret;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  181  	struct file *filp;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  182  	char *devname;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  183  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  184  	devname = kasprintf(GFP_KERNEL, "/dev/%s", misc->name);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  185  	ret = init_mknod(devname, S_IFCHR | 0600,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  186  			 new_encode_dev(MKDEV(MISC_MAJOR, misc->minor)));
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  187  	if (ret != 0)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  188  		KUNIT_FAIL(test, "failed to create node\n");
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  189  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  190  	filp = filp_open(devname, O_RDONLY, 0);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  191  	if (IS_ERR_OR_NULL(filp))
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23 @192  		KUNIT_FAIL(test, "failed to open misc device: %ld\n", PTR_ERR(filp));
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  193  	else
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  194  		fput(filp);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  195  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  196  	init_unlink(devname);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  197  	kfree(devname);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  198  }
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  199  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  200  static void __init miscdev_test_static_basic(struct kunit *test)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  201  {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  202  	struct miscdevice misc_test = {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  203  		.name = "misc_test",
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  204  		.fops = &miscdev_test_fops,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  205  	};
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  206  	int ret;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  207  	const struct miscdev_test_case *params = test->param_value;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  208  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  209  	misc_test.minor = params->minor;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  210  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  211  	ret = misc_register(&misc_test);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  212  	KUNIT_EXPECT_EQ(test, ret, 0);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  213  	KUNIT_EXPECT_EQ(test, misc_test.minor, params->minor);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  214  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  215  	if (ret == 0) {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  216  		miscdev_test_can_open(test, &misc_test);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  217  		misc_deregister(&misc_test);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  218  	}
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  219  }
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  220  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  221  static void __init miscdev_test_dynamic_basic(struct kunit *test)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  222  {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  223  	struct miscdevice misc_test = {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  224  		.minor = MISC_DYNAMIC_MINOR,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  225  		.name = "misc_test",
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  226  		.fops = &miscdev_test_fops,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  227  	};
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  228  	int ret;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  229  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  230  	ret = misc_register(&misc_test);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  231  	KUNIT_EXPECT_EQ(test, ret, 0);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  232  	KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(misc_test.minor));
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  233  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  234  	if (ret == 0) {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  235  		miscdev_test_can_open(test, &misc_test);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  236  		misc_deregister(&misc_test);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  237  	}
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  238  }
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  239  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  240  static void miscdev_test_twice(struct kunit *test)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  241  {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  242  	struct miscdevice misc_test = {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  243  		.name = "misc_test",
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  244  		.fops = &miscdev_test_fops,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  245  	};
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  246  	int ret;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  247  	const struct miscdev_test_case *params = test->param_value;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  248  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  249  	misc_test.minor = params->minor;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  250  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  251  	ret = misc_register(&misc_test);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  252  	KUNIT_EXPECT_EQ(test, ret, 0);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  253  	KUNIT_EXPECT_EQ(test, misc_test.minor, params->minor);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  254  	if (ret == 0)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  255  		misc_deregister(&misc_test);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  256  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  257  	ret = misc_register(&misc_test);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  258  	KUNIT_EXPECT_EQ(test, ret, 0);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  259  	KUNIT_EXPECT_EQ(test, misc_test.minor, params->minor);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  260  	if (ret == 0)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  261  		misc_deregister(&misc_test);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  262  }
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  263  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  264  static void miscdev_test_duplicate_minor(struct kunit *test)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  265  {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  266  	struct miscdevice misc1 = {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  267  		.name = "misc1",
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  268  		.fops = &miscdev_test_fops,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  269  	};
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  270  	struct miscdevice misc2 = {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  271  		.name = "misc2",
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  272  		.fops = &miscdev_test_fops,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  273  	};
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  274  	int ret;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  275  	const struct miscdev_test_case *params = test->param_value;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  276  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  277  	misc1.minor = params->minor;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  278  	misc2.minor = params->minor;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  279  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  280  	ret = misc_register(&misc1);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  281  	KUNIT_EXPECT_EQ(test, ret, 0);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  282  	KUNIT_EXPECT_EQ(test, misc1.minor, params->minor);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  283  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  284  	ret = misc_register(&misc2);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23 @285  	KUNIT_EXPECT_EQ(test, ret, -EBUSY);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  286  	if (ret == 0)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  287  		misc_deregister(&misc2);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  288  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  289  	misc_deregister(&misc1);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  290  }
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  291  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  292  static void miscdev_test_duplicate_name(struct kunit *test)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  293  {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  294  	struct miscdevice misc1 = {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  295  		.minor = MISC_DYNAMIC_MINOR,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  296  		.name = "misc1",
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  297  		.fops = &miscdev_test_fops,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  298  	};
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  299  	struct miscdevice misc2 = {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  300  		.minor = MISC_DYNAMIC_MINOR,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  301  		.name = "misc1",
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  302  		.fops = &miscdev_test_fops,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  303  	};
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  304  	int ret;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  305  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  306  	ret = misc_register(&misc1);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  307  	KUNIT_EXPECT_EQ(test, ret, 0);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  308  	KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(misc1.minor));
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  309  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  310  	ret = misc_register(&misc2);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  311  	KUNIT_EXPECT_EQ(test, ret, -EEXIST);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  312  	if (ret == 0)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  313  		misc_deregister(&misc2);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  314  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  315  	misc_deregister(&misc1);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  316  }
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  317  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  318  /*
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  319   * Test that after a duplicate name failure, the reserved minor number is
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  320   * freed to be allocated next.
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  321   */
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  322  static void miscdev_test_duplicate_name_leak(struct kunit *test)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  323  {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  324  	struct miscdevice misc1 = {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  325  		.minor = MISC_DYNAMIC_MINOR,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  326  		.name = "misc1",
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  327  		.fops = &miscdev_test_fops,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  328  	};
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  329  	struct miscdevice misc2 = {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  330  		.minor = MISC_DYNAMIC_MINOR,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  331  		.name = "misc1",
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  332  		.fops = &miscdev_test_fops,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  333  	};
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  334  	struct miscdevice misc3 = {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  335  		.minor = MISC_DYNAMIC_MINOR,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  336  		.name = "misc3",
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  337  		.fops = &miscdev_test_fops,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  338  	};
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  339  	int ret;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  340  	int dyn_minor;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  341  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  342  	ret = misc_register(&misc1);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  343  	KUNIT_EXPECT_EQ(test, ret, 0);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  344  	KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(misc1.minor));
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  345  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  346  	/*
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  347  	 * Find out what is the next minor number available.
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  348  	 */
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  349  	ret = misc_register(&misc3);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  350  	KUNIT_EXPECT_EQ(test, ret, 0);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  351  	KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(misc3.minor));
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  352  	dyn_minor = misc3.minor;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  353  	misc_deregister(&misc3);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  354  	misc3.minor = MISC_DYNAMIC_MINOR;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  355  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  356  	ret = misc_register(&misc2);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  357  	KUNIT_EXPECT_EQ(test, ret, -EEXIST);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  358  	if (ret == 0)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  359  		misc_deregister(&misc2);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  360  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  361  	/*
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  362  	 * Now check that we can still get the same minor we found before.
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  363  	 */
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  364  	ret = misc_register(&misc3);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  365  	KUNIT_EXPECT_EQ(test, ret, 0);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  366  	KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(misc3.minor));
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  367  	KUNIT_EXPECT_EQ(test, misc3.minor, dyn_minor);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  368  	misc_deregister(&misc3);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  369  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  370  	misc_deregister(&misc1);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  371  }
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  372  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  373  /*
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  374   * Try to register a static minor with a duplicate name. That might not
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  375   * deallocate the minor, preventing it from being used again.
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  376   */
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  377  static void miscdev_test_duplicate_error(struct kunit *test)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  378  {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  379  	struct miscdevice miscdyn = {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  380  		.minor = MISC_DYNAMIC_MINOR,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  381  		.name = "name1",
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  382  		.fops = &miscdev_test_fops,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  383  	};
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  384  	struct miscdevice miscstat = {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  385  		.name = "name1",
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  386  		.fops = &miscdev_test_fops,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  387  	};
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  388  	struct miscdevice miscnew = {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  389  		.name = "name2",
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  390  		.fops = &miscdev_test_fops,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  391  	};
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  392  	int ret;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  393  	const struct miscdev_test_case *params = test->param_value;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  394  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  395  	miscstat.minor = params->minor;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  396  	miscnew.minor = params->minor;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  397  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  398  	ret = misc_register(&miscdyn);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  399  	KUNIT_EXPECT_EQ(test, ret, 0);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23 @400  	KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(miscdyn.minor));
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  401  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  402  	ret = misc_register(&miscstat);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  403  	KUNIT_EXPECT_EQ(test, ret, -EEXIST);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  404  	if (ret == 0)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  405  		misc_deregister(&miscstat);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  406  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  407  	ret = misc_register(&miscnew);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  408  	KUNIT_EXPECT_EQ(test, ret, 0);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  409  	KUNIT_EXPECT_EQ(test, miscnew.minor, params->minor);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  410  	if (ret == 0)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  411  		misc_deregister(&miscnew);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  412  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  413  	misc_deregister(&miscdyn);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  414  }
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  415  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  416  static void __init miscdev_test_dynamic_only_range(struct kunit *test)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  417  {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  418  	int ret;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  419  	struct miscdevice *miscdev;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  420  	const int dynamic_minors = 256;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  421  	int i;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  422  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  423  	miscdev = kunit_kmalloc_array(test, dynamic_minors,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  424  					sizeof(struct miscdevice),
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  425  					GFP_KERNEL | __GFP_ZERO);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  426  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  427  	for (i = 0; i < dynamic_minors; i++) {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  428  		miscdev[i].minor = MISC_DYNAMIC_MINOR;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  429  		miscdev[i].name = kasprintf(GFP_KERNEL, "misc_test%d", i);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  430  		miscdev[i].fops = &miscdev_test_fops;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  431  		ret = misc_register(&miscdev[i]);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  432  		if (ret != 0)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  433  			break;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  434  		/*
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  435  		 * This is the bug we are looking for!
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  436  		 * We asked for a dynamic minor and got a minor in the static range space.
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  437  		 */
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  438  		if (miscdev[i].minor >= 0 && miscdev[i].minor <= 15) {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  439  			KUNIT_FAIL(test, "misc_register allocated minor %d\n", miscdev[i].minor);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  440  			i++;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  441  			break;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  442  		}
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  443  		KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(miscdev[i].minor));
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  444  	}
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  445  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  446  	for (i--; i >= 0; i--) {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  447  		miscdev_test_can_open(test, &miscdev[i]);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  448  		misc_deregister(&miscdev[i]);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  449  		kfree_const(miscdev[i].name);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  450  	}
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  451  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  452  	KUNIT_EXPECT_EQ(test, ret, 0);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  453  }
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  454  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  455  static void __init miscdev_test_collision(struct kunit *test)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  456  {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  457  	int ret;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  458  	struct miscdevice *miscdev;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  459  	struct miscdevice miscstat = {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  460  		.name = "miscstat",
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  461  		.fops = &miscdev_test_fops,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  462  	};
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  463  	const int dynamic_minors = 256;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  464  	int i;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  465  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23 @466  	miscdev = kunit_kmalloc_array(test, dynamic_minors,
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  467  					sizeof(struct miscdevice),
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  468  					GFP_KERNEL | __GFP_ZERO);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  469  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  470  	miscstat.minor = miscdev_test_ranges[0].minor;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  471  	ret = misc_register(&miscstat);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  472  	KUNIT_ASSERT_EQ(test, ret, 0);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  473  	KUNIT_EXPECT_EQ(test, miscstat.minor, miscdev_test_ranges[0].minor);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  474  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  475  	for (i = 0; i < dynamic_minors; i++) {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  476  		miscdev[i].minor = MISC_DYNAMIC_MINOR;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  477  		miscdev[i].name = kasprintf(GFP_KERNEL, "misc_test%d", i);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  478  		miscdev[i].fops = &miscdev_test_fops;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  479  		ret = misc_register(&miscdev[i]);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  480  		if (ret != 0)
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  481  			break;
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  482  		KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(miscdev[i].minor));
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  483  	}
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  484  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  485  	for (i--; i >= 0; i--) {
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  486  		miscdev_test_can_open(test, &miscdev[i]);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  487  		misc_deregister(&miscdev[i]);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  488  		kfree_const(miscdev[i].name);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  489  	}
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  490  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  491  	misc_deregister(&miscstat);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  492  
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  493  	KUNIT_EXPECT_EQ(test, ret, 0);
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  494  }
45f0de4f8dc385 Thadeu Lima de Souza Cascardo 2025-04-23  495  

:::::: The code at line 285 was first introduced by commit
:::::: 45f0de4f8dc385cd8959d884cd89b3b84c76b7f9 char: misc: add test cases

:::::: TO: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
