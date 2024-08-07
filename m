Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBA82F3E
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Aug 2024 00:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722990571; cv=none; b=Mv/tdi9V2m+aj5gnARWcUCm3EiqxSKG1IkmuF94GcTnFR5foamaxHAgDjruDeeTSFZk86r+R+80965RE0asORI8A1b6qigT3Ss99mUmmJEYboAUWaa9BRljJPAVpApLrTrCdssUSZ/2PKMBtLmmBJCF9nJCv7KhCA4kQN6hKpTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722990571; c=relaxed/simple;
	bh=i4d26EJhExlf1qUyJIly0lHHDcS8tOnEp53ABmhIF9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HfAcFl4RGNLPacgDySOeyWOI0iGRihTMQd2D+giHZEScX7I7hC2FCUYVE/06TFI9PrxsT6lzrzTt232FtPc6hPHpchVwXP1yyA7wUl3ud2bGDwUc0qjl5RNUgGGqnFkuXh300ajhlIHUKB9DJ+z/EFz4hGe6jPDRHkgoyYwx+6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrR+bH+Z; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrR+bH+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722990570; x=1754526570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i4d26EJhExlf1qUyJIly0lHHDcS8tOnEp53ABmhIF9g=;
  b=jrR+bH+Z5sz/+RCHZteao2gxfkGwc5YAm8zc+ZdQDZpztph3SZk1qYow
   g3Dsa5DQeK8ITEnVKVp4FNOl9XF6YtKRxiRZ13nddtr5kBJBUR/kvCX1X
   r3YOX5gAqyQlRzJoKLIfEmYUhRWdzHbPZkU5MejWafDatPZRMcSJGXkt8
   c8uMjeoYIE/OOHkXO4KmlSIsvsnL8XCGWrVmqVGlsMQpRDPvqKGqju2Bw
   qtDLFQ0pw6MO/9X4R6W92iiJcIlgELbrz0ywD5UyTDExEXmECHiWCGX57
   vtyw/TDCL18KMLSsEGlsWWlA/PLqq6YbBMYPoMVdl8Gu7BkIsMS7qo0Tf
   A==;
X-CSE-ConnectionGUID: eDDH/UI6SvOa5F6MRNvaXQ==
X-CSE-MsgGUID: tUW0WM+3Q9qOXbuJSV5AhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="38495568"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="38495568"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:29:29 -0700
X-CSE-ConnectionGUID: gp9fblVMQaiqoN9+udEzrw==
X-CSE-MsgGUID: ZjMCIPmtTi+eBQLIAUYWnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="56650243"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 06 Aug 2024 17:29:28 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbUYP-00050e-2y;
	Wed, 07 Aug 2024 00:29:25 +0000
Date: Wed, 7 Aug 2024 08:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/7] dt-bindings: x86: Add ACPI wakeup mailbox
Message-ID: <202408070834.VkZmA2lb-lkp@intel.com>
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
In-Reply-To: <20240806221237.1634126-3-yunhong.jiang@linux.intel.com>
References: <20240806221237.1634126-3-yunhong.jiang@linux.intel.com>
TO: Yunhong Jiang <yunhong.jiang@linux.intel.com>

Hi Yunhong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9ebdc7589cbb5c976e6c8807cbe13f263d70d32c]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunhong-Jiang/x86-acpi-Move-ACPI-MADT-wakeup-to-generic-code/20240807-064329
base:   9ebdc7589cbb5c976e6c8807cbe13f263d70d32c
patch link:    https://lore.kernel.org/r/20240806221237.1634126-3-yunhong.jiang%40linux.intel.com
patch subject: [PATCH 2/7] dt-bindings: x86: Add ACPI wakeup mailbox
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: arc-randconfig-051-20240807 (https://download.01.org/0day-ci/archive/20240807/202408070834.VkZmA2lb-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408070834.VkZmA2lb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408070834.VkZmA2lb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/x86/wakeup.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
