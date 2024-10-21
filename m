Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95B41EBFF7
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 17:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729530884; cv=none; b=WDLry1zi8VrxA0QWqRda4w9F6Tae353UWr/QXhzvNgfNYuSphwqJg8rHs6wQCfZsQihyPAfY52ZRg8LvfB1VW9ZG8LAvoahPjyLCehimN7+GK2FZ7PvXNLNuZxh84P3lxcgwgGakWDzQaqSTYFajZpSUphPKdjx3SEYs+Ji1NnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729530884; c=relaxed/simple;
	bh=dXT/T1V93jHVMVVlWXRVhU0xBAXU9p+fhtJ4kYgKB7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X1bm8hVuAiRnTyt2BNxxNAQYq37/SZT1/yL14mCj95FkaMPEwTzFbG+rytD+0me3wO3hoKRFpP+REJYys5i9dPtC2r/qU6dWt+0qG5YmwpBFke+ftiptzhS2oqPudaWEv/BMaigY3YEUkDkaVOSHXQUoWtdX/4ASu37ce//J5uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zvad+45r; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zvad+45r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729530879; x=1761066879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dXT/T1V93jHVMVVlWXRVhU0xBAXU9p+fhtJ4kYgKB7M=;
  b=Zvad+45rt5rfqtXRVAbc+x44brr0P/caOoHiyydeLdt/jD6Fq6KTGHMS
   +WEoi1KAu8lywBaGmqyP/L3OzxNKBV85Pvyf75Z+dZq3pnDraukItVH24
   r1mQEjIz4/BQO2cTZA0MyrslPQCm0G6vgNDRITwvre6hUx82Kj4r4Wy1K
   xQxpgSs5Vq4t+mj3FAi/0occPnU8okX6EkGqMNSKjdv85ADfMZJI+4nj2
   WlEgK16aHJu3Q/4nuNgQVr4V2ePgiUTpn+cU27ePo1Xt9rPXKwrDeypUT
   tK4/yj/A31WiJ7FSIKQQ3i28ZLeOpKo0hC2ujXCpQkiiKDLJqdnL7iD48
   A==;
X-CSE-ConnectionGUID: Q3hAVRYXQumhH/1AMKmZ+Q==
X-CSE-MsgGUID: YMWkaWxPQgqrszWgW7BLnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29190709"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29190709"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 10:14:39 -0700
X-CSE-ConnectionGUID: f8JASXeDRMCtnrKdXTSWWQ==
X-CSE-MsgGUID: Qsnl+mD4TKq+GCYLBlOApg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="84375744"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Oct 2024 10:14:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2vzH-000SRZ-2V;
	Mon, 21 Oct 2024 17:14:35 +0000
Date: Tue, 22 Oct 2024 01:13:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/libstub/x86-stub.c:276 apple_set_os() error:
 uninitialized symbol 'set_os'.
Message-ID: <202410220145.1CWop8WP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Aditya Garg <gargaditya08@live.com>
CC: Ard Biesheuvel <ardb@kernel.org>
CC: Lukas Wunner <lukas@wunner.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   42f7652d3eb527d03665b09edac47f85fb600924
commit: 71e49eccdca6328eecc335ed8f5557bd0ed70fc6 x86/efistub: Call Apple set_os protocol on dual GPU Intel Macs
date:   4 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-r072-20241021 (https://download.01.org/0day-ci/archive/20241022/202410220145.1CWop8WP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410220145.1CWop8WP-lkp@intel.com/

New smatch warnings:
drivers/firmware/efi/libstub/x86-stub.c:276 apple_set_os() error: uninitialized symbol 'set_os'.

Old smatch warnings:
drivers/firmware/efi/libstub/x86-stub.c:190 retrieve_apple_device_properties() error: uninitialized symbol 'p'.
drivers/firmware/efi/libstub/x86-stub.c:190 retrieve_apple_device_properties() error: uninitialized symbol 'p'.
drivers/firmware/efi/libstub/x86-stub.c:208 retrieve_apple_device_properties() error: uninitialized symbol 'new'.
drivers/firmware/efi/libstub/x86-stub.c:208 retrieve_apple_device_properties() error: uninitialized symbol 'new'.
drivers/firmware/efi/libstub/x86-stub.c:384 setup_unaccepted_memory() error: uninitialized symbol 'proto'.

vim +/set_os +276 drivers/firmware/efi/libstub/x86-stub.c

71e49eccdca632 Aditya Garg 2024-06-30  258  
71e49eccdca632 Aditya Garg 2024-06-30  259  static void apple_set_os(void)
71e49eccdca632 Aditya Garg 2024-06-30  260  {
71e49eccdca632 Aditya Garg 2024-06-30  261  	struct {
71e49eccdca632 Aditya Garg 2024-06-30  262  		unsigned long version;
71e49eccdca632 Aditya Garg 2024-06-30  263  		efi_status_t (__efiapi *set_os_version)(const char *);
71e49eccdca632 Aditya Garg 2024-06-30  264  		efi_status_t (__efiapi *set_os_vendor)(const char *);
71e49eccdca632 Aditya Garg 2024-06-30  265  	} *set_os;
71e49eccdca632 Aditya Garg 2024-06-30  266  	efi_status_t status;
71e49eccdca632 Aditya Garg 2024-06-30  267  
71e49eccdca632 Aditya Garg 2024-06-30  268  	if (!efi_is_64bit() || !apple_match_product_name())
71e49eccdca632 Aditya Garg 2024-06-30  269  		return;
71e49eccdca632 Aditya Garg 2024-06-30  270  
71e49eccdca632 Aditya Garg 2024-06-30  271  	status = efi_bs_call(locate_protocol, &APPLE_SET_OS_PROTOCOL_GUID, NULL,
71e49eccdca632 Aditya Garg 2024-06-30  272  			     (void **)&set_os);
71e49eccdca632 Aditya Garg 2024-06-30  273  	if (status != EFI_SUCCESS)
71e49eccdca632 Aditya Garg 2024-06-30  274  		return;
71e49eccdca632 Aditya Garg 2024-06-30  275  
71e49eccdca632 Aditya Garg 2024-06-30 @276  	if (set_os->version >= 2) {
71e49eccdca632 Aditya Garg 2024-06-30  277  		status = set_os->set_os_vendor("Apple Inc.");
71e49eccdca632 Aditya Garg 2024-06-30  278  		if (status != EFI_SUCCESS)
71e49eccdca632 Aditya Garg 2024-06-30  279  			efi_err("Failed to set OS vendor via apple_set_os\n");
71e49eccdca632 Aditya Garg 2024-06-30  280  	}
71e49eccdca632 Aditya Garg 2024-06-30  281  
71e49eccdca632 Aditya Garg 2024-06-30  282  	if (set_os->version > 0) {
71e49eccdca632 Aditya Garg 2024-06-30  283  		/* The version being set doesn't seem to matter */
71e49eccdca632 Aditya Garg 2024-06-30  284  		status = set_os->set_os_version("Mac OS X 10.9");
71e49eccdca632 Aditya Garg 2024-06-30  285  		if (status != EFI_SUCCESS)
71e49eccdca632 Aditya Garg 2024-06-30  286  			efi_err("Failed to set OS version via apple_set_os\n");
71e49eccdca632 Aditya Garg 2024-06-30  287  	}
71e49eccdca632 Aditya Garg 2024-06-30  288  }
71e49eccdca632 Aditya Garg 2024-06-30  289  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
