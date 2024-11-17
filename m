Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89264B661
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Nov 2024 02:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731810757; cv=none; b=rgqlNTrlJJwe8r+c/ed3aerLhsla/PahqfB8Jxtb+c97l6pifjW5f5m+Yip6Vw69/qkUl4xcqL1YmRdMZd8sgbnP9ecXXt76c9D/SaMNf3BCe0cUK4EEaM0gWNKsHfQ0SjQIvGFFgykzAoQO97flyaAwa89T3E9YXJc4mIQoFzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731810757; c=relaxed/simple;
	bh=l/+yV7WP8wCXWBnJINxOj+gVRD/q2tun4dMVR4QA04c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HuoninggsmJKqiJapEW7ltKD9kMkCwBGgLzmrPhKG8FF0NBQbT/iZcrhHUC8gza5BM2UUi9DTIpiLwinw8wybXnzf6deu9g9uNzfb8jQMs8d7t6ZLMbuVdEOoMZzw5l+wy8KQ0W3n5BaQD9Iz6XnOA64g/LbHRyF0RTuuoVaCGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2t9u8o5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2t9u8o5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731810755; x=1763346755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l/+yV7WP8wCXWBnJINxOj+gVRD/q2tun4dMVR4QA04c=;
  b=Y2t9u8o5BL5AJQIhq9sMgN/67HiK/1sZ3z7u7C/faQ5OAVR9LkW74f22
   M/banqg4Y9dDiGJ0SjKktW91CGx5i6po5qz7qbM9ZYUDKNvWH4PtnrmwL
   a16W47PmpVNMCFjGlnmrlxIlscfNOf6lICQBNJ/Ue5wv3t+JDtwaY+Z3o
   e9iFb4rup4qoi01G31DUdIn8MhN4RSYOZKkiF0VUBqG9hh/iqqvf55qIw
   UICeAl4+JOVmXxMk/4sxxtzvEzh5gYuBHG/nqP70rDAtDHE3cxGl1JQvW
   eFicktSKfoys/lDJu1O10cJL77i8F9ySY3UB+nNWrXywjjX+2fLr+r0CW
   A==;
X-CSE-ConnectionGUID: az3hrQX/Sd2s1983eif6HA==
X-CSE-MsgGUID: 1nIzrPq+Q4e22WS1CTdRBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31730187"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="31730187"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 18:32:35 -0800
X-CSE-ConnectionGUID: KXWLQmD9Ssa7FudNoAA5Sg==
X-CSE-MsgGUID: ohHCph93SzmaKTjtxl2RIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="119749254"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Nov 2024 18:32:34 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCV5T-0001ET-2D;
	Sun, 17 Nov 2024 02:32:31 +0000
Date: Sun, 17 Nov 2024 10:32:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-milkv-mars: set host mode
 and vbus pin for on-chip USB 2.0
Message-ID: <202411171031.POqLA7xw-lkp@intel.com>
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
In-Reply-To: <20241114201805.24143-2-e@freeshell.de>
References: <20241114201805.24143-2-e@freeshell.de>
TO: E Shattow <e@freeshell.de>
TO: Jisheng Zhang <jszhang@kernel.org>
CC: E Shattow <e@freeshell.de>
CC: Emil Renner Berthing <kernel@esmil.dk>
CC: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Shattow,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20241114]
[cannot apply to robh/for-next v6.12-rc7 v6.12-rc6 v6.12-rc5 linus/master v6.12-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/E-Shattow/riscv-dts-starfive-jh7110-milkv-mars-set-host-mode-and-vbus-pin-for-on-chip-USB-2-0/20241115-045845
base:   next-20241114
patch link:    https://lore.kernel.org/r/20241114201805.24143-2-e%40freeshell.de
patch subject: [PATCH] riscv: dts: starfive: jh7110-milkv-mars: set host mode and vbus pin for on-chip USB 2.0
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-052-20241117 (https://download.01.org/0day-ci/archive/20241117/202411171031.POqLA7xw-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171031.POqLA7xw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411171031.POqLA7xw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: pinctrl@13040000: usb0-0: 'driver-vbus-pin' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/starfive,jh7110-sys-pinctrl.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
