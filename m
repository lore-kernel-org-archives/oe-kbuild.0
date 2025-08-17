Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C18E186A
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Aug 2025 01:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755392674; cv=none; b=UK6LEsLJbnzaUfBrVLTuf9AgMz4q0L34xP6CuFeTWC2fEg2Kzg5kJQFMRAmF9fV/r/Pl1zi3GJowZctEs0F+v36kVb0Ua7ZOcjwdJC55KWZE0VOlc1O2Dc+oOfUIzdW3T938RZcIEsNdHTwxyd5gzseysP6hHZHouiMH4m6dIFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755392674; c=relaxed/simple;
	bh=5y+EU2eHeEoM9nwgc4UzloJl1ongW+oeTe6WlUcKsuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o+RTnqfPCTTd7F1KeyRLcSJ/y8oMHIL/pT0r9tdFPudG4+y8JaFO6D4qVrquNj42b13Mr7QeRwGp0s9uodIs2IjMEQs6GTEvBvYBEXo8l7GerRniqAhg0nBuirSkD4dVuLio0Qyn2gC3MYVJBHBo4K3rtjJ1I/4dE4Mancyv+eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GkvHw02y; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GkvHw02y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755392672; x=1786928672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5y+EU2eHeEoM9nwgc4UzloJl1ongW+oeTe6WlUcKsuA=;
  b=GkvHw02ycKi4I82XsYh86fgnyDfZOPN9IhKwbXVAPyaNdzrWwt851+sn
   eU/qnDoyhSwJHiBKmSxvjk/mJVQrAxcNAnLPK5mflEmcj626iyG4lj9zn
   5RGkU1+jkj/JDBOTmxCw591K/t2vMw+k/SU/Mb5pBayfM7kuXckqAKXLk
   v+TcRLYF53f/HperwlqE6sDe/7TvaNE4X7N02gd4AwwY60VCH3uAKH+2t
   2szHf8jgOuyaM9AXsJirUfbBVtHKrwu6tO4WSNupvHSbXRp86VjnU5Jka
   i0D4ETX2dWit5drQXlFdmf/ADpgg+Q1oQeSUpsJvbXDd8C6K+x5q2yvam
   w==;
X-CSE-ConnectionGUID: be5V9JhqS0qjNnLoFegAhA==
X-CSE-MsgGUID: hicHxHV2R0WnC/ZI0Zuv8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="45234309"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="45234309"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 18:04:32 -0700
X-CSE-ConnectionGUID: GLVOqmP7Qh2JyBWLRg0qKg==
X-CSE-MsgGUID: i5ekwn2DRhCYanhHclyD7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167535886"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 16 Aug 2025 18:04:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unRov-000DIF-1b;
	Sun, 17 Aug 2025 01:04:26 +0000
Date: Sun, 17 Aug 2025 09:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] riscv: dts: thead: th1520: add soft PWM fan for
 Lichee Pi 4A
Message-ID: <202508170800.3cXZFM3A-lkp@intel.com>
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
In-Reply-To: <20250816093209.2600355-4-uwu@icenowy.me>
References: <20250816093209.2600355-4-uwu@icenowy.me>
TO: Icenowy Zheng <uwu@icenowy.me>
TO: Drew Fustini <fustini@kernel.org>
TO: Guo Ren <guoren@kernel.org>
TO: Fu Wei <wefu@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Han Gao <rabenda.cn@gmail.com>
CC: Yao Zi <ziyao@disroot.org>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Icenowy Zheng <uwu@icenowy.me>

Hi Icenowy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Icenowy-Zheng/riscv-dts-thead-th1520-add-coefficients-to-the-PVT-node/20250816-173608
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250816093209.2600355-4-uwu%40icenowy.me
patch subject: [PATCH 3/3] riscv: dts: thead: th1520: add soft PWM fan for Lichee Pi 4A
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: riscv-randconfig-052-20250817 (https://download.01.org/0day-ci/archive/20250817/202508170800.3cXZFM3A-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250817/202508170800.3cXZFM3A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508170800.3cXZFM3A-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: pvt@fffff4e000 (moortec,mr75203): moortec,ts-coeff-g: 42740 is not a multiple of 100
   	from schema $id: http://devicetree.org/schemas/hwmon/moortec,mr75203.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: pvt@fffff4e000 (moortec,mr75203): moortec,ts-coeff-j: -160 is not a multiple of 100
   	from schema $id: http://devicetree.org/schemas/hwmon/moortec,mr75203.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpio-pwm (pwm-gpio): $nodename:0: 'gpio-pwm' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
