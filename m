Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD668F54
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Nov 2024 07:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732605411; cv=none; b=GVI3kkW+fFzwFEqvC1SgPxaI/vLFI1ACj64k21sCnKE3RGYiva4WPjmzmgJ6Ymj9o20vNSClrOPeZiZXx4d+7FZymu8EtbXgWsQ6f+yDn6hRsvlpj1gSiBY5ul0PXOz2LC3KtqLMfk31b9a0aDtuOxUtbEbHW0fbYSeUDozK1k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732605411; c=relaxed/simple;
	bh=QTlR0TTDuEeaxT9IeJsDcTPq80ICizty/UF5cFTZp5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ohdu47HgJ4LGeIuilV3yOmlbfnp6Il94G2r1NIYdvHW2wf7mcClpUaMRZ8RT6cAb6YUJ9Mv9M9teu4XMvSp+fT/37SzT52dXrdRMJGbp3AAAr1ubu0XwliXYubwNJPozJ7osPtkLs5wY/WkOh95vDeMAaOBpVcnF/SwUxRvcWms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MmUEAT6U; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MmUEAT6U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732605410; x=1764141410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QTlR0TTDuEeaxT9IeJsDcTPq80ICizty/UF5cFTZp5U=;
  b=MmUEAT6UuU411bpEDBET9vXj9Mqf21JlLQxJ0N+yZG2PzTprKszBbBgT
   IVqsiYUurc/mcfbvpP44xD1II2DyAgwvHJ6CWTISIfEXJpIzBMT1tlVK9
   37KmCSnpb9VbX2EBTzjSlMNebRoI1aHPTCrQ/qOlDUzdJF/nZzbnztpQr
   yk1Rz2FQkkEOKuuNTF8SKrKq/P2PFwhhTSb0LMg+SyUsAce925Srp8/SM
   nAcpStPaaUeYFBB6AJJi8RedwDyOK/AkUH1hN0xDL8fT6Kny89opFh2PV
   JdlNk2/jZHNwtVhuIGU3vhBQmym0fTmoZRsHQb8zFLC/ssGJEmwPqGCjJ
   w==;
X-CSE-ConnectionGUID: mibjV0kHR5eD4ByfP6nzug==
X-CSE-MsgGUID: hFT4e//sS3+0PZfi3qsFyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="43364326"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="43364326"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 23:16:46 -0800
X-CSE-ConnectionGUID: GXmwztMSRnicQVzfr53p/w==
X-CSE-MsgGUID: tpWTmAF9TNiRiGsUv0IgyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="95608386"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Nov 2024 23:16:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFpoR-000797-0u;
	Tue, 26 Nov 2024 07:16:43 +0000
Date: Tue, 26 Nov 2024 15:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/hid/wacom_sys.c:167 wacom_raw_event() error:
 __builtin_memcpy() 'wacom->wacom_wac.data' too small (361 vs u32max)
Message-ID: <202411261521.SrpZyeIQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andrey Konovalov <andreyknvl@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5
commit: 2e577732e8d28b9183df701fb90cb7943aa4ed16 kasan, fortify: properly rename memintrinsics
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
config: powerpc-randconfig-r072-20241126 (https://download.01.org/0day-ci/archive/20241126/202411261521.SrpZyeIQ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411261521.SrpZyeIQ-lkp@intel.com/

smatch warnings:
drivers/hid/wacom_sys.c:167 wacom_raw_event() error: __builtin_memcpy() 'wacom->wacom_wac.data' too small (361 vs u32max)

vim +167 drivers/hid/wacom_sys.c

83417206427bdf drivers/hid/wacom_sys.c          Jason Gerecke      2017-11-10  152  
29b4739134c73a drivers/input/tablet/wacom_sys.c Benjamin Tissoires 2014-07-24  153  static int wacom_raw_event(struct hid_device *hdev, struct hid_report *report,
29b4739134c73a drivers/input/tablet/wacom_sys.c Benjamin Tissoires 2014-07-24  154  		u8 *raw_data, int size)
3bea733ab21247 drivers/usb/input/wacom_sys.c    Ping Cheng         2006-07-13  155  {
29b4739134c73a drivers/input/tablet/wacom_sys.c Benjamin Tissoires 2014-07-24  156  	struct wacom *wacom = hid_get_drvdata(hdev);
3bea733ab21247 drivers/usb/input/wacom_sys.c    Ping Cheng         2006-07-13  157  
1db1f392591aff drivers/hid/wacom_sys.c          Jason Gerecke      2022-12-01  158  	if (wacom->wacom_wac.features.type == BOOTLOADER)
1db1f392591aff drivers/hid/wacom_sys.c          Jason Gerecke      2022-12-01  159  		return 0;
1db1f392591aff drivers/hid/wacom_sys.c          Jason Gerecke      2022-12-01  160  
29b4739134c73a drivers/input/tablet/wacom_sys.c Benjamin Tissoires 2014-07-24  161  	if (size > WACOM_PKGLEN_MAX)
29b4739134c73a drivers/input/tablet/wacom_sys.c Benjamin Tissoires 2014-07-24  162  		return 1;
29b4739134c73a drivers/input/tablet/wacom_sys.c Benjamin Tissoires 2014-07-24  163  
83417206427bdf drivers/hid/wacom_sys.c          Jason Gerecke      2017-11-10  164  	if (wacom_wac_pen_serial_enforce(hdev, report, raw_data, size))
83417206427bdf drivers/hid/wacom_sys.c          Jason Gerecke      2017-11-10  165  		return -1;
83417206427bdf drivers/hid/wacom_sys.c          Jason Gerecke      2017-11-10  166  
29b4739134c73a drivers/input/tablet/wacom_sys.c Benjamin Tissoires 2014-07-24 @167  	memcpy(wacom->wacom_wac.data, raw_data, size);
3bea733ab21247 drivers/usb/input/wacom_sys.c    Ping Cheng         2006-07-13  168  
29b4739134c73a drivers/input/tablet/wacom_sys.c Benjamin Tissoires 2014-07-24  169  	wacom_wac_irq(&wacom->wacom_wac, size);
3bea733ab21247 drivers/usb/input/wacom_sys.c    Ping Cheng         2006-07-13  170  
29b4739134c73a drivers/input/tablet/wacom_sys.c Benjamin Tissoires 2014-07-24  171  	return 0;
3bea733ab21247 drivers/usb/input/wacom_sys.c    Ping Cheng         2006-07-13  172  }
3bea733ab21247 drivers/usb/input/wacom_sys.c    Ping Cheng         2006-07-13  173  

:::::: The code at line 167 was first introduced by commit
:::::: 29b4739134c73a2873adec93346f09bb76d6a794 Input: wacom - switch from an USB driver to a HID driver

:::::: TO: Benjamin Tissoires <benjamin.tissoires@redhat.com>
:::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
