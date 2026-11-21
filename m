Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795234734;
	b=VBrfg1hUkt+KyfPbwjsuUrrP5WW2Of/UTTCu8i2uo07EQ5cQhPinD/WLmxcE5YrgN6It
	 CVInX5HgvDQcmy/Y+pEgoEkiPYSlXECOwSEeLWjTrqQpuf1zW4CcujTCI8P3ysovhq+LR
	 csUp7REBQRBzT4V0cHboWYI4pU+wmreld9bM5btvMdJSRTt0KPen+81CchXzzE6z13iIO
	 tWd6ZAapgfuDifdklnqTIIiE8kClTBjwMGH+/QDrwP4Vn5wpL5Ujdyt+70P3KHCdUAFbP
	 Dg6qextuAGzog+qhoHg11Nj7ZbHxBzIFmKzbsM+EPB8fx1euQqqhELLi4c93sHHVjHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795234734;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=yf4vtVMNw2HE6MzVo9whkcpFm4UYJLmVHv934MEsXcw=;
	b=zSa91J7FTXUS/m8cTz9XIweYlMNbNuDM6Juof0u/ccPVDymrA9+ooAobCJWnhkflk2SF
	 WNDx09BDf1DJD0de7lK1kaL760EJChj0vgk5xiGY9PMwgoj27mf5s4UlDth2syoF7Kjem
	 7k7pMC3j1ZpBmWytnFH+7xLpPzbQjYedCXGywhHdmePqNmBvnJwdpBB59aqiyUTWzwp17
	 fjMi4yIca+yRfiBfV+KQhr01Y5cWNniXIFoSDtAsF6wT9WtsOnoJbNhO2TmiZT/M8RIHe
	 MR/AWPP6nSIZcyTSOm/4lJgVmj+AjQmU6Jw/L76XrU3EP0f+EWyKyqEFBz0aaHM+uwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mlm6vCE6;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8149F606A690
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 04:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8149F606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mlm6vCE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795234728; x=1826770728;
  h=date:from:to:cc:subject:message-id;
  bh=We/YB59045X4ecWh5T1m3Z7dNpipLjwkKzsG/CSPVK4=;
  b=mlm6vCE678lfBi+mOZYdtcjuU9Uv3UkWMgO0AWoFCOauMcMIM12U7rnY
   YYBYmwIH2oYjRUUDYvc3zi2Dkg5xCAg7UOkht2AiRb78miSiwaEZ47dgc
   oedy7F7kHyyhg9h0Q+75wlwnzY8ImNQ1uGxA+6kpNMx+oNyIuD62mItY6
   4jlZwFuoLASPQzmhORsXRdoEhXOmlrhStAt6zrgDvVwTUi5sI0q+cTlW6
   yG3T3U6Pfo088YdYLULcKhYdbweOI6fuZfFGUAAHUvjIiM3KYvUojNPa0
   1MyvO1lxo6RE8rCAA4ykQwH3+XpHFXHtHbkhgPCiBn3NnQSapyt4PD5dr
   A==;
X-CSE-ConnectionGUID: KwyNG7OpTXejNSungBsbaQ==
X-CSE-MsgGUID: ILzfLWI4SqmCrY5yiPydwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4000539"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4000539"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 20:18:48 -0800
X-CSE-ConnectionGUID: +i42dvEIRFWZzaRkqoepEA==
X-CSE-MsgGUID: 3hY+SnQrQZKFXEaq9UnuDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10841397"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 20 Nov 2026 20:18:47 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUcYm-000000004Eb-2JzK;
	Sat, 21 Nov 2026 04:18:44 +0000
Date: Sat, 21 Nov 2026 05:17:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hare-nvme:dhchap-keyring.v4 4/9] sparc-linux-ld:
 drivers/nvme/host/fabrics.c:1106:undefined reference to
 `nvme_auth_extract_key'
Message-ID: <20261121051706.NGznwFYW-lkp@intel.com>
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
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hannes Reinecke <hare@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git dhchap-keyring.v4
head:   1b78746d90bfa570d96e88475983421f24c38b0d
commit: 471402e9fa1b77a993d10ccd1568579108ea44e8 [4/9] nvme: parse dhchap keys during option parsing
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: sparc-randconfig-r2102-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121051706.NGznwFYW-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121051706.NGznwFYW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121051706.NGznwFYW-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: drivers/nvme/host/fabrics.o: in function `nvmf_parse_options':
   drivers/nvme/host/fabrics.c:1091:(.text+0x1f78): undefined reference to `nvme_auth_extract_key'
>> sparc-linux-ld: drivers/nvme/host/fabrics.c:1106:(.text+0x2048): undefined reference to `nvme_auth_extract_key'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
