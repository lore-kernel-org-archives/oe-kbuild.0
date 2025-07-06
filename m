Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73702CCC8
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Jul 2025 16:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751818946; cv=none; b=ZYnGvZu5RrEtl+xITVTr2s3vF+NOzYLl39xgb+sKrwCIyQUShWg8/4olWCP6KDUg8BXb1r/keaU5/C4N1hAfPMe0OmntQOvJIppTBlajD3BaGHuOAlPrjIlktd15J75IxqRUFJi4weCf9yz5HukYTiTK8ZfvUlRuy9lCKbpIYR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751818946; c=relaxed/simple;
	bh=TwV1tiqpJNNYhTYfN7yIsJe7okMAtYNcBcUb6Dnxv+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hvgGjVyvI32JO4b7GISg3oLR0PQdIzarvk+6ilzoVC5V8n7pT/INZHhMabWE0xCsRY2VLJrkDHk7uR4De02rIk1F5YIIJd5odtwmvUAT9Dcx243poU5JY8r8V48ZCrPT0GVqo6RPonOH7DwarKwWrpPzNN7VIG9RD+vtc/wOExY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lqz51RN+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lqz51RN+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751818945; x=1783354945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TwV1tiqpJNNYhTYfN7yIsJe7okMAtYNcBcUb6Dnxv+w=;
  b=Lqz51RN+QMATWcAWEH7didPp4cyGYW1ruLS9LzmWFpjTLpqSNcphUNTc
   X6GCFLsVFBBTyYw+OqBtponCnLI5JravhUa/qJBBdBcxxjZJIU2In5OrT
   SbPDC/0vEHDINIaO8CAr5lSWDyqOXuhC9LDJbtERfqq+Yr2QNMDNw2XGP
   Vvbr7yl6QHthwPRp4kSgXnBjD5eep/JHZVTTTeYkwabiMFG9MUf3fcHKh
   wgjDzmYo3EJda6wRemjHYUGRJKjgJvGm1YdX//QLYGHmQPAtSxd/pp9cX
   SbKsLlYBaJ+ADGM6QlB3MdVSaH8dYIePeSZEFqnyBSKfkEPtrovm89ULn
   w==;
X-CSE-ConnectionGUID: FLMI7FpOQ7y+WW37ld7Qjg==
X-CSE-MsgGUID: HLOKOXB1Sjq3YETMUAwxMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="53930863"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="53930863"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 09:22:24 -0700
X-CSE-ConnectionGUID: SFOZpeLSQ9uWxvQg0bDJgw==
X-CSE-MsgGUID: GKUzMFwjSKWq3mPEKf4tVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="154437067"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Jul 2025 09:22:23 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYS8C-0005A3-2I;
	Sun, 06 Jul 2025 16:22:20 +0000
Date: Mon, 7 Jul 2025 00:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 6/7] ARM: dts: sunxi: add support for NetCube Systems
 Nagami Basic Carrier
Message-ID: <202507070003.uqjDjzbQ-lkp@intel.com>
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
In-Reply-To: <20250705213900.3614963-7-lukas.schmid@netcube.li>
References: <20250705213900.3614963-7-lukas.schmid@netcube.li>
TO: Lukas Schmid <lukas.schmid@netcube.li>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Chen-Yu Tsai" <wens@csie.org>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Samuel Holland <samuel@sholland.org>
TO: Paul Walmsley <paul.walmsley@sifive.com>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Alexandre Ghiti <alex@ghiti.fr>
TO: Maxime Ripard <mripard@kernel.org>
CC: Lukas Schmid <lukas.schmid@netcube.li>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-sunxi@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org

Hi Lukas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sunxi/sunxi/for-next]
[also build test WARNING on robh/for-next krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Schmid/dt-bindings-arm-sunxi-Add-NetCube-Systems-Nagami-SoM/20250706-054253
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20250705213900.3614963-7-lukas.schmid%40netcube.li
patch subject: [PATCH v1 6/7] ARM: dts: sunxi: add support for NetCube Systems Nagami Basic Carrier
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm-randconfig-054-20250706 (https://download.01.org/0day-ci/archive/20250707/202507070003.uqjDjzbQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507070003.uqjDjzbQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507070003.uqjDjzbQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-basic-carrier.dtb: dcxo-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
