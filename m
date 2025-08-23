Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2530B222593
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Aug 2025 19:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755977432; cv=none; b=Sn4mf/g9Qh9Ff+iiBFMq1bl6jLk3OLJJ8T1OGMhVUpqXsF7fMLKpUFDfHR2arGuGttyx3/Fb4rtYH4QmAx+09hLoCEDMYOiyeoydI4ghexXH7EJQwpPyaP675EmmwV+m5WWRzT6yz/u7h/BJ/CJQirtD8nhsdAIwWVgD6czUJNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755977432; c=relaxed/simple;
	bh=izlUiJLZCkr0KCAanVf1olV6Ql8qi4Uqq73cDwiThzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kZJKYAyschsGV872Mm8xovsuyotH1wASAV8ONSBfIh5sDea81OdDHId9o/IqpUNoUL9+PqsrU5si4/3brOr5mv9SUm4V/jdjhnZBVzIXSTLjR/eGoYgVaGWvWT59MhYSdQCWJjC/1TNz5VtPTAwIc1b9yW5J/0OYkxHpWV1HCIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=irxQvFee; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irxQvFee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755977430; x=1787513430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=izlUiJLZCkr0KCAanVf1olV6Ql8qi4Uqq73cDwiThzo=;
  b=irxQvFeeVFEBX3iGyjoJ3eTdaaSRFex99eXRzTZgElmMIGw4XIChMmDv
   f7uHcjVBIsKt+EtNpZpQ9T7/ncENA2ikUr/CDkJCFycNuYu/ABy8r1nxH
   oZHDngTCRhvOOkdRMEJPMVl7aR4k+cE38OL7tL6eEOD+UQ7QRPFpHwSea
   L/Rn+OKZqc5tKtqW8kKTXCiCkmZTsWOy1uM1Xj7hmiC636ag/WYCD0ycD
   8sqww5AVElN8tu4mPn4zAmDUjRFcB8S+zUSW3XcgC5Fe9rIy+8mI/H/VJ
   Kh8v/dpUxZKELDCwS1In1+z/4KAeJdk/bIt0YifQ0TxY+qSSQSy9Wn2iz
   w==;
X-CSE-ConnectionGUID: 7YpPQGgYRxyhnoBxYWlTzg==
X-CSE-MsgGUID: 75Mw012gS2uBeQ3pTcKrkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="45821275"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="45821275"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 12:30:27 -0700
X-CSE-ConnectionGUID: YhwgMKEDTtKhs10XgS6Qvw==
X-CSE-MsgGUID: Sr7GukXJRNiK0ExoJZjSzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="206118793"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 Aug 2025 12:30:25 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uptwV-000MXR-0d;
	Sat, 23 Aug 2025 19:30:23 +0000
Date: Sun, 24 Aug 2025 03:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mips-linux:mips-fixes 2/2]
 arch/mips/boot/dts/lantiq/danube_easy50712.dtb: ethernet@e180000
 (lantiq,etop-xway): 'mac-address' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202508240304.yX8qQ49y-lkp@intel.com>
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
CC: linux-mips@vger.kernel.org
TO: Aleksander Jan Bajkowski <olek2@wp.pl>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Hi Aleksander,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git mips-fixes
head:   8c431ea8f3f795c4b9cfa57a85bc4166b9cce0ac
commit: 8c431ea8f3f795c4b9cfa57a85bc4166b9cce0ac [2/2] mips: lantiq: xway: sysctrl: rename the etop node
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: mips-randconfig-051-20250824 (https://download.01.org/0day-ci/archive/20250824/202508240304.yX8qQ49y-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240304.yX8qQ49y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508240304.yX8qQ49y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/pci@e105400: failed to match any schema with compatible: ['lantiq,pci-xway']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: pci@e105400 (lantiq,pci-xway): 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/localbus@0: failed to match any schema with compatible: ['lantiq,localbus', 'simple-bus']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/localbus@0/nor-boot@0: failed to match any schema with compatible: ['lantiq,nor']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/pinmux@e100b10: failed to match any schema with compatible: ['lantiq,danube-pinctrl']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: exin: lantiq,groups: b'exin1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: pci: lantiq,groups: b'gnt1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: ethernet@e180000 (lantiq,etop-xway): 'mac-address' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/lantiq,etop-xway.yaml#
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: stp@e100bb0 (lantiq,gpio-stp-xway): $nodename:0: 'stp@e100bb0' does not match '^gpio@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-stp-xway.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
