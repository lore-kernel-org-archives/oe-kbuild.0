Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B186D1CAA78
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965754; cv=none; b=GeaJq7RYctV8h5KRxBGS8Sdlmfb2PbZo0uXOLyI009+7D0fujJ095Y8cg7i/lq+Sk1jbK8nIl5IhvwWSvk+tF7hsAp1RkJkGdlwXqK2liSnuY8EexgNnfSvgVOYvVj7jInVES5wJxPtkrYoUJ2JD118EacTGumEpOUQfsGMDTRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965754; c=relaxed/simple;
	bh=N5Q2stnSQU/PCZ3GF3u/8X8gk7ouYy76TI0uzIzkOeI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pLHK867ZBAdk3ZGIu2WJBO8SFd4X6zaD43Sue6gNCmYu+auyiAETsV4WfA+HicwxksNEJRr2+OL/5oUD11rczAwltBO0StzNoBNqonQF4zU790sig3uG3KkIO5sA5+AHe1eq06oHpLRYRjMpOrLtm/9ngFtVdXbURIuNFktArzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHP5aGnF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHP5aGnF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786965752; x=1818501752;
  h=date:from:to:cc:subject:message-id;
  bh=N5Q2stnSQU/PCZ3GF3u/8X8gk7ouYy76TI0uzIzkOeI=;
  b=UHP5aGnFm4mRt1H+AAHHKOfm/z4chlhBotvJ+db7j2Iaizk1pEbfFPc/
   1M4pnkhEjesEeLmS2n+Ysjwdxb3/jJ3Is/qtFiNpMJh56sL6/+jdEomk9
   k67nsRzVcrKj5MxDe2eCraCdumBgKPFXV/YRcdbB/5Za+Ox9i94enhfxH
   +I3BDEZWuKQZgMg5H0GJNBC/0lbk2feIiU4YYUv4WuoYS3gEgWC7FSYNz
   k1B4cijl9ubCMJ+fc5dSZXsJy0yzdWI26QBDqCqE8ksEp/3/zDu6fCjkN
   LrqSAQTD9xWQNAsJZ+TtI6diK6Z623flrdHVD0lip4FqsL2wcQ3cpf1u5
   w==;
X-CSE-ConnectionGUID: gzCGCulTT3qtFsxsUHyuNA==
X-CSE-MsgGUID: 8wJ5V4E9RPe6X9X/3Hk12Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98100226"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="98100226"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 04:22:31 -0700
X-CSE-ConnectionGUID: gVwUggcUQCiCeyqfiJqhfw==
X-CSE-MsgGUID: Y8/cymxPQ6qiC6MP7sOuEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="264924145"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 17 Aug 2026 04:22:32 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvvQD-000000006nJ-1QLK;
	Mon, 17 Aug 2026 11:22:29 +0000
Date: Mon, 17 Aug 2026 13:21:44 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dtb: /
 (gocontroll,moduline-mini-111): hardware: b'Moduline Mini V1.11\x00' is not
 of type 'object', 'integer', 'array', 'boolean', 'null'
Message-ID: <202608171323.yXffA6D7-lkp@intel.com>
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
TO: Maud Spierings <maudspierings@gocontroll.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8d3ae59288f1e7d58d76558a6ee96d533bc5019f
commit: 081a4a78b6e64e2bac5a18bc6a548bc80cd8ae44 arm64: dts: freescale: Add the GOcontroll Moduline Mini
date:   6 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260817/202608171323.yXffA6D7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171323.yXffA6D7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 081a4a78b6e6 ("arm64: dts: freescale: Add the GOcontroll Moduline Mini")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608171323.yXffA6D7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'toradex,verdin-imx8mm' was expected
   	'ifm,imx8mn-vhip4' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'fsl,imx8mm' is not one of ['fsl,imx8qm', 'fsl,imx8qp']
   	'fsl,imx8mm' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml
   arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dtb: /: failed to match any schema with compatible: ['gocontroll,moduline-mini-111', 'karo,tx8m-1610', 'fsl,imx8mm']
   arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dtb: /: failed to match any schema with compatible: ['gocontroll,moduline-mini-111', 'karo,tx8m-1610', 'fsl,imx8mm']
>> arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dtb: / (gocontroll,moduline-mini-111): hardware: b'Moduline Mini V1.11\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
