Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE4DA41
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Nov 2025 01:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762480038; cv=none; b=UHl8Ku6pLMAYg/iHA8NlCd5YnfvaQAhIh4FCG5tmsgunn2UuEdVLoGeuB5XkRUXNHP7eeHXi1D4CdndBIgIQiT2kbEAcQbkWRzyiNma/EbyZwPKxg2khg7uzElPetNshTKUq8SLkkeajWl69x3Le5oiAlMuyZFy1qP8XGApTUFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762480038; c=relaxed/simple;
	bh=JcUp1BioylVv6xGiB9LWd2J5e68tJbkfUU0VrQpq3iI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oTmNhdZwL/Ej7lygLeQcSkdQ6onnN0BEard5CCNjANrlDazRHvF1Kq79zCz9K1ioNgcGlLxl6tjtTaBcVvbxBLzygp97Y5pT/jD85JnbxKS1cPLLHqtipTMpKL3h/ieXrvQjz6fmrAhSJCJ+3t6+zsB9ZmVy3gG0CnLToIEHVdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJcnvFH3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJcnvFH3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762480037; x=1794016037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JcUp1BioylVv6xGiB9LWd2J5e68tJbkfUU0VrQpq3iI=;
  b=ZJcnvFH3q0tCZLzfGENrC6HeR5BKzV7TPw8QJVxd2CfTRzPHAm8tczQg
   174bdXtSV+yap8cqRScMsuxCIfNGBSyBFImKzWVPp1Lin9bW4xGVYfvyO
   F3LNkNzjB+sIcxVgyNYNblK+AdYt7WrEbCLd8IEa5HNjfoJ4hgAj0iYs9
   k7B5blXURcYwSCB0V8x6jwG4a3hVYzk4ci0rYHNKVouhi1x9Ry7+dld4v
   lxExJMLdLWXlpR81zK/8LUSGqLCtYfqk7p5N/4QXSNgJWORKiV7brAwk2
   cn/+CKsbjsVtEYmDdETk9itJfYkJJg8PK9S6LbIJONZse1HuYU/k9UA2+
   A==;
X-CSE-ConnectionGUID: pSSmV4bMSc+jd3kQI3cBvg==
X-CSE-MsgGUID: lEkOdW28RRGBUDzESRyUag==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="52197035"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="52197035"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 17:47:16 -0800
X-CSE-ConnectionGUID: AklKOYTzS5G0qHXqpQXKXw==
X-CSE-MsgGUID: GnXCcDc3TYacQw8fsgpYMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="188078774"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 06 Nov 2025 17:47:15 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vHBZI-000000003Cw-3Ocb;
	Fri, 07 Nov 2025 01:47:12 +0000
Date: Fri, 7 Nov 2025 02:46:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:renesas-lts/v6.18-rc3-2025-10-30-x5h-ironhide 18/21]
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000
 (renesas,scif-r8a78000): 'resets' is a required property
Message-ID: <202511070255.JR1e2Jgq-lkp@intel.com>
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
TO: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc3-2025-10-30-x5h-ironhide
head:   80827640973fc37984dca63282497d3787866053
commit: 9e41077ffdc895a91c3493109bdde2b6c5f65db2 [18/21] FIXME: arm64: renesas: r8a78000: Switch HSCIF0 back to dummy clock, enable HSCIF1 with SCMI clock
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2052-20251106 (https://download.01.org/0day-ci/archive/20251107/202511070255.JR1e2Jgq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511070255.JR1e2Jgq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511070255.JR1e2Jgq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000 (renesas,scif-r8a78000): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000 (renesas,scif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: scp@c1000000 (mmio-sram): 'scp-shmem@60000', 'scp-shmem@60300' do not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: scp@c1000000 (mmio-sram): $nodename:0: 'scp@c1000000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
