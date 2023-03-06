Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568D97E
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Mar 2023 10:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678097219; x=1709633219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wRxwIywQg6a7q3mOZ2Ui8dx285Dz2gvR3IXm0WsCJpU=;
  b=m20Cisle52K0ELClN6iVfnjHGE1xKmczn1cW6s/LsS5bi4v4YMSCXPnT
   SVBRRAMWnn+YbU69Rkhb9HA8XE1oA2+t2lK9gEdVpBH070V7Rq70C98aQ
   F8C4Z04eWK2YIVUXxCH+zXpL+fLDOtoPpQQOfGAlkGf3bzGmfBzMjPjCy
   Q5tP+ngEYg2vF6ak7OS0esIBc2dHdVThWM1x8KGTL+AiXE7mTzMOEJYFW
   DFTRSAA4ugSyEQE+YV0k1VsgM5B9UI/41NzhjOTyordyqowlFhGePC91A
   KGV8DQD/LWfGrJqRVvwivzfy6yq4NCQ535AtM5HB8pjYOCbxl+iFvidbK
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="337034711"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="337034711"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 02:06:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="786162295"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="786162295"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2023 02:06:57 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ7k9-0000ER-1M;
	Mon, 06 Mar 2023 10:06:57 +0000
Date: Mon, 6 Mar 2023 18:06:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/pci/pcie/portdrv.c:753:51: warning: Operator '|' with one
 operand equal to zero is redundant. [badBitmaskCheck]
Message-ID: <202303061820.2Latimfv-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Bjorn Helgaas <helgaas@kernel.org>
CC: Christoph Hellwig <hch@lst.de>
CC: Keith Busch <kbusch@kernel.org>

Hi Bjorn,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
commit: a1ccd3d911382f68753033c6adcf69663c2a9fc5 PCI/portdrv: Squash into portdrv.c
date:   4 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 months ago
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a1ccd3d911382f68753033c6adcf69663c2a9fc5
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303061820.2Latimfv-lkp@intel.com/

cppcheck warnings: (new ones prefixed by >>)
>> drivers/tty/serial/pch_uart.c:1464:16: warning: Local variable 'tmout' shadows outer variable [shadowVariable]
     unsigned int tmout;
                  ^
   drivers/tty/serial/pch_uart.c:1449:23: note: Shadowed declaration
    unsigned int status, tmout = 10000;
                         ^
   drivers/tty/serial/pch_uart.c:1464:16: note: Shadow variable
     unsigned int tmout;
                  ^
--

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pci/pcie/portdrv.c:753:51: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
    { PCI_DEVICE_CLASS(((PCI_CLASS_SYSTEM_RCEC << 8) | 0x00), ~0) },
                                                     ^
>> drivers/usb/core/usb-acpi.c:175:24: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
     port_dev->location = USB_ACPI_LOCATION_VALID
                          ^
>> drivers/usb/core/usb-acpi.c:175:24: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
     port_dev->location = USB_ACPI_LOCATION_VALID
                          ^
--
>> net/core/sock.c:630:6: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]
    ret = -EPERM;
        ^
   net/core/sock.c:625:10: note: ret is initialized
    int ret = -ENOPROTOOPT;
            ^
   net/core/sock.c:630:6: note: ret is overwritten
    ret = -EPERM;
        ^
   net/core/sock.c:675:6: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]
    ret = -EINVAL;
        ^
   net/core/sock.c:669:10: note: ret is initialized
    int ret = -ENOPROTOOPT;
            ^
   net/core/sock.c:675:6: note: ret is overwritten
    ret = -EINVAL;
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
https://github.com/intel/lkp-tests
