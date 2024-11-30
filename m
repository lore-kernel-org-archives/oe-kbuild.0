Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065E812B93
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 09:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732958078; cv=none; b=YhMJ5mz/mSSrL7ww/Ef6F4LMzSFWX+Op2oLzKDGtoiNzBnqrhzFwxENS0AptcvxAbOCG8Xa0DUisPt5dvPzW3Q0Jg7e3V3Rhz7qL2ybxfZ5zkC5X+/LKKXIjOrgaEGsX3rxNkWB9N96vOp0uzoE+DHA7N6z1tzOe0l0OnsACS9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732958078; c=relaxed/simple;
	bh=/nJXy5D9Dxv+napaWuNIn89bzdv9gdgBZ4r1KUUQQpc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O6uSjR6H6mqJP0t9CH1MfkYCpQkAhYw5Xv6SUqEVcL66pKpRv3wCQbktHSse9XuCSyjSduvlofKiqyvQkyP/hQl9M/h9zsiItQE/jEo2IX/W5vTX3tTjTaCehOYF0Gp1CGlifRZ5ioYCngXmF2Tb59H7VdbjaKsPVHEFembIW0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMx7srJ7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMx7srJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732958076; x=1764494076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/nJXy5D9Dxv+napaWuNIn89bzdv9gdgBZ4r1KUUQQpc=;
  b=iMx7srJ7q7TvhAgI/VxbFdUJaWtiajjhXIrJhbhSmOpMBmNQM7VD1k3N
   DD6Gl0bYhnX7JGm/Fpvpb1sr10d1yZ73rWke7650E+hIMr9pckBoma4PB
   GkLdeYWJZ5h8QsUFQltV8sYKzhiKBgbgsFRnkidYd5UexPk9q5hYCxcut
   z41DO2dZ2qNIT00+nUjjuZP4FU6zU77BEGfLcRSCd7iJglNrch4ov1DJF
   pjmHtv3ljrWo0mj9afjh60JMwH5BUQLyQquoOBvMQ4Di9mY2CrpC40qwS
   iG0D525+kJW6Z+DLU4X8YcGE2uqTOM/Q0QHckPTJ3ZbwMN0cY6tGftP0d
   g==;
X-CSE-ConnectionGUID: FAtOD5oWS42/WG08Knn07w==
X-CSE-MsgGUID: opRSqjTXTHGCqPRkKZ/WMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="44543776"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="44543776"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 01:14:36 -0800
X-CSE-ConnectionGUID: 5KrUylBkT5+7yXUcSF3ceQ==
X-CSE-MsgGUID: S7cw+oqFT6yj6Ymg7gItQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="123525706"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Nov 2024 01:14:34 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHJYe-0000Tq-1n;
	Sat, 30 Nov 2024 09:14:32 +0000
Date: Sat, 30 Nov 2024 17:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [atishp04:b4/counter_delegation_v2 7/24]
 Documentation/devicetree/bindings/riscv/extensions.yaml: ignoring, error
 parsing file
Message-ID: <202411301716.zCliAymn-lkp@intel.com>
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
CC: Atish Patra <Atish.Patra@wdc.com>
TO: Atish Patra <atishp@rivosinc.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/atishp04/linux b4/counter_delegation_v2
head:   20eccade6e1057a3ea847f0f5f9a6eaab65150d6
commit: 58925d5036606d346a176279ab81132f173fb67a [7/24] dt-bindings: riscv: add Sxcsrind ISA extension description
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: csky-randconfig-052-20241118 (https://download.01.org/0day-ci/archive/20241130/202411301716.zCliAymn-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411301716.zCliAymn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411301716.zCliAymn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/riscv/extensions.yaml: ignoring, error parsing file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
