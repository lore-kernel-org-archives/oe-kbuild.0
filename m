Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850083;
	b=A0jfIqj5rb5agG1LZe1Yq66TnRDjzoVtiL689FD6nxzqGl8K2bV0hTD9WsGDciKIO02J
	 3MPMihGYjCggk1k9vZhYjEFoHRmyW2CucgUrb2jv7SnMffmcr8Hmb4u4OiBBXelZIhhEi
	 JvHkzLRHWzbOca9Aj1msTlCIoTLcJ8xMHZNifPeVEHivXUm8rsY6IkmNTNEJC/x5YqB4q
	 F3GSO66URMAHSUOmH+en532A50sGZY2bKgly1ZoZptjmByBzSRI/xm+uSvT+w1g66HnZB
	 Rp3DCR/uBoLkLWGxHTLL/NBFtgTdlyEx4sBkqRhZACwWdxMibbZglUzqLEUkw9+8MOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850083;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7uiQdPsLyiN0CeLC12cMydK8aJZzlAY3NvXCwMkQC1g=;
	b=z+Xw4UfbCg4vWjtSima9pPwgSPO88nSSiDzrkLr4t2pgp9kZ893vu873H3QzWHSxij+l
	 xACWC9QevFkdIqKc2a2pUnqtvG5AKk4s2Yt8ZUpwAgDmrO7uXySzGJiU6mOJLNybDCZJT
	 Pw3EruYTjesz5h6jPg73U5jh4AeCfC1T0gOBTSHRLIbnh+r/YD/Q/UtJcOrFoZwx5jbFu
	 q9Nm7s7gR90ntCYgw/1gjdcVqTvBVR6Xbin371ELliCva3dMruD96QNoeLK51L+AO2oaS
	 DyL2TmDWJssrEAuwnIEARcVCdD4iyrDYBkpdR0bgUjNVH3VSkJOaes2LBRmsO9BeuDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PGdzQs9Y;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DAD606A31C
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 17:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14DAD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PGdzQs9Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794850084; x=1826386084;
  h=date:from:to:cc:subject:message-id;
  bh=M1zfU57+sHNuvEKCTMrGZyx4I1epv3yQD95rj9LAqI0=;
  b=PGdzQs9YY4gltEpdL4TTD6Yvx0xunSbGOsAoZET+HebTV/TPLZHI7uxO
   1/xvDA3BYnDUUWLr9W0mR9h/aRlsybScZzBnY+wuJL1XDkX56R7Cfiire
   cjdVs2sIoiN+Iu4DVsIr3ndba4T+MYJHXQMS4SjzDXe0Hqp2RDYu7jbR/
   eLDv1FaghL/LG2gQq97WP8iZhfiBNiG4w2Skt1EGBN6CQuNptkg1mRa/A
   xxEhRpIdFuG0wPnzmISS293q7Gw1PuEZgRWMIDkwu5WBgCfIKv1JqRcaF
   SFegok36JcmBtgHAOGmWFCVGLxvz3hmWGNt15RjvuC2CcOZE9MjKQrLmE
   g==;
X-CSE-ConnectionGUID: s+B/MLYqSWKCJuZqMon33Q==
X-CSE-MsgGUID: Q5eWNSEnTD+9Rr8egqY0Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3486499"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3486499"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 09:28:03 -0800
X-CSE-ConnectionGUID: JQ26bM7KTe2Wta49TiFIEQ==
X-CSE-MsgGUID: 9YWmwYWmTL2YAs8Oxw+D1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9441597"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 16 Nov 2026 09:28:01 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT0Ui-000000002kc-0azT;
	Mon, 16 Nov 2026 17:27:52 +0000
Date: Mon, 16 Nov 2026 18:26:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 82/295]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e20c000
 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202611161628.F377ggtD-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   60757b5e5834d1725150bf5bc70e88d5e549967d
commit: 3e2114629f945662e8f83d3d3db1eba2f8a9db2b [82/295] DROP_v7.4: arm64: dts: apple: t600x: Add legacy "apple,dcs-min-ps" property
:::::: branch date: 3 hours ago
:::::: commit date: 11 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261116/202611161628.F377ggtD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev6+ged91b647c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611161628.F377ggtD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611161628.F377ggtD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
