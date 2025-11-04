Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8FB346A06
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Nov 2025 21:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762293276; cv=none; b=AuIIQs+oOCFXuo9dzQgn+rRHM9/mq1DGnBkE+4G+o7vo14FqGq6rrMLp7txB3xGH4vSgZF/69Yj3mqTL4NW7LlMVQVcruc+IXpZrr9Ve14KR8IJJ1fkDw1RkoHBkcxTpuCxh8jrMGwkaQZVbPRGUyFdWcuf7K/CcY+tK5F9nhsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762293276; c=relaxed/simple;
	bh=wulNuRydPJYzjbPL43mjJRikCntxOwDEXLkJ7+msFZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KxouTqpvIpIci/E0m6aL2N5vtTBpdiU54NVIxtzahU/K7qHuECp0AbcovMsAeoJMohg+ufdgbR+2XlA35LlojeTqD4ABPZLB3/b3cVEFp5FHjSNhD513GeeaQT3e0lWxtpfdvYbqEec7a08QnJnH4IuQFoRXDmVeLLi1IoRC/c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8TxN0w/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8TxN0w/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762293274; x=1793829274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wulNuRydPJYzjbPL43mjJRikCntxOwDEXLkJ7+msFZY=;
  b=W8TxN0w/aTgNo/WSxsgEdMtqE0ojWi7OXL6uIyIR4Z0I4/q+jZskI6X0
   0jiULWc2Md4VLzYi1fVhLtGqtBy6Lbrp94Cos+UjBpQeJNQe6Sq7qwcgU
   292lW8yjxa0fBTp51TggRE2jfb2iIyZdmLttuf2DU1nXrzB8sYUdr3Vv1
   ikaQKJjayEGof/MvTaCgKO3gM7XtT2nveeSlIHn6usBjBWgf0v1htg6Zc
   iKDKO0bxkDJZJP/8K15YI2E4G0/WlTkad3Luk36TpOLUl01iPWCcB+gv1
   VLLwS+kQ2rssOu1pPikltAF6bLm5hgbjF13CPCwTMowGGkyNdbxSjkadp
   w==;
X-CSE-ConnectionGUID: XbKBrGCSQmq9ayi2cptSwQ==
X-CSE-MsgGUID: 9WqK1wj5RQWEQu/iTvdKEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="51970590"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="51970590"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 13:54:33 -0800
X-CSE-ConnectionGUID: yQw6k2jJST276IfmRjWrgQ==
X-CSE-MsgGUID: uiFPNOgESOSng+ACAlD9qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="186522096"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 04 Nov 2025 13:54:33 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vGOz0-000000002J2-1ypE;
	Tue, 04 Nov 2025 21:54:30 +0000
Date: Tue, 4 Nov 2025 22:53:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/lantiq/danube_easy50712.dtb:
 /biu@1f800000/watchdog@803f0: failed to match any schema with compatible:
 ['lantiq,wdt']
Message-ID: <202511042234.0iuvo36P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   17d85f33a83b84e7d36bc3356614ae06c90e7a08
commit: 61a6ba233fe1198e9eacc9ca1d1cbdb27f70cee5 dt-bindings: Unify "fsl,liodn" type definitions
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: mips-randconfig-2051-20251031 (https://download.01.org/0day-ci/archive/20251104/202511042234.0iuvo36P-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511042234.0iuvo36P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511042234.0iuvo36P-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: cpus: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: cpus: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: cpu@0 (mips,mips24Kc): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: biu@1f800000 (lantiq,biu): $nodename:0: 'biu@1f800000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /biu@1f800000: failed to match any schema with compatible: ['lantiq,biu', 'simple-bus']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /biu@1f800000/icu@80200: failed to match any schema with compatible: ['lantiq,icu']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /biu@1f800000/watchdog@803f0: failed to match any schema with compatible: ['lantiq,wdt']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /sram@1f000000: failed to match any schema with compatible: ['lantiq,sram']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /sram@1f000000/eiu@101000: failed to match any schema with compatible: ['lantiq,eiu-xway']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: cgu@103000 (lantiq,cgu-xway): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/lantiq/lantiq,cgu.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /sram@1f000000/rcu@203000: failed to match any schema with compatible: ['lantiq,rcu-xway']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: fpi@10000000 (lantiq,fpi): $nodename:0: 'fpi@10000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000: failed to match any schema with compatible: ['lantiq,fpi', 'simple-bus']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/gptu@e100a00: failed to match any schema with compatible: ['lantiq,gptu-xway']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/serial@e100c00: failed to match any schema with compatible: ['lantiq,asc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
