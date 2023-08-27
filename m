Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C9F11184
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Aug 2023 17:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693156680; x=1724692680;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=n6ooAwxqJJkWrpjrDlbx8MtrP90zkiVEcdfTjrwEYQQ=;
  b=kloGZVaTZm1ZXQD9hx7WzagBJghs1bFzm4Bai+ZoC7q9dsH7aRs5YMkk
   hlmnrjmXR2MIx7h+/NjpNom/jOdRLKKcWWijYxSBgytRxGjUIwEyxjnr+
   RL3gm537uiQg8Qr011boX3D5gewoMsmCxMOy0LbiiOU0RYtoJJ4ErGTE3
   botqTbX+1VmUSYqxQXfv1HvNHgppddPHGhAJtW4cFTx4S89SPAaFeXWE3
   jRT+f2v1s3v/Zu9vXf28U/+jvBJg+gLY2u3wMp+EAOyuanUaPqaPISzru
   mLO8m/Qi/Xc2OanQYAmP6gGuNYmXl1Bf8QOAYPyAKKL7dpFVUdyBnGz8Z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="461325720"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="461325720"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 10:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="731589649"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="731589649"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 27 Aug 2023 10:17:58 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaJOf-00061v-2L;
	Sun, 27 Aug 2023 17:17:57 +0000
Date: Mon, 28 Aug 2023 01:17:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:controller/rcar 14/19] checkpatch: WARNING: added, moved or
 deleted file(s), does MAINTAINERS need updating?
Message-ID: <202308280111.WUbEuR4a-lkp@intel.com>
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
CC: Rob Herring <robh@kernel.org>
CC: Serge Semin <fancer.lancer@gmail.com>
INFO skip CC for checkpatch warnings

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/rcar
head:   3ef0626cae45defbdb3aee4b034839caceecaaf3
commit: 67d2faa7df897116d943e50793a72dbf7c7a24df [14/19] dt-bindings: PCI: renesas: Add R-Car Gen4 PCIe Host
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280111.WUbEuR4a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308280111.WUbEuR4a-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#22: 
new file mode 100644

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
