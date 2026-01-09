Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF40429B8E0
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 06:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767939921; cv=none; b=tB2KGDMc3eJ8oEZZIEJKn9rPQrRiwAMoQOkkEoLExxmO8wwzkiMAJoYWL9WQnGnEynewfQ+dYrsp3SFV2S2ba+De2PmhobY1ZFyrr2U6hjdGlKmktqw1t/e0VKry8kWnTokNvSye9mdLyWCIYOsXSAFeAYcQEz90JqkBZgIGnw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767939921; c=relaxed/simple;
	bh=Ibk7k2wo2KtBOhGzW6Koioqi3zYg1UqihRfe1ibrQKs=;
	h=Date:From:To:Subject:Message-ID; b=ieuj85e/6sd3JAxFMzywEa3NP6JyFcqWQXONGvPX4sym37nQE5adnVn4+Ak8gxx4Hj+XHDEfMRvE7mUWKAvqSFfcjrXurkYJ7JHP3GkoKpKIH/IsJF1JJiR3zaiW2kLNNFv8R3GaO4piziG3hLaX+BTrJbKC6k7qekZn14qjmp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G1BXa+45; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1BXa+45"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767939919; x=1799475919;
  h=date:from:to:subject:message-id;
  bh=Ibk7k2wo2KtBOhGzW6Koioqi3zYg1UqihRfe1ibrQKs=;
  b=G1BXa+45gJm9kpm+S3BJybz+7vr8O12/X4o3zds2ShSsEPOLOeYLtXwO
   X2V5aMlSP+yxTMQ57s32pChbTtk2x5x27ZHnfdOAPuNqdZMQ1JwF1sMPg
   iKUvw6Zatl8tZ1C1pWwOqlShLe4fHRYgzhsfA373gei3+JaFq1syPGJA8
   /QLEBr35Iqiw67sHW9SzuGOWGMYZuPncZXvppZYZBwxuMk8NFvbonDJBm
   2yAbceNfBcy1SU1yX8hWFJ3CWK5YOE2AGQfwj6/yCFwjqKg3sD5xOuWXL
   7Y4Fa+0OXl4BwKpAjzVHhP7hNnY3QNHdHOHLbH9JZqs3hEiiN0Ijv1NYm
   Q==;
X-CSE-ConnectionGUID: ji5X7zmJR/yPPAeAetmG8Q==
X-CSE-MsgGUID: JkXZpUVFRNyC/OxiZVEi8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69368391"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="69368391"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 22:25:19 -0800
X-CSE-ConnectionGUID: nTkwRHCCRgqss/09PVp9BQ==
X-CSE-MsgGUID: RMGLfmStQ6WBxggBz9nP3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="226785809"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jan 2026 22:25:18 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve5vw-000000001zE-3J6w
	for oe-kbuild@lists.linux.dev;
	Fri, 09 Jan 2026 06:25:16 +0000
Date: Fri, 09 Jan 2026 07:25:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ebiggers:wip-aes 41/53] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202601090738.VOAoJf15-lkp@intel.com>
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
TO: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-aes
head:   08edcb2b4e40d17c130e77cb1220433b582dd831
commit: b78e56383c8886319cac40e6079bd9089107a8ac [41/53] crypto: arm/ghash - Use new AES library API
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260109/202601090738.VOAoJf15-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#42: FILE: arch/arm/crypto/ghash-ce-glue.c:215:
+	aes_encrypt(&aes_key, (u8 *)&k, (u8[AES_BLOCK_SIZE]){});

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
