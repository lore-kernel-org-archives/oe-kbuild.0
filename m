Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE2E18B48A
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Nov 2024 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731482677; cv=none; b=rT4hLaSjnxfEe21uj1ApBo1wMVtCL2SJ6ny2y/oeQe1JQUz+C+Wa/jgHxcPgi1CaLrA9hpL6zZB0n25qCghzsoewcoGV/syvO9Lhev6UiXFCM+stOOr2AqIkWLZL20i1OooAJYKEgsJHzZ3vcvYFSySMUvUl74mIXyl41FmcMgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731482677; c=relaxed/simple;
	bh=O0+Il4BvVvDYiiWbuhVzy1e3aHKjhRl7RRNYC/eB910=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IfRN50ZhqDLcVQB5eqCiTrFAr1UYzAnJ2ilUOeth4i7PjptfvesWQe8dRCmp3FGOmdmuUotpX3Pbhocq7iAVcyyU6Y8hCswEc7OLmT/Wppcd692SbPaKSGZHCdG7bu8bQY8ZpJgqlRdX8dYvs8c96PS6PiwM4i/SVHjQQlxwhRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2ViWl+6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2ViWl+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731482676; x=1763018676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O0+Il4BvVvDYiiWbuhVzy1e3aHKjhRl7RRNYC/eB910=;
  b=H2ViWl+6DkvwMRsvR6cxFkhmaiKHTvZipSfO8ZZAqom5cLUchTtwCL6J
   j+Ymdc6cj1PIRVPDpMquBurxSZmNzwz2ErAMschGP8uxCwEs6XNbLZNIV
   Qf3aY2Ck/+6fFi3e9A9la2WuvKalEq4lW6NppW89Gf9l0/zZh6NEa4yvY
   MUt408DW6MMssTehKu0ffPPOC3KF+GRLDodxM3w0iSjKOAFIAp2Axi7Rx
   mu22/fG/1YaQrdZcftKLlHBq5FvpvWx9PFWtlemmIABoaDhRkELJK8Q5c
   Eftgrk+95cEGArT7JysnCSwN8fMay/rDMlGKEdMdghQ/UToVIh1rRQfs5
   Q==;
X-CSE-ConnectionGUID: 5vWJRH+0TrSbwiLCNfPtiw==
X-CSE-MsgGUID: xmajgVQKSwOaV2lVaNOb9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="41973689"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="41973689"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 23:24:35 -0800
X-CSE-ConnectionGUID: 3QCTOYCkRAmivMu8lBXqSQ==
X-CSE-MsgGUID: U6x8C8UHTeSxvDjQyz8SYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="88181765"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Nov 2024 23:24:34 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB7jr-00005V-37;
	Wed, 13 Nov 2024 07:24:31 +0000
Date: Wed, 13 Nov 2024 15:24:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/3] dt-bindings: net: nuvoton: Add schema for MA35
 family GMAC
Message-ID: <202411131549.2yqnJfxZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: ignoring, error in schema: properties: compatible"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241113051857.12732-2-a0987203069@gmail.com>
References: <20241113051857.12732-2-a0987203069@gmail.com>
TO: Joey Lu <a0987203069@gmail.com>
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: mcoquelin.stm32@gmail.com
TO: richardcochran@gmail.com
CC: alexandre.torgue@foss.st.com
CC: joabreu@synopsys.com
CC: ychuang3@nuvoton.com
CC: schung@nuvoton.com
CC: yclu4@nuvoton.com
CC: linux-arm-kernel@lists.infradead.org
CC: netdev@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: openbmc@lists.ozlabs.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: Joey Lu <a0987203069@gmail.com>

Hi Joey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on net-next/main net/main linus/master v6.12-rc7 next-20241112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Lu/dt-bindings-net-nuvoton-Add-schema-for-MA35-family-GMAC/20241113-132300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241113051857.12732-2-a0987203069%40gmail.com
patch subject: [PATCH v2 1/3] dt-bindings: net: nuvoton: Add schema for MA35 family GMAC
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: arc-randconfig-051-20241113 (https://download.01.org/0day-ci/archive/20241113/202411131549.2yqnJfxZ-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
dtschema version: 2024.11
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131549.2yqnJfxZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411131549.2yqnJfxZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: ignoring, error in schema: properties: compatible
   Warning: Duplicate compatible "adi,ad5693" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   Warning: Duplicate compatible "adi,ad5675r" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   Warning: Duplicate compatible "adi,ad5691r" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   Warning: Duplicate compatible "adi,ad5695r" found in schemas matching "$id":

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
