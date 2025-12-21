Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686BB2571C5
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 14:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766327764; cv=none; b=DwxGYrhav4jGLipGRLucRbXiiwhdTUi+uvta68cH0Id01/yrkFhEfdkf6ZEnPUgxJOyOiWMUGExWWQIP9u7JFDe4Z/n3TO3Y4j8fuWl+XyuagplVZSFrSa7dRjmK5RDjyIdEBChlqlIpOm2WKckris82R+fj9fEPp/k62wjSW+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766327764; c=relaxed/simple;
	bh=lO4LYn23LstqYjKY+cDajZC6LkT7n2HKE9qDiLALBlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YqgPOA/OqvmBtR808i3Ax8GBmr/25PG8L7Ah3eSwzGREIqzZ9bKgcbG38t4sxWSkAhQuk9jX+uSZSk3qhQlLm7MBqdEVIXVTmtQANLFYgAql2vQRaepiofre2KXJDtodK+1Ei85Qcsp+BxRpmuplkOXf9Y3XCyBFDl8/eANbx0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRsHG1Iv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRsHG1Iv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766327762; x=1797863762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lO4LYn23LstqYjKY+cDajZC6LkT7n2HKE9qDiLALBlQ=;
  b=QRsHG1IvE28vx+BRyBi/Jw4xKDa6OGptMTscNmtQjrrPn2V/TRSrpsHV
   xLiaeA7MKjgSgW1t4nnRYDeqbFK3vT3sp/5kbCOssBKV1Ip64tY9hsv8Z
   ehDwB8Aq+O5cP57+zeBB8hq0KXVmAk1R/oplJJFfD7x9B2yfGuQKjYWzE
   QJgOV3lcHdxri/H82SEZg+/lY9WEU+n0xL6J/6of0eQw3hKUIjar08H6d
   2fR+RtG8jbWW3lfjqAtP3Uv8L06jx56NQDuK7v5QWOq/veuc9nKRnOQ7D
   FFtzFlmCT6/fAi6HOaZsaCy3K77YlvjzdGgQK/bXNeLFl4tNHyGaM8ytj
   Q==;
X-CSE-ConnectionGUID: +obQgw5bTGCE6Kg9EviJqQ==
X-CSE-MsgGUID: rL6lC3xzStGpZtBGqmRAuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68100817"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68100817"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 06:36:02 -0800
X-CSE-ConnectionGUID: yVYNb4CTRhizKXRmTPbPyw==
X-CSE-MsgGUID: aFWaeblxTUmUjSfVF38IrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199611111"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 21 Dec 2025 06:36:01 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXKXO-0000000054y-3crL;
	Sun, 21 Dec 2025 14:35:58 +0000
Date: Sun, 21 Dec 2025 15:35:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 5/6] riscv: dts: anlogic: add clocks and CRU for DR1V90
Message-ID: <202512211545.fkHSicDM-lkp@intel.com>
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
In-Reply-To: <20251216-dr1v90-cru-v3-5-52cc938d1db0@pigmoral.tech>
References: <20251216-dr1v90-cru-v3-5-52cc938d1db0@pigmoral.tech>
TO: Junhui Liu <junhui.liu@pigmoral.tech>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Junhui Liu <junhui.liu@pigmoral.tech>
TO: Paul Walmsley <pjw@kernel.org>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Alexandre Ghiti <alex@ghiti.fr>
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org

Hi Junhui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Junhui-Liu/clk-correct-clk_div_mask-return-value-for-width-32/20251216-115101
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251216-dr1v90-cru-v3-5-52cc938d1db0%40pigmoral.tech
patch subject: [PATCH v3 5/6] riscv: dts: anlogic: add clocks and CRU for DR1V90
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: riscv-randconfig-2051-20251217 (https://download.01.org/0day-ci/archive/20251221/202512211545.fkHSicDM-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211545.fkHSicDM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512211545.fkHSicDM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dtb: clock-ext-can (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
>> arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dtb: clock-ext-wdt (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
