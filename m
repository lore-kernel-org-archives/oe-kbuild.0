Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0DF5674E
	for <oe-kbuild@lists.linux.dev>; Fri, 30 May 2025 03:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748574390; cv=none; b=iCeDRoNC7KBXibP+Ds2YfxG8gBC09DEzAcmShGEhk9TSgCkpW3FQPMDdY92ZpJMqVJ+1RAprPz7kriXIQcI9FU7kGTx1z+034fykIQNrwkgw7fpaidc/eM5n4a01KZY4oEZnEQG07O58OD5bkCNvKpMWLdPV3yM4te9cAjiT5Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748574390; c=relaxed/simple;
	bh=UJoFKwWooLQtcZbjiZZPHUWftcSRE+0SExF1JBFK1po=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=msjpis86xZ+AYZsvgoEuJlv6ZkathwPxIr/7EYF1Rq1pmpCHf0dd3UfO8/Z3sT4R1EuvVSrhr0BSzUl+mJ+v8PAoc7SIJqemsDYnped/LcFa1nSGg/19pwnFJ9RRkXQq0x44tH3jM3wsR+TnWmHqM8sk23tlti5PEWIEUwDHsZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FVYzqhJn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FVYzqhJn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748574388; x=1780110388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UJoFKwWooLQtcZbjiZZPHUWftcSRE+0SExF1JBFK1po=;
  b=FVYzqhJndHtIRlaxmRuoOlLEYRuF6L82Y/TeS9HvBDmF1xJfL29AlUKT
   SjJVoyICrJk/Rv0Xfw/x9FpbakcZ6sSj8c66k06k2eLMQ7OmOyOYtZ+ye
   gpUkY3Dq6ah4KCMRsnI9ZZeyrOZHifNEcHX0p1EtzluX+p14D5Dlhleik
   nKI7za8Dyggaf4ILeQ0N2aZOGetrjFitOrCOXsf+nlZ7JE0baGrEvuOca
   LFuo8Z+WaRi9qQS8vLA6gU1ACPyY3JIwESvYrPqmScmOa40+lPbp9tO1T
   7jLhPvW9ArSP0Hy4STfuj+NMAHwiwuwjpJv2H0RKs5OMG4DilCjH5Euqz
   Q==;
X-CSE-ConnectionGUID: WYOEMbYISH6LF7Bs1j92Wg==
X-CSE-MsgGUID: x/1QQnztQEWQ6ZwVg7q2zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="49902731"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="49902731"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 20:06:28 -0700
X-CSE-ConnectionGUID: 0Rf/4BzVQK6rzmYwExnF4Q==
X-CSE-MsgGUID: 6RYT5YOKQfulJuabGvaJng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="143776661"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 May 2025 20:06:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKq4e-000XHo-2J;
	Fri, 30 May 2025 03:06:24 +0000
Date: Fri, 30 May 2025 11:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/1] dt-bindings: display: convert himax, hx8357d.txt to
 yaml format
Message-ID: <202505301018.3Z04iJfS-lkp@intel.com>
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
In-Reply-To: <20250529164822.777908-1-Frank.Li@nxp.com>
References: <20250529164822.777908-1-Frank.Li@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
TO: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
TO: open list <linux-kernel@vger.kernel.org>
CC: imx@lists.linux.dev

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15 next-20250529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-display-convert-himax-hx8357d-txt-to-yaml-format/20250530-004954
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250529164822.777908-1-Frank.Li%40nxp.com
patch subject: [PATCH 1/1] dt-bindings: display: convert himax, hx8357d.txt to yaml format
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: csky-randconfig-052-20250530 (https://download.01.org/0day-ci/archive/20250530/202505301018.3Z04iJfS-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505301018.3Z04iJfS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505301018.3Z04iJfS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition
>> Documentation/devicetree/bindings/display/himax,hx8357.yaml: gpios-reset: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
