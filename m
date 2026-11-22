Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795307891;
	b=vsKTEZtS6hi7e4KQP3+vTmMKIVMLYgEacx2vVFbgxO0rtBq3WLYGuzQvPBv9zWttppQB
	 ojxJKgA9U5+AIvila5NTistK8hnKRkR9AKhJlfPx+E5/sROMIg5Er3LsqS0GTRXHhzyvM
	 VfVh/2elpfJrSZPRE/9pXqJOqdiH7HFZ5VRQarz6+UCEuDOJdw4s4w/4MLcg3n6OLOT6v
	 rYAhbVBfxgMMYcCUIuL55lFGoRXUD2bO72mwfQhNGc9lwlwjLAYvnt1ICxaIPWlSurs9r
	 IcTmzbTvpv6Y2OVuEr+LMTKxiUpyI0uf5+EVK8ecyz8H9bDJzyNL8RbjgEruQqzdlNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307891;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=2EMCFHb7Br9VVS86CwivXfu22mBhxINFOAIfFJDr08E=;
	b=1UO1+433XLR9vCCCcNJebfn/4vEmlhob9A2VzgnmYq7l0i+Ap0VH0PScJ6OZ+b/Aevs2
	 tPittDHJ/XwL5O9pluZ/lP658nQV2RYOijD9DdLHwNA75IQa2clCqoxjuy9YhrjEGKcFf
	 P3JYHbZ8gij8wVdwyMIzLZOnxe3QwCtldLVO36FYQnECQpN5/0iz9xjnwLD8agV9M95x4
	 fF4nNDeTxUhJpSTibv/srF1QB/hj3xL/QmBvj7N1q4T9px5kUsSRStmYk9tSfPNoYYscF
	 BVJoZabUlVge6dbm79j7N9dCGiM4FG7GVSfgT8D0cxgn0A/fEp7Ypm3SsObdzYDL56w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=epdSHGO+;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D8D606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 00:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D8D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=epdSHGO+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795307890; x=1826843890;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GnIQTu90sDKtql6g8FBB+pYFthP0CiJ7ny8I5kGyZQI=;
  b=epdSHGO+p4t5U+isquNZOorTRvUoJUZAW8kHGiA/I8UX3MlHblS6l+/v
   yV+nVP2Ra+Tg/AveP4nQrS9cQ0ithVZXhggKCzpvq80fj+W55RMVaNgS4
   39f4Te9h6/By+WcybqTvH5LcH1izCVBjS83OIgCvEd+5v3eVQIeGxb9Lp
   A0OtlfuZApbBBdfHc5aUeuV6v/i2eGtFGiEgd9/ns1czSNUsdwlKqfHT3
   V7MJ8rVHlN9q8/zjF77iprGOXo5inL3ztWkRaSQetIfSOdO6nbQmJyc1u
   BjJXY++/GUD5JzJbihjbs0jK0kiXs1L0RlN8JvV0mi2CD5ofiit7kogUD
   g==;
X-CSE-ConnectionGUID: rn/Z9W+TS1e3C+ctNivjEw==
X-CSE-MsgGUID: erRHYHgOT/GLCl1GJHlYMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4193091"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4193091"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 16:38:10 -0800
X-CSE-ConnectionGUID: eo/P/GgxRV6Z9QPUwUO0qA==
X-CSE-MsgGUID: N5lgkflcR3CLrZFehH8yQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11076305"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Nov 2026 16:38:09 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUvao-00000001Kop-2BbL;
	Sun, 22 Nov 2026 00:38:06 +0000
Date: Sun, 22 Nov 2026 08:37:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC wireless-next 2/4] wifi: b43: TX descriptor and TX
 status for the AC microcode
Message-ID: <202611220824.OTwZNXMG-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "same reports for this branch"
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261112175640.40603-3-gonsolo@gmail.com>
References: <20261112175640.40603-3-gonsolo@gmail.com>
TO: Andreas Wendleder <gonsolo@gmail.com>

Hi Andreas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Wendleder/wifi-b43-11ac-chanspec-for-the-AC-microcode/20261112-185637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20261112175640.40603-3-gonsolo%40gmail.com
patch subject: [PATCH RFC wireless-next 2/4] wifi: b43: TX descriptor and TX status for the AC microcode
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20261122/202611220824.OTwZNXMG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/202611220824.OTwZNXMG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611220824.OTwZNXMG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/broadcom/b43/main.c:25:
   In file included from include/linux/if_arp.h:22:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from drivers/net/wireless/broadcom/b43/main.c:44:
>> drivers/net/wireless/broadcom/b43/xmit.h:202:6: error: call to undeclared function 'b43_ucode_is_ac'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     202 |         if (b43_ucode_is_ac(dev))
         |             ^
>> drivers/net/wireless/broadcom/b43/main.c:1346:7: error: call to undeclared function 'b43_ucode_is_ac'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1346 |                 if (b43_ucode_is_ac(dev)) {
         |                     ^
   drivers/net/wireless/broadcom/b43/main.c:1444:7: error: call to undeclared function 'b43_ucode_is_ac'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1444 |                 if (b43_ucode_is_ac(dev)) {
         |                     ^
   1 warning and 3 errors generated.
--
   In file included from drivers/net/wireless/broadcom/b43/xmit.c:17:
   In file included from drivers/net/wireless/broadcom/b43/xmit.h:5:
   In file included from drivers/net/wireless/broadcom/b43/main.h:21:
   In file included from drivers/net/wireless/broadcom/b43/b43.h:7:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from drivers/net/wireless/broadcom/b43/xmit.c:17:
>> drivers/net/wireless/broadcom/b43/xmit.h:202:6: error: call to undeclared function 'b43_ucode_is_ac'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     202 |         if (b43_ucode_is_ac(dev))
         |             ^
>> drivers/net/wireless/broadcom/b43/xmit.c:472:6: error: call to undeclared function 'b43_ucode_is_ac'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     472 |         if (b43_ucode_is_ac(dev))
         |             ^
   1 warning and 2 errors generated.
--
   In file included from drivers/net/wireless/broadcom/b43/dma.c:17:
   In file included from drivers/net/wireless/broadcom/b43/b43.h:7:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from drivers/net/wireless/broadcom/b43/dma.c:21:
>> drivers/net/wireless/broadcom/b43/xmit.h:202:6: error: call to undeclared function 'b43_ucode_is_ac'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     202 |         if (b43_ucode_is_ac(dev))
         |             ^
   1 warning and 1 error generated.


vim +/b43_ucode_is_ac +202 drivers/net/wireless/broadcom/b43/xmit.h

6e7ab9ca854ca2a drivers/net/wireless/broadcom/b43/xmit.h Andreas Wendleder 2026-11-12  198  
eb189d8bc9824bc drivers/net/wireless/b43/xmit.h          Michael Buesch    2008-01-28  199  static inline
eb189d8bc9824bc drivers/net/wireless/b43/xmit.h          Michael Buesch    2008-01-28  200  size_t b43_txhdr_size(struct b43_wldev *dev)
eb189d8bc9824bc drivers/net/wireless/b43/xmit.h          Michael Buesch    2008-01-28  201  {
6e7ab9ca854ca2a drivers/net/wireless/broadcom/b43/xmit.h Andreas Wendleder 2026-11-12 @202  	if (b43_ucode_is_ac(dev))
6e7ab9ca854ca2a drivers/net/wireless/broadcom/b43/xmit.h Andreas Wendleder 2026-11-12  203  		return B43_TXH_AC_LEN;
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.h          Rafał Miłecki     2011-08-11  204  	switch (dev->fw.hdr_format) {
5d852905561a979 drivers/net/wireless/b43/xmit.h          Rafał Miłecki     2011-08-11  205  	case B43_FW_HDR_598:
5d852905561a979 drivers/net/wireless/b43/xmit.h          Rafał Miłecki     2011-08-11  206  		return 112 + sizeof(struct b43_plcp_hdr6);
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.h          Rafał Miłecki     2011-08-11  207  	case B43_FW_HDR_410:
eb189d8bc9824bc drivers/net/wireless/b43/xmit.h          Michael Buesch    2008-01-28  208  		return 104 + sizeof(struct b43_plcp_hdr6);
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.h          Rafał Miłecki     2011-08-11  209  	case B43_FW_HDR_351:
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.h          Rafał Miłecki     2011-08-11  210  		return 100 + sizeof(struct b43_plcp_hdr6);
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.h          Rafał Miłecki     2011-08-11  211  	}
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.h          Rafał Miłecki     2011-08-11  212  	return 0;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.h          Michael Buesch    2008-01-28  213  }
eb189d8bc9824bc drivers/net/wireless/b43/xmit.h          Michael Buesch    2008-01-28  214  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
