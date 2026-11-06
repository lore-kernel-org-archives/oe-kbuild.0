Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981734;
	b=rzoTRWZwkH/qZG4QkOrld+pgMLhcaLUWU2juO5OmU0EowvMUa6RBXYK4xFfAxwJ7Q0+9
	 ju6JLknR3pwL97/040AvlR1+DPDo7pHMvPdvbls/wDqqjH8k1gmwb74YuorXgkb0IqOsU
	 km3HxmaABy6P789oQq99bhVCKOFxePqfemJoGB6UIzlqUeU/btVK1rEezvJ1nZpPgG7Xz
	 ZQdED8OyWc7TpvN3NRFFnkoRU+ovyKIiCxGgrMi5yYpzK0ZcVVXq1+G2u2rFUOPw055B+
	 hrZrmtWDq4FrqvSIMDgYHFmhyUIEFXsYxSrImMxfDygjC6pG9581YwaVFVnIxM4bgWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981734;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=RVguxWsQ227YoVlhiejDgO8nkm2zM6sRM0ld7m8mIVw=;
	b=2vJFx7OAZB5NPQzh+44ZdtAAAC3O771PNV8JkcGipaHKpgKLcO/VzaxKZW+QxJLR0gK/
	 KVM+rfJuNvClWVyD3Ythv4dJis8KKOAhMpCRRn2zSS2QB3lLm8dEBMmu6IGAnUqnROPGy
	 K2VTMpX6zIf6FI0Lv7kaYM967Yb+Stt13Nnr4VC9KZkTV84lg2uofAWOac/PKVnKgiwMh
	 HQfv98ZCvce4MHX3n8Gw4HcFsWjUaco1Bd1UPjqQYoyS7vj6Tqaxxe4VFviLk/ndgaF+V
	 mA1gPyzeLGJzrpKsqBFCWo8gB1NZDtMvlT5fJQGdqQIiIYp/bWAl6iMgRAgihgAkU+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bs42iqDS;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64C1606A326
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 16:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A64C1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bs42iqDS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793981733; x=1825517733;
  h=date:from:to:cc:subject:message-id;
  bh=PVqAqQgjPW8nbajY+/gNzKsTidg+q46NB6Uy0O8gGHE=;
  b=Bs42iqDSxjCAp9Ggvb8HGo634hr1LR1qszGdP8ARD2QSo4C0or1E/LPl
   zNgW0zCu2/PgJfPuk7XjC9IzNhlNTfBEDJvzp8YqxwJYk87tpmvUuiUBN
   RM3T/wyUr3G6uz5QEVSs/f/Ssauq9cxKm/kdw6cZW/mfsDxp8qniU9rXL
   wHTSq4Dbs7hlp4Vd2WLndJ8fmOAxkEDzwLLqiLC/znFSwxtxS9w95BjSy
   tkgNx8O1hlxp+atce57Yky57TOhUk0hHEZN9RUCaeO71c9N1b+Iy4aF6A
   1pBBApVoB7bpAmHYVuC+fouH8tq8xllOlkVRcIJyr+nzXJkVyKQM3RdaI
   Q==;
X-CSE-ConnectionGUID: JILJBRx2SdGopHyTcit1uw==
X-CSE-MsgGUID: L2Bwko0sRqWIe9cFLCAWNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2839170"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2839170"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 08:15:32 -0800
X-CSE-ConnectionGUID: 7oWGs0owRfW5gXHRXqKMlg==
X-CSE-MsgGUID: hAjagZtpR1m4gTRjZ1QZvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7176309"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 06 Nov 2026 08:15:31 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPMb9-00000000AJP-2mS3;
	Fri, 06 Nov 2026 16:15:27 +0000
Date: Fri, 06 Nov 2026 17:14:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:apple-soc/dt-7.5 1/6]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/reset-controller@23b784000:
 failed to match any schema with compatible: ['apple,t8103-cio-reset']
Message-ID: <202611061748.oriozqnj-lkp@intel.com>
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
TO: Sven Peter <sven@kernel.org>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux apple-soc/dt-7.5
head:   3757588f0cb52742ddd7a0423279d6d7c27c8c51
commit: 9055977102a4b4f094f1ce5025820ba228deff44 [1/6] arm64: dts: apple: Add CIO reset controllers
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261106/202611061748.oriozqnj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061748.oriozqnj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611061748.oriozqnj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/reset-controller@23b784000: failed to match any schema with compatible: ['apple,t8103-cio-reset']
--
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/reset-controller@23b784000: failed to match any schema with compatible: ['apple,t8103-cio-reset']
--
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/reset-controller@23b784000: failed to match any schema with compatible: ['apple,t8103-cio-reset']
--
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/reset-controller@23b784000: failed to match any schema with compatible: ['apple,t8103-cio-reset']
--
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/reset-controller@23b784000: failed to match any schema with compatible: ['apple,t8103-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@28e080000 (apple,t6020-pmgr): 'reset-controller@a02c' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@28e080000 (apple,t6020-pmgr): 'reset-controller@a02c' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-management@28e080000 (apple,t6020-pmgr): 'reset-controller@a02c' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-management@28e080000 (apple,t6020-pmgr): 'reset-controller@a02c' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-management@28e080000 (apple,t6020-pmgr): 'reset-controller@a02c' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-management@28e080000 (apple,t6020-pmgr): 'reset-controller@a02c' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): 'reset-controller@a02c' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@28e080000 (apple,t6020-pmgr): 'reset-controller@a02c' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@28e080000 (apple,t6020-pmgr): 'reset-controller@a02c' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@28e080000 (apple,t6020-pmgr): 'reset-controller@a02c' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/power-management@28e080000/reset-controller@a02c: failed to match any schema with compatible: ['apple,t6020-cio-reset', 'apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/reset-controller@23b790000: failed to match any schema with compatible: ['apple,t8112-cio-reset', 'apple,t8103-cio-reset']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/reset-controller@23b790000: failed to match any schema with compatible: ['apple,t8112-cio-reset', 'apple,t8103-cio-reset']
--
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/reset-controller@23b790000: failed to match any schema with compatible: ['apple,t8112-cio-reset', 'apple,t8103-cio-reset']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/reset-controller@23b790000: failed to match any schema with compatible: ['apple,t8112-cio-reset', 'apple,t8103-cio-reset']
--
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/reset-controller@23b790000: failed to match any schema with compatible: ['apple,t8112-cio-reset', 'apple,t8103-cio-reset']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/reset-controller@23b790000: failed to match any schema with compatible: ['apple,t8112-cio-reset', 'apple,t8103-cio-reset']
--
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/reset-controller@23b790000: failed to match any schema with compatible: ['apple,t8112-cio-reset', 'apple,t8103-cio-reset']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/reset-controller@23b790000: failed to match any schema with compatible: ['apple,t8112-cio-reset', 'apple,t8103-cio-reset']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
