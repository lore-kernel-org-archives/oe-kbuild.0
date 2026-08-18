Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCC3368282
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Aug 2026 21:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787089143; cv=none; b=GO9PdNCHb7JCA1bxqHwXuY1Oy6DwMnF5LxwAC4UwQw87CPUyukgGdahPWLR1oRlYIxW/zVbPBKn+/ZJAT9Jq2V4NCTz/tVG+Hm6VN9kxf9YPO/NrM2gqXXQnmYI8YOoefB2Zk8CJi+6cJ+ui6Al5hwQEd2W5JMGXGIyfFReMyks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787089143; c=relaxed/simple;
	bh=A+ut8Uvp9VYqNw2oT4ACpvIEgjBeBvVY//qG/TLEk3g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j2JrHe8rrpdqV/tGU1e28/9OHr2ObQ1oEvgk4yUrCM1ujVVSHhOrM3bK2khm/+vPpwwVwrlOtRYlNjt3elWAwbNZk/Xolfv99h8ywKQlBoCsSC/D/cVtXCmjDciJLupugh3YTQxiWq286UpQpjv61o0morbvfyuGYEg8v1lcVgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFBj8oNk; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFBj8oNk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787089140; x=1818625140;
  h=date:from:to:cc:subject:message-id;
  bh=A+ut8Uvp9VYqNw2oT4ACpvIEgjBeBvVY//qG/TLEk3g=;
  b=EFBj8oNkLn8IEUkyPgr0wSeptCeWk6Nvd9J+Mf0ZEnS1podvF9hKnZW5
   EPidoUdbbnM/m06mHoxgvUJbF/CEIZA2ltzcddN1QA0cIW8PZkWGKmMX9
   8MjrsXfinIWz6fokIHQJ2WFd+x6wJWQl+7RScGOGMP9R0QdbYMBJpGDwS
   ru1UrxMbjfh/d30QeZdmvYgNlSH5uhrLmTm0WgGsd4X83SVq4Q9C/D6hH
   XhmFptiX7jkLSpxBxBR95LLVpuLiQJjDel9AxafDkV/nyousHtkiio7AV
   JyVU1mOubNikC5nMcvWF3f0NKP2KBIaICGDzlg3fHMubgq4R8l+ZwMx5I
   A==;
X-CSE-ConnectionGUID: qPcCKSVNTJyY3GT5Euan8Q==
X-CSE-MsgGUID: Nfaj/qIASGawuiS/XWAKgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="97931228"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="97931228"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 14:38:59 -0700
X-CSE-ConnectionGUID: vW6m9kxzTPGe0+DuThZyFQ==
X-CSE-MsgGUID: UAWUNTvGRRe7iRoNJb7Arg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="269184714"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 18 Aug 2026 14:38:59 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwRWK-000000007Fh-2tWg;
	Tue, 18 Aug 2026 21:38:56 +0000
Date: Tue, 18 Aug 2026 23:38:54 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb:
 opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type
 'object', 'integer', 'array', 'boolean', 'null'
Message-ID: <202608182316.xor29oAg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Shengjiu Wang <shengjiu.wang@nxp.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1200d84f4c0a929a0780180d25063d93773be79c
commit: 7b5d318616888360a93cf0830705ce51b5452078 arm64: dts: add support for NXP i.MX95 15x15 audio board (version 2)
date:   4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260818/202608182316.xor29oAg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608182316.xor29oAg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7b5d31861688 ("arm64: dts: add support for NXP i.MX95 15x15 audio board (version 2)")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608182316.xor29oAg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
