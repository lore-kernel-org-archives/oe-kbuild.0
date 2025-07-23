Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D862F4A
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Jul 2025 05:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753250150; cv=none; b=PpfCL8MtItxq1pPhWIQExhtEttzUoBku/I5T6cirLJbcAggeCY4z8MmxIBhLQ1Vjlp3SPImxeVAzosYHpWHGSMvyvBsqrIjalnRhiTX1KHhI4Fg3T1zNsZ44pqQdbpPBUQuI2Z/CuoQR0q/0fHG61Qk2hqnQ72gDblFREbYHNMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753250150; c=relaxed/simple;
	bh=rRBwf0cfoceYZleCwPoaSxaitJp0Tum73+w+OMvxSmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PqETYatJ/E1exG7xDMhybnU/8RV2Uvm1Jxp3rZHcBdKeocfuYOEqoy/UtHw6GsKkuaDL8ZZ29mlUUW4xf/rVJXerYKVWRJ/WTFg429MW5yc/yeA1xq11RxTZR2zL3kx1FfRCfZmHwO6cCfwIX2tMLk7wVTldEXfRK8ug6gbf9OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNbkVA9M; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNbkVA9M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753250148; x=1784786148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rRBwf0cfoceYZleCwPoaSxaitJp0Tum73+w+OMvxSmc=;
  b=QNbkVA9MqjgPBZxxPYV/EIvtXKHJRJqMeTMiKOMxrkT3jczohnV36Nkk
   GJfArCtGj5XEYDqEUvs5Dgs6EoD+CqXUQjq9hyTIQRikANCZX1FX/Mjnt
   bAqfj7nQD23Yv/FKCTKofalVxtogHyE+HYM8jd5wfGMO4miy3hAJRr6Ac
   O5OU4jIL6LgSPAXmoS9FE0A9Wxa7fQ2dUbHnnF/XRDgbpCOYHzKCbHT5E
   v8jdZZLcIePwX/pEOIHN6Eo0iu1DtPMo3pn8/e3eKOhqnvL7GLeYOpTIu
   XA/XybAZKQ2WdH4G54TSULY3xA5oCTthWlFg2UpzKCuuYoxJm9gUA7tGb
   A==;
X-CSE-ConnectionGUID: +oxwMc2ZTA6fqcaZY7loRQ==
X-CSE-MsgGUID: vMimwHfpQfi8GHIN48zKLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="78057289"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="78057289"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 22:55:47 -0700
X-CSE-ConnectionGUID: cWHe9RU7RQyoGSi/IFy3kA==
X-CSE-MsgGUID: G+zHE4pkTf6uNwXnq1B/Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="163383055"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Jul 2025 22:55:47 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueSS8-000J1T-2j;
	Wed, 23 Jul 2025 05:55:44 +0000
Date: Wed, 23 Jul 2025 13:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2 v2a]: New board support,LinkStar-H68k-1432v1 (RK3568)
Message-ID: <202507231301.AaYJ5KcF-lkp@intel.com>
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
In-Reply-To: <20250721201714.233962-1-xunil@tahomasoft.com>
References: <20250721201714.233962-1-xunil@tahomasoft.com>
TO: Erik Beck <xunil@tahomasoft.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
CC: Erik Beck <xunil@tahomasoft.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Erik,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on linus/master v6.16-rc7 next-20250722]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Erik-Beck/New-board-support-LinkStar-H68k-1432v1-RK3568/20250722-041929
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20250721201714.233962-1-xunil%40tahomasoft.com
patch subject: [PATCH 2/2 v2a]: New board support,LinkStar-H68k-1432v1 (RK3568)
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: arm64-randconfig-051-20250722 (https://download.01.org/0day-ci/archive/20250723/202507231301.AaYJ5KcF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231301.AaYJ5KcF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507231301.AaYJ5KcF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3568-linkstar-h68k-1432v1.dtb: / (seeed,rk3568-linkstar-h68k-1432v1): compatible: 'oneOf' conditional failed, one must be fixed:
   	['seeed,rk3568-linkstar-h68k-1432v1', 'rockchip,rk3568'] is too short
   	'vamrs,ficus' was expected
   	'vamrs,rock960' was expected
   	'amarula,vyasa-rk3288' was expected
   	'seeed,rk3568-linkstar-h68k-1432v1' is not one of ['anbernic,rg351m', 'anbernic,rg351v']
   	'seeed,rk3568-linkstar-h68k-1432v1' is not one of ['anbernic,rg353p', 'anbernic,rg353ps', 'anbernic,rg353v', 'anbernic,rg353vs', 'anbernic,rg503', 'anbernic,rg-arc-d', 'anbernic,rg-arc-s']
   	'ariaboard,photonicat' was expected
   	'armsom,sige5' was expected
   	'armsom,sige7' was expected
   	'seeed,rk3568-linkstar-h68k-1432v1' is not one of ['armsom,w3']
--
   	'rockchip,px5' was expected
   	'rockchip,rk3228' was expected
   	'rockchip,rk3562' was expected
   	'rockchip,rk3568' is not one of ['rockchip,rv1126', 'rockchip,rv1109']
   	'tsd,px30-cobra' was expected
   	'tsd,px30-pp1516' was expected
   	'tsd,rk3588-tiger' was expected
   	'xunlong,orangepi-3b' was expected
   	'rockchip,rk3318' was expected
   	from schema $id: http://devicetree.org/schemas/arm/rockchip.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-linkstar-h68k-1432v1.dtb: /: failed to match any schema with compatible: ['seeed,rk3568-linkstar-h68k-1432v1', 'rockchip,rk3568']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
