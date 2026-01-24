Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17208230D14
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 21:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769288861; cv=none; b=YnkG7Q41wzrOLfn4cEFGF3GPHBCD3hNs+A58zy59v9vENJSWRnijKaz/HEA9srjL8O2cOZaQLve2/2rCKUYSZBJ2V+L7vrGWqtkTND0ziU/+BDW5//YxFJyWYJLBNV1up3pu2YeD9jcgRYR+XtxzLp+Cietd9yKNpU63WBJxN1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769288861; c=relaxed/simple;
	bh=BAKckjliAyMXJNi8HXo3yrMCNm4ItFwjfT8Tov5vVyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WjXWOOhgyFT+PqN8vJB8+5ZUHp/l/a9oQIkwNADJUgHQdElTEGWlGMIYepwfBMUjZqwSjOR0vBHSvxxBQMHSS/3llNfTm6B99P3qta6HAWe1GX5BkGIO8DZbnmkbIByUwwa7CRiqwgfZVUOThG3svwB6z9zU28iVcxXF7JLBQqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VuqxzG9f; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuqxzG9f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769288858; x=1800824858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BAKckjliAyMXJNi8HXo3yrMCNm4ItFwjfT8Tov5vVyg=;
  b=VuqxzG9fiio6KyIdKUX+m4RiJRdyiMUr7IFldCBkncvgU6BGHx0PpMqU
   xxY1udz15maESuVCAPprS+lc9sXe//R4Qvhn7pNgwGUpCggkqvQNVtC9l
   M3y1WFq7l7MT9L3gFiEGnqnuUImF7gIQwvMb2v/zVrcZEokCyQLDfw7KX
   at+EAw3JxYAzYC4FsVjo/Bz78z8mrbgnyGbbvq9QztgO0fUSEtxQ42hHA
   rH2OYgoPDr2L+uyrv6YYw4yLW9qJ6z86lpzeggcU7nOnHTehzsdyk73XB
   cuDcwR56v6u9xyULjmubeOzxfZgA6z7aejuv3HuFe+GW6O4X26KMxf3Ww
   Q==;
X-CSE-ConnectionGUID: TKsGX1UVRKSyaojni14RYQ==
X-CSE-MsgGUID: IGQz8Az1S+urdtMzfqcehA==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70565275"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="70565275"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 13:07:37 -0800
X-CSE-ConnectionGUID: 0xe3bUPNTvGFZl2Xwq1W7w==
X-CSE-MsgGUID: y1O8yRS6TIGP/fXTAniu1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="237978417"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jan 2026 13:07:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjkqz-00000000VXm-342X;
	Sat, 24 Jan 2026 21:07:33 +0000
Date: Sun, 25 Jan 2026 05:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] ACPI: OSL: Panic when encountering a fatal ACPI error
Message-ID: <202601250430.zebPNFK2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/acpi/osl.c:75:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260124021859.8337-1-W_Armin@gmx.de>
References: <20260124021859.8337-1-W_Armin@gmx.de>
TO: Armin Wolf <W_Armin@gmx.de>
TO: rafael@kernel.org
TO: lenb@kernel.org
CC: linux-acpi@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Armin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge linus/master v6.19-rc6 next-20260123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Armin-Wolf/ACPI-OSL-Panic-when-encountering-a-fatal-ACPI-error/20260124-102043
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20260124021859.8337-1-W_Armin%40gmx.de
patch subject: [PATCH] ACPI: OSL: Panic when encountering a fatal ACPI error
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-123-20260124 (https://download.01.org/0day-ci/archive/20260125/202601250430.zebPNFK2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601250430.zebPNFK2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601250430.zebPNFK2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/osl.c:75:1: sparse: sparse: bad integer constant expression
   drivers/acpi/osl.c:75:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/acpi/osl.c:76:1: sparse: sparse: bad integer constant expression
   drivers/acpi/osl.c:76:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"

vim +75 drivers/acpi/osl.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  73  
923740f040eb19 Armin Wolf     2026-01-24  74  static bool panic_on_fatal = CONFIG_ACPI_PANIC_ON_FATAL;
923740f040eb19 Armin Wolf     2026-01-24 @75  module_param(panic_on_fatal, bool, 0);
923740f040eb19 Armin Wolf     2026-01-24  76  MODULE_PARM_DESC(panic_on_fatal, "Trigger a kernel panic when encountering a fatal ACPI error");
923740f040eb19 Armin Wolf     2026-01-24  77  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
