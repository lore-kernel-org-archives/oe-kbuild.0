Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DE94A02
	for <oe-kbuild@lists.linux.dev>; Sat, 25 May 2024 00:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716597177; cv=none; b=IrVX164FOJNRliF6PWVQuc4X6fNPmizJNYavTqY/kORpqV9da24nAUmaMC/KRFAlNhDL8PSbUfg0mwzyaWTEJzMvhxSK70aQKPPkiZSbPqFfWl6cFuZ37LNa8PqGWJjr3p3JSfskpzGGK/IBhVLWTJ39bnhH2I2G7HlhlwbGvt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716597177; c=relaxed/simple;
	bh=ZqqFxluqyGJkDYZESN0yaXC/5y9L781GhsbohtZ0j3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KmvwQDF+vs/hpWh+LFlARrNEsFTqmpfm4+5Qi37VGc9rZBPRoeervn3P5cUJo/hy2ItN94b5runwdce+Qdqs04R7GVTMLv+q6Vzb95WMjMxuetmPvNetyAqsggi7Z5ZFZnr48Qhrh2wp1wDBKLAz/z9dvZcz36xs924zRzGFApI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQGcxrvP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQGcxrvP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716597176; x=1748133176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZqqFxluqyGJkDYZESN0yaXC/5y9L781GhsbohtZ0j3k=;
  b=jQGcxrvPrnBRx30sk28grp1CE6wIuChuEfQxfWxvUCCnjoLkdn7b+jdj
   hh8I93y6V5uzdkLwpSvR4rWT25V3wyRwvGcQm4YMRMFjZCRdzzPZFlW29
   r3sstuY03vFZUnT8UY3HnB7RCosVMJPXUL6m8aDh5sJ/e5mAUSiwDsCeI
   yt3x/moCR7prWfvMKv+9yxYyx0Y7S90u9Bn7eUYq/SZerUjhmpN4y1Jiz
   a44li9Im53DjzJ6wHUHMJDmBGYqX3DayybJ0EQarPIzR4icEvWT70WSHe
   sQ34ykQGhquB7imtuURodNnS1J0SfDNkaTtz2cUdGAjy419v34O+32N5S
   A==;
X-CSE-ConnectionGUID: 9hgprtvsT8mK+0J2oAhcJw==
X-CSE-MsgGUID: SWMv7g+4RSC2KgpTbgizFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="13112191"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="13112191"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 17:32:55 -0700
X-CSE-ConnectionGUID: ebYda7VMSh+Fvlel2zEujA==
X-CSE-MsgGUID: uueFPR12RWi8BIsOk0ituA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="38603345"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 May 2024 17:32:54 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAfLA-00062h-0L;
	Sat, 25 May 2024 00:32:52 +0000
Date: Sat, 25 May 2024 08:32:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-5.10 27119/30000] dtbs_check:
 Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml:
 ^channel@[0-3]$: Missing additionalProperties/unevaluatedProperties
 constraint
Message-ID: <202405250844.2wAXaBNe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml: ^channel@[0-3]$: Missing additionalProperties/unevaluatedProperties constraint"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: sanglipeng <sanglipeng1@jd.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8d7f48064dc365d3e6bfdf6b71a9561d5aa6d3eb
commit: e25e57f7c34051c1abec1fe6060a4af915f71b5f [27119/30000] dt-bindings: iio: add AD74413R
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7aa382fd7257d9bd4f7fc50bb7078a3c26a1628c)
dtschema version: 2024.5.dev4+ga5bbb3e
reproduce: (https://download.01.org/0day-ci/archive/20240525/202405250844.2wAXaBNe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405250844.2wAXaBNe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml: title: 'Allwinner A10 Display Engine Pipeline Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/nvmem/imx-iim.yaml: title: 'Freescale i.MX IC Identification Module (IIM) device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/arm/atmel-at91.yaml: title: 'Atmel AT91 device tree bindings.' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml: ^channel@[0-3]$: Missing additionalProperties/unevaluatedProperties constraint

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
