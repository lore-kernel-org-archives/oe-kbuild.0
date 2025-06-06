Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E19B433A6
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Jun 2025 18:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749234258; cv=none; b=jQ9IgmnUXO5qBd3DFaaDraOhi9PxNmPvNzcHmuzZe5uMWoo+nc33QFG2AZtDLd5BdkFJlTjFgcfEZY6aIDy4yTbg8RTKw8d4BNuxr9JPy/0eSChIKV1iARm1Fr7wRD7owyuJT07jRiG56ghQ/lboVhsgXyQLNDt0ROp9OZgi4Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749234258; c=relaxed/simple;
	bh=jSM8buBMoJVmfss0gbqIU+1Lf+1NSHW0b4InyssUTcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QJIirGPzcbimHU01PSPla95EmCbv1hc+94fYdEN74qp33EVVL9Lbek12tnfIMxeG52myVSfKEJJvOiMM+CqQPMHFUcw2Kgo197XDRwmrtbD+QkedMkQqlSVNVFTmCkND6thHsxvcBZbabxFrP1DybYPFTftBC9Um6VI9+TaKPdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zk7LFFP+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zk7LFFP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749234256; x=1780770256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jSM8buBMoJVmfss0gbqIU+1Lf+1NSHW0b4InyssUTcY=;
  b=Zk7LFFP+dW96P2mh5TLex6kcPgXgcSZXPUreO/waxUalB5CxxUJjUNTM
   /+ruPw/sEhFwFB1kt11XFfWTJ53FiRX2tfS5pxvmVfrc9IsqbqMpVk4tS
   dTfbREyCY0UXs0mhVDk5F9qkC33dtzqcfzQDHzKYyHGRMezqYB23xd5G3
   C9Bv2ZySyQc0lpw89X6qPTr8uGscD0UunkzHk2P+qr0Gjm0yozC2GMMXI
   hnAfTOuJ5RjBl8McgLFXB7PmQjzYeytRsH1BJxssxxqVblWWFbRa1DyjR
   pKdKN1xf4ydpi425auSMJ90EpQwzQ1lXTdKyMGpL7wCS+1Q5eqrwfo6OR
   A==;
X-CSE-ConnectionGUID: JS3FFlYdRgiPG5f9f/CV5Q==
X-CSE-MsgGUID: E6IJ1GeHRFWINFw8Eh2zqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="61659097"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="61659097"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 11:24:16 -0700
X-CSE-ConnectionGUID: NJtBJUd5Tzeraathg74Zew==
X-CSE-MsgGUID: hrWGQyjQQwSsHoJyiZgXcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="151151534"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Jun 2025 11:24:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNbjg-0005CD-2t;
	Fri, 06 Jun 2025 18:24:12 +0000
Date: Sat, 7 Jun 2025 02:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wsa:renesas/g3s/i3c 8/9]
 arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb:
 /soc/i3c@1005b000/temp@4a: failed to match any schema with compatible:
 ['adi,adt7411']
Message-ID: <202506070231.6bPaKrP8-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/i3c
head:   1c4b3673c4a68187f90bebfed23c332d4ce0dcd9
commit: 0426adf706aa94122f582c722958873fc925fb31 [8/9] WIP: arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arm64-randconfig-052-20250606 (https://download.01.org/0day-ci/archive/20250607/202506070231.6bPaKrP8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506070231.6bPaKrP8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506070231.6bPaKrP8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: /soc/i3c@1005b000/temp@4a: failed to match any schema with compatible: ['adi,adt7411']
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: clock-controller@11010000 (renesas,r9a08g045-cpg): #power-domain-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzg2l-cpg.yaml#
--
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod1-type-3a.dtb: /soc/i3c@1005b000/temp@4a: failed to match any schema with compatible: ['adi,adt7411']
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod1-type-3a.dtb: clock-controller@11010000 (renesas,r9a08g045-cpg): #power-domain-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzg2l-cpg.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
