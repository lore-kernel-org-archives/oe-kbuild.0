Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C91242D9B
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jan 2026 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767259083; cv=none; b=NIrtgTQVM3w8bvwvWBNDYnMSi7V1lWiJ3tX1/QD2dmAL56Q3uxzlnvm/j9JspjAmXlB3fZSnuqTuKEsmYOoq0ShbIPmTPs5jCjo4qAvvA2v5loFeCp9X95R0k3CzwPwCymuRzGxt4V0qQ1TdJJ57Gm5NOWWh8KP/WkAhFIlCFR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767259083; c=relaxed/simple;
	bh=kaYyO0ZddnZvBWrvSWFH37qcwBobfUG6etG3v9viCAA=;
	h=Date:From:To:Subject:Message-ID; b=YIXca9nZPmC/ifHHHDVHpx0s80UcmpFhBvaXFR+DJv7mCLrmqzevL6NG40laINlMTaB8wvcuOtzBxecREiBq5sJmyUUbDMA4oA1daiCUadkLhnOeFcsBmIGF9URLA5FGI37Rt6EgxTCuSjXQqA417WnCMoCfyZQflpgSlEAVrmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0O85vIb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0O85vIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767259081; x=1798795081;
  h=date:from:to:subject:message-id;
  bh=kaYyO0ZddnZvBWrvSWFH37qcwBobfUG6etG3v9viCAA=;
  b=b0O85vIbTp9XMXqOaI66kfIHsqCMYHh0iPGjK05w4C1fzmWdwBMDK69Y
   0eVsmhc0iLe+1WuRmlXCOCl8iiENIXRrJTDNxWw2rWka7M9pT2Tjb0+yK
   9o2MOS85Nyv8MQyZgx+WZvHntYmjWITQd5ZYQa4qKPtqmRSFG97zrTtnR
   8fOHWeIxi/sj7F4tfUm1Jv3Y+OnDMENsDb2ZfxVdXCf9b+Ae6iScKYz+Z
   FjggpXKvlmgQU/0jbXYew/SRC+vljt65Ftf+hNapD7jZjtgcYJ8cJmoPy
   jfyYN002w0GdQbdWvGSH/OfBf9tYDMaJFDhnBKbHWRAFLSmDS9Vcs3xaR
   Q==;
X-CSE-ConnectionGUID: wSUe9KAuRASkTZanbONKqw==
X-CSE-MsgGUID: xEYUmGE8SaexFUOHtv15hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="91453064"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="91453064"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 01:17:59 -0800
X-CSE-ConnectionGUID: 9eKYuvD5RkS2QvS/mzy3mQ==
X-CSE-MsgGUID: lUxtLgRTSi+ltQw9ZkKx6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="232289647"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 01 Jan 2026 01:17:59 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbEoe-000000000GX-0iwa
	for oe-kbuild@lists.linux.dev;
	Thu, 01 Jan 2026 09:17:56 +0000
Date: Thu, 01 Jan 2026 10:17:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ebiggers:wip-aes 37/50] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202601011001.7lM2s65x-lkp@intel.com>
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
head:   f31a24f9ce95a91bd3437677f9a2889b1836474b
commit: 4bbb14fa3fc23787b03223d8b4f8f4c3ef1f544c [37/50] crypto: arm/ghash - Use new AES library API
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260101/202601011001.7lM2s65x-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#39: FILE: arch/arm/crypto/ghash-ce-glue.c:215:
+	aes_encrypt_new(&aes_key, (u8 *)&k, (u8[AES_BLOCK_SIZE]){});

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
