Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793411346;
	b=S5rThiRNA7IG4kIgJjzHOSirT72WVp3VFQedG/4o3WV1dI3aLoce00lnnoxTRdZlnSH2
	 d/Ls6gEDY/quQ7PL+ZSHf2O/3UgF8xWCrLFvFZ76eaAWqbI9USR5DRkqqzsdNRAkw2ZQa
	 L6NcnBZLJ7Mtb181TX/btPDAAqEjacSOthPNs9zaMPI3I9YwW9EXoi84yzAju/RUdObfX
	 a5xjW5Fx1qrNKjzO8IeXFNdwJf06u3NqaPmhSPo9fPjzNk15iWRscoACmmRUOxe8nvHXB
	 s8KNG0wjOgE1rXASCyfCpUlLLkfPCI0Tw/XHWlwC8HUWuR7goO3/44Bgrl1k3jXSuXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793411346;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=BA5slgvpVcOd7AHq8J5i3hpv7NdrIRzc4z7EBQ41wms=;
	b=x+DTrtPkA8Vjq4UyepyvMz9n+RXbX34V7CLsPqX7XzRnWe//92M5TdVvqS7Wx3RYzwMx
	 IbFWnPNwMS71YwqePgY2YrlxHPvl5ph52/xFKz/o8WDiFMSuu1mK2icskJJ1RZh9cDuLx
	 xs86+uudUcSl+Pwo+TIeOlkVRBpws+QJIbILdmjJQWAMpFyWTQt7HEnK8CFEH3UzhGM7E
	 lkPQTRMonxN2hekeo6wf3y5ZwbC8SlienL4qk4Xoxo/jwa+2mXcC//MRmboFZFPNsZ2gb
	 adDQOqhP9g5DLLcWky5tzLYRtrjuvCZCQvVzBgnm1qi55O0OwQy0H34jZnRUXtRz2Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cOBXUtNl;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA284606A322
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Oct 2026 01:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA284606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cOBXUtNl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793411344; x=1824947344;
  h=date:from:to:cc:subject:message-id;
  bh=im4ltkh4t7qnesenE0+xw9/K1uVdToGmC7VJedUpkfc=;
  b=cOBXUtNlgkulz3ScKzl8BCVz29lHJzAy3Y0VQAmk/lErRmQyDzMN4MvF
   /CSDbzqgKbWcwJszZA9Sj7bWw/2xTDD4ASoTSsL3JjMxW5syPwKvygfQY
   QS9y3c9zHnO/CFZr5MQ3puD5IWQEeIQv4PPaLY5S/PSXgNMU2CBVp+L7d
   unpzZM1fqyPOw4zinNSoLe+jkyYZNDtBvHiis4GuqulmoTQIYB+eyRCao
   9wf8sT2l2u0yf9AhgzBkakVoaIKwkUZiaCpQ9w1TfmRJH582yMhb8SRQG
   n86p1e9NfqmCPel6KBUip8+GEGB4KSEfm0gvRvC/gVjJDNXpbylNgy34u
   Q==;
X-CSE-ConnectionGUID: hLzieaT/RQG5vugztYF0GQ==
X-CSE-MsgGUID: gDxP5xipRom6uyyQsA/WBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2061721"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2061721"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:49:03 -0700
X-CSE-ConnectionGUID: wNKab0vdRlW2cuuawAfi2Q==
X-CSE-MsgGUID: mv0uBnv6R4+0Q4RPlZsJ1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5662989"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 30 Oct 2026 18:49:02 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMyDK-000000005ox-0usI;
	Sat, 31 Oct 2026 01:48:58 +0000
Date: Sat, 31 Oct 2026 02:47:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 [geert-renesas-drivers:topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4
 20/51] arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: i2c@c06c0000
 (renesas,i2c-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is
 too long
Message-ID: <202610310210.eueJTqv5-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4
head:   ae92f399d2e08d100636faa61d5a31c019d05f8d
commit: dceaa11ea6462d3fa6bdd521b1eb3763d0b927d0 [20/51] arm64: dts: renesas: r8a78000: Add DMA properties to I2C
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261031/202610310210.eueJTqv5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310210.eueJTqv5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610310210.eueJTqv5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: i2c@c06c0000 (renesas,i2c-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: i2c@c06c0000 (renesas,i2c-r8a78000): dmas: [[74, 147], [74, 146], [75, 147], [75, 146], [76, 147], [76, 146]] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: i2c@c06c8000 (renesas,i2c-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: i2c@c06c8000 (renesas,i2c-r8a78000): dmas: [[74, 149], [74, 148], [75, 149], [75, 148], [76, 149], [76, 148]] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: i2c@c06d0000 (renesas,i2c-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: i2c@c06d0000 (renesas,i2c-r8a78000): dmas: [[74, 151], [74, 150], [75, 151], [75, 150], [76, 151], [76, 150]] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: i2c@c06d8000 (renesas,i2c-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: i2c@c06d8000 (renesas,i2c-r8a78000): dmas: [[74, 153], [74, 152], [75, 153], [75, 152], [76, 153], [76, 152]] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: i2c@c06e0000 (renesas,i2c-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: i2c@c06e0000 (renesas,i2c-r8a78000): dmas: [[74, 155], [74, 154], [75, 155], [75, 154], [76, 155], [76, 154]] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: i2c@c06e8000 (renesas,i2c-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: i2c@c06e8000 (renesas,i2c-r8a78000): dmas: [[74, 157], [74, 156], [75, 157], [75, 156], [76, 157], [76, 156]] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: i2c@c06f0000 (renesas,i2c-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: i2c@c06f0000 (renesas,i2c-r8a78000): dmas: [[74, 159], [74, 158], [75, 159], [75, 158], [76, 159], [76, 158]] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: i2c@c06f8000 (renesas,i2c-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: i2c@c06f8000 (renesas,i2c-r8a78000): dmas: [[74, 177], [74, 176], [75, 177], [75, 176], [76, 177], [76, 176]] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0700000 (renesas,scif-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0700000 (renesas,scif-r8a78000): dmas: [[74, 81], [74, 80], [75, 81], [75, 80], [76, 81], [76, 80]] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000 (renesas,scif-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000 (renesas,scif-r8a78000): dmas: [[74, 83], [74, 82], [75, 83], [75, 82], [76, 83], [76, 82]] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0708000 (renesas,scif-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is too long

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
