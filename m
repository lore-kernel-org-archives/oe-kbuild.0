Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B100215198
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Dec 2024 12:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698243; cv=none; b=IERkFtF7Ub8jDbWPk/DchhImEfSFb1gmXgjmbJXBK00TOeairv4kB45nzEQUXKQIbs0trVWKisw24K5XdyiMDFPxXdu+gT0cCuqsnqJh23vEQEiYxBZfTeJPYgcODmkYjr6UIkQdxBmECT6n4vN6CHL1p9l/T8wt6GKdoAwWKaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698243; c=relaxed/simple;
	bh=Oc491TdKZITtjsq+3GyP+SXhPnackPsyEp08UEfmAV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S42/YLLt9rNx8X9adqSKADJFdcFxZ7pfIm+fdrZ4ap5hN9P4+ISar4Xh2dxNnedyUC0ltHy82r5cfyP9OyKUC92SP4p+jtydHI45LKY2UGuPYET/HRS0kGzLKbkbM7u1k+Rk1fkDGT7lo7OfyIJdZwvkDugPYkngH45k7q4gNaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bz7dKyMJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bz7dKyMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734698240; x=1766234240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oc491TdKZITtjsq+3GyP+SXhPnackPsyEp08UEfmAV8=;
  b=bz7dKyMJzRGSOIHCh3MqnIMFV2ahOyN8uTe+vsV7u1gQCfyRrtOTIGbl
   2b97qCYiWQYKJfPLjf5uJXsV0xehR1U6ESL4hSiOMi+IcNvduryRvNtcs
   oq+rlz7+79trbJBSRIojTSFO2vv1WlA7R5VBMhnKvDsogp7/kstmjX87z
   o8S86bTRrjO6GYFsru1z/IfB1Ivhpz8Xu6RGojCGF0xuNbNjYjuYaDLzg
   3ojC49s82IvjmtvxJm4pC1m5QIbVHtiS4b+id0aE1HT+F/5iMwLFGC6Bf
   bXGBmxykcwU/XIhTrqrAADynuDi91AzC5sKvfmG4Gd9Cbb83MaLNasHa2
   g==;
X-CSE-ConnectionGUID: NY/ca5nGR66TDXGk6p9UWA==
X-CSE-MsgGUID: fpHEQSNrQnGgPGhzx3Aglw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="52650722"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="52650722"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 04:37:20 -0800
X-CSE-ConnectionGUID: bCki59RjTHWzJ5oRUtEBTw==
X-CSE-MsgGUID: FI6jjP4zQxqmUNqTIK9JBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103121748"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Dec 2024 04:37:19 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOcFp-00018n-0D;
	Fri, 20 Dec 2024 12:37:17 +0000
Date: Fri, 20 Dec 2024 20:36:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] xlnx: dt-bindings: xlnx,spdif: Convert to json-schema
Message-ID: <202412202057.aI5V3vMe-lkp@intel.com>
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
In-Reply-To: <20241213165240.3652961-4-vincenzo.frascino@arm.com>
References: <20241213165240.3652961-4-vincenzo.frascino@arm.com>
TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: vincenzo.frascino@arm.com
CC: Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>
CC: Sudeep Holla <sudeep.holla@arm.com>
CC: Rob Herring <robh@kernel.org>

Hi Vincenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on robh/for-next linus/master v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincenzo-Frascino/xlnx-dt-bindings-xlnx-i2s-Convert-to-json-schema/20241214-005636
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20241213165240.3652961-4-vincenzo.frascino%40arm.com
patch subject: [PATCH 3/3] xlnx: dt-bindings: xlnx,spdif: Convert to json-schema
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: csky-randconfig-052-20241220 (https://download.01.org/0day-ci/archive/20241220/202412202057.aI5V3vMe-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412202057.aI5V3vMe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412202057.aI5V3vMe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition
>> Documentation/devicetree/bindings/sound/xlnx,spdif.yaml: xlnx,aud_clk_i: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
