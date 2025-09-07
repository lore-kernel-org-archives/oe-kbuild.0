Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6DF13FD86
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Sep 2025 07:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757230711; cv=none; b=JRtc57NUdKaTeysB7lhOIMNvauHO03dcMUje2/dZnT3Jp3pn/2VI1CNTLTdJi9995WUVe3RC4wTAwrdgNf0wzD9Ba+9IdPMUF7Y5GqNpIcZ8WxpyoEt5TI1sdovPHWzl5HdgDyu3rR3VNL87UNDCs+/no8JHw7MFDMf5bLCES3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757230711; c=relaxed/simple;
	bh=Ot8ji+SWgIBbOpzRDvluGIaVromX5n+rz0PT7uK9jYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T8OYSd10FI9Xlz5N4NN9e0uccaQCsGGkve74v8dJdtBYvGgE5Ob9aNNysl2JfFoT1kZXby3F8pu4Ty2gTF8jKafwyefB6pF0Zqk2PRc7xKh/VZJaWaOXHooiYpuj4PsKVbXg2XrB2nJ1C4L2nL2LMCA6EEXtA+uwhFrjvQkkxJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFqOqPa7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFqOqPa7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757230709; x=1788766709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ot8ji+SWgIBbOpzRDvluGIaVromX5n+rz0PT7uK9jYQ=;
  b=fFqOqPa7Uy1Fq49f7EN2lYBTDI+S39t+NqOlt6BtRXhCoCjmdca6Hw0j
   Usk5Zpo0anArsYbCoY2X0/dMhk00z4hOIXYPNoXUuO6RxXoD8Hb97y0aS
   PmUQwvCXt0+uMj81J2vBJj4KUpgIT1ZIdaZOTxq9Rj1lpoq0lOXZv4S8t
   VcvP+SQ3PsM9R6Iv8kGIGUuvCEk1GbQ0/F+LtycLvqtQbghfZGO2Flmt7
   F8JZjcsdsjHuSq/glAfvFnZcENCUodAKi589xowuhf9RGWd59mMzoLeM1
   0lbT0jqHSP0wEn9s3sOQxC0eH1hEAt3kSor0hutuO+VBm83x8CWHa0kLh
   w==;
X-CSE-ConnectionGUID: j6IO1gQeRPScfKnleY2w3w==
X-CSE-MsgGUID: XgN3JmN+Sey/SFivvW/CtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="59591296"
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="59591296"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 00:38:28 -0700
X-CSE-ConnectionGUID: BOzIHM1ITG6yCD4sFxkGXw==
X-CSE-MsgGUID: uYdBzAXhQ2GxL/t1ri4U9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="203312689"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Sep 2025 00:38:27 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uv9yj-00027D-1Z;
	Sun, 07 Sep 2025 07:38:25 +0000
Date: Sun, 7 Sep 2025 15:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add I3C node
Message-ID: <202509071539.2vEDcBuI-lkp@intel.com>
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
In-Reply-To: <20250904165909.281131-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904165909.281131-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
TO: Prabhakar <prabhakar.csengg@gmail.com>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Wolfram Sang <wsa-dev@sang-engineering.com>
TO: Magnus Damm <magnus.damm@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-renesas-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Prabhakar <prabhakar.csengg@gmail.com>
CC: Biju Das <biju.das.jz@bp.renesas.com>
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-devel/next]
[also build test WARNING on next-20250905]
[cannot apply to linus/master v6.17-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/arm64-dts-renesas-r9a09g057-Add-I3C-node/20250905-010225
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20250904165909.281131-2-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add I3C node
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250907 (https://download.01.org/0day-ci/archive/20250907/202509071539.2vEDcBuI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509071539.2vEDcBuI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509071539.2vEDcBuI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: i3c@12400000 (renesas,r9a09g057-i3c): compatible:0: 'renesas,r9a09g057-i3c' is not one of ['renesas,r9a08g045-i3c', 'renesas,r9a09g047-i3c']
   	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: i3c@12400000 (renesas,r9a09g057-i3c): compatible: ['renesas,r9a09g057-i3c', 'renesas,r9a09g047-i3c'] is too long
   	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
--
>> arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dtb: i3c@12400000 (renesas,r9a09g057-i3c): compatible:0: 'renesas,r9a09g057-i3c' is not one of ['renesas,r9a08g045-i3c', 'renesas,r9a09g047-i3c']
   	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dtb: i3c@12400000 (renesas,r9a09g057-i3c): compatible: ['renesas,r9a09g057-i3c', 'renesas,r9a09g047-i3c'] is too long
   	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
--
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: i3c@12400000 (renesas,r9a09g057-i3c): compatible:0: 'renesas,r9a09g057-i3c' is not one of ['renesas,r9a08g045-i3c', 'renesas,r9a09g047-i3c']
   	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: i3c@12400000 (renesas,r9a09g057-i3c): compatible: ['renesas,r9a09g057-i3c', 'renesas,r9a09g047-i3c'] is too long
   	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
--
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: i3c@12400000 (renesas,r9a09g057-i3c): compatible:0: 'renesas,r9a09g057-i3c' is not one of ['renesas,r9a08g045-i3c', 'renesas,r9a09g047-i3c']
   	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: i3c@12400000 (renesas,r9a09g057-i3c): compatible: ['renesas,r9a09g057-i3c', 'renesas,r9a09g047-i3c'] is too long
   	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
