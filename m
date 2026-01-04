Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE25191
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Jan 2026 06:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767506427; cv=none; b=ruVkJrbh/ZLVlY+ovoxyzovAl5+EX+U0Tdtp/APcUg/vFdJAbW3i41w370TlGsWughkLnz8yMqqbLG7ARgGDNptshCn7piTBPuVV8S/uBUp0WbfPl71TiMWlZlhClW4410QKxzlmvUe1gXPX6WTMus3jsIDabpZj7sPCBEK2/ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767506427; c=relaxed/simple;
	bh=VnO1FmABdApqOGGm8uBb83I1F5lUNzju/t7DZQwLQMY=;
	h=Date:From:To:Subject:Message-ID; b=b/QgcoXHengC0g8bv7ef2JCnGZWu1uWJRpaE7ub9xhwcbNiPQaN+xaS7AMrpUtqFWKf4PLG4xe0iffytyDqaXoUyTuD0OsCXkiWLqNonWw1wsrkYj1TZcUpkbQuZVd1rGRUAHNshl0A2QnZDua49HGi98kGBe9TB4B/BOFv50Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=leTuJQGq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="leTuJQGq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767506426; x=1799042426;
  h=date:from:to:subject:message-id;
  bh=VnO1FmABdApqOGGm8uBb83I1F5lUNzju/t7DZQwLQMY=;
  b=leTuJQGqsnXPT3MgXztLyrLy7cakh6XFHu+sxsSNgdhj3i6+xtQsSlPb
   Mg9Yfyvb5aDN/afTGy8lyZzNt582/SfEVogOcUP/IiDo4/8/5rE7oOH9u
   9VlEvC+8Ca8CMJiEdnfrrXB2iQmeOCvmbc0DImzqgWEdVyNHTLzEAVXoy
   Raq2ugbU5NTcvaT0q7YSIx0mxSod73h9vTpbmccDgnQH9k5hVzmG2i6b9
   r6FlDgrqcpxrQ3uxWskZfZHZXXSvUqSlGpitqHXk0WR7kTS/RwwawCV6Y
   YyDGkD4ZGPINlZ3Jye7QT6JxJTtIL2jbI2OEg8LZQ9FpdrVhyTtNfp4Wm
   g==;
X-CSE-ConnectionGUID: j9oDaWYuQDOxoyFKhXzIqQ==
X-CSE-MsgGUID: 58zrdYgZTE+nmuH02WYSEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="80363723"
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="80363723"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 22:00:26 -0800
X-CSE-ConnectionGUID: DlIopBziQsO6Mjwx82BOmg==
X-CSE-MsgGUID: dKeuC4NgTq63aQrIr9N8Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="233228829"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jan 2026 22:00:24 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcHA6-000000000qr-3Ee4
	for oe-kbuild@lists.linux.dev;
	Sun, 04 Jan 2026 06:00:22 +0000
Date: Sun, 04 Jan 2026 06:59:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ebiggers:wip-aes 49/50] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202601040627.9wvSH7eS-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-aes
head:   d267b9a1525bb945f8936382fd66bd3dc810616d
commit: e62f8393c50585e5b620fbc07faecd37a2863f7c [49/50] lib/crypto: aes: Drop "_new" suffix from en/decryption functions
:::::: branch date: 70 minutes ago
:::::: commit date: 70 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260104/202601040627.9wvSH7eS-lkp@intel.com/reproduce)

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
