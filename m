Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C7D22CBD9
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Feb 2026 09:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771146527; cv=none; b=SHMIqztya/vaaihHBERvC67NEN1rodobsDrF6xjaXm9/HgNzFNDikmpV/aFNNZ+AAwtbN2c0UwE3zZ4A0VDXPF2GSHsJydQtWPpXVnn+SOpdZOhNxBiRZUX7lINh9LYEW4lfNzKIPhIwWDNjoXK+TTDwrvke+7aix1E5fEFOnf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771146527; c=relaxed/simple;
	bh=gFRff4VATDfGwgEJzELC6KsTQJoAnLbjlGmA8k0Hm28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bpwb7d1u5jR+zDfqVqy8GnAXE9YkG/3JEmaRtDOrgbE0MAVST/ZAnF1nQhA57Hweq/WOT0krhWn70d388CLKf+Dv+YCTS7CWu6VZvbcHb3aydaUASD7KwXyDhScP9x4CFgQOFRpFES0+g7ahNtyFIvRCKMaKhPJzGcV//eVl10I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dws5/Ygv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dws5/Ygv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771146525; x=1802682525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gFRff4VATDfGwgEJzELC6KsTQJoAnLbjlGmA8k0Hm28=;
  b=dws5/YgvY1ML9tbT/dNlQ9WWdUrdtKF7CnSiQ6yNg0th+oj/YkXHwHbc
   kYY9aM1H4hhQRzsKlH3+paGyKIb+IwKJuCVyk2Rrn6igr+oK8C67UqLA4
   Bo1x/sD4Z/BTw1rsbK2L2bptenhdv8lKgzwi1RMg3e14eWnAvchmpfyK/
   qVDgKaWmv2i4I1KvRhBPoGMCz6U4bhqTAP3mpyNcmgvTJ1CMbxcB3nHf2
   ERCKZFP335Gr89SBJNEsivdnPRme7FSn8u577py4I5JZDA6iEGj1Nqhcr
   j0ZQq/wimQ0YEykFClhKqXNtAkFfxW+x/QqKG0pugkE4SwhBwTD4prr2B
   A==;
X-CSE-ConnectionGUID: PnR23Z+5SZW72KHMxhuf7w==
X-CSE-MsgGUID: 9PuI6lRIQfu7i6jnRkccfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="83707095"
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="83707095"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 01:08:45 -0800
X-CSE-ConnectionGUID: D4FlkjvgSIy0ayN5mj/hlw==
X-CSE-MsgGUID: MGVvAc+6SWyfjZKo4UKF5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="211932900"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Feb 2026 01:08:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrY7M-00000000y7Y-1nOh;
	Sun, 15 Feb 2026 09:08:40 +0000
Date: Sun, 15 Feb 2026 17:08:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 2/2] clk: clocking-wizard: add user clock monitor
 support
Message-ID: <202602151704.qepyfVlc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260214180933.42143-3-hpausten@protonmail.com>
References: <20260214180933.42143-3-hpausten@protonmail.com>
TO: Harry Austen <hpausten@protonmail.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Michal Simek <monstr@monstr.eu>
CC: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Harry Austen <hpausten@protonmail.com>

Hi Harry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ea7282e99ead6d2a294cef40acd2a29ada3ab71d]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Austen/dt-bindings-clock-xilinx-add-description-of-user-monitor-interrupt/20260215-021554
base:   ea7282e99ead6d2a294cef40acd2a29ada3ab71d
patch link:    https://lore.kernel.org/r/20260214180933.42143-3-hpausten%40protonmail.com
patch subject: [PATCH v4 2/2] clk: clocking-wizard: add user clock monitor support
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: microblaze-randconfig-r072-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151704.qepyfVlc-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602151704.qepyfVlc-lkp@intel.com/

smatch warnings:
drivers/clk/xilinx/clk-xlnx-clock-wizard.c:1183 clk_wzrd_user_mon_work() error: dereferencing freed memory 'dump' (line 1182)

vim +/dump +1183 drivers/clk/xilinx/clk-xlnx-clock-wizard.c

68614f228e6cbe Harry Austen 2026-02-14  1175  
68614f228e6cbe Harry Austen 2026-02-14  1176  static void clk_wzrd_user_mon_work(struct work_struct *work)
68614f228e6cbe Harry Austen 2026-02-14  1177  {
68614f228e6cbe Harry Austen 2026-02-14  1178  	struct clk_wzrd *clk_wzrd = container_of(work, struct clk_wzrd, work.work);
68614f228e6cbe Harry Austen 2026-02-14  1179  	u32 *dump = vmalloc(WZRD_NUM_DUMP_REGS * sizeof(*dump));
68614f228e6cbe Harry Austen 2026-02-14  1180  
68614f228e6cbe Harry Austen 2026-02-14  1181  	ioread32_rep(clk_wzrd->base, dump, WZRD_NUM_DUMP_REGS);
68614f228e6cbe Harry Austen 2026-02-14 @1182  	dev_coredumpv(&clk_wzrd->pdev->dev, dump, WZRD_NUM_DUMP_REGS * sizeof(*dump), GFP_KERNEL);
68614f228e6cbe Harry Austen 2026-02-14 @1183  	iowrite32(dump[WZRD_INTR_STATUS / sizeof(*dump)], clk_wzrd->base + WZRD_INTR_STATUS);
68614f228e6cbe Harry Austen 2026-02-14  1184  }
68614f228e6cbe Harry Austen 2026-02-14  1185  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
