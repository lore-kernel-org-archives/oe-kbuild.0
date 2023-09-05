Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4FF20EC
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Sep 2023 08:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693901139; x=1725437139;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=d0E1jEPeOwvGQVw8MpTzTAE1XKvRDvUgxa/Pa8nhRoA=;
  b=jeVBPW8p669CIjQG/wcEqKWoMeAzGP5C2r9Pvb82/JyRIiAKjHa5S74K
   5oOO3VMTvc8434beb6sFrD98foRmU5Aa767C8Ip40Ofx7+ul/mRQRBfFo
   23ei4I8K0Lw4UBdPiZO/77Hc0awhlUHHzJ6OCQh6EPW34+nIZfMAjXTVq
   0pBrclI7pSxclB9DNslBbo3zKgSaNiDNEZoja+oWH//HM9EoZQzRFFjhq
   tLtu06v3YuG+Hle7yFTzqo/ipDPP/3E414/AYMRzopcirF9z4/J8m1G1C
   UUCf9sdPj+vaS44VeerEH38mAFHrRW0oSqed8d3GqUeVOhUrfuf2hM1IH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="356229159"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="356229159"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 01:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="806517076"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="806517076"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 05 Sep 2023 01:04:53 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdR3L-0001Pv-1y;
	Tue, 05 Sep 2023 08:04:51 +0000
Date: Tue, 5 Sep 2023 16:04:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:controller/rcar 14/19] checkpatch: WARNING: added, moved or
 deleted file(s), does MAINTAINERS need updating?
Message-ID: <202309051539.invJakYd-lkp@intel.com>
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
commit: d828097a0bef346e836430b62aa8d8a9180f9a11 [14/19] dt-bindings: PCI: renesas: Add R-Car Gen4 PCIe Host
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230905/202309051539.invJakYd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309051539.invJakYd-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
