Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051016;
	b=Hhkei8fxMgNuBGLlC2VPlPhvNqalOEaaTNMPH5a7Les7VwKSY9qu+bIFigQVLfgrqo8L
	 MbzLJW7xtxSiB/bjPy3tcpztF0cXW/7Db+/6E4AVPkcEqTzw1XZMhLks5lgCoqU/HKCMP
	 OzrAGz804AYWpdw23B/E/2P9bDAa65uO37SKPtr3v/kbXVXLW+t5nPBqWFbg50XkG8MOr
	 FqK+7P1aIZ2ArXx18WUwSLT2/PlyFYCHR1JrXfvt9mNHZflFM7QeEiSdt/TnTWsV1XtpW
	 56jNtkeIwhUeLhCHQeF7iQdjXaXKVxtQR43GHc+h08naAtLPSLnNXjVKAs8Lz7F8caA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051016;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qYGmoCNY6pNXohleyXIm5EAm4pyR0oMLJRcEJXW/9d4=;
	b=SN676ATR2D4bjgHBSregYFf+R+Zlw040PbviTgfwkkIrxH/UqQktJsH8wGGLDxN1lt6a
	 WegavvZU7WwN6g1jxXqR6L7tm9lkICiYjOgGiBb1j58T1PdCeXNyxA7r+iKWhTOfGuELo
	 WXUpmiPrihs2kmeiIZsvAyngYYEymLUCq4G0Zyska24fW4PRa7Xki47XeBaDiNvGu8CsA
	 +BGoFxltEO9n/2ccqDdDn58dWR+CSW5wSEgauMRtZIPaTy5kpC7IicZyCuFVqZvIdnxcK
	 2IrAeSWbUs0uHEKPy9ADIuqtJI8PdiQHlvZZKfoashj/P7vWfeMc2TCbsBLCKUBe7xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZfoRNa+Y;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8427D606A331
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 01:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8427D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZfoRNa+Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795051015; x=1826587015;
  h=date:from:to:cc:subject:message-id;
  bh=WiRFQhjGdpxTezHpXv/TZppAGJqg6dpNKry7S88bzCA=;
  b=ZfoRNa+YWnR+zHV5X+OfBULACUMKUjXBFbVpsxaHZf0xY9/NO6zy3XTs
   dcjLTl6dVgTyLrJ3gjAj36ho26H0A5FJf9oBTTr8s44JVorXKjCb6kRwN
   6HWSR1cpZAdBdOLpK4SBqm7fPn7KpbxrRQWh5j5n/iNmJxkybAeYPYANo
   NnCPvf0LR1EATeZLwtedNo6EZObBzH1YCPWYUt1Oh9EoRSRVqzqMWpOnV
   CkJgd+lh9Onn946DPhS7Q5RfgcyjNbXRGBa6Y/0k1Ai24n0fm8EXIww9A
   F/GaZMuPPDHOhBwtqvJ0h0EEe2TrcImVItgs6MT9vbOvX9DqijFXEoC28
   w==;
X-CSE-ConnectionGUID: gcIzG8pETtamOivKj6MmsA==
X-CSE-MsgGUID: 3BJoEzA8QrKPdKxWIchkFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3904531"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3904531"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 17:16:54 -0800
X-CSE-ConnectionGUID: Rzi+if1MR9qz3DVw0HwxZA==
X-CSE-MsgGUID: 4cQ7YUVHSdGwSyXvVy295A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10333074"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 18 Nov 2026 17:16:54 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTqlf-000000003ZI-0x2Y;
	Thu, 19 Nov 2026 01:16:51 +0000
Date: Thu, 19 Nov 2026 02:16:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-sp 24/24]
 mm/huge_memory.c:870 setup_thp_anon() error: strcpy() 'str' too large for
 'str_dup' (1010102 vs 4096)
Message-ID: <20261119021343.oLspWIlR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-sp
head:   8642d493c489225226aeda3fe1640c380d6c0c59
commit: dd4d30d1cdbe826e6569b44453c2d9bb9424d234 [24/24] mm: override mTHP "enabled" defaults at kernel cmdline
:::::: branch date: 17 hours ago
:::::: commit date: 2 years, 3 months ago
config: i386-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261119/20261119021343.oLspWIlR-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: dd4d30d1cdbe ("mm: override mTHP "enabled" defaults at kernel cmdline")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261119021343.oLspWIlR-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:870 setup_thp_anon() error: strcpy() 'str' too large for 'str_dup' (1010102 vs 4096)

vim +870 mm/huge_memory.c

dd4d30d1cdbe826 Ryan Roberts 2024-08-14  858  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  859  static char str_dup[PAGE_SIZE] __initdata;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  860  static int __init setup_thp_anon(char *str)
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  861  {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  862  	char *token, *range, *policy, *subtoken;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  863  	unsigned long always, inherit, madvise;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  864  	char *start_size, *end_size;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  865  	int start, end, nr;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  866  	char *p;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  867  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  868  	if (!str || strlen(str) + 1 > PAGE_SIZE)
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  869  		goto err;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14 @870  	strcpy(str_dup, str);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  871  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  872  	always = huge_anon_orders_always;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  873  	madvise = huge_anon_orders_madvise;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  874  	inherit = huge_anon_orders_inherit;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  875  	p = str_dup;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  876  	while ((token = strsep(&p, ";")) != NULL) {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  877  		range = strsep(&token, ":");
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  878  		policy = token;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  879  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  880  		if (!policy)
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  881  			goto err;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  882  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  883  		while ((subtoken = strsep(&range, ",")) != NULL) {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  884  			if (strchr(subtoken, '-')) {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  885  				start_size = strsep(&subtoken, "-");
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  886  				end_size = subtoken;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  887  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  888  				start = get_order_from_str(start_size);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  889  				end = get_order_from_str(end_size);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  890  			} else {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  891  				start = end = get_order_from_str(subtoken);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  892  			}
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  893  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  894  			if (start < 0 || end < 0 || start > end)
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  895  				goto err;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  896  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  897  			nr = end - start + 1;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  898  			if (!strcmp(policy, "always")) {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  899  				bitmap_set(&always, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  900  				bitmap_clear(&inherit, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  901  				bitmap_clear(&madvise, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  902  			} else if (!strcmp(policy, "madvise")) {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  903  				bitmap_set(&madvise, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  904  				bitmap_clear(&inherit, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  905  				bitmap_clear(&always, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  906  			} else if (!strcmp(policy, "inherit")) {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  907  				bitmap_set(&inherit, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  908  				bitmap_clear(&madvise, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  909  				bitmap_clear(&always, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  910  			} else if (!strcmp(policy, "never")) {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  911  				bitmap_clear(&inherit, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  912  				bitmap_clear(&madvise, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  913  				bitmap_clear(&always, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  914  			} else {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  915  				pr_err("invalid policy %s in thp_anon boot parameter\n", policy);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  916  				goto err;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  917  			}
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  918  		}
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  919  	}
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  920  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  921  	huge_anon_orders_always = always;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  922  	huge_anon_orders_madvise = madvise;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  923  	huge_anon_orders_inherit = inherit;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  924  	anon_orders_configured = true;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  925  	return 1;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  926  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  927  err:
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  928  	pr_warn("thp_anon=%s: error parsing string, ignoring setting\n", str);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  929  	return 0;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  930  }
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  931  __setup("thp_anon=", setup_thp_anon);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  932  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
