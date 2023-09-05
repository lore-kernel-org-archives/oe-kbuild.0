Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FA41FA4
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Sep 2023 08:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693901159; x=1725437159;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=p1IGRqVluxgKUpS/afgR5AMM7zwZMbOub9QeZ6vh48w=;
  b=ZYpRZzzR0f9yX4OQLgfh4Y/LaBQrf6QvUKtXtXxMXa/qILTHgPUiREaN
   rsGI6EQ1RC1SKr5QFyd2mj+v+uHMde4CTgli4AdwUh/quczvCpa0STnc3
   JkVwNa7gnSu+j1YgaoMOYO7LkBjMIoMzT6S5IjGqEUGG9a98Ukjhzk7T8
   9k2KfHEhxqfq4JxujOIatjM50h8lKIkiKFn2tjoBvajf7GpYAuzVkvuAj
   WiCelXb9JsLdeYEo+kKZgyi7PIFwtpxX15WSE2o/G/6HLdgjjBRml6OKf
   QhUZUx+lD54WKp0f8My/4oIDrlnWUdKkr1YPauPvt8g5vgHP+ZTkt1Pvy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="380536004"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="380536004"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 01:05:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="831168022"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="831168022"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Sep 2023 01:05:57 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdR4L-0001Q9-0p;
	Tue, 05 Sep 2023 08:05:54 +0000
Date: Tue, 5 Sep 2023 16:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:controller/rcar 15/19] checkpatch: WARNING: added, moved or
 deleted file(s), does MAINTAINERS need updating?
Message-ID: <202309051659.Dk2wXgPO-lkp@intel.com>
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
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Rob Herring <robh@kernel.org>
CC: Serge Semin <fancer.lancer@gmail.com>
INFO skip CC for checkpatch warnings

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/rcar
head:   7af65c1120567de8624e021d798438252cbde876
commit: c1ff8c2d1a8c0b5f1a68d79c72ab767e9971ada7 [15/19] dt-bindings: PCI: renesas: Add R-Car Gen4 PCIe Endpoint
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230905/202309051659.Dk2wXgPO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309051659.Dk2wXgPO-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
new file mode 100644

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
