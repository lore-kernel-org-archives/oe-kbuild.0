Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7162EB87B
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 18:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768241081; cv=none; b=IBPUK1SIzN2rJoxHKnyQjuIFivSg/eeaUyexWGuD6slPpRQsmzrFpNLIax+PepsL69XCeUOuB/yXhZv+T0IZTjTm3U3XDlT1JC8T+luE7vDLFQxstL5IyR8vpinHYto/LGDALES01yGC4aUKi8bSBbdikzWItLW1Ukk4tFJhxOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768241081; c=relaxed/simple;
	bh=eScIYGOXQByJ1IDdgXoQw32MICn4Hwe47/oEMURzm70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WpbRfh7xSfl4vk7jsRJhYz8K9ilKZ+9FzFvWTt/nVDPYKEob0ZKY5FszUCdVorFuc11A6SEmnvVHa3W4LyI/Clk/WCrpGLwohABvkVyvoQzQ0tyAbuIFmIfOkuN5Z3qs0FGm4pOtZIdROXbptxzwsrIqA01Fbde4CqM5yFTuSRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyT1vole; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyT1vole"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768241080; x=1799777080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eScIYGOXQByJ1IDdgXoQw32MICn4Hwe47/oEMURzm70=;
  b=kyT1vole2qAGZXMJe6ncpd5XT2Y+Cq5FyydSCvPsl6NtNNv853XxffvD
   EJifmmytDIbNPYJxlbhaQ5H5nYBNhzSscFzZ2AIos3a9BK60216VipU2t
   ou7hQ5bePF1P1uvgpYD+O+OiEmJ6WoL22DnPD5FZ0lAaOZ2iwmk/ljr8y
   X3QQCLqedO/XJsM9ezeLJj7Wq9HpEi+QmvRkj3p6dP3sQm9yhCepCc7jf
   hW1Zn86SY13KdL7DNzSLJtpTSRca4CyWCmr404IAbthH18pTon/aYn6nu
   dQqtj3boMEdPPOFkdOSUJRfMllrX++iOwIY8GnVSIIuTOwQWbFHTHZ7Ah
   w==;
X-CSE-ConnectionGUID: RHAqqW/gToylbvqBHHt3aA==
X-CSE-MsgGUID: bPByUKBvSp6JJ3FbmxJicw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80886300"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80886300"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 10:04:39 -0800
X-CSE-ConnectionGUID: PRmpVZcWQEqXy0BvV0Rk1w==
X-CSE-MsgGUID: FLVudHUMQXqCkJRBtPl4fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="203364335"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 12 Jan 2026 10:04:38 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfMHM-000000000xp-1ZDo;
	Mon, 12 Jan 2026 18:04:36 +0000
Date: Mon, 12 Jan 2026 19:04:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: Add support for Andes
 ATCWDT200
Message-ID: <202601121920.S7fOeWjT-lkp@intel.com>
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
In-Reply-To: <20260107145058.213334-2-cl634@andestech.com>
References: <20260107145058.213334-2-cl634@andestech.com>
TO: CL Wang <cl634@andestech.com>
TO: cl634@andestech.com
TO: wim@linux-watchdog.org
TO: linux@roeck-us.net
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-watchdog@vger.kernel.org
CC: tim609@andestech.com

Hi CL,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on groeck-staging/hwmon-next linus/master v6.16-rc1 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/CL-Wang/dt-bindings-watchdog-Add-support-for-Andes-ATCWDT200/20260107-233010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260107145058.213334-2-cl634%40andestech.com
patch subject: [PATCH 1/3] dt-bindings: watchdog: Add support for Andes ATCWDT200
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: openrisc-randconfig-2052-20260112 (https://download.01.org/0day-ci/archive/20260112/202601121920.S7fOeWjT-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121920.S7fOeWjT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601121920.S7fOeWjT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/watchdog/andestech,ae350-wdt.yaml: andestech,clock-source: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
