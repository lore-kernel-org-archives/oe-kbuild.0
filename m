Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB09D2288D2
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Feb 2025 11:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740656604; cv=none; b=J/eQQz5UUUIpo7nRN+JYtEJ4hk1gCjqpDY0+xSSAn4tvba1UMElBMl80cUqresqEj2zrZBwM+eM2Ypls/qT+CoiyOU5CeoXbJAHnxmD+3TTzsu4KnsF3gcsuVJM0KUO/x10YDH+FLkHDk49bunLuiXp8pli2n1sdk/Y71+vnNl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740656604; c=relaxed/simple;
	bh=rRCuAH1Ao+0d29+gLVKRkObC9mNIFhFCTiGHkbaQh5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AIS51VEZ+PM3J+kkNLICnfgQA1mB2Qwcj6IQCHDxfLuwez9JRX50sv2YKJAsH8Q4w8bT3QpNbXgoDTUSUVXrNPpnAEtYS5ZeS1mw6qZWjA0+1VaDxJeC4JRRfOOfCd0rKQEDRHHwfjZY5k/WJCnmolEgcnveNHzDCdU9SIKjQ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jl0SJxIJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jl0SJxIJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740656602; x=1772192602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rRCuAH1Ao+0d29+gLVKRkObC9mNIFhFCTiGHkbaQh5Y=;
  b=jl0SJxIJEw0HlSwwXoW8Rb/QnuS0ubIsGrWwTDVdakKbki+shcZzEH2c
   isQ2H2P57dg/HjOErFMvgv+lBrjWKd/ah8GLB0l/dM3doNcn9rS2ciQ5M
   BXVHqrltDYvNrun3ZNzVHUqgslcaAKYRAtk607mjaL/ZvvRDSuAi6ubBm
   S58cViu/UhLsrKxmnCXfoNedOLN1qnw1sEEy4EuP7nm9JV0LjcRMUcLY2
   DKf6VPhNVzjT2pVfvImubCFKOFDA3SMzfIc6t/llltGRaUHjviPY5KZm5
   Yqkhn2pEpuZ4R4C5x4igYczGIMbVJcP4o4YaomtiWchLdp/HO9FJudeXm
   g==;
X-CSE-ConnectionGUID: EAkniGBtQ02MetmpNaMTeg==
X-CSE-MsgGUID: Ioy6MQ3eSuGNihLxVp94Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41671684"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="41671684"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 03:43:21 -0800
X-CSE-ConnectionGUID: BRQo/aYGSl2hDtODa43Agw==
X-CSE-MsgGUID: lsI47RnyT2q80B/JF5ltsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="121940377"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 27 Feb 2025 03:43:20 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tncIQ-000DIu-0D;
	Thu, 27 Feb 2025 11:43:18 +0000
Date: Thu, 27 Feb 2025 19:42:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add LP5812 LED driver bindings
Message-ID: <202502271916.eFTLx8Wb-lkp@intel.com>
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
In-Reply-To: <20250225170601.21334-2-trannamatk@gmail.com>
References: <20250225170601.21334-2-trannamatk@gmail.com>
TO: Nam Tran <trannamatk@gmail.com>
TO: pavel@kernel.org
TO: lee@kernel.org
TO: krzk+dt@kernel.org
TO: robh@kernel.org
TO: conor+dt@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Nam Tran <trannamatk@gmail.com>

Hi Nam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on robh/for-next linus/master v6.14-rc4 next-20250227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nam-Tran/dt-bindings-leds-Add-LP5812-LED-driver-bindings/20250226-011634
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20250225170601.21334-2-trannamatk%40gmail.com
patch subject: [PATCH v2 1/2] dt-bindings: leds: Add LP5812 LED driver bindings
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: csky-randconfig-051-20250227 (https://download.01.org/0day-ci/archive/20250227/202502271916.eFTLx8Wb-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271916.eFTLx8Wb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502271916.eFTLx8Wb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/leds/ti,lp5812.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
