Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9783AFD16
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 10:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786962695; cv=none; b=aKWFu0AU0W3LDWP/Qz9putPKqYNbvR7F8hd1fS9nHK3+82SvmoDZTARFcyr4XRB5cdrX7FS7aI6puTKuMXzH+dxfdARim1D68bOI5ZlQizib3HJLrordYvn2nmgUieF5FQQZCEkRy6nAHUgV8vl4nytl2YanB0EUxUWDtpWmLj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786962695; c=relaxed/simple;
	bh=Gi17D6rCYhfeBNuLH+I7sOZ8IT3MzTVhQE/UbKi4Y3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hzHao+ICuKRFOoJ+isZ8SpEaC066ENQU6jILXFK/v5+eIBurSHqmrm5PCjYihWAQSTP+A+rXBoPYjFf6AMvFLViAWoT5pQ41OXTzPdWZZ8drg2+P+s9jQl2ug7Rw/MneRGUslLYWF7IdGo2pMkqZ0nVnzP5FHhxQztRlK0+Meew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hj7YcyT0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hj7YcyT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786962694; x=1818498694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gi17D6rCYhfeBNuLH+I7sOZ8IT3MzTVhQE/UbKi4Y3E=;
  b=Hj7YcyT00C8WdLNnUkbJwIMVtJIR3ZsARjFQRZUQ15sP4zdrt0nDAVjt
   DROY8DMGttDFZGo7dpIoDJqpReSq7llXw7huZvx0giGzz5if7gLCnVbgv
   K3DA4Zr9sO1zv425dQbGWSp6eif2kzRt3vfQzunaYaAEY7rgbMyvvbNuS
   Wf23YIf8PZpbIQplPmwh8S7FVKRqS5m+ZUcH8SCdtB5/O4jrFTYwdlTi8
   Q4ICMJ6YSxkmU4I6HfhtNKOMGK6sQ1+F62c3hltCuyK3Y8PJ0Z0IH/k41
   KA3+zKr6WGhbtUZS3a2W6juL9lAeanmM9F84z/J9intPWpnzysD07zwaM
   w==;
X-CSE-ConnectionGUID: 9GvE+eBzRfCI3DWSj60eEQ==
X-CSE-MsgGUID: Udjzuyc8Q5yyY1Rr2HHrrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87195551"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="87195551"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 03:31:33 -0700
X-CSE-ConnectionGUID: 95AhUZhiSkuOB3GEPYU6xQ==
X-CSE-MsgGUID: WG/2VGsXQduoeragqKSbog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="262258103"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 17 Aug 2026 03:31:31 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvucr-000000006mz-0Erh;
	Mon, 17 Aug 2026 10:31:29 +0000
Date: Mon, 17 Aug 2026 12:30:51 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] vfio: selftests: Fix out-of-tree build with make O=
Message-ID: <202608171225.NJO5REjA-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <0-v1-79f29139180b+8e-vfio_st_make_o_jgg@nvidia.com>
References: <0-v1-79f29139180b+8e-vfio_st_make_o_jgg@nvidia.com>
TO: Jason Gunthorpe <jgg@nvidia.com>
TO: Alex Williamson <alex@shazbot.org>
TO: kvm@vger.kernel.org
TO: linux-kselftest@vger.kernel.org
TO: Shuah Khan <skhan@linuxfoundation.org>
CC: David Matlack <dmatlack@google.com>
CC: patches@lists.linux.dev

Hi Jason,

kernel test robot noticed the following build errors:

[auto build test ERROR on 681b35420592a2e072d9759254185e72d2e914c8]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Gunthorpe/vfio-selftests-Fix-out-of-tree-build-with-make-O/20260813-191912
base:   681b35420592a2e072d9759254185e72d2e914c8
patch link:    https://lore.kernel.org/r/0-v1-79f29139180b%2B8e-vfio_st_make_o_jgg%40nvidia.com
patch subject: [PATCH] vfio: selftests: Fix out-of-tree build with make O=
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260817/202608171225.NJO5REjA-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171225.NJO5REjA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608171225.NJO5REjA-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[1]: *** [../../lib.mk:225: tools/testing/selftests/drivers/net/psp_responder] Error 1
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** [Makefile:124: tools/testing/selftests/hid/host-tools/sbin/bpftool] Error 2
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** No targets.  Stop.
   make[1]: *** [../lib.mk:225: tools/testing/selftests/net/busy_poller] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/net/tun] Error 1
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** No targets specified and no makefile found.  Stop.
   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.
>> make[1]: *** No rule to make target 'vfio_dma_mapping_test(OUTPUT)/%.o', needed by 'tools/testing/selftests/vfio/vfio_dma_mapping_test'.
>> make[1]: *** No rule to make target 'vfio_dma_mapping_mmio_test(OUTPUT)/%.o', needed by 'tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test'.
>> make[1]: *** No rule to make target 'vfio_iommufd_setup_test(OUTPUT)/%.o', needed by 'tools/testing/selftests/vfio/vfio_iommufd_setup_test'.
>> make[1]: *** No rule to make target 'vfio_pci_device_test(OUTPUT)/%.o', needed by 'tools/testing/selftests/vfio/vfio_pci_device_test'.
>> make[1]: *** No rule to make target 'vfio_pci_device_init_perf_test(OUTPUT)/%.o', needed by 'tools/testing/selftests/vfio/vfio_pci_device_init_perf_test'.
>> make[1]: *** No rule to make target 'vfio_pci_driver_test(OUTPUT)/%.o', needed by 'tools/testing/selftests/vfio/vfio_pci_driver_test'.
   make[1]: Target 'all' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
