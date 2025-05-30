Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD8C28B4FE
	for <oe-kbuild@lists.linux.dev>; Fri, 30 May 2025 22:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748644869; cv=none; b=ONw+F8x97dWicf/NWhVHW2QMtALAZqzjs05DBuTPydAsmQ4md+p/TCX/Mdz8TIbxEeXBq1RiZZXHitcI3mKuqV6X6TPmy70oWZ2JOp3L/lk5yfT3MfyISu/QtzGyeMfktspmdHxz4re4mQCtEg/G7YF+fa+oPrOqfdnNloWxktQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748644869; c=relaxed/simple;
	bh=Fm/ymYnTRHtxaHjFGBU71ygjy/zY9EgieUtJQdOfUxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VYdXn/ULi1RC78MOMnAFp/8IFG6pDHg+lKSe5uQIIPzYSTzKa49zr5eHZ3nyHQAZUzk6qQ22kRT9qQqLTkIQG/2gFlS4rGbsLaM49KFNN1J91E2mAGdVak9BAKH6WducNZM2FcaREJN7luWkM8IDtVPVLcco8NcSklHU2LIZY7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fPp5F80e; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fPp5F80e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748644867; x=1780180867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fm/ymYnTRHtxaHjFGBU71ygjy/zY9EgieUtJQdOfUxc=;
  b=fPp5F80es6ehwuA54J+cwvnwH1Rm1xab6bsAyfauT/xNxI7GseNFbqFr
   3wE57MvKbQw112j0qhUm8xGDbLa3/3gkCEnQUCnMMOAIcUTkwWjAtZKyl
   I0Qfw11kI1MUhyOxUjlDmW2VFgcnvgFRLjdzZxkg6r2cmdsINopORnU3h
   sg3JW26ciszq3ZBifPlmZtNT+OgiJlT7aZmAdYGqgH9re6vXfKZtO95eI
   TaYgAVeIxHAZQA0dhmRi1aW5C67XrPEroiMPqDHtpkvsLv1V6ZOscyr4q
   MvsIjmW0xwSCx4fqy9whDcyVJFn8EL4/5p6oPXyyc+9EtNvtvfVBMPlod
   Q==;
X-CSE-ConnectionGUID: bjrf/GIrQf2t9GpxeCzJyQ==
X-CSE-MsgGUID: BQ9njiSCSNu5mVMlnw27mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="49985398"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="49985398"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 15:41:06 -0700
X-CSE-ConnectionGUID: QGFQSjdmR4S8qwNTgmrcXQ==
X-CSE-MsgGUID: 1fSldAFYRqimCbT9A8v2kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="148861832"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 May 2025 15:41:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL8PO-000Y1M-2T;
	Fri, 30 May 2025 22:41:02 +0000
Date: Sat, 31 May 2025 06:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cbeznea:tests 4/7] drivers/pci/controller/pcie-rzg3s-host.c:1253
 rzg3s_pcie_parse_map_dma_ranges() warn: iterator 'i' not incremented
Message-ID: <202505310603.KZuHDhlm-lkp@intel.com>
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
TO: Claudiu Beznea <claudiu.beznea@tuxon.dev>

tree:   https://github.com/claudiubeznea/linux.git tests
head:   7f5c4d65a0610b7f73e4cdc59cd53ca83927eec1
commit: b957d44a096a484939e32956c27e1dcf4d1fd571 [4/7] PCI: rzg3s-host: Add Initial PCIe Host Driver for Renesas RZ/G3S SoC
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r072-20250530 (https://download.01.org/0day-ci/archive/20250531/202505310603.KZuHDhlm-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505310603.KZuHDhlm-lkp@intel.com/

smatch warnings:
drivers/pci/controller/pcie-rzg3s-host.c:1253 rzg3s_pcie_parse_map_dma_ranges() warn: iterator 'i' not incremented

vim +/i +1253 drivers/pci/controller/pcie-rzg3s-host.c

b957d44a096a48 Claudiu Beznea 2025-03-27  1248  
b957d44a096a48 Claudiu Beznea 2025-03-27  1249  static int rzg3s_pcie_parse_map_dma_ranges(struct rzg3s_pcie_host *host)
b957d44a096a48 Claudiu Beznea 2025-03-27  1250  {
b957d44a096a48 Claudiu Beznea 2025-03-27  1251  	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
b957d44a096a48 Claudiu Beznea 2025-03-27  1252  	struct resource_entry *entry;
b957d44a096a48 Claudiu Beznea 2025-03-27 @1253  	int i = 0, ret;
b957d44a096a48 Claudiu Beznea 2025-03-27  1254  
b957d44a096a48 Claudiu Beznea 2025-03-27  1255  	resource_list_for_each_entry(entry, &bridge->dma_ranges) {
b957d44a096a48 Claudiu Beznea 2025-03-27  1256  		ret = rzg3s_pcie_set_inbound_windows(host, entry, &i);
b957d44a096a48 Claudiu Beznea 2025-03-27  1257  		if (ret)
b957d44a096a48 Claudiu Beznea 2025-03-27  1258  			return ret;
b957d44a096a48 Claudiu Beznea 2025-03-27  1259  	}
b957d44a096a48 Claudiu Beznea 2025-03-27  1260  
b957d44a096a48 Claudiu Beznea 2025-03-27  1261  	return 0;
b957d44a096a48 Claudiu Beznea 2025-03-27  1262  }
b957d44a096a48 Claudiu Beznea 2025-03-27  1263  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
