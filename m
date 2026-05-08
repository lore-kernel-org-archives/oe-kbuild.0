Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D748321F5F
	for <oe-kbuild@lists.linux.dev>; Fri,  8 May 2026 04:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778213093; cv=none; b=SzS+ifQ25sP2EGwNEFJQC0LS70ymmQnVvJ05eDeMljDzna/jRk1FVSdgRgY8Rg0eGw6bLKwrrNAkh6wtMXqzAFkWZ10rHNXvcsyjvCa2z91zBaSyxDmMKkhroYIc5OF2kcjXPFvtMwIMuOy+mxPjOUuZ/DNIkrTgNmHJ+cXPn+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778213093; c=relaxed/simple;
	bh=sTXxtGqvDWWCL0KLFRqmWNWJM1PJObfPm2LiQVscLg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eCqaU14NOT3OJlSxLKJAB5+i7riY45M6c1JT9R8xub9cSrCywS6F+Af0uezHxsDJIEaQIg4YF0dOq6h1pdER36/+bejdniufRDroZiBoQT/AMDqn/YNFciuHa/PXaxjI3wTQtSa81bnsbwOqHcvUtPaSVhKZGrhs2YnNUmLYqAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=heGWFVaE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="heGWFVaE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778213090; x=1809749090;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sTXxtGqvDWWCL0KLFRqmWNWJM1PJObfPm2LiQVscLg4=;
  b=heGWFVaEx8CpXlOniQel0VDQg/luj5PIqME5WUbuOP2IQ9Jh6d+Xtgaa
   /kvOlG1NUF3e4umQtpuhiDVkyyWxWTilD6UTFNjIVJgzROsLV0d2b5+yj
   pxpGh3pHmO6/RpbrrANXcLNpu6lWy6laOCkZAmD29Jl+fZSBE2XCXKsgn
   Of+qMPdwdXrtECvOoogVuNp6+GJWEazO2hLdc4slrOOrVuLbE94RSv7If
   19d2cdWntzEXeoXV1IZ09FEyWfdjj2smfpJ8b3zLLq7VOII7X2N3KviUl
   NKz926Wkjf+bGMOpxTAVaS7hHwiNsBJfsTph0M2ntjsvjit4QZVmBJnSv
   A==;
X-CSE-ConnectionGUID: vNEeKeEPSDqDSM5sbPvtyg==
X-CSE-MsgGUID: 0TEaBZYvT3OXYrEIfvFcFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89767603"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="89767603"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 21:04:50 -0700
X-CSE-ConnectionGUID: R0VqpDcwSVuHk9aaht+ajA==
X-CSE-MsgGUID: 8Fs+bKtAR/uPuBha4M+ylQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="233603819"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2026 21:04:49 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLCSF-0000000075N-1a9l;
	Fri, 08 May 2026 04:04:47 +0000
Date: Fri, 08 May 2026 06:03:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: mmc@1
 (prt,prtt1c-wfm200): $nodename:0: 'mmc@1' does not match '^wifi(@.*)?$'
Message-ID: <202605080517.xAZrbl04-lkp@intel.com>
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
date:   1 year ago
:::::: branch date: 11 months ago
:::::: commit date: 1 year ago
config: arm-randconfig-2051-20260429 (https://download.01.org/0day-ci/archi=
ve/20260508/202605080517.xAZrbl04-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260508/202605080517.xAZrbl04-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: c301db25dd69 ("dt-bindings: wireless: silabs,wfx: Use wireless-con=
troller.yaml")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605080517.xAZrbl04-lkp@intel.com/

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
