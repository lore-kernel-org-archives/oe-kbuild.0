Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B270B1108
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Oct 2023 10:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtW0VuNa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697970893; x=1729506893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G02dvy0i7IX/dEAJqQCYntrXstl4WFlwbzIkVCe/LtE=;
  b=PtW0VuNajgAKREg5/62vgi9my2Kkh/eq41ttL0RDWy/VP7tT+pXeLvLu
   DR4sMSkCpGPYQRpE7l3anCiI/xdc3vV2FOXYLI5B/WH/c8gpnIPbUjIpa
   fGfIRykAXC3dwBrV6fKKrtnaNmxfWuXmab6A7le55D8KGbnLNrJ4Ge0SI
   YxyHkOxTOwctNDv70EUAe+pyDjBSsc21ONn799qmVEudeby3oF9bOpzyd
   Ew3krjrWGnI26j0N4k40eyINCoXqgiPORg0RctQm7CNFLrsYq4CS3BNG3
   RG4Fwcl5vK+JD4csTnutxIwnlfobpN+aJEGL0cdNE457osoC4xr2WmPvw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="383895470"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="383895470"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 03:34:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="707652755"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="707652755"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Oct 2023 03:34:51 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quVnE-0005qA-3B;
	Sun, 22 Oct 2023 10:34:48 +0000
Date: Sun, 22 Oct 2023 18:34:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] PCI: pciehp: Prevent child devices from doing RPM on
 PCIe Link Down
Message-ID: <202310221806.gdrl0tU9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231016040132.23824-1-kai.heng.feng@canonical.com>
References: <20231016040132.23824-1-kai.heng.feng@canonical.com>
TO: "Kai-Heng Feng" <kai.heng.feng@canonical.com>
TO: bhelgaas@google.com
CC: linux-pm@vger.kernel.org
CC: linux-mmc@vger.kernel.org
CC: "Kai-Heng Feng" <kai.heng.feng@canonical.com>
CC: Ricky Wu <ricky_wu@realtek.com>
CC: Kees Cook <keescook@chromium.org>
CC: Tony Luck <tony.luck@intel.com>
CC: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC: Lukas Wunner <lukas@wunner.de>
CC: linux-pci@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-hardening@vger.kernel.org
CC: bpf@vger.kernel.org

Hi Kai-Heng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kai-Heng-Feng/PCI-pciehp-Prevent-child-devices-from-doing-RPM-on-PCIe-Link-Down/20231017-142208
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20231016040132.23824-1-kai.heng.feng%40canonical.com
patch subject: [PATCH] PCI: pciehp: Prevent child devices from doing RPM on PCIe Link Down
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-005-20231022 (https://download.01.org/0day-ci/archive/20231022/202310221806.gdrl0tU9-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310221806.gdrl0tU9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310221806.gdrl0tU9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/hotplug/pciehp_pci.c:25:5: warning: no previous declaration for 'pci_dev_disconnect' [-Wmissing-declarations]
    int pci_dev_disconnect(struct pci_dev *pdev, void *unused)
        ^~~~~~~~~~~~~~~~~~


vim +/pci_dev_disconnect +25 drivers/pci/hotplug/pciehp_pci.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  24  
2bd1cb5c4e67115 Kai-Heng Feng  2023-10-16 @25  int pci_dev_disconnect(struct pci_dev *pdev, void *unused)
2bd1cb5c4e67115 Kai-Heng Feng  2023-10-16  26  {
2bd1cb5c4e67115 Kai-Heng Feng  2023-10-16  27  	pm_runtime_barrier(&pdev->dev);
2bd1cb5c4e67115 Kai-Heng Feng  2023-10-16  28  	pci_dev_set_disconnected(pdev, NULL);
2bd1cb5c4e67115 Kai-Heng Feng  2023-10-16  29  
2bd1cb5c4e67115 Kai-Heng Feng  2023-10-16  30  	return 0;
2bd1cb5c4e67115 Kai-Heng Feng  2023-10-16  31  }
2bd1cb5c4e67115 Kai-Heng Feng  2023-10-16  32  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
