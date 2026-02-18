Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6778D326D73
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421424; cv=none; b=VrFhpBVxwha70GcN8nRoGhmDbIwhRLNv07rSrbBUT2aRXSDxrhz11mmv4GAtaHAgdJbE+KnGV1lhDZKp1aJ+3Cz6+ENrdUIeRUx4e28fwKiMtgJvR1/xl7EcyzCFBSP1FuGq9o7Km87lmxMpEZf0zrHtY71Gr/H+u4TLYmQCfmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421424; c=relaxed/simple;
	bh=EHqmiTrmAuHL7M3iIsH9sVY5N1fpimGn/CipZU3AqIg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M+RtMeynLz0J/FqDmL1K2ZmkHNMiROqHVwDQ36hGnufX4b6n83L/byEVWpk5jwXfPNiNNHPNpSaHZZ0PImT87ogNlPCl55XgBzw7qCd19vmJRfJWq+SgCCoPqqNfD9Xpy7Qu86CjWAjL7d98y4Y+jbHDSrBvF0VtMVz7IC/bDGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lm19f3FO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lm19f3FO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771421423; x=1802957423;
  h=date:from:to:subject:message-id:mime-version;
  bh=EHqmiTrmAuHL7M3iIsH9sVY5N1fpimGn/CipZU3AqIg=;
  b=lm19f3FODWIcfbO7NjhIf4TLdIT2uGK9Vbd0651KWAag1JVRpVHZlXUz
   1rPvtk9ASMVSIfK/GcfDZbk991YTQueMp56U64axXn5yhjSGwim6o6uz4
   Vy6/XChjkSjhs9zW18VqWTPVUuYfIjlTOMb5kaP6qMaH0rXceEmg7rKad
   niIv10QXTn7S5jn+3kedd1vWG+8xzpJbgdlfefEnZxAuIq/s79/qqxnqT
   CgnnINrjmddVJ8AqoU5pZ0SU0CWK0YutRecT+eQrAnQQFVO8pz5VX1gB0
   UYpzIki1mbatDWpeqGzOAxIu7xzR6a1U1KQsFTaS6cOCj1XNNbBsOkPnQ
   w==;
X-CSE-ConnectionGUID: 7r5wvwPqSzCqwDyb1VOZzw==
X-CSE-MsgGUID: Vh4Wst2XTDq5apbrZixWEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72399285"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="72399285"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 05:30:23 -0800
X-CSE-ConnectionGUID: 1Rx9ZKmZRoyX8zUk6HJIjw==
X-CSE-MsgGUID: b9G8FOkCSFaxoFCcd2+UzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="213281314"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Feb 2026 05:30:22 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vshdD-000000003dR-3vLp
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Feb 2026 13:30:19 +0000
Date: Wed, 18 Feb 2026 14:29:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v9 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Message-ID: <202602181429.WFFHv4Gs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260218125805.615525-5-pavitrakumarm@vayavyalabs.com>
References: <20260218125805.615525-5-pavitrakumarm@vayavyalabs.com>
TO: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
TO: linux-crypto@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: herbert@gondor.apana.org.au
TO: robh@kernel.org

Hi Pavitrakumar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0ce90934c0a6baac053029ad28566536ae50d604]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavitrakumar-Managutte/dt-bindings-crypto-Document-support-for-SPAcc/20260218-210308
base:   0ce90934c0a6baac053029ad28566536ae50d604
patch link:    https://lore.kernel.org/r/20260218125805.615525-5-pavitrakumarm%40vayavyalabs.com
patch subject: [PATCH v9 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
:::::: branch date: 26 minutes ago
:::::: commit date: 26 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260218/202602181429.WFFHv4Gs-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'enable'
#100: FILE: drivers/crypto/dwc-spacc/Kconfig:52:
+	  Say y to enable Enable DDT entry stats.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
