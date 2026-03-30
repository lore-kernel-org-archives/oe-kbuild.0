Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFB43AB29D
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857632; cv=none; b=MAPtIinepO70XUVAtIXYLTqj4EFmVkXTE8xAxJGVr4Akdp8gobeEAmfwz7BzfbUdEuCWsrz1Z/wJCN9b3ljgCP6JXxURhKR//VlKb5iQubh4NE33z02qYAMcnlwLJ66ciQSZE3EXZpBSSeDuWdFsCZS9UR716i7zUOWe/NoiZNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857632; c=relaxed/simple;
	bh=fqfgGPi2Hu2mp5dIe9ipdXp+eUqAhY40UgerOyiDA/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Al0f4vozOz3Hg+dgNMR5jIOf5QwNYtuhP8Akyiw+U+lPOE6BwuBqGsmuyteHvzmqp1J/xc31nXaMeN7a8ZNISrJNU+ukOvqP1RGNkPxInvuzfDI5a25jT1ECF5Lb7fUuSS0NwUtjMyRx6bnxMvlGsgHQ+r8k1z78Mmm4O4Q+ZKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K7KcRD6i; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7KcRD6i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774857631; x=1806393631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fqfgGPi2Hu2mp5dIe9ipdXp+eUqAhY40UgerOyiDA/M=;
  b=K7KcRD6iXX0fqJfH7qouLkxiqTHD++9qQYfmBGrNXTgWN9fJz6M5l7Ya
   cMvzv9+i+NzOnN9ZfkVasddR57W8W5xzFXWqDGCDzdiwVq+lgZ8NDI7ZM
   iijhcnQVOLdF7N9x+P1BQHzjbHwj1O6DLfMC8S2cxVcyznq71dB+2MCUU
   OBMtQmGhi8annC7d7co3zwCyReL0HAu2mPX9BOJRglE8xKwtOC79eDzzf
   wLT7a9yYvsHvHA3lZbx7V7DtCQEyqY28ONwQpl203xaZaQcbdb7iYz2Km
   rkF+NI7Er53CaWXgZNZa5vz910xB+007fD+yDF3fF+5qWuzYWhrGukV2b
   Q==;
X-CSE-ConnectionGUID: vRMu05PPTAuxhZvCPXGbFQ==
X-CSE-MsgGUID: b1yamOy8QBiVwoRZLrmuUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79445410"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="79445410"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 01:00:31 -0700
X-CSE-ConnectionGUID: krsDAnVxSnqh4K8Wt6vuGw==
X-CSE-MsgGUID: gM160+l4TMu4EOsZMkHAZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="225156206"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 30 Mar 2026 01:00:26 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w77Xr-0000000084b-2M5f;
	Mon, 30 Mar 2026 08:00:23 +0000
Date: Mon, 30 Mar 2026 09:59:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/2] dt-bindings: perf: marvell: Document CN20K DDR PMU
Message-ID: <202603300925.P6K1b3Ki-lkp@intel.com>
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
In-Reply-To: <20260329152439.10573-2-gakula@marvell.com>
References: <20260329152439.10573-2-gakula@marvell.com>
TO: Geetha sowjanya <gakula@marvell.com>
TO: linux-perf-users@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: devicetree@vger.kernel.org
CC: mark.rutland@arm.com
CC: will@kernel.org
CC: krzk+dt@kernel.org

Hi Geetha,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on robh/for-next linus/master acme/perf/core v6.16-rc1 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geetha-sowjanya/dt-bindings-perf-marvell-Document-CN20K-DDR-PMU/20260330-013714
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20260329152439.10573-2-gakula%40marvell.com
patch subject: [PATCH v2 1/2] dt-bindings: perf: marvell: Document CN20K DDR PMU
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arc-randconfig-2052-20260330 (https://download.01.org/0day-ci/archive/20260330/202603300925.P6K1b3Ki-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev9+g4cd3cdfac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603300925.P6K1b3Ki-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603300925.P6K1b3Ki-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.example.dts] Error 1
   make[3]: *** Deleting file 'Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.example.dts'
   make[3]: Target 'dt_binding_check' not remade because of errors.

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml: ignoring, error parsing file
--
>> Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml:35:1: found character '\t' that cannot start any token
--
>> Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml:35:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
