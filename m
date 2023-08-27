Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91717EE
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Aug 2023 16:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693155480; x=1724691480;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TLy5FqO2y1f/YsOcN12XVhnbZTfgEpMu9aYV+9ltJBE=;
  b=gPc/C7jrtW8FFj5TI0tuvhUggxhtvyFkcuvb7BjDfWqpsiTEpIDc9TO6
   aoyDr/LQ28w0Uob/4OFopJxuMn/cmPXa/VhhEq9G02g+uBVYCw96IZc8s
   KTw/ERWeXlLOCEu5UQ+w90reKTC+xXEjjldSX7xs0U/HwgtzgNpWoCDps
   RHRP5PYjdVpkAUW2XE7H7/mtdogfRV06YRHti5KwAiazDIAoTIjHyzh37
   L8B5wf1TN8G4App06HPPnrYUAe4W505L6FrzgoAA/p8errX0erRYsq/WF
   USG4U5jQEMUtCZzfoPrL3T+0rDIk/mIubtOFgjI9OKh6SBQBLQhfp5Css
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="461323927"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="461323927"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 09:57:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="773020278"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="773020278"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 27 Aug 2023 09:57:58 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaJ5J-000611-0y;
	Sun, 27 Aug 2023 16:57:57 +0000
Date: Mon, 28 Aug 2023 00:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:controller/rcar 7/19] checkpatch: WARNING: Possible unwrapped
 commit description (prefer a maximum 75 chars per line)
Message-ID: <202308280007.fAXTVebR-lkp@intel.com>
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
commit: 7e6bca2ec8c4183170a2419b42f4ac649903f9ba [7/19] PCI: dwc: Add missing PCI_EXP_LNKCAP_MLW handling
:::::: branch date: 75 minutes ago
:::::: commit date: 75 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280007.fAXTVebR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308280007.fAXTVebR-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#28: 
[X+1] DesignWare Cores PCI Express Controller Databook - DWC PCIe Root Port,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
