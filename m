Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1137B325722
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 05:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767591217; cv=none; b=PXrJjQgIs0RKi6lFLY62Ha4S/03V0Fj42kkG/HPZgIRYUT1I69YP8fUKpxNM2xba8bZCHoVcwhq4+LSDJeXQSnV3i/aTW6gBaYolqcAqVmFoCZuVTWU+ArzqikyemYf9ejCWaAJUD8lrg/mKOIHvTfW139paVo3eHA5aoQ21uMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767591217; c=relaxed/simple;
	bh=MMX7oNVEBm8RC9iK1aY66EofS80Ma8XOw9G+TPY1W4A=;
	h=Date:From:To:Subject:Message-ID; b=jAzCXdMAQnohpVpY2O3+wPI1OAYm9MdGRInsjdmb3tRLuSWH4rNDEevEjQO49l8sGlr3SvaKSTWwSML4Za87kSeg+/ZlbNzcUmvW1mTs9tNgZCGSEWcqoqztnC6+FRztrwOKKVZ7uFxj5KYVsGtHijGZSIGjLbKLtA97sN12Ngw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UphLt2es; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UphLt2es"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767591215; x=1799127215;
  h=date:from:to:subject:message-id;
  bh=MMX7oNVEBm8RC9iK1aY66EofS80Ma8XOw9G+TPY1W4A=;
  b=UphLt2eseqjfylV6hjZjQFlr7qrWwMiB/xGTHP9rPWxqg1RfaAdBx+k7
   k1USEQ++2XExExwPyc4YdRzjjy+BkYRYE5kQg9ad9q+wLhP95q2FclXhu
   XHcFLcv0g0irMXqyzIShnuPJqNg+4eBX7o5RM+TO6XokjDuvhyEjXHdbk
   xQx4Y6skb8oeJq5Y8JKLBCtd4qBNJeypIDnjQYK9ss4P4JHOFnGVABugU
   2sV2nwl1Oa+EGj61r8UYj7KgtcVltxMn0nSPUMU9Nvx4jD4CfMqDjGshX
   QWu1GqbxVU/4WJy5O5IQTk0SlBqkyNiwibUv2bP5/jlAuWMTN3lKFpAtd
   w==;
X-CSE-ConnectionGUID: aty07HinStSUpxCKjOjoqQ==
X-CSE-MsgGUID: Tz0rxnAJSU+ykGfoZ2jivg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="79590179"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="79590179"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 21:33:34 -0800
X-CSE-ConnectionGUID: GtmDOrKJS4yaQLau+MBLpw==
X-CSE-MsgGUID: 6xIgl6zYSxOR0FWCYOc/zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="202781247"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jan 2026 21:33:33 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcdDf-0000000012L-233z
	for oe-kbuild@lists.linux.dev;
	Mon, 05 Jan 2026 05:33:31 +0000
Date: Mon, 05 Jan 2026 06:32:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ebiggers:aes-lib-v1 50/51] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202601050631.1HrWwb0v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Eric Biggers <ebiggers@kernel.org>

Hi Eric,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git aes-lib-v1
head:   6429cf9fe433e31889029d5e0ea54fc7860862be
commit: dc63f9e7f126087273224d60abe5005c20d55e9e [50/51] lib/crypto: aes: Drop "_new" suffix from en/decryption functions
:::::: branch date: 89 minutes ago
:::::: commit date: 89 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260105/202601050631.1HrWwb0v-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#84: FILE: arch/arm/crypto/ghash-ce-glue.c:215:
+	aes_encrypt(&aes_key, (u8 *)&k, (u8[AES_BLOCK_SIZE]){});

ERROR:SPACING: space required before the open brace '{'
#97: FILE: arch/arm64/crypto/ghash-ce-glue.c:201:
+	aes_encrypt(&ctx->aes_key, key, (u8[AES_BLOCK_SIZE]){});

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
