Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73570192
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Oct 2022 05:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667106310; x=1698642310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v4thScGj0w14bT6ELWymKutEcPPcBOkcXJfUn0rlAKs=;
  b=TlS2FzdTw27SoMhYP8gshdBS+iTxmCL/3+txstIQ2bOLK1J9XTZc82y9
   fEJUj17zvV+EGDPYVIpl5CaUG3UcgzSIx33WIMK7KLWANVQs2BvfClu2s
   C5t8EKFifptnenUM97ewIEJ3qWSugfIG8fc+u7KA/NdFVXUXD+ZM6reYI
   Zy5fHZRA+QFlocIwFCasqYN+amF6StSV7sTf/axgAtsEDnmAnAu8Gb7I1
   exJsHYyeGkDHuk2yZad0UUFJKUWZf/CADtLOXslbQWehv4x5E8j3kpoNx
   JFXaW1E3XE67Gg7wvO0dDaMzI1Jh559qCQcps2rqitNyQLPVwjyTyIWCU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="296123456"
X-IronPort-AV: E=Sophos;i="5.95,225,1661842800"; 
   d="scan'208";a="296123456"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2022 22:05:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="702167515"
X-IronPort-AV: E=Sophos;i="5.95,225,1661842800"; 
   d="scan'208";a="702167515"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Oct 2022 22:05:08 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1op0VP-000BfW-39;
	Sun, 30 Oct 2022 05:05:07 +0000
Date: Sun, 30 Oct 2022 13:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2758/4127] drivers/pci/pcie/portdrv.c:753:51:
 warning: Operator '|' with one operand equal to zero is redundant.
 [badBitmaskCheck]
Message-ID: <202210301301.VIocLuzE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/pci/pcie/portdrv.c:753:51: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
CC: Christoph Hellwig <hch@lst.de>
CC: Keith Busch <kbusch@kernel.org>

Hi Bjorn,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fd8dab197cca2746e1fcd399a218eec5164726d4
commit: a1ccd3d911382f68753033c6adcf69663c2a9fc5 [2758/4127] PCI/portdrv: Squash into portdrv.c
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a1ccd3d911382f68753033c6adcf69663c2a9fc5
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pci/pcie/portdrv.c:753:51: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
    { PCI_DEVICE_CLASS(((PCI_CLASS_SYSTEM_RCEC << 8) | 0x00), ~0) },
                                                     ^

vim +753 drivers/pci/pcie/portdrv.c

a1ccd3d911382f Bjorn Helgaas 2022-10-19  743  
a1ccd3d911382f Bjorn Helgaas 2022-10-19  744  /*
a1ccd3d911382f Bjorn Helgaas 2022-10-19  745   * LINUX Device Driver Model
a1ccd3d911382f Bjorn Helgaas 2022-10-19  746   */
a1ccd3d911382f Bjorn Helgaas 2022-10-19  747  static const struct pci_device_id port_pci_ids[] = {
a1ccd3d911382f Bjorn Helgaas 2022-10-19  748  	/* handle any PCI-Express port */
a1ccd3d911382f Bjorn Helgaas 2022-10-19  749  	{ PCI_DEVICE_CLASS(PCI_CLASS_BRIDGE_PCI_NORMAL, ~0) },
a1ccd3d911382f Bjorn Helgaas 2022-10-19  750  	/* subtractive decode PCI-to-PCI bridge, class type is 060401h */
a1ccd3d911382f Bjorn Helgaas 2022-10-19  751  	{ PCI_DEVICE_CLASS(PCI_CLASS_BRIDGE_PCI_SUBTRACTIVE, ~0) },
a1ccd3d911382f Bjorn Helgaas 2022-10-19  752  	/* handle any Root Complex Event Collector */
a1ccd3d911382f Bjorn Helgaas 2022-10-19 @753  	{ PCI_DEVICE_CLASS(((PCI_CLASS_SYSTEM_RCEC << 8) | 0x00), ~0) },
a1ccd3d911382f Bjorn Helgaas 2022-10-19  754  	{ },
a1ccd3d911382f Bjorn Helgaas 2022-10-19  755  };
a1ccd3d911382f Bjorn Helgaas 2022-10-19  756  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
