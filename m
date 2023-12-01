Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC30D11716
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 08:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gAXU+rg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701418525; x=1732954525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qwCbErxI/vXA91vtCKRVCXGUkpmfnSWn9JaWmkKvgR0=;
  b=gAXU+rg0jPE5O9Is0HBWtlJAvNyB4Hrjy0DLUJBKA1di40MEN4Pgo6m+
   I0kNp8wimj/J1mJrpdYaLK0jGNv0AabD/YJJNGhLnpbGW/wu+nhst2sjm
   hCQ3yZZkllUaiXAyCrrMU7bapQZky8RzN5e+buvOrb7C1FgLbZieo/1Nd
   g1vNpaRpG4pxmjYzLTIpZsvHGPmQYtUpEPVljjk7fp4lYiFGmzwXWujD6
   xCITNS4lgwnD6shCb1CuiNSXz1+9xvxZNYVSLd8IyVwEWehYOs2c4dhaY
   6rcmYd5yAuBUjqNCGqAbDwkGdiFtxD58TOD8/idGQpepzear1226xvGi/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="6703264"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="6703264"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 00:15:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="1016952115"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="1016952115"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2023 00:15:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8yg1-0003JE-0O;
	Fri, 01 Dec 2023 08:15:09 +0000
Date: Fri, 1 Dec 2023 16:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC KERNEL PATCH v2 3/3] xen/privcmd: Add new syscall to get
 gsi from irq
Message-ID: <202312011652.YwfS8NBH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231124103123.3263471-4-Jiqian.Chen@amd.com>
References: <20231124103123.3263471-4-Jiqian.Chen@amd.com>
TO: Jiqian Chen <Jiqian.Chen@amd.com>

Hi Jiqian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.7-rc1]
[cannot apply to xen-tip/linux-next tip/irq/core tip/x86/core linus/master v6.7-rc2 next-20231201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiqian-Chen/xen-pci-Add-xen_reset_device_state-function/20231124-183607
base:   v6.7-rc1
patch link:    https://lore.kernel.org/r/20231124103123.3263471-4-Jiqian.Chen%40amd.com
patch subject: [RFC KERNEL PATCH v2 3/3] xen/privcmd: Add new syscall to get gsi from irq
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312011652.YwfS8NBH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312011652.YwfS8NBH-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/xen/privcmd.c: xen/events.h is included more than once.

vim +38 drivers/xen/privcmd.c

    36	
    37	#include <xen/xen.h>
  > 38	#include <xen/events.h>
    39	#include <xen/privcmd.h>
    40	#include <xen/interface/xen.h>
    41	#include <xen/interface/memory.h>
    42	#include <xen/interface/hvm/dm_op.h>
    43	#include <xen/interface/hvm/ioreq.h>
    44	#include <xen/features.h>
    45	#include <xen/page.h>
    46	#include <xen/xen-ops.h>
    47	#include <xen/balloon.h>
  > 48	#include <xen/events.h>
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
