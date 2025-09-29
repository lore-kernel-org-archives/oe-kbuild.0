Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695211E3DE8
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Sep 2025 19:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759174931; cv=none; b=WtHpewMZmDlruDel5VyrGhfyxLGcPLs8nCjEQJn0V8xv0irvn9oJu2lknpSmOpOWWi+x/AJZUgBYPFLlMPwgO292+t76CvJjJtUtafJ7x6KFoIJFr+z8FHe71qN7N8BnqwG5rMaG205gZmbBIC64cEHLjO/5SLil9cwvJsx6e/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759174931; c=relaxed/simple;
	bh=IxMswMiab8tqy070UJjBFB01zdLW3wHl06NFYfk3qyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g7x6YgsB9ndMxdpJ78/nzNi1jbzZK/JcYqaCnsqMKe8JKgM5278WwSiOKoGjOvnclhTf4ZlaLIse5T/MfceEMFvmgppF/gu3TQzD3DgwiNX413cOkmWYpKVNbTtnkOMPi4pg2lN7h845xXOdW0su4z9oDx++yMpkBAvBAMtinUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDn+Ixcn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDn+Ixcn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759174929; x=1790710929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IxMswMiab8tqy070UJjBFB01zdLW3wHl06NFYfk3qyM=;
  b=jDn+IxcnwwWFfzsiEzwnJVP5TuAOMJMp6TV+NBEbv7tGOfszU4i4APFf
   7fhnNkTdP7K0ugbkvG5hjDYjx3lvOBfpJR5JxYLYKvl0PDPzyojvb6kps
   WTUXBMSHgvNJZxugT7HLkU03XCqraDDBZjqMqq8ZBFJv2OJSN01srKKkj
   gmmrEvMAUh5PHmkBxDokAw8v7TA8AtCcx8R9zLhoegKAjlctFMBZpajBy
   1ts2LFUtDokbMcdaD1OgTDzunAcYn77N+grTtKQ1axgfZ7N0hN3OJyCrd
   sc+ttLZPddA43dgiFxfMmQm/mwlM3oD6k1SO3CgiPP8e5V3uBvug3BDot
   g==;
X-CSE-ConnectionGUID: cyVZ+N5pTNC8Bd3AmvfEjQ==
X-CSE-MsgGUID: TaNgZvClRTazJ1xGuCfRhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="65061039"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; 
   d="scan'208";a="65061039"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 12:42:08 -0700
X-CSE-ConnectionGUID: eWWVduzZQP+z2L+ek2y+hQ==
X-CSE-MsgGUID: pBDZ86PARGywxqWVtBu+Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; 
   d="scan'208";a="183502459"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Sep 2025 12:42:08 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3Jl7-0000cZ-1g;
	Mon, 29 Sep 2025 19:42:05 +0000
Date: Tue, 30 Sep 2025 03:41:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 4/6] arm64: dts: exynos7870-on7xelte: enable display
 panel support
Message-ID: <202509300350.PTjFcKlB-lkp@intel.com>
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
In-Reply-To: <20250928-exynos7870-drm-dts-v3-4-bb7d8e570860@disroot.org>
References: <20250928-exynos7870-drm-dts-v3-4-bb7d8e570860@disroot.org>
TO: Kaustabh Chakraborty <kauschluss@disroot.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Kaustabh Chakraborty <kauschluss@disroot.org>

Hi Kaustabh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 262858079afde6d367ce3db183c74d8a43a0e83f]

url:    https://github.com/intel-lab-lkp/linux/commits/Kaustabh-Chakraborty/dt-bindings-samsung-exynos-sysreg-add-exynos7870-sysregs/20250929-015945
base:   262858079afde6d367ce3db183c74d8a43a0e83f
patch link:    https://lore.kernel.org/r/20250928-exynos7870-drm-dts-v3-4-bb7d8e570860%40disroot.org
patch subject: [PATCH v3 4/6] arm64: dts: exynos7870-on7xelte: enable display panel support
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-051-20250929 (https://download.01.org/0day-ci/archive/20250930/202509300350.PTjFcKlB-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cd4c5280c73d42fd41819cc8927d00787ade88e0)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509300350.PTjFcKlB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509300350.PTjFcKlB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/exynos/exynos7870.dtsi:707.10-718.6: Warning (graph_child_address): /soc@0/dsi@14800000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: /soc@0/dsi@14800000/panel@0: failed to match any schema with compatible: ['syna,td4300-panel']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
