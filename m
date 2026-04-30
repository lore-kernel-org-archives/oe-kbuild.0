Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA911407584
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Apr 2026 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777558305; cv=none; b=Qa2Jbzx5lFKkvo2QCNvGkgGnVUH4ckgEoaKUwwzg754SUP3wqWBI8eISQFuBKolAIHWZIbzEDrzOGIJvWzldqxUsjpVSPyPAtzpJLhY41nJqJ5N0TuBLzhF1B46ZdnnH+FbRKIxWeGUl5EXYLMElid0kLZnQrTzjTacZEb3bq2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777558305; c=relaxed/simple;
	bh=0CDUB2JJM950DYWeJA7YhzfAe9QmzyRPaBvUEkW4h9A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HArZ0lk7n3tcmAvw5evpyYM/8iOo4Oayra6iiBALn6PcWllIFvbBIY4Glo1VJe9S1go6xqrBfhhQYqW0wZWnGU2OO1ptbj2dWJwaFGVWd6B+33iwFQfMLy7yfbL12TLJQ0+enjcdg8IioxjvQ6h8Lvt5gQsotK9EnPtmW2YjX+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwC6pX6h; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwC6pX6h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777558302; x=1809094302;
  h=date:from:to:cc:subject:message-id;
  bh=0CDUB2JJM950DYWeJA7YhzfAe9QmzyRPaBvUEkW4h9A=;
  b=mwC6pX6hxWbznAzkOEetZ51C0e8WwsLzIhO2wXpCXc8GwtFoVqtj5ynD
   0taw4CQUgnoHUeeIZiaFnLvb07VCPR0Xl9/SWyiDQwSuupmcFgk1jmWma
   d+/jEafs3JCBYXC2rnN9tDc+3HpphYPvAX4IooiTmLkFkI+BGR8qSTEnA
   aURwaqz2Axxl/rN2ph28jxHt6i01DGlVS5CQfPGZNU4+pmvtI0qM+uwtw
   WPJ2YL+jtlM+vvyDJeOR6flU/jI/aNtI4Pvh10JxAxWzLxPmYrGGYf0Az
   xb0qBJp7xScXtKgb6G9ZIM8wGIwIVjMuLDyF3OtRDHlR8/D6pyrelrGA+
   A==;
X-CSE-ConnectionGUID: 8jXxjbfkSImA74wFo8j3Ww==
X-CSE-MsgGUID: ZtsLPCILRWefR1R4m6a1fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78374901"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78374901"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 07:11:38 -0700
X-CSE-ConnectionGUID: r+JyHoHgSJOZr2959kzu1Q==
X-CSE-MsgGUID: MbYpqDNcTg2SZrf2d4Y5BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="236379913"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 30 Apr 2026 07:11:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIS74-000000004q1-3M9J;
	Thu, 30 Apr 2026 14:11:34 +0000
Date: Thu, 30 Apr 2026 16:11:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml:
 properties:fsl,cpus-bits: '$ref' should not be valid under {'const': '$ref'}
Message-ID: <202604301635.fMcHnx1S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiafei Pan <Jiafei.Pan@nxp.com>
CC: 0day robot <lkp@intel.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/intel-lab-lkp/linux/commits/Jiafei-Pan/dt-bindings-remoteproc-add-imx-rproc-psci-binding/20260430-035825
head:   22dbd3de2985429326de17f9948c1a488c328b99
commit: d96dd94852f3a0f96b18f4f9ea16af6c0e4cf33a dt-bindings: remoteproc: add imx-rproc-psci binding
date:   18 hours ago
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arc-randconfig-2051-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301635.fMcHnx1S-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301635.fMcHnx1S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604301635.fMcHnx1S-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml: properties:fsl,cpus-bits: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
