Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1133C48B398
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Oct 2026 19:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792007159; cv=none; b=F8uksbQzWru24J8K9pDHC+VxRQhKHpw6RGd+o2Fm6r/h06Z2BkQhnRahrHuVkYW5NS5+r0eWSUPeL82Kmm+6z3k4KBXFXWs2JFeOeHmCIXT2IKDHUyYOu9QppQA6SiNiA+kyNfXamhIutTX8WhZq21mg4jQstGq+UkQXuCoUm2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792007159; c=relaxed/simple;
	bh=wgBU4wbyGokkvzMHibBKRT4X2cB3SmEKxClP71pVfnk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KXNmeYuzUKye0xxZ4Df4d+RJ/19FyvsFo20iOyZ61o9UHCAJ+LoVxTAb+dsx9EQylPd729RjaHPg2tUBSb5ZsFENdECDSh0vOX/YCDeI/ijSjuhvZbcqz/RVQTSDzKwpCThn5M1b0LNIyugb+khWEvPIGi8l2NmMmQLm5r3o5bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dp5EbQbX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dp5EbQbX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792007152; x=1823543152;
  h=date:from:to:cc:subject:message-id;
  bh=wgBU4wbyGokkvzMHibBKRT4X2cB3SmEKxClP71pVfnk=;
  b=dp5EbQbXTHd4rmdlYQZu+C/iqAo4xJBz0CIcovefzOXib39d8QHTHFMD
   GcN20WDh1mr6ENIbBwDUF7OxfNjyINF3E5U8BbY/cpioPB41CIC9jesy7
   G7tGHe4GYlk1AL45xLZzEFkIRt0e9MCBsREp/Mv5uJD27NPTC/gYZ2iv6
   OtTL4u/ETUXe4l9fYHJEvH7vglzir1qhK5gqmIS+8yGygwL+SCTpxd8w5
   GFuzZCwEs1YaNAa4Pce81OoZOew+3ixkzBMdt7JWLx3l7dh33Mtv0xvcX
   f2i2MwUNiEBy53k+BTy7PA5lZD0aATNYjJsiuIruy8r5wOuzEHwDGQgK1
   g==;
X-CSE-ConnectionGUID: 8ICJ0uXKSvm4tLuM8RMpDA==
X-CSE-MsgGUID: saG+8Dp3Q8+UESwkAhVfOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="666131"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="666131"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 12:45:52 -0700
X-CSE-ConnectionGUID: mJFxxHUcROKWsdSirRu3bg==
X-CSE-MsgGUID: wmYMaxTyShSfqDF356BtUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1844840"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 14 Oct 2026 12:45:51 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH4v6-00000000BHV-1DcG;
	Wed, 14 Oct 2026 19:45:48 +0000
Date: Wed, 14 Oct 2026 21:45:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 15111/16498]
 drivers/net/wireless/intel/iwlwifi/pcie/rx.o: warning: objtool:
 iwl_pcie_rx_allocator+0x264: unreachable instruction
Message-ID: <202610142141.Wg6Ng38T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d419d682257d813f6cb7a28e42b35d0edf4ad038
commit: ea0bd01bc8bc5fd9b9e262e258606e20b2cb667b [15111/16498] wifi: iwlwifi: Revert "wifi: iwlwifi: pcie: move generation specific files to a folder"
:::::: branch date: 5 hours ago
:::::: commit date: 3 days ago
config: loongarch-randconfig-2001-20261014 (https://download.01.org/0day-ci/archive/20261014/202610142141.Wg6Ng38T-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610142141.Wg6Ng38T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610142141.Wg6Ng38T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/intel/iwlwifi/pcie/rx.o: warning: objtool: iwl_pcie_rx_allocator+0x264: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
