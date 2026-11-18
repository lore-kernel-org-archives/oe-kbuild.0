Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965502;
	b=XQARC0IUbbij//LBRycnGwG7YzoXWD07hYuh/3z/BQLQoUwTVEKo/p2ewKrudVNOPWsl
	 9DvMl9rwPSlwAYdU/lkZEUqxICPiGlGFFvIbv3RRwB1/lsYgztV2Z47UySAO+7Pzqe+XR
	 0ig7eSzJajOMHaPwsxE89HQgka2v7HtnYKzALm32EYzNrRIu9LA0mFV8+4Dys/30xEQBN
	 N0hUGnRN5p2CVb3QUNObmLDW77twnpcN1cyS1PWat/iosXrMIitxqXfv1o+NY6Wz98cnB
	 zsE1UYdHDI3ZpIOmR1tiUHlt5GLruzBIimgvi6HaFv22YOac8kIbHytW5Eu2wUQqmUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965502;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=tW2iiTCIiuJWHuJY/Cp+tdsIah84T+e4R4Mt3kHFb/Q=;
	b=4Xd4HsAUTWeBjR5sANZK1SQeM7Lsh7vmgLPjRxDbzSWC1W3x8WaBvGuRkKmq0v8SrKZv
	 SyjsaGas3f+IX3Y7fgXrCP6f0UVmiT86Jjptuci8iqqs0PFeKhk+vPpv5+sCIK4xQlErK
	 H30s0G6qHjI+mePYgSnmLbHoKpf1Unm4SH8lTkwnKUJ/QPR0Yl4fjEG2ZOcYYGFX1rCOZ
	 aata69XGygRPBUGpuimqrBvVWhy8ddtraGsqCuTiRTiZBMe5qFzIWPUVuNJbazwVRMR42
	 wKb8xEo0sdsOIYret6NzotC0zGr9mywn24Yrl4NxJXiyxocfq793ebjjnBTaQDHF8IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jqFL585k;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB74606A32A
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 01:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB74606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jqFL585k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794965502; x=1826501502;
  h=date:from:to:cc:subject:message-id;
  bh=eDCpoUCj4nbn7A5wVBpvpTzbZ8KU7AkgYSr/rW4aKq4=;
  b=jqFL585kYXEl2244IkKM/Iff1rC+s8tuFsIjaelr2lVFAOdeWljJgc/z
   OviVPUJDT8aGEPjaFthAd2bQpRiBj3pZGrv/LA6QByDxcZB5FQV6eg/Bn
   2QqksSMFvfSWMAyJUuwnuwYRjPNW8Xr4v7hsWN3NAgeFCYyRt9uWUR6CN
   hHfLos2PwzcO3tqOO+DKx+2hzNjI37a/FTPNMlKrydoTsDOCbAVf2wgVQ
   0h4+oMeSaI15tUwlvIEv99LYkq9rd/F4NxOgczTugNennmnYtf6AMr0OK
   iB8N+TIKXL25a6IiH/YCo1pAPLn1DLzgQo58UaBAenK41dp2Ougwb10UQ
   Q==;
X-CSE-ConnectionGUID: xtDnrpajQiCwVkYlJwjRXA==
X-CSE-MsgGUID: WeKEMAmKShWFSgwy0hb/bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3660278"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3660278"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 17:31:41 -0800
X-CSE-ConnectionGUID: 8jU9FOe2TK6sHEecj8rRuQ==
X-CSE-MsgGUID: NSWBZdLpTAixAK6uF4l8vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9909018"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2026 17:31:40 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTUWP-000000003HS-12f4;
	Wed, 18 Nov 2026 01:31:37 +0000
Date: Wed, 18 Nov 2026 02:30:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-lts 205/205] tls.c:2015:23:
 error: implicit declaration of function '__test_passed'
Message-ID: <20261118022341.1eKY5esK-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android15-6.6-lts
head:   824580839cbc0d47e64dd2bbdef66590a57ef92d
commit: e3738530ad9c98c5aa518a7e55453684938c4144 [205/205] selftests: tls: add rekey tests
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261118/20261118022341.1eKY5esK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118022341.1eKY5esK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261118022341.1eKY5esK-lkp@intel.com/

Note: the android-common/android15-6.6-lts HEAD 824580839cbc0d47e64dd2bbdef66590a57ef92d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1673:9: error: too many arguments to function 'tls_crypto_info_init'
    1673 |         tls_crypto_info_init(TLS_1_3_VERSION, TLS_CIPHER_AES_GCM_128,
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_rekey':
   tls.c:1709:9: error: too many arguments to function 'tls_crypto_info_init'
    1709 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_rekey_fail':
   tls.c:1757:17: error: too many arguments to function 'tls_crypto_info_init'
    1757 |                 tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1764:9: error: too many arguments to function 'tls_crypto_info_init'
    1764 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1768:9: error: too many arguments to function 'tls_crypto_info_init'
    1768 |         tls_crypto_info_init(TLS_1_2_VERSION, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1773:9: error: too many arguments to function 'tls_crypto_info_init'
    1773 |         tls_crypto_info_init(TLS_1_2_VERSION, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1779:17: error: too many arguments to function 'tls_crypto_info_init'
    1779 |                 tls_crypto_info_init(variant->tls_version, TLS_CIPHER_CHACHA20_POLY1305, &tls12, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1781:17: error: too many arguments to function 'tls_crypto_info_init'
    1781 |                 tls_crypto_info_init(variant->tls_version, TLS_CIPHER_AES_GCM_256, &tls12, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1804:9: error: too many arguments to function 'tls_crypto_info_init'
    1804 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_rekey_peek':
   tls.c:1827:9: error: too many arguments to function 'tls_crypto_info_init'
    1827 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_splice_rekey':
   tls.c:1867:9: error: too many arguments to function 'tls_crypto_info_init'
    1867 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_rekey_peek_splice':
   tls.c:1917:9: error: too many arguments to function 'tls_crypto_info_init'
    1917 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_rekey_getsockopt':
   tls.c:1934:9: error: too many arguments to function 'tls_crypto_info_init'
    1934 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 0);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1950:9: error: too many arguments to function 'tls_crypto_info_init'
    1950 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_rekey_poll_pending':
   tls.c:1980:9: error: too many arguments to function 'tls_crypto_info_init'
    1980 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
>> tls.c:2015:23: error: implicit declaration of function '__test_passed' [-Wimplicit-function-declaration]
    2015 |                 exit(!__test_passed(_metadata));
         |                       ^~~~~~~~~~~~~
   tls.c: In function 'tls_rekey_poll_delay':
   tls.c:2032:9: error: too many arguments to function 'tls_crypto_info_init'
    2032 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
