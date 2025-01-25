Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C022C859
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jan 2025 14:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737817153; cv=none; b=DqZGuJluyTVdFSunCY/prqzjTq/EqPgYBv10Gx5BDI2UAOAs/yDciSMsTNQ0cf+tBAamz3iLIeX9aMrHraf+UfJPeouhpZJdv7zvZt/DKD7l5dsd4vTW8QACyugq2ltfreoL70KdZrNYpHLNb3W1M54Nn2zJf0lo531PCWSecdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737817153; c=relaxed/simple;
	bh=Ok8CpyaNxu4V+Q9an9JsY+ROjSHIStNnfn+XQg6b1Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=birlaBnPqGAvkyGVpM7ha5H89kfFdyZXG2Rkk7i1Uh/cp4o9z8DSrfT43+PTvGy6k3IqGkgtD2MBLssuyeiEnKlYQVMA38PtX/mxCa/seCfO14cbIu5q04KhiEnXd6uCtq3aYmLAFzPNEQf7aKE8xpjSM6HyD8Uml3XlKlZBsO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4kO85MQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4kO85MQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737817152; x=1769353152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ok8CpyaNxu4V+Q9an9JsY+ROjSHIStNnfn+XQg6b1Ac=;
  b=n4kO85MQ65wtm/I6G0vuGTSh/z6aPOgHwpnayQ/BZZt4c0lYEFBmcHUh
   5LhYBnHkfvE6qClvwW5VymyKjnin6ROYDcgGrIf0rFAC0/IlP/RgnoCCx
   Z5oSkLnhUBV0+lMDg/mGAADqvixZwhhVEPHM6ENXLI0BqvffWlokAo4Ey
   jeX1GhBNQMUbva0bYH1WV+w0OTmHZ7fvOTwGo/7nTD88zYta99m3Z+C+m
   2PyLCZ0zlJtRwi54ePzQS5sTfsUXLe9LHTcWvhktQHKFjjs8aWUwihfxc
   km1FOAGs5NTyyCQzcejoDj4Rx2U00ItUYGVY4IlFY3CQNkQZ8yLDddbCK
   w==;
X-CSE-ConnectionGUID: bWHPqPGCQOKAQldETwGM5Q==
X-CSE-MsgGUID: /GlXW2VGQqKtirLES3EmsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="42268911"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="42268911"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 06:59:11 -0800
X-CSE-ConnectionGUID: zd3kXcuZQAGqat5Ql03hZQ==
X-CSE-MsgGUID: YEBNoR+KTFqcdfZ+2BfikA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="107826246"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jan 2025 06:59:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbhcp-000duJ-32;
	Sat, 25 Jan 2025 14:59:07 +0000
Date: Sat, 25 Jan 2025 22:58:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.15 51/63]
 arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dtb: /: compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202501252238.4C6A4IRP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-renesas-soc@vger.kernel.org
TO: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.15
head:   d1be18bd0830e8e5c62e1eab570e890d70a4fafb
commit: cdc5b11397d55bcf4dd35dfd95307c5bd5c0d0c4 [51/63] arm64: dts: renesas: Add initial device tree for Yuridenki-Shokai Kakip board
:::::: branch date: 20 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-051-20250125 (https://download.01.org/0day-ci/archive/20250125/202501252238.4C6A4IRP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501252238.4C6A4IRP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501252238.4C6A4IRP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['yuridenki,kakip', 'renesas,r9a09g057h48', 'renesas,r9a09g057'] is too long
>> 	arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   		['yuridenki,kakip', 'renesas,r9a09g057h48', 'renesas,r9a09g057'] is too short
   		'shimafuji,kingfisher' was expected
   		'renesas,r9a09g057h48' is not one of ['renesas,h3ulcb', 'renesas,m3ulcb', 'renesas,m3nulcb']
   		'renesas,r9a09g057' is not one of ['renesas,r8a7795', 'renesas,r8a7796', 'renesas,r8a77961', 'renesas,r8a77965']
   		'renesas,r9a09g057' is not one of ['renesas,r8a779m0', 'renesas,r8a779m1', 'renesas,r8a779m2', 'renesas,r8a779m3', 'renesas,r8a779m4', 'renesas,r8a779m5', 'renesas,r8a779m8', 'renesas,r8a779mb']
   	'yuridenki,kakip' is not one of ['renesas,kzm9d']
   	'yuridenki,kakip' is not one of ['renesas,genmai', 'renesas,gr-peach', 'renesas,rskrza1']
   	'yuridenki,kakip' is not one of ['renesas,rza2mevb']
   	'yuridenki,kakip' is not one of ['renesas,kzm9g']
   	'yuridenki,kakip' is not one of ['renesas,ape6evm']
--
   	'renesas,r9a08g045' was expected
   	'renesas,r9a08g045s33' was expected
   	'renesas,r9a09g011' was expected
   	'renesas,r9a09g057h48' is not one of ['renesas,rzg3e-smarcm']
   	'renesas,r9a09g057h48' is not one of ['renesas,r9a09g057h41', 'renesas,r9a09g057h42', 'renesas,r9a09g057h44']
   	'renesas,r9a07g043' was expected
   	'renesas,r9a07g044' was expected
   	'renesas,r9a07g054' was expected
   	'renesas,r9a09g057' is not one of ['renesas,r9a09g047e27', 'renesas,r9a09g047e28', 'renesas,r9a09g047e37', 'renesas,r9a09g047e38', 'renesas,r9a09g047e47', 'renesas,r9a09g047e48', 'renesas,r9a09g047e57', 'renesas,r9a09g047e58']
   	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dtb: /: failed to match any schema with compatible: ['yuridenki,kakip', 'renesas,r9a09g057h48', 'renesas,r9a09g057']
>> arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dtb: /: failed to match any schema with compatible: ['yuridenki,kakip', 'renesas,r9a09g057h48', 'renesas,r9a09g057']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
