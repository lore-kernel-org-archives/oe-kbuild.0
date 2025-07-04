Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E705386329
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Jul 2025 21:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751663383; cv=none; b=fV7Y91ZrPbkdmJlbfzFLLyKYcaGIOX/ss7trJapXQsxbrgqkUyHkwSDg/1s0B2YQtm7MbZnm5aRCCj5IQdAXKtIqcJwZbmcHClxr8EFfIOtBTLkkWX5HbmEh/vyk6QsRv4/3Fjt+R56s5V1Ob+evJt3F4qkOFO8PRzRp0G6tgKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751663383; c=relaxed/simple;
	bh=VRQhAwYSMmlv30EzX5qvI+sN8ySXK9Wcm4JmU+h5dVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HypL93Hi7UC/cIBI3i+jll7gteMgcsrho5m7Ag+y98alnKGvuOJh2avI0ZBwthAUy3+EY2D6mXHPSjL7JOGIWHWe83OJSm91qPk51y5UM/TQPYpfLWuumhKeOKkT+464DMWJ2DCcGK+u+w5wUWyVct3Y62FlnDfb99I0d6MQ0h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPO5iFqy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPO5iFqy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751663382; x=1783199382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VRQhAwYSMmlv30EzX5qvI+sN8ySXK9Wcm4JmU+h5dVM=;
  b=dPO5iFqylLPLBH9D7imI4ByTxyF0u5iTFcq8OKjwlHgpPZBaCM0ODB/4
   fJOaKGbxbrN9qoLdyeTXdGLD0nZ4HJBXe04VLLRnp29MY7TQIjmqwb9O4
   4JneMRAYP6e5BBFCXt8iLr8W9tSec97k8EpFtMyZ3lhzvLraVxxSYjRlE
   WBfzd0RVytDoInnPsPwiHUnfaVxmfvOqzNteqDblibgmwVqRPWflcOrY9
   c3er/ub9/kMjPvEXsROQbhDwsnNvH5MCpaQsOlVad5lctns1t6x6+eUH9
   7VRG07y4ANM412PXNn/oR8fdgMehV4rDqfoq6oh3wh46CASSuTr3GSHId
   A==;
X-CSE-ConnectionGUID: PqqOidIlT9msh5sKRk52eQ==
X-CSE-MsgGUID: ggZZB9vzRY+k759Os/tK9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="65337548"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="65337548"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 14:09:41 -0700
X-CSE-ConnectionGUID: 53V4ehZmTUq2tQqonisejQ==
X-CSE-MsgGUID: 2yWsBBaRSVGkfB8A3D3djw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="154459981"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Jul 2025 14:09:41 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXnf7-00044l-2z;
	Fri, 04 Jul 2025 21:09:37 +0000
Date: Sat, 5 Jul 2025 05:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 7/8] riscv: dts: andes: add Voyager board device tree
Message-ID: <202507050440.yDE9c5dS-lkp@intel.com>
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
In-Reply-To: <20250704081451.2011407-8-ben717@andestech.com>
References: <20250704081451.2011407-8-ben717@andestech.com>
TO: "Ben Zong-You Xie" <ben717@andestech.com>
CC: arnd@arndb.de
CC: paul.walmsley@sifive.com
CC: palmer@dabbelt.com
CC: aou@eecs.berkeley.edu
CC: alex@ghiti.fr
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: tglx@linutronix.de
CC: daniel.lezcano@linaro.org
CC: prabhakar.mahadev-lad.rj@bp.renesas.com
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: soc@lists.linux.dev
CC: tim609@andestech.com
CC: "Ben Zong-You Xie" <ben717@andestech.com>

Hi Ben,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on tip/irq/core soc/for-next linus/master v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ben-Zong-You-Xie/riscv-add-Andes-SoC-family-Kconfig-support/20250704-163125
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250704081451.2011407-8-ben717%40andestech.com
patch subject: [PATCH 7/8] riscv: dts: andes: add Voyager board device tree
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: riscv-randconfig-051-20250705 (https://download.01.org/0day-ci/archive/20250705/202507050440.yDE9c5dS-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507050440.yDE9c5dS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507050440.yDE9c5dS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/andes/qilai-voyager.dtb: cache-controller@200000 (andestech,qilai-ax45mp-cache): cache-sets: 1024 was expected
   	from schema $id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
