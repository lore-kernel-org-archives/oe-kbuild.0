Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05079253A8
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Aug 2023 23:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691192578; x=1722728578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F1XjasjEQ9bgeX2bSefhtRRNfakURPiS1JyrPplU0LY=;
  b=HJOM9WmFVsgfGrqnQzxfNolHZ2xTGY/AV/VKb1sIc1ULHY6+eHNq1lEi
   FkvbnZ7GnYt17/s1O8fNrHGztG2LDpEQt94/amdwtJqyqUKqGAxE7xu/J
   yfdq/lhY1jyJnstDBvcX3QMCHykHD7KunUMyJ6DWusVTBNyYb0j8gBV3g
   nJ8i/EzVQW/F+DnIUtdGPCjebCxQZIVKk3Ernx4+TzH3FQwYdJ706ibG1
   W9kTya/FYT6SzHjQ4472ynNJhaVzrwWQsghVXsUDaswKHFfT7q5CtgVfW
   YfzB0+2QkpiUQbZEDR2Ca1q616vH74RrK7DRSVopR9XIB995SZf+ScZs3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="373925219"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="373925219"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 16:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="853989508"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="853989508"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Aug 2023 16:42:57 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS4Rc-0003CN-1i;
	Fri, 04 Aug 2023 23:42:56 +0000
Date: Sat, 5 Aug 2023 07:42:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 5/5] minmax: Relax check to allow comparison between
 int and small unsigned constants.
Message-ID: <202308050722.nnqMDL7A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/char/agp/generic.c:746:14: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <b6a49ed73aba427ca8bb433763fa94e9@AcuMS.aculab.com>
References: <b6a49ed73aba427ca8bb433763fa94e9@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>
TO: "'Linus Torvalds'" <torvalds@linux-foundation.org>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on crng-random/master v6.5-rc4 next-20230804]
[cannot apply to next-20230804 akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Add-min_unsigned-a-b-and-max_unsigned-a-b/20230804-190414
base:   linus/master
patch link:    https://lore.kernel.org/r/b6a49ed73aba427ca8bb433763fa94e9%40AcuMS.aculab.com
patch subject: [PATCH v3 5/5] minmax: Relax check to allow comparison between int and small unsigned constants.
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-x061-20230730 (https://download.01.org/0day-ci/archive/20230805/202308050722.nnqMDL7A-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050722.nnqMDL7A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308050722.nnqMDL7A-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/char/agp/generic.c:746:14: sparse: sparse: too long token expansion
>> drivers/char/agp/generic.c:746:14: sparse: sparse: too long token expansion
--
>> drivers/media/i2c/mt9p031.c:604:17: sparse: sparse: too long token expansion
   drivers/media/i2c/mt9p031.c:608:18: sparse: sparse: too long token expansion

vim +746 drivers/char/agp/generic.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  710  
^1da177e4c3f41 Linus Torvalds  2005-04-16  711  
^1da177e4c3f41 Linus Torvalds  2005-04-16  712  /**
^1da177e4c3f41 Linus Torvalds  2005-04-16  713   * agp_collect_device_status - determine correct agp_cmd from various agp_stat's
^1da177e4c3f41 Linus Torvalds  2005-04-16  714   * @bridge: an agp_bridge_data struct allocated for the AGP host bridge.
^1da177e4c3f41 Linus Torvalds  2005-04-16  715   * @requested_mode: requested agp_stat from userspace (Typically from X)
^1da177e4c3f41 Linus Torvalds  2005-04-16  716   * @bridge_agpstat: current agp_stat from AGP bridge.
^1da177e4c3f41 Linus Torvalds  2005-04-16  717   *
^1da177e4c3f41 Linus Torvalds  2005-04-16  718   * This function will hunt for an AGP graphics card, and try to match
^1da177e4c3f41 Linus Torvalds  2005-04-16  719   * the requested mode to the capabilities of both the bridge and the card.
^1da177e4c3f41 Linus Torvalds  2005-04-16  720   */
^1da177e4c3f41 Linus Torvalds  2005-04-16  721  u32 agp_collect_device_status(struct agp_bridge_data *bridge, u32 requested_mode, u32 bridge_agpstat)
^1da177e4c3f41 Linus Torvalds  2005-04-16  722  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  723  	struct pci_dev *device = NULL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  724  	u32 vga_agpstat;
^1da177e4c3f41 Linus Torvalds  2005-04-16  725  	u8 cap_ptr;
^1da177e4c3f41 Linus Torvalds  2005-04-16  726  
^1da177e4c3f41 Linus Torvalds  2005-04-16  727  	for (;;) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  728  		device = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, device);
^1da177e4c3f41 Linus Torvalds  2005-04-16  729  		if (!device) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  730  			printk(KERN_INFO PFX "Couldn't find an AGP VGA controller.\n");
^1da177e4c3f41 Linus Torvalds  2005-04-16  731  			return 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  732  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  733  		cap_ptr = pci_find_capability(device, PCI_CAP_ID_AGP);
^1da177e4c3f41 Linus Torvalds  2005-04-16  734  		if (cap_ptr)
^1da177e4c3f41 Linus Torvalds  2005-04-16  735  			break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  736  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  737  
^1da177e4c3f41 Linus Torvalds  2005-04-16  738  	/*
^1da177e4c3f41 Linus Torvalds  2005-04-16  739  	 * Ok, here we have a AGP device. Disable impossible
^1da177e4c3f41 Linus Torvalds  2005-04-16  740  	 * settings, and adjust the readqueue to the minimum.
^1da177e4c3f41 Linus Torvalds  2005-04-16  741  	 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  742  	pci_read_config_dword(device, cap_ptr+PCI_AGP_STATUS, &vga_agpstat);
^1da177e4c3f41 Linus Torvalds  2005-04-16  743  
^1da177e4c3f41 Linus Torvalds  2005-04-16  744  	/* adjust RQ depth */
^1da177e4c3f41 Linus Torvalds  2005-04-16  745  	bridge_agpstat = ((bridge_agpstat & ~AGPSTAT_RQ_DEPTH) |
^1da177e4c3f41 Linus Torvalds  2005-04-16 @746  	     min_t(u32, (requested_mode & AGPSTAT_RQ_DEPTH),
^1da177e4c3f41 Linus Torvalds  2005-04-16  747  		 min_t(u32, (bridge_agpstat & AGPSTAT_RQ_DEPTH), (vga_agpstat & AGPSTAT_RQ_DEPTH))));
^1da177e4c3f41 Linus Torvalds  2005-04-16  748  
^1da177e4c3f41 Linus Torvalds  2005-04-16  749  	/* disable FW if it's not supported */
^1da177e4c3f41 Linus Torvalds  2005-04-16  750  	if (!((bridge_agpstat & AGPSTAT_FW) &&
^1da177e4c3f41 Linus Torvalds  2005-04-16  751  		 (vga_agpstat & AGPSTAT_FW) &&
^1da177e4c3f41 Linus Torvalds  2005-04-16  752  		 (requested_mode & AGPSTAT_FW)))
^1da177e4c3f41 Linus Torvalds  2005-04-16  753  		bridge_agpstat &= ~AGPSTAT_FW;
^1da177e4c3f41 Linus Torvalds  2005-04-16  754  
^1da177e4c3f41 Linus Torvalds  2005-04-16  755  	/* Check to see if we are operating in 3.0 mode */
66bb8bf8b235ba David Mosberger 2005-04-04  756  	if (agp_bridge->mode & AGPSTAT_MODE_3_0)
^1da177e4c3f41 Linus Torvalds  2005-04-16  757  		agp_v3_parse_one(&requested_mode, &bridge_agpstat, &vga_agpstat);
^1da177e4c3f41 Linus Torvalds  2005-04-16  758  	else
^1da177e4c3f41 Linus Torvalds  2005-04-16  759  		agp_v2_parse_one(&requested_mode, &bridge_agpstat, &vga_agpstat);
^1da177e4c3f41 Linus Torvalds  2005-04-16  760  
^1da177e4c3f41 Linus Torvalds  2005-04-16  761  	pci_dev_put(device);
^1da177e4c3f41 Linus Torvalds  2005-04-16  762  	return bridge_agpstat;
^1da177e4c3f41 Linus Torvalds  2005-04-16  763  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  764  EXPORT_SYMBOL(agp_collect_device_status);
^1da177e4c3f41 Linus Torvalds  2005-04-16  765  
^1da177e4c3f41 Linus Torvalds  2005-04-16  766  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
