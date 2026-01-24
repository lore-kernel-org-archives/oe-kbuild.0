Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6783EBF00
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 06:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769237217; cv=none; b=AELzNq5MAlDCKvlO4tZRB9XXPhUVa+UFZFZDXoPYXnIZnaAycfDt95ED8YhzTCBvX9F6lnmIPLR+RWdGRysGcnfWfeJfUTHkPaedxu8CLr9VqDSX1ebyWm9iZUu7j2sZTig8sbsyp+8vn4E+N+yRgvwHtFqWjG1NQnQpqf2uFA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769237217; c=relaxed/simple;
	bh=fGx1Ata6kPeCl+unzXQCIiB+hGRno/fZscro6icbZGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aeXMrDzg4TEg4Zy5xAuNvB6yXDy9Qg38CHGh9dsO14ceNiHC9Qsbh4tmyO/WrZuOjt/0rxVJ0oTgDCYwHhI8YVKF9bPz8wZJ2XgGsvEkZVAfisGGemYBvjrlCrvsGMbrVv8fkFOh6XtNwHD63baNPAjjfJMcycEc9y1UeQUnreQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrA1+PHO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrA1+PHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769237214; x=1800773214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fGx1Ata6kPeCl+unzXQCIiB+hGRno/fZscro6icbZGE=;
  b=lrA1+PHOEDEvC2PzBmDi7yp4YqZdnI57JT8xZ3WFHG9QCbVGj8HzytBc
   GiqBqhShA8TS02jHT4W7jx99a0k6+v+8KzZQI5wdzxDYkm529FSQU2heL
   0sgimW5fEUN8LK8IomRKyJ6dVt/0+LvYDqS3ilM6rJuOqTa2QF/3RxuZ8
   vw+Prc/ypCbcBSIfmp/v7Ne7Obbw07Y4rl3/WE2jtD52+FBYEUha6WH3h
   y8KYyotyE4Sy2KyLVqnJmUf5uP0+GHH3AjjfdfNQBJhoiL3lQl2tAOzGj
   VA0bnW5MIuou3cYguoyrQXCBGmpWcz8p8nDlpscCRHRbU3BNwgp3YGyHp
   A==;
X-CSE-ConnectionGUID: OK0Lxz5dTn2rpizDsiFM3g==
X-CSE-MsgGUID: vVlZBNmwQ9CA0LsM3PP1mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="93148148"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="93148148"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 22:46:53 -0800
X-CSE-ConnectionGUID: ENZUbXI8TLqSf3AQawmKuw==
X-CSE-MsgGUID: wAjhgud+TVS2aVttiaUzyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="211328236"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 23 Jan 2026 22:46:53 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjXQ2-000000000uf-1oZo;
	Sat, 24 Jan 2026 06:46:50 +0000
Date: Sat, 24 Jan 2026 07:46:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
Message-ID: <202601240738.fJHaTFsU-lkp@intel.com>
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
In-Reply-To: <20260123140031.94752-7-john.madieu.xa@bp.renesas.com>
References: <20260123140031.94752-7-john.madieu.xa@bp.renesas.com>
TO: John Madieu <john.madieu.xa@bp.renesas.com>
TO: claudiu.beznea.uj@bp.renesas.com
TO: lpieralisi@kernel.org
TO: kwilczynski@kernel.org
TO: mani@kernel.org
TO: geert+renesas@glider.be
TO: krzk+dt@kernel.org
CC: robh@kernel.org
CC: bhelgaas@google.com
CC: conor+dt@kernel.org
CC: magnus.damm@gmail.com
CC: biju.das.jz@bp.renesas.com
CC: linux-pci@vger.kernel.org
CC: linux-renesas-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: john.madieu@gmail.com
CC: John Madieu <john.madieu.xa@bp.renesas.com>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260122]
[also build test WARNING on v6.19-rc6]
[cannot apply to pci/next pci/for-linus geert-renesas-drivers/renesas-clk geert-renesas-devel/next linus/master v6.19-rc6 v6.19-rc5 v6.19-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Madieu/PCI-rzg3s-host-Fix-reset-handling-in-probe-error-path/20260123-220948
base:   next-20260122
patch link:    https://lore.kernel.org/r/20260123140031.94752-7-john.madieu.xa%40bp.renesas.com
patch subject: [PATCH v2 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Document RZ/G3E SoC
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: microblaze-randconfig-2051-20260124 (https://download.01.org/0day-ci/archive/20260124/202601240738.fJHaTFsU-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240738.fJHaTFsU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601240738.fJHaTFsU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml: properties:reset-names: {'minItems': 1, 'maxItems': 7, 'items': [{'const': 'aresetn'}, {'const': 'rst_b'}, {'const': 'rst_gp_b'}, {'const': 'rst_ps_b'}, {'const': 'rst_rsm_b'}, {'const': 'rst_cfg_b'}, {'const': 'rst_load_b'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
