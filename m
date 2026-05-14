Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8773C140E
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 20:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778791204; cv=none; b=DPEnfMSfXK+2LPyq+OhrGR4I8R5nhPeOtJx3jfabJ3dPYbh0/fhz861j8QG1mur7Ff94SfaEWpkt3kYsdgkBta5GJArEmVTyJQ5oVUhbnXCoDAkrWyLbNKU8KXApZLmHGxT8OQ58cYBG3e54BA0kPLjFS24cqktbtBfr6QkmRFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778791204; c=relaxed/simple;
	bh=fjYwjGTYDeAv1UN6C7fpBXL1S3E8tSU2QcNdkRTckHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IjfxRGT6ySyXHUvLhj74BGvqtaN6L5VRGdBkFk61F89ZiGTJ4Z4oiIpE5lJ8dKbW+7d5Xnuh/1+volMfTpl5Rk4s6hKXwSo5DOuWiup6Eh11DguEzCL/vuGYcBJF4C/lnFQ9HRhBCHvAVTTdxhYCfU6AbqzwWqaIdjzzgsNqn+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8zBBg9U; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8zBBg9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778791203; x=1810327203;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fjYwjGTYDeAv1UN6C7fpBXL1S3E8tSU2QcNdkRTckHw=;
  b=M8zBBg9UMAlk1aVg0SnYxC2u6+O4p/Wy5NeGH/ULH67KfWrw2GEB3P3y
   UVHUkyZKlaLvyci6n8nfYnyEExWB8RLbq9Q99siYpnoCAeVdCaJhuHxlt
   /v4IykmOSqW6uwEbcbg7M2MTaa95zFFrSrUJyk61Atvz+l0Qdmf9mp3g3
   qN7EI5PkMAiL7pujpjDmkMPsm8SQ0EUlItqKuk+78K8Xk2rqxTr0pQRZd
   t2De4k9fRjTf2/RK5IfZD49iC1Xz11NEssKoMITmaR38WiaxjP2l08yok
   CZ7kE9vyoNxXVU9G5xVkTUFZw1MdKHFkS8LvHD1jMYZ5SBP1yBvgCWyyB
   A==;
X-CSE-ConnectionGUID: cut0AwTgQr+0/Yyp1kMd/Q==
X-CSE-MsgGUID: GHHeknZ0SpKW01RAbkRq+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79915597"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79915597"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 13:40:02 -0700
X-CSE-ConnectionGUID: 9abhayOYQMqNEPswSTzPNQ==
X-CSE-MsgGUID: k3Xpzvh4Qu6omkytXepazA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="262010466"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 14 May 2026 13:40:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNcqd-000000008rp-13GU;
	Thu, 14 May 2026 20:39:59 +0000
Date: Thu, 14 May 2026 22:39:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: mmc@1
 (prt,prtt1c-wfm200): $nodename:0: 'mmc@1' does not match '^wifi(@.*)?$'
Message-ID: <202605142244.tMMZtXVz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Janne Grunau <j@jannau.net>
CC: Johannes Berg <johannes.berg@intel.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: "J=C3=A9r=C3=B4me Pouiller" <jerome.pouiller@silabs.com>
CC: David Heidelberg <david@ixit.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: c301db25dd69d656b13f3ad2844e6349ac932c7e dt-bindings: wireless: sil=
abs,wfx: Use wireless-controller.yaml
date:   1 year, 1 month ago
:::::: branch date: 11 months ago
:::::: commit date: 1 year, 1 month ago
config: arm-randconfig-2051-20260429 (https://download.01.org/0day-ci/archi=
ve/20260514/202605142244.tMMZtXVz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260514/202605142244.tMMZtXVz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: c301db25dd69 ("dt-bindings: wireless: silabs,wfx: Use wireless-con=
troller.yaml")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605142244.tMMZtXVz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: switch@0 (nxp,sja1105q): Un=
evaluated properties are not allowed ('clocks', 'reset-gpios' were unexpect=
ed)
   	from schema $id: http://devicetree.org/schemas/net/dsa/nxp,sja1105.yaml
>> arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: mmc@1 (prt,prtt1c-wfm200): =
$nodename:0: 'mmc@1' does not match '^wifi(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/silabs,wfx.=
yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
