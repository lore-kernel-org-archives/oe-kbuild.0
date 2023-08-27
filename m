Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FEE11184
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Aug 2023 17:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693156079; x=1724692079;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UX22MMcohuWzQLmYUTR7eVBHKoJj1Eip7YFH8Vyo5ew=;
  b=K9L0thdKBtKBeQCk4T4/r8jtZVHg9RSrRcljYD9rqSCgoNZ9u/2rt/rT
   iNpDFh4gJ0L+bAke3UrdsbY+sSXtAV9+z9nVIFLy4jPfMXJsD3OHLVScy
   kmi4eYjs/vQUmHAhKmJ037dL8wS6Yq+e3f1duGg3KwZBk5d6QteFi3Pac
   ZLMF159/SI/NXh+b3Lk2iBWL8QZCylWXrCIsn0l/zmCVq2qJy1ZWYnG6y
   AlGYJp2+GoBUNj1QV3mahE0nx25OFsR/8666vf9eaxGV7TtInqFo12Ozq
   I1UdH4XWFBrVJ2OqBWwDMOhnC3OLCYI6FUySEREY9tTskvq5Ekq2AR2Ry
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="355291694"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="355291694"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 10:07:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="852557038"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="852557038"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 27 Aug 2023 10:07:58 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaJEz-00061H-1N;
	Sun, 27 Aug 2023 17:07:57 +0000
Date: Mon, 28 Aug 2023 01:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:controller/rcar 11/19] checkpatch:   ERROR:
 "dw_pcie_write_dbi2" [drivers/pci/controller/dwc/pcie-rcar-gen4-host-drv.ko]
 undefined!
Message-ID: <202308280151.X7UDPWtL-lkp@intel.com>
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
:::::: Manual check reason: "checkpatch"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-pci@vger.kernel.org
TO: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
CC: Serge Semin <fancer.lancer@gmail.com>
INFO skip CC for checkpatch warnings

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/rcar
head:   3ef0626cae45defbdb3aee4b034839caceecaaf3
commit: c92ee2295ccfa29887e6438f25564818b4b0c2ef [11/19] PCI: dwc: Expose dw_pcie_write_dbi2() to module
:::::: branch date: 88 minutes ago
:::::: commit date: 88 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280151.X7UDPWtL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308280151.X7UDPWtL-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#14: 
  ERROR: "dw_pcie_write_dbi2" [drivers/pci/controller/dwc/pcie-rcar-gen4-host-drv.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
