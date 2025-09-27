Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8924C98
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Sep 2025 20:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759005064; cv=none; b=t+4muk9b6wZsbxzUq0+vsEw89uxC6FSw48/X4usHUT5wriM82E9JEnxrHJP8Q73neiNLTFf2eXBPktUSi1XSBoz6xDdQ7TOb7ECfqYUy+/jtoXEUmEMZM4Jn8XwyOZcvJ1IfOy8mbnVI1JIBMa4wR2ZZsVH4UoPjqDPGtRDxzjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759005064; c=relaxed/simple;
	bh=CWOsVj10omUKsJh75lJXYQMc+G6k8o2zb8pTofQvDC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tqkvIvIP3nqFG4WvDh0CP2K1f02NjIKBRzhckuyeKHXINOzm7FbyRZ3ii1BSI00LNq/en/RplMyhOCyuR+6zQIaTfq4bxuz0lV3honQtOmZp9Dmvi1RuR8ix5XQSE89z/s27OKq6J6NKENp5wOKwFgsadaPlMTN6uw2R//N96uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1U3GsAv; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1U3GsAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759005061; x=1790541061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CWOsVj10omUKsJh75lJXYQMc+G6k8o2zb8pTofQvDC8=;
  b=J1U3GsAvddGgcNjvWIReq6H5YtWF+pFahS0buOgW8aK39BrMYSjNSMDT
   Wlp5QY4jviaCiOpUZS9vIm25041wtvtk+LCFHnkWmdeoTtuMY6wMl2lQ8
   qUMjubP1q9qkjs4vyXXGoD1H6aVJoL6Stbav9bbAipP70fGQj02pNZGAG
   2TWwDFhmvNZkI5BR2pj1V/Gz0Eg002sU3tcaU4WzBUfvYwHDHnmTk7oFO
   +dxuvPpIww8az2rwN590E6jBZ7/hvzlMSqc4Em5J8sNAyVbj1vJmP9/Kk
   ZLjuFHLIu9ZFzCplXkrcNYFCGE/MgFwMMd1cav+FI4XVqxIe8Nx4X+Jn9
   Q==;
X-CSE-ConnectionGUID: zsvpb5dLRU6cMcKoCAOigQ==
X-CSE-MsgGUID: UpK3Gr1lSF+w+aKyF6rBBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="78945093"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="78945093"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 13:31:00 -0700
X-CSE-ConnectionGUID: LCryyWdmSSm1FVnhpg/EKA==
X-CSE-MsgGUID: 4hQKVUo+T7y1VvoJm4yqEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="178282789"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 27 Sep 2025 13:30:59 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2bZJ-0007KR-0o;
	Sat, 27 Sep 2025 20:30:57 +0000
Date: Sun, 28 Sep 2025 04:29:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 3/3] arm64: dts: nuvoton: npcm845-evb: Add peripheral
 nodes
Message-ID: <202509280422.9r3YWpMH-lkp@intel.com>
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
In-Reply-To: <20250925200625.573902-4-tmaimon77@gmail.com>
References: <20250925200625.573902-4-tmaimon77@gmail.com>
TO: Tomer Maimon <tmaimon77@gmail.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: avifishman70@gmail.com
TO: tali.perry1@gmail.com
TO: joel@jms.id.au
TO: venture@google.com
TO: yuenn@google.com
TO: benjaminfair@google.com
CC: openbmc@lists.ozlabs.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Tomer Maimon <tmaimon77@gmail.com>

Hi Tomer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250925]
[cannot apply to robh/for-next v6.17-rc7 v6.17-rc6 v6.17-rc5 linus/master v6.17-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomer-Maimon/arm64-dts-nuvoton-fix-warning-and-nodes-order/20250926-041235
base:   next-20250925
patch link:    https://lore.kernel.org/r/20250925200625.573902-4-tmaimon77%40gmail.com
patch subject: [PATCH v3 3/3] arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250926 (https://download.01.org/0day-ci/archive/20250928/202509280422.9r3YWpMH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509280422.9r3YWpMH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509280422.9r3YWpMH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/spi@fb000000: failed to match any schema with compatible: ['nuvoton,npcm845-fiu']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/spi@fb002000: failed to match any schema with compatible: ['nuvoton,npcm845-fiu']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/spi@c0000000: failed to match any schema with compatible: ['nuvoton,npcm845-fiu']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/spi@fb001000: failed to match any schema with compatible: ['nuvoton,npcm845-fiu']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: watchdog@901c (nuvoton,npcm845-wdt): Unevaluated properties are not allowed ('syscon' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/nuvoton,npcm750-wdt.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/bus@f0000000/i2c@86000/tmp100@48: failed to match any schema with compatible: ['tmp100']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/bus@f0000000/pwm-fan-controller@103000: failed to match any schema with compatible: ['nuvoton,npcm845-pwm-fan']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/bus@f0000000/spi@201000: failed to match any schema with compatible: ['nuvoton,npcm845-pspi']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
