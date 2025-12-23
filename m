Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0FA339877
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 16:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766508928; cv=none; b=b7lUSrevd6vCtF+tD3TEo3Wk3rmEBwG26wfieoKG5e6gRPaa3wU2nftumygdxnPvYIoBN8grFSsvP3S4zuw83uiMsNyLNIgFkEgsOBtcjcOCJeDVuw8TpwUZI2h3R7nPAZlCtLmxPxZTdXTPb9IFGEXzFxtxlhigKWt9xMzWerI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766508928; c=relaxed/simple;
	bh=2YsOZ77gR9uGKNOdbQW0yezii28xu33EbKnouPdT4J0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IDTO/18CkbDj2h74q7gvUC830Bdd3LfaFoopdwOrvsbfhpyqcNny4M7h2iKLFkVTpbjlBDgSnuiHq6mIeMQHf0knQ60MIfrq/4B2eyqpWd0PlK5ge2PaQ9PUUMSInz6C6+/WnAtfN/NRFkbBI83+Jlsyr25Pf4msXvbeTzXlxB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sd9RFr01; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sd9RFr01"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766508926; x=1798044926;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2YsOZ77gR9uGKNOdbQW0yezii28xu33EbKnouPdT4J0=;
  b=Sd9RFr01WcbgibjCadFZNkHFJhpkYS3fM+1D46WaLRU7DHjh6Rn1cxUt
   P5Ei+MMuLo4HOiGu5lC7DK2uJFMkAVm4yPl7wOafB5PNXXHwKxSKrfEOv
   Z9ZmkEE6r1DKr2d5I/SWVrFNlYqKZQMeHioWJEmKcGfbFUEUJrIxNpcSd
   Cawhagusu3MiY5OH5F2siTDc/8oAetolyKP17T+1b6hG/YXslkf1+yOeu
   0GCd+oiAjtNdB2i1Yau5e67J3ThuxyGoABieC0f7nym6jkI/BqkopmOlp
   F762eyFVCb6lSoPZVS/ibTZ3ZJEpN6HkehjsRc03BHjlMmjetc2crfJKY
   A==;
X-CSE-ConnectionGUID: vtbll+ZQReS4QSkoXkzcAw==
X-CSE-MsgGUID: +iv6ddSoTtOq/lZjSeU/RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68513700"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="68513700"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 08:55:26 -0800
X-CSE-ConnectionGUID: l6HJNFfdR4+yba89WfR1GQ==
X-CSE-MsgGUID: M11xSs30RTeTyoePHimm7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="230482196"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Dec 2025 08:55:25 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY5fO-000000002Az-2enQ;
	Tue, 23 Dec 2025 16:55:22 +0000
Date: Wed, 24 Dec 2025 00:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 02/14] mux: Add driver for Renesas RZ/V2H USB VBENCTL
 VBUS_SEL mux
Message-ID: <202512240028.8tbSKMIV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/mux/rzv2h-usb-vbenctl.c:95:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <0703bf9888c1a259fda505474358ea4b1ac3c7f3.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
References: <0703bf9888c1a259fda505474358ea4b1ac3c7f3.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
TO: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
TO: tomm.merciai@gmail.com
CC: linux-renesas-soc@vger.kernel.org
CC: biju.das.jz@bp.renesas.com
CC: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
CC: Peter Rosin <peda@axentia.se>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: "Uwe Kleine-König" <ukleinek@kernel.org>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: Georgi Djakov <djakov@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-phy@lists.infradead.org

Hi Tommaso,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on geert-renesas-devel/next linus/master v6.19-rc2 next-20251219]
[cannot apply to pza/reset/next pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tommaso-Merciai/dt-bindings-mux-Remove-nodename-pattern-constraints/20251222-215453
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/0703bf9888c1a259fda505474358ea4b1ac3c7f3.1766405010.git.tommaso.merciai.xr%40bp.renesas.com
patch subject: [PATCH v6 02/14] mux: Add driver for Renesas RZ/V2H USB VBENCTL VBUS_SEL mux
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm-randconfig-r113-20251223 (https://download.01.org/0day-ci/archive/20251224/202512240028.8tbSKMIV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240028.8tbSKMIV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512240028.8tbSKMIV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mux/rzv2h-usb-vbenctl.c:95:1: sparse: sparse: bad integer constant expression
   drivers/mux/rzv2h-usb-vbenctl.c:95:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/mux/rzv2h-usb-vbenctl.c:96:1: sparse: sparse: bad integer constant expression
   drivers/mux/rzv2h-usb-vbenctl.c:96:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/mux/rzv2h-usb-vbenctl.c:97:1: sparse: sparse: bad integer constant expression
   drivers/mux/rzv2h-usb-vbenctl.c:97:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/mux/rzv2h-usb-vbenctl.c:97:1: sparse: sparse: bad integer constant expression
   drivers/mux/rzv2h-usb-vbenctl.c:97:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +95 drivers/mux/rzv2h-usb-vbenctl.c

6c1bbbaed2c6763 Tommaso Merciai 2025-12-22  94  
6c1bbbaed2c6763 Tommaso Merciai 2025-12-22 @95  MODULE_DESCRIPTION("RZ/V2H USB VBENCTL VBUS_SEL mux driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
