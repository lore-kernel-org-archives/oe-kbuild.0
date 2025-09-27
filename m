Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD2C2E090A
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Sep 2025 13:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758981137; cv=none; b=r0CdsTZFbn+xTSTnr9fvOpnY8d+7NAmRH+rso/1qTLyFJ5ME6CM4oTa93x3xtOONV9nv+X+gAX8KfMEryjY9z3dYvVJHVTgP7W3Im83/KY395SWmWg0BCemTLnEU5TJngHTRUT0d8isMK5rtS92MIh/O9KJtGAcloPVf8XZDg4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758981137; c=relaxed/simple;
	bh=SRjswyGmYLJcxwcuaLufhQNg4LFvePRuT5kWuzw98h8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ggSaOsanurrSRBGxH0UgGyfxPqqU9882EsYHhqUsCDepfnfwEWzqgqI7Z/sebPUtTmPA+Knj0sm8nFyqLUeXkLyaURT+xeYX5wPEORPPPc1PHnG8/ZEgFofoPfloPtnrRZ894gwpcoaXuCva8KjGi3E22qnDiwTQdI55yNzK1mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KVTmmtRe; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVTmmtRe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758981135; x=1790517135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SRjswyGmYLJcxwcuaLufhQNg4LFvePRuT5kWuzw98h8=;
  b=KVTmmtRelIXvOe41EDeCriy1J5wIUNWhFg0SmQXjm0KJ0z6fVR19KCTg
   3uMiup1dwBJxyH47uzdRKZoOA1JT3Mwf9JBSRELw2YUepwppvaLBWuINn
   Uu0a07ZgKnoiXHVrMZVLW9CGM5p590gEVuAsgXeS6tx9dMMyoj4fVbUgW
   v3pasNLa5IRcQlVZeeNKnM12JeSzBjUfzO91QEgFq8T8dda2KZ6HaRNF5
   7uZ2QFaqXcZowgeQB9nde+VaeIOtiP2tLLa3j/HP7MLhEoKVdUEEfQzk0
   P2Lb7fI/xt3RABH64d29glrhRTA+k/f+1eHztdP3TTgV4i7LgzXBIobao
   w==;
X-CSE-ConnectionGUID: t/7JPdj9SmCysrMg2YNnaQ==
X-CSE-MsgGUID: GOeZ9S1URRKU9brUi+PorQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="61208974"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="61208974"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 06:52:12 -0700
X-CSE-ConnectionGUID: YJ0ozxhgRtWayB+GnaHTiw==
X-CSE-MsgGUID: aoTEKyeGQgWcRT3U6Qy4qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="177110056"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 27 Sep 2025 06:52:12 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2VLN-00075r-0S;
	Sat, 27 Sep 2025 13:52:09 +0000
Date: Sat, 27 Sep 2025 21:51:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/3] arm64: dts: nuvoton: npcm845: Add peripheral nodes
Message-ID: <202509272115.wM5fGPjS-lkp@intel.com>
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
In-Reply-To: <20250925200625.573902-3-tmaimon77@gmail.com>
References: <20250925200625.573902-3-tmaimon77@gmail.com>
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
patch link:    https://lore.kernel.org/r/20250925200625.573902-3-tmaimon77%40gmail.com
patch subject: [PATCH v3 2/3] arm64: dts: nuvoton: npcm845: Add peripheral nodes
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250926 (https://download.01.org/0day-ci/archive/20250927/202509272115.wM5fGPjS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509272115.wM5fGPjS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509272115.wM5fGPjS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: / (nuvoton,npcm845-evb): memory@0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/spi@fb000000: failed to match any schema with compatible: ['nuvoton,npcm845-fiu']
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/spi@fb002000: failed to match any schema with compatible: ['nuvoton,npcm845-fiu']
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/spi@c0000000: failed to match any schema with compatible: ['nuvoton,npcm845-fiu']
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/spi@fb001000: failed to match any schema with compatible: ['nuvoton,npcm845-fiu']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: watchdog@901c (nuvoton,npcm845-wdt): Unevaluated properties are not allowed ('syscon' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/nuvoton,npcm750-wdt.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/bus@f0000000/pwm-fan-controller@103000: failed to match any schema with compatible: ['nuvoton,npcm845-pwm-fan']
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/bus@f0000000/spi@201000: failed to match any schema with compatible: ['nuvoton,npcm845-pspi']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
