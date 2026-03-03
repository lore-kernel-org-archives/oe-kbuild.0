Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492A0373BE9
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 02:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772504056; cv=none; b=Fa54At5Zw1X7tVbjnpE6xsk3KTu1BLdWsu7DWtDeRGS4LkB+sEKCz6GNvOVtO3CMtKXNiR+m6TCej0Ht/Wbr3o2knilm4ozehBHlIYKEAeFe51/TsFEfvgmBdzY1Jbr7zhqape6BQgFMo4Cm8B2aLz+6mTxlKk0nA/N+ZdKO1HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772504056; c=relaxed/simple;
	bh=sibFcmrT5YpSQ5uoymvk8wUFfP8fGV93jOcM6NLFedo=;
	h=Date:From:To:Subject:Message-ID; b=UWdKdtEagjHNC5x9Csl4Q/rmuMAEPSDJfYY6DcoDugqRgLM2c2nh+M5HerPxXFrcs7p9BsOdkQ1K4eaQ+Ghymp6cSm3VUMfOMt3+hPh5Tt5BWsw8JF3JNeXyQBWWT3SLC82SeI/ZhFh/Wc1a7SCFZ80WJCuy2bxpmN/6UyPVt40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kY9Fv7KC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kY9Fv7KC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772504054; x=1804040054;
  h=date:from:to:subject:message-id;
  bh=sibFcmrT5YpSQ5uoymvk8wUFfP8fGV93jOcM6NLFedo=;
  b=kY9Fv7KCXb+nFsI/8u2kvPmi+sfo0IykXkFamkQ8Ww8hVryTPaND/5Pp
   0XEyDBEhP4mQu/R2PO9kVfCZuRo9HAMQZ8RwgWesXEdumobWGaVpqBe1q
   mHQUynLhfBAPFaU35GIPqoUKXpZD92eJNzp+gCrdGxfhwHOM4lUOSV2E9
   j2XQ9fjK+kSP70BwmGEZoJA7/UzV2EkOXw2eAlcBYRJcMBJ1ZxSt4Vqmw
   I91JqaQ3rplWBqPhdteLRvxBCYv7ncCAqFhlPjCRavaEkxyDEdaOEP8c4
   moHp9mw/9KjEqOrOkE+g4zmEkB85bgpMyWW2O1pTOLUQAaQzRW4e9SUvM
   g==;
X-CSE-ConnectionGUID: Kg2wsOgTTrep1V5Yk6U24Q==
X-CSE-MsgGUID: sTolbfLpRXaolIKXaPMHdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="83866214"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="83866214"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 18:14:12 -0800
X-CSE-ConnectionGUID: WvwXoUSbSBKw4ZwT1TAf2g==
X-CSE-MsgGUID: 165GgNeiR02mNYgNskQVVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="215798014"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 02 Mar 2026 18:14:12 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxFGz-000000001Lo-2Tj6
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Mar 2026 02:14:09 +0000
Date: Tue, 03 Mar 2026 03:13:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-nonmm-unstable 84/103] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202603030331.lxrIiuxY-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   edf9ae1454f27f84c0dd4274c9a0519d2917ff4d
commit: bbea7464400fe521703ec97ffb2990c3b2321ad2 [84/103] xor: pass the entire operation to the low-level ops
:::::: branch date: 42 minutes ago
:::::: commit date: 42 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603030331.lxrIiuxY-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#324: FILE: lib/raid/xor/arm64/xor-neon.c:13:
+static void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#333: FILE: lib/raid/xor/arm64/xor-neon.c:40:
+static void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#342: FILE: lib/raid/xor/arm64/xor-neon.c:76:
+static void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#351: FILE: lib/raid/xor/arm64/xor-neon.c:121:
+static void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#370: FILE: lib/raid/xor/arm64/xor-neon.c:188:
+static void __xor_eor3_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#379: FILE: lib/raid/xor/arm64/xor-neon.c:222:
+static void __xor_eor3_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#388: FILE: lib/raid/xor/arm64/xor-neon.c:265:
+static void __xor_eor3_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#537: FILE: lib/raid/xor/powerpc/xor_vmx.c:54:
+		unsigned long * __restrict v1_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#538: FILE: lib/raid/xor/powerpc/xor_vmx.c:55:
+		const unsigned long * __restrict v2_in)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#551: FILE: lib/raid/xor/powerpc/xor_vmx.c:73:
+		unsigned long * __restrict v1_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#552: FILE: lib/raid/xor/powerpc/xor_vmx.c:74:
+		const unsigned long * __restrict v2_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#553: FILE: lib/raid/xor/powerpc/xor_vmx.c:75:
+		const unsigned long * __restrict v3_in)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#567: FILE: lib/raid/xor/powerpc/xor_vmx.c:97:
+		unsigned long * __restrict v1_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#568: FILE: lib/raid/xor/powerpc/xor_vmx.c:98:
+		const unsigned long * __restrict v2_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#569: FILE: lib/raid/xor/powerpc/xor_vmx.c:99:
+		const unsigned long * __restrict v3_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#570: FILE: lib/raid/xor/powerpc/xor_vmx.c:100:
+		const unsigned long * __restrict v4_in)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#585: FILE: lib/raid/xor/powerpc/xor_vmx.c:126:
+		unsigned long * __restrict v1_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#586: FILE: lib/raid/xor/powerpc/xor_vmx.c:127:
+		const unsigned long * __restrict v2_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#587: FILE: lib/raid/xor/powerpc/xor_vmx.c:128:
+		const unsigned long * __restrict v3_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#588: FILE: lib/raid/xor/powerpc/xor_vmx.c:129:
+		const unsigned long * __restrict v4_in,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#589: FILE: lib/raid/xor/powerpc/xor_vmx.c:130:
+		const unsigned long * __restrict v5_in)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
