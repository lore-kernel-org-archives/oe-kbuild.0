Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB913220
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Feb 2023 12:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675687078; x=1707223078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=inz5P/WtzxUh2bmwnSNy4e1Lk8Kq86CYjLeDnbXnqbU=;
  b=E5G/DTAVonQOQyKcOIJZGqf+spa/EKdP7aCT0amDXiKIIpeowyx/iVtJ
   Wog5QHq5vJu3/wqXp2SH9KVaz93T7099dJnfZQx6sHVOdq4rq3kliY7NU
   gCjl/r0s4YWts2TaPSlikNcXjl/EwQtEC9E/QGenHCyTdBBhYIebCoGr2
   GoRXKobZtnGeKvPo+SFL8DgxMgENXh+K/YP8ajkyySv2+qXtkk99uco0q
   +aq1lLXBOsoDGaC6AUFqXNFRfFvwr2ToNmrsPYWtE+2jRgDKArCtOlrB1
   atcWnZn6t1utrK2rEqFSfcKgo9NLKdBPEP3LU1XkU3aSQfniiUG95JINA
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="393793039"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="393793039"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 04:37:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="809113256"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="809113256"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2023 04:37:56 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP0kt-0002Xg-2y;
	Mon, 06 Feb 2023 12:37:55 +0000
Date: Mon, 6 Feb 2023 20:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/isdn/hardware/mISDN/hfcmulti.c:452:22: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202302062047.JnENgnPh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "drivers/isdn/hardware/mISDN/hfcmulti.c: fbc_errors <19> is not larger than parent_errors <19>"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2d11f342b179f1894a901f143ec7c008caba43e
commit: 15104de122a4f0258981b06ed94cf616a6eb03ef x86: Adjust types used in port I/O helpers
date:   10 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-s043-20230206 (https://download.01.org/0day-ci/archive/20230206/202302062047.JnENgnPh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=15104de122a4f0258981b06ed94cf616a6eb03ef
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 15104de122a4f0258981b06ed94cf616a6eb03ef
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/isdn/hardware/mISDN/ samples/ftrace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/isdn/hardware/mISDN/hfcmulti.c:452:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/isdn/hardware/mISDN/hfcmulti.c:452:22: sparse:     expected unsigned int [usertype] value
   drivers/isdn/hardware/mISDN/hfcmulti.c:452:22: sparse:     got restricted __le32 [usertype]
>> drivers/isdn/hardware/mISDN/hfcmulti.c:457:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/isdn/hardware/mISDN/hfcmulti.c:457:22: sparse:     expected unsigned short [usertype] value
   drivers/isdn/hardware/mISDN/hfcmulti.c:457:22: sparse:     got restricted __le16 [usertype]
   drivers/isdn/hardware/mISDN/hfcmulti.c:472:24: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __le32 [usertype] @@
   drivers/isdn/hardware/mISDN/hfcmulti.c:472:24: sparse:     expected unsigned int val
   drivers/isdn/hardware/mISDN/hfcmulti.c:472:24: sparse:     got restricted __le32 [usertype]
   drivers/isdn/hardware/mISDN/hfcmulti.c:478:24: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short val @@     got restricted __le16 [usertype] @@
   drivers/isdn/hardware/mISDN/hfcmulti.c:478:24: sparse:     expected unsigned short val
   drivers/isdn/hardware/mISDN/hfcmulti.c:478:24: sparse:     got restricted __le16 [usertype]
   drivers/isdn/hardware/mISDN/hfcmulti.c:496:32: sparse: sparse: cast to restricted __le32
   drivers/isdn/hardware/mISDN/hfcmulti.c:501:32: sparse: sparse: cast to restricted __le16
   drivers/isdn/hardware/mISDN/hfcmulti.c:518:25: sparse: sparse: cast to restricted __le32
   drivers/isdn/hardware/mISDN/hfcmulti.c:524:25: sparse: sparse: cast to restricted __le16
   drivers/isdn/hardware/mISDN/hfcmulti.c:1092:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/hfcmulti.c:1092:26: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/isdn/hardware/mISDN/hfcmulti.c:1092:26: sparse:     got void *

vim +452 drivers/isdn/hardware/mISDN/hfcmulti.c

af69fb3a8ffa37 Karsten Keil 2008-07-27  445  
af69fb3a8ffa37 Karsten Keil 2008-07-27  446  /* write fifo data (REGIO) */
5b8343540a3d27 Hannes Eder  2008-12-12  447  static void
af69fb3a8ffa37 Karsten Keil 2008-07-27  448  write_fifo_regio(struct hfc_multi *hc, u_char *data, int len)
af69fb3a8ffa37 Karsten Keil 2008-07-27  449  {
af69fb3a8ffa37 Karsten Keil 2008-07-27  450  	outb(A_FIFO_DATA0, (hc->pci_iobase) + 4);
af69fb3a8ffa37 Karsten Keil 2008-07-27  451  	while (len >> 2) {
b3e0aeeb7e0f89 Karsten Keil 2008-08-02 @452  		outl(cpu_to_le32(*(u32 *)data), hc->pci_iobase);
af69fb3a8ffa37 Karsten Keil 2008-07-27  453  		data += 4;
af69fb3a8ffa37 Karsten Keil 2008-07-27  454  		len -= 4;
af69fb3a8ffa37 Karsten Keil 2008-07-27  455  	}
af69fb3a8ffa37 Karsten Keil 2008-07-27  456  	while (len >> 1) {
b3e0aeeb7e0f89 Karsten Keil 2008-08-02 @457  		outw(cpu_to_le16(*(u16 *)data), hc->pci_iobase);
af69fb3a8ffa37 Karsten Keil 2008-07-27  458  		data += 2;
af69fb3a8ffa37 Karsten Keil 2008-07-27  459  		len -= 2;
af69fb3a8ffa37 Karsten Keil 2008-07-27  460  	}
af69fb3a8ffa37 Karsten Keil 2008-07-27  461  	while (len) {
af69fb3a8ffa37 Karsten Keil 2008-07-27  462  		outb(*data, hc->pci_iobase);
af69fb3a8ffa37 Karsten Keil 2008-07-27  463  		data++;
af69fb3a8ffa37 Karsten Keil 2008-07-27  464  		len--;
af69fb3a8ffa37 Karsten Keil 2008-07-27  465  	}
af69fb3a8ffa37 Karsten Keil 2008-07-27  466  }
af69fb3a8ffa37 Karsten Keil 2008-07-27  467  /* write fifo data (PCIMEM) */
5b8343540a3d27 Hannes Eder  2008-12-12  468  static void
af69fb3a8ffa37 Karsten Keil 2008-07-27  469  write_fifo_pcimem(struct hfc_multi *hc, u_char *data, int len)
af69fb3a8ffa37 Karsten Keil 2008-07-27  470  {
af69fb3a8ffa37 Karsten Keil 2008-07-27  471  	while (len >> 2) {
b3e0aeeb7e0f89 Karsten Keil 2008-08-02  472  		writel(cpu_to_le32(*(u32 *)data),
b3e0aeeb7e0f89 Karsten Keil 2008-08-02  473  		       hc->pci_membase + A_FIFO_DATA0);
af69fb3a8ffa37 Karsten Keil 2008-07-27  474  		data += 4;
af69fb3a8ffa37 Karsten Keil 2008-07-27  475  		len -= 4;
af69fb3a8ffa37 Karsten Keil 2008-07-27  476  	}
af69fb3a8ffa37 Karsten Keil 2008-07-27  477  	while (len >> 1) {
b3e0aeeb7e0f89 Karsten Keil 2008-08-02  478  		writew(cpu_to_le16(*(u16 *)data),
b3e0aeeb7e0f89 Karsten Keil 2008-08-02  479  		       hc->pci_membase + A_FIFO_DATA0);
af69fb3a8ffa37 Karsten Keil 2008-07-27  480  		data += 2;
af69fb3a8ffa37 Karsten Keil 2008-07-27  481  		len -= 2;
af69fb3a8ffa37 Karsten Keil 2008-07-27  482  	}
af69fb3a8ffa37 Karsten Keil 2008-07-27  483  	while (len) {
b3e0aeeb7e0f89 Karsten Keil 2008-08-02  484  		writeb(*data, hc->pci_membase + A_FIFO_DATA0);
af69fb3a8ffa37 Karsten Keil 2008-07-27  485  		data++;
af69fb3a8ffa37 Karsten Keil 2008-07-27  486  		len--;
af69fb3a8ffa37 Karsten Keil 2008-07-27  487  	}
af69fb3a8ffa37 Karsten Keil 2008-07-27  488  }
eac74af9b547e2 Karsten Keil 2009-05-22  489  

:::::: The code at line 452 was first introduced by commit
:::::: b3e0aeeb7e0f89791c4c3bdfd98b36074c5178e6 Fix remaining big endian issue of hfcmulti

:::::: TO: Karsten Keil <kkeil@suse.de>
:::::: CC: Karsten Keil <kkeil@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
