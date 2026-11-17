Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893807;
	b=V9zAgLyDryXM1FdHRroAE+zid4iNmV9iRE7/d7wi1Ljb/OJHpaZpUjFrfPRm66DH53lj
	 cKQhlxMGIT/E1PrTDFdO6h6zkQ0ikZkpOUxA4XRBhNRjRDF3UbX735PfGSgaxGF0szpbm
	 SrPaTnwGkOR2HhgrTrhVW3YUZGFzqVkhqxMCbB297Nsa1aa6hgU8/Av+Ff0sYvv0Trt9U
	 Sx+pBmeiTTBEC+rqxP4HuI9MepqNoM+0bqR/zWhSbOF5Kqdgo4a345iZeCzmyVyMzY+xp
	 DylOMcNdn1ziRDtlL45YyJZl8W0ggOHi43XwzJgUy753+f4P22xjUjvq1j8qMzDal5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893807;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=m8ysfASCVRguy3cLwBQ39XU37stKuwEbtjtzrf8Zw8c=;
	b=SVY8OF4xmE6o7r+ttaDuT8NLYcPJRD9TUkQEOhwMTzbwZwQUHcNhwH3X2aKMLSbRE3Rv
	 qUuKyZ0SM/u8eg8J+y6T1KgzM60h29Q9mkSoA4gDKZmg1sGK4CuzawLmqviYvG/7NTkn5
	 4fAPtx0F5bO7sPGa1lFWCtKvuHnZc5BcTPrmxGtQANlWn0/BFnm5pZECNaAMaEvefqvya
	 /e16g/xi+rYc6uOQsHz4W8lzQr7plQ76DQlOKGU94MzEnYgY9bsG/zVAbsv4HWACHoQPe
	 4q1CpQq8l3iNLeKi1Grjc8WNfYYQV5oX9ebWio4DdCXz9PZU2ANH3RX8k4Ix+Y7aX6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T7YGvikG;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EA5606A31C
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 05:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83EA5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T7YGvikG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794893806; x=1826429806;
  h=date:from:to:cc:subject:message-id;
  bh=yp0DO6JaxEEg2NDdCcsAgWY/3zBy9OdyOYm1her2Qc0=;
  b=T7YGvikGmUHmKqhYvbxzdTo85xu9yefsmpKJzcwDhNTUWht6G0piqNP2
   UVFjAmKsouYA2ifk3uh+YPuAnYf3tVPVqSHNO2ZvLx6b88kQaqc64BaqT
   aOdszZpyb+ITWSfYksulXAx7eFF8Vgd9jAomN64H8M6ssTrwriTNEpdEr
   ckyBr5I/vGbavVP7/POFSILzFd1MiREG4cowDqMYoN8+9exC49p0xH+7v
   k7hVIFB5wmQSCmoyrVCBFVfcX8LSBf15W8ACrIoc/qqRDSCsbHCh85zGu
   eW4ozWWsSpu4WsG2gD8GdbPPCNZVcAD6bSrYYBvxRSfda+VMb6NORcdxm
   A==;
X-CSE-ConnectionGUID: bwA2c3uOSa+dh5B/vhDPcA==
X-CSE-MsgGUID: k9ebcjpkSoeVP+70HIXsjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3529927"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3529927"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 21:36:46 -0800
X-CSE-ConnectionGUID: uRzSJJJdRzemM9MY2/RxbA==
X-CSE-MsgGUID: 0SaBqEhSR5+p2reSX6YGww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10064001"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 16 Nov 2026 21:36:45 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTBs2-000000002z8-3vYN;
	Tue, 17 Nov 2026 05:36:42 +0000
Date: Tue, 17 Nov 2026 06:36:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-lts 152/152] tls.c:1685:9:
 error: too many arguments to function 'tls_crypto_info_init'
Message-ID: <202611170607.BEtkxld0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   c5e3d3a3d3b60eb95c36e3c49dbfe7a34c220c5a
commit: eaf1f4a5c38aaef9c1ff6c9e4fb062d9138860e4 [152/152] selftests: tls: add rekey tests
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261117/202611170607.BEtkxld0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170607.BEtkxld0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611170607.BEtkxld0-lkp@intel.com/

All errors (new ones prefixed by >>):

   tls.c: In function 'tls_basic_rekey_rx':
>> tls.c:1685:9: error: too many arguments to function 'tls_crypto_info_init'
    1685 |         tls_crypto_info_init(TLS_1_3_VERSION, TLS_CIPHER_AES_GCM_128,
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1687:9: error: too many arguments to function 'tls_crypto_info_init'
    1687 |         tls_crypto_info_init(TLS_1_3_VERSION, TLS_CIPHER_AES_GCM_128,
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_basic_rekey_tx':
   tls.c:1716:9: error: too many arguments to function 'tls_crypto_info_init'
    1716 |         tls_crypto_info_init(TLS_1_3_VERSION, TLS_CIPHER_AES_GCM_128,
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1718:9: error: too many arguments to function 'tls_crypto_info_init'
    1718 |         tls_crypto_info_init(TLS_1_3_VERSION, TLS_CIPHER_AES_GCM_128,
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_rekey':
   tls.c:1754:9: error: too many arguments to function 'tls_crypto_info_init'
    1754 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_rekey_fail':
   tls.c:1802:17: error: too many arguments to function 'tls_crypto_info_init'
    1802 |                 tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1809:9: error: too many arguments to function 'tls_crypto_info_init'
    1809 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1813:9: error: too many arguments to function 'tls_crypto_info_init'
    1813 |         tls_crypto_info_init(TLS_1_2_VERSION, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1818:9: error: too many arguments to function 'tls_crypto_info_init'
    1818 |         tls_crypto_info_init(TLS_1_2_VERSION, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1824:17: error: too many arguments to function 'tls_crypto_info_init'
    1824 |                 tls_crypto_info_init(variant->tls_version, TLS_CIPHER_CHACHA20_POLY1305, &tls12, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1826:17: error: too many arguments to function 'tls_crypto_info_init'
    1826 |                 tls_crypto_info_init(variant->tls_version, TLS_CIPHER_AES_GCM_256, &tls12, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1849:9: error: too many arguments to function 'tls_crypto_info_init'
    1849 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_rekey_peek':
   tls.c:1872:9: error: too many arguments to function 'tls_crypto_info_init'
    1872 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_splice_rekey':
   tls.c:1912:9: error: too many arguments to function 'tls_crypto_info_init'
    1912 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_rekey_peek_splice':
   tls.c:1962:9: error: too many arguments to function 'tls_crypto_info_init'
    1962 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_rekey_getsockopt':
   tls.c:1979:9: error: too many arguments to function 'tls_crypto_info_init'
    1979 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 0);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
