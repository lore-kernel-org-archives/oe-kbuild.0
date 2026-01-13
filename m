Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEEE36A023
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 17:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768325916; cv=none; b=bB3sqUxsRIVKAdX7vF6ETLOsw2qX+QKz1rAx5r210k+iQMaDYghbCHmoXOzroxcFJz6Y6emtfLQabvroyNgVENcgNQ4mVxvtXRW1tFXxAmoOKEcWTENDtpGd26TlyZI+cIZRxOdUOSIYMh2SFqRZE5quL2IHCum+X7PDVrIORJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768325916; c=relaxed/simple;
	bh=ge8HyxvHDVWxgjiSHQ2HPqRHBg4SMUHX7qFO+Wk8y8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DlJhru3+yg3yyLxs8XI0HqnkWrpQG8PiJhYfvJgJs3u+e6XYoQ3OQl6yITQcMehSDSjOeOu1OB5vveb08aK1j5eqpLx0a7soCRnqxL0WSkvR8VJcri4ad3Up+YP6yUZXpetbaE7rWgveHi81YiP58BtIlcK+mowUAMvESP/Jmxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGUrs9I+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGUrs9I+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768325914; x=1799861914;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ge8HyxvHDVWxgjiSHQ2HPqRHBg4SMUHX7qFO+Wk8y8w=;
  b=mGUrs9I+rFiYadiNe2rhy2pshCgMvish6tK+eVgRHiuadncUku+0jK4x
   yte8sT9DLsnPqz+xUxMaf+HzbK+6szdyQocg+/CrDUM5KyzPBCp3cCva9
   VUZeGjFP8b50z7QGAN9gFpmD5x46Kk6BBSJy7HXhNxQ7ri+jSls1xjOlE
   UIhLVMs1tgAgdLE9+7QkNEWVncJG+SlIq0yNK42MnqpwKHm9qTYVuVWC7
   jigDt1jjQqumTDMCy8u8d9vMRyK6hV/SRxz69rvn9a+WDUmulVIz7fuYv
   IfTBtIBjV/anjqVEvNEZ0lhn1//WnO6+nz3UpLbUAzMQdHdxCY9bal+DR
   A==;
X-CSE-ConnectionGUID: h0KWr11xQS6pEzRp/Uv1Dg==
X-CSE-MsgGUID: EyZdureGQ8Kv0P53xn5MgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73474759"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73474759"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 09:38:33 -0800
X-CSE-ConnectionGUID: FUdC15lBS9WR7FvBxrGbBA==
X-CSE-MsgGUID: KxS++qCFRBakgk1ogg+9oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204335543"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jan 2026 09:38:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfiLd-00000000FBA-2mcy;
	Tue, 13 Jan 2026 17:38:29 +0000
Date: Wed, 14 Jan 2026 01:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] PCI: layerscape: Allow to compile as module
Message-ID: <202601140109.TZ328ToM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/pci/controller/dwc/pci-layerscape.c:426:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260112-v6-19-topic-layerscape-pcie-v1-1-1cd863fce50e@pengutronix.de>
References: <20260112-v6-19-topic-layerscape-pcie-v1-1-1cd863fce50e@pengutronix.de>
TO: Steffen Trumtrar <s.trumtrar@pengutronix.de>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Minghuan Lian <minghuan.Lian@nxp.com>
TO: Mingkai Hu <mingkai.hu@nxp.com>
TO: Roy Zang <roy.zang@nxp.com>
TO: Jingoo Han <jingoohan1@gmail.com>
CC: linux-pci@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-arm-kernel@lists.infradead.org
CC: imx@lists.linux.dev
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Steffen Trumtrar <s.trumtrar@pengutronix.de>

Hi Steffen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Steffen-Trumtrar/PCI-layerscape-Allow-to-compile-as-module/20260113-031840
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260112-v6-19-topic-layerscape-pcie-v1-1-1cd863fce50e%40pengutronix.de
patch subject: [PATCH] PCI: layerscape: Allow to compile as module
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-r121-20260113 (https://download.01.org/0day-ci/archive/20260114/202601140109.TZ328ToM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140109.TZ328ToM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601140109.TZ328ToM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/dwc/pci-layerscape.c:426:1: sparse: sparse: bad integer constant expression
   drivers/pci/controller/dwc/pci-layerscape.c:426:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/pci/controller/dwc/pci-layerscape.c:427:1: sparse: sparse: bad integer constant expression
   drivers/pci/controller/dwc/pci-layerscape.c:427:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/pci/controller/dwc/pci-layerscape.c:428:1: sparse: sparse: bad integer constant expression
   drivers/pci/controller/dwc/pci-layerscape.c:428:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/pci/controller/dwc/pci-layerscape.c:428:1: sparse: sparse: bad integer constant expression
   drivers/pci/controller/dwc/pci-layerscape.c:428:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +426 drivers/pci/controller/dwc/pci-layerscape.c

dec661c9cf9ebf Sascha Hauer 2026-01-12  425  
dec661c9cf9ebf Sascha Hauer 2026-01-12 @426  MODULE_AUTHOR("Minghuan Lian <Minghuan.Lian@freescale.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
