Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F3F32939B
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 18:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769539555; cv=none; b=jw6QLeB5WpxRPpeujVPB9svJQDlkBE+cnRfW7vm9mHR9kFFw014rQmSDpPJvnfzztuHXwiNJ+Oeum2xKMVIPuKzEwZwSB1Fgwebo4IdyxT5IojwrSfcV0N50vftAqqP3v7di0KobmzTI07xYb8tpT3YsuzW135fK8Rw+y/jfxlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769539555; c=relaxed/simple;
	bh=/TylhwbAjQLcT3hTXpZS7lcWacX4rFKEx8lJYFLTSKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=icXFwmxC4+NUyK4wpR+cXhjvEb4EdbH/ZUMqaCGG8cATLh7z8A5ykxgbTicm+SFCE/5E3bHHh2xau7UQ2ISXbM1NpdLbFxSdCNnEUSgLd0Mp5LwiY82QIsEEhRB0NlDvcTvDR74iMytnmmirxmW3IJ5T86ccVyI/4TtjDki8sYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nroYTaY3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nroYTaY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769539552; x=1801075552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/TylhwbAjQLcT3hTXpZS7lcWacX4rFKEx8lJYFLTSKQ=;
  b=nroYTaY3N2v5hWIZI3VqFa1yeA3KBrSxtazi6KhsUhs7jlOV6YUYaYvq
   Bvh74tvW2vW7e0MeQiWbZea1IWiOJez5YQXAcQyvDWK9Y3Qyx7iRi02e5
   PykgGD+0c9Q8E52s4wLWzVGC/VyfR+xIlE+jumvPiT2dFXMaaNFZsr6v6
   158ErawxQzEmcZZykpfv4YxHbBe3vESF/ZGOCTF0a41whA5ZgkPJxixNU
   D7KS7BOtMYCFw8c8NUAVaRTcKL7qNBdiI6e6adOstIZh3WqSBWg29K4FI
   1s+/NFPUU7rvBjoCelKzauOKC/VGROAYop+aN28Z7UoWRnu5qSR72Biik
   w==;
X-CSE-ConnectionGUID: Ujw8ehA6TAOnjp5/ZLOmww==
X-CSE-MsgGUID: uEukW5X/QoSaD2KItifTPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70788054"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70788054"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 10:45:52 -0800
X-CSE-ConnectionGUID: EoojF2qZTDCX/epjGwJgsw==
X-CSE-MsgGUID: i+LeEOVCSFeZjuGX/bRs/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="213021961"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Jan 2026 10:45:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vko4S-00000000Yqy-1tLX;
	Tue, 27 Jan 2026 18:45:48 +0000
Date: Wed, 28 Jan 2026 02:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/3] dma: amlogic: Add general DMA driver for A9
Message-ID: <202601280238.FBRrlnUB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/dma/amlogic-dma.c:561:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260127-amlogic-dma-v2-2-4525d327d74d@amlogic.com>
References: <20260127-amlogic-dma-v2-2-4525d327d74d@amlogic.com>
TO: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
TO: Vinod Koul <vkoul@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Kees Cook <kees@kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: linux-amlogic@lists.infradead.org
CC: dmaengine@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-hardening@vger.kernel.org
CC: Xianwei Zhao <xianwei.zhao@amlogic.com>

Hi Xianwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3c8a86ed002ab8fb287ee4ec92f0fd6ac5b291d2]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-dma-Add-Amlogic-A9-SoC-DMA/20260127-113039
base:   3c8a86ed002ab8fb287ee4ec92f0fd6ac5b291d2
patch link:    https://lore.kernel.org/r/20260127-amlogic-dma-v2-2-4525d327d74d%40amlogic.com
patch subject: [PATCH v2 2/3] dma: amlogic: Add general DMA driver for A9
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: sparc-randconfig-r134-20260127 (https://download.01.org/0day-ci/archive/20260128/202601280238.FBRrlnUB-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280238.FBRrlnUB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601280238.FBRrlnUB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/amlogic-dma.c:561:1: sparse: sparse: bad integer constant expression
   drivers/dma/amlogic-dma.c:561:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/dma/amlogic-dma.c:562:1: sparse: sparse: bad integer constant expression
   drivers/dma/amlogic-dma.c:562:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/dma/amlogic-dma.c:563:1: sparse: sparse: bad integer constant expression
   drivers/dma/amlogic-dma.c:563:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +561 drivers/dma/amlogic-dma.c

380facdecb2d4b Xianwei Zhao 2026-01-27  560  
380facdecb2d4b Xianwei Zhao 2026-01-27 @561  MODULE_DESCRIPTION("GENERAL DMA driver for Amlogic");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
