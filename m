Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B652311184
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Aug 2023 17:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693156083; x=1724692083;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+ToTR59961YaZn+yGzpBsdOWnGxyR7ycb8BYREjKBm8=;
  b=ftrXHEMSD+aljb9veUVKsjnC9tSforeM3sE0fnN61VOcgZDQPAD5p7XA
   VNe4XBFdcoEVqPOWqFvT//tWaTPDKOqHLIm1+qjhy1mU9Cm/Qc02iNpVk
   YkvEORahFPmsaY5L53+C+h9bpCkP2/roI7CCXCUSSNrFqAzId7XNqwBzt
   /IkDQybzbXQIxXU8FzB6MaTai3UT9vIUH6Dhgw/YYdLj4k5Rc8IenrTek
   BIRoaw05paspw8o7RTJZ7sUym3rdkqjN0r9P84QlG1kFJ46FFRI+NIJct
   RehAWNqYtkNlOpfBgXD5CGjQOkh25GZBl/+gUTSuixiIiK9DK4MHqjrRS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="405953692"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="405953692"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 10:08:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="741127606"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="741127606"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 27 Aug 2023 10:07:58 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaJEz-00061J-1S;
	Sun, 27 Aug 2023 17:07:57 +0000
Date: Mon, 28 Aug 2023 01:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:controller/rcar 10/19] checkpatch:   ERROR: "dw_pcie_ep_exit"
 [drivers/pci/controller/dwc/pcie-rcar-gen4-ep-drv.ko] undefined!
Message-ID: <202308280047.8Za2S3oU-lkp@intel.com>
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
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
INFO skip CC for checkpatch warnings

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/rcar
head:   3ef0626cae45defbdb3aee4b034839caceecaaf3
commit: c8348f4f4463ac063c06bdb8a9d5cd24d2a3147c [10/19] PCI: dwc: Expose dw_pcie_ep_exit() to module
:::::: branch date: 85 minutes ago
:::::: commit date: 85 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280047.8Za2S3oU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308280047.8Za2S3oU-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#14: 
  ERROR: "dw_pcie_ep_exit" [drivers/pci/controller/dwc/pcie-rcar-gen4-ep-drv.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
