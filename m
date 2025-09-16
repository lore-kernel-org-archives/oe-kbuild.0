Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8684727707
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Sep 2025 01:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757986073; cv=none; b=j40RW+OVIZf2OXLsXGeNmxB5JUIiDkQcACbSd5f1+kjnV0/lXcTA1qOIMFef4sGtb9hQFowBPCGxLeeMstbrmb/fXL+mTH47M5yCSNxpNs6kqDeDlxd3RqL7z/aMTSDJUTA/5QtVcVCTomJI0dm+PVSk7gW1r4THpVn86ixFRTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757986073; c=relaxed/simple;
	bh=AC7Lb8jLE8mRKSW4vv4KQzIrfM8MvkIPRU7dv5Wj/I0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p1Xyv56tqHy0sapn2ji5R6TC/R9iY2nIuMdRzhTSUgGvYdx6HggyUdeXW+XJ89g33eOXrYwlr3OCOqUw9LYwiAFrOQarYYs32IrmXKK8VFJG1DpHVfdU6A0AMQ6BcrwEM6ZFJYpHA4Bv5ceKUjUx6W/pT8My9qLiuOz+1Ikx0Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNJXZDHD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNJXZDHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757986070; x=1789522070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AC7Lb8jLE8mRKSW4vv4KQzIrfM8MvkIPRU7dv5Wj/I0=;
  b=fNJXZDHDQTN2DnVPeHKtr6HOtddQr74oKHgXhVJQkoXQNNM53i4W4m79
   X6BsfMnn4s9FgS3Y8oJOohEjEDSBi61yiskweFRgOrm7arzVC1tQZCe+p
   fZfPtMzLjmqM/D/HSVFfb74Xzvs2b78eRihws2HzE9Hf1zAGXeabrg5Gw
   Ms0GYkLysOfVsbnrF9/qVFw9oIxJVbOdu0wRGwtqoXnOILn8rfMk4m5jP
   lhaJ/uN/CaqclN9sESBsaurpk8YC+zPk/8hCkuw7rspYrKDvu4vaVAgtF
   JaLAmIBnG1GLb5leVQXbGGwrIB5N7KBc93wv4SF2ytxFZioWauVFpaOd5
   w==;
X-CSE-ConnectionGUID: MzQExDChRtaxql5qZS++fw==
X-CSE-MsgGUID: 6zoIeUbhTs6lLuIWEzN2/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60365529"
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; 
   d="scan'208";a="60365529"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 18:27:49 -0700
X-CSE-ConnectionGUID: lxdNPclvQy+h1wJtdyIGnw==
X-CSE-MsgGUID: JHA17qToT3mkaRh3ZQtBgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; 
   d="scan'208";a="211971645"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Sep 2025 18:27:48 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyKTx-0000st-28;
	Tue, 16 Sep 2025 01:27:45 +0000
Date: Tue, 16 Sep 2025 09:27:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] riscv: dts: spacemit: add UART pinctrl combinations
Message-ID: <202509160945.7iIO6YIN-lkp@intel.com>
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
In-Reply-To: <20250915112845.58134-1-hendrik.hamerlinck@hammernet.be>
References: <20250915112845.58134-1-hendrik.hamerlinck@hammernet.be>
TO: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
TO: dlan@gentoo.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: paul.walmsley@sifive.com
TO: palmer@dabbelt.com
TO: aou@eecs.berkeley.edu
TO: alex@ghiti.fr
CC: skhan@linuxfoundation.org
CC: linux-kernel-mentees@lists.linux.dev
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: spacemit@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>

Hi Hendrik,

kernel test robot noticed the following build warnings:

[auto build test WARNING on spacemit/for-next]
[also build test WARNING on spacemit/fixes linus/master v6.17-rc6 next-20250915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hendrik-Hamerlinck/riscv-dts-spacemit-add-UART-pinctrl-combinations/20250915-193719
base:   https://github.com/spacemit-com/linux for-next
patch link:    https://lore.kernel.org/r/20250915112845.58134-1-hendrik.hamerlinck%40hammernet.be
patch subject: [PATCH v2] riscv: dts: spacemit: add UART pinctrl combinations
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: riscv-randconfig-052-20250916 (https://download.01.org/0day-ci/archive/20250916/202509160945.7iIO6YIN-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509160945.7iIO6YIN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509160945.7iIO6YIN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart0-0-cfg:uart0-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart0-1-cfg:uart0-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart0-2-cfg:uart0-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart2-0-cfg:uart2-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart2-0-cts-rts-cfg:uart2-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-0-cfg:uart3-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-0-cts-rts-cfg:uart3-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-1-cfg:uart3-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-1-cts-rts-cfg:uart3-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-2-cfg:uart3-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-2-cts-rts-cfg:uart3-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-0-cfg:uart4-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-1-cfg:uart4-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-1-cts-rts-cfg:uart4-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-2-cfg:uart4-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-3-cfg:uart4-3-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-3-cts-rts-cfg:uart4-3-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-4-cfg:uart4-4-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-4-cts-rts-cfg:uart4-4-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-0-cfg:uart5-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-1-cfg:uart5-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-1-cts-rts-cfg:uart5-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-2-cfg:uart5-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-2-cts-rts-cfg:uart5-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-3-cfg:uart5-3-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-3-cts-rts-cfg:uart5-3-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-0-cfg:uart6-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-0-cts-rts-cfg:uart6-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-1-cfg:uart6-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-1-cts-rts-cfg:uart6-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-2-cfg:uart6-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart7-0-cfg:uart7-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart7-1-cfg:uart7-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart7-1-cts-rts-cfg:uart7-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-0-cfg:uart8-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-1-cfg:uart8-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-1-cts-rts-cfg:uart8-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-2-cfg:uart8-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-2-cts-rts-cfg:uart8-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-0-cfg:uart9-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-1-cfg:uart9-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-1-cts-rts-cfg:uart9-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-2-cfg:uart9-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/dma-bus/dma-controller@d4000000: failed to match any schema with compatible: ['spacemit,k1-pdma']
--
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart0-0-cfg:uart0-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart0-1-cfg:uart0-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart0-2-cfg:uart0-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart2-0-cfg:uart2-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart2-0-cts-rts-cfg:uart2-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-0-cfg:uart3-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-0-cts-rts-cfg:uart3-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-1-cfg:uart3-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-1-cts-rts-cfg:uart3-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-2-cfg:uart3-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-2-cts-rts-cfg:uart3-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-0-cfg:uart4-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-1-cfg:uart4-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-1-cts-rts-cfg:uart4-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-2-cfg:uart4-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-3-cfg:uart4-3-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-3-cts-rts-cfg:uart4-3-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-4-cfg:uart4-4-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-4-cts-rts-cfg:uart4-4-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-0-cfg:uart5-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-1-cfg:uart5-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-1-cts-rts-cfg:uart5-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-2-cfg:uart5-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-2-cts-rts-cfg:uart5-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-3-cfg:uart5-3-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-3-cts-rts-cfg:uart5-3-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-0-cfg:uart6-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-0-cts-rts-cfg:uart6-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-1-cfg:uart6-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-1-cts-rts-cfg:uart6-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-2-cfg:uart6-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart7-0-cfg:uart7-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart7-1-cfg:uart7-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart7-1-cts-rts-cfg:uart7-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-0-cfg:uart8-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-1-cfg:uart8-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-1-cts-rts-cfg:uart8-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-2-cfg:uart8-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-2-cts-rts-cfg:uart8-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-0-cfg:uart9-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-1-cfg:uart9-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-1-cts-rts-cfg:uart9-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-2-cfg:uart9-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/dma-bus/dma-controller@d4000000: failed to match any schema with compatible: ['spacemit,k1-pdma']
--
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart0-0-cfg:uart0-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart0-1-cfg:uart0-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart0-2-cfg:uart0-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart2-0-cfg:uart2-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart2-0-cts-rts-cfg:uart2-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-0-cfg:uart3-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-0-cts-rts-cfg:uart3-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-1-cfg:uart3-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-1-cts-rts-cfg:uart3-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-2-cfg:uart3-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart3-2-cts-rts-cfg:uart3-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-0-cfg:uart4-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-1-cfg:uart4-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-1-cts-rts-cfg:uart4-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-2-cfg:uart4-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-3-cfg:uart4-3-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-3-cts-rts-cfg:uart4-3-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-4-cfg:uart4-4-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart4-4-cts-rts-cfg:uart4-4-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-0-cfg:uart5-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-1-cfg:uart5-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-1-cts-rts-cfg:uart5-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-2-cfg:uart5-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-2-cts-rts-cfg:uart5-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-3-cfg:uart5-3-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart5-3-cts-rts-cfg:uart5-3-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-0-cfg:uart6-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-0-cts-rts-cfg:uart6-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-1-cfg:uart6-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-1-cts-rts-cfg:uart6-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart6-2-cfg:uart6-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart7-0-cfg:uart7-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart7-1-cfg:uart7-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart7-1-cts-rts-cfg:uart7-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-0-cfg:uart8-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-1-cfg:uart8-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-1-cts-rts-cfg:uart8-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-2-cfg:uart8-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart8-2-cts-rts-cfg:uart8-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-0-cfg:uart9-0-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-1-cfg:uart9-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-1-cts-rts-cfg:uart9-1-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): uart9-2-cfg:uart9-2-pins:bias-pull-up: True is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: /soc/dma-bus/dma-controller@d4000000: failed to match any schema with compatible: ['spacemit,k1-pdma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
