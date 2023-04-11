Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594CA2F2D
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Apr 2023 08:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681201144; x=1712737144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q701Rkf8qzw+iuQ5X2YwUFyG0bFogzWQQ3uP97KoUfM=;
  b=gB10S0k0lzFjpEcoWFUEhb+GWzVLQUT6xqkz65BUEV+uxNLGJdFTYWCa
   pnbR7ulNaEK33j28S/IPZM65i+0dwZbQyeHjTD6cXDEs3f/AX/C398zNd
   NXDGQJtTo+gDPkjr4SheJegutvicZugTSYKNabdtizxtfdb/I4PU+o8uZ
   zm5wFhWAVA65wR+oyQ9RIYB8p9YyTB8LauM0EwTEiS61t964brlYXR/7J
   6mIaPtz9KDi9qx/5Z8Sb345fI0YtfjZ6rBWeDehMkClyVPZtWyPoHhr3K
   40UQhhXvGZcL/3adPFGo4Inn/ih6VyqkIU92bBPQ235sLpjHbOC7vVMDd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="327655291"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="327655291"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 01:19:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="832261468"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="832261468"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Apr 2023 01:19:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm9DR-000W8L-26;
	Tue, 11 Apr 2023 08:19:01 +0000
Date: Tue, 11 Apr 2023 16:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9381/10570] drivers/acpi/acpica/tbutils.c:181
 acpi_tb_get_root_table_entry() error: uninitialized symbol 'address32'.
Message-ID: <202304111600.jRNc8maR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Tamir Duberstein <tamird@google.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Bob Moore <robert.moore@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   009795d283d1f9f043e5a4ff97d4140cde17e2d3
commit: d56ba92b0ce659a235d8ed541c785fdb2f760449 [9381/10570] ACPICA: Avoid undefined behavior: load of misaligned address
:::::: branch date: 64 minutes ago
:::::: commit date: 5 days ago
config: ia64-randconfig-m031-20230410 (https://download.01.org/0day-ci/archive/20230411/202304111600.jRNc8maR-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304111600.jRNc8maR-lkp@intel.com/

New smatch warnings:
drivers/acpi/acpica/tbutils.c:181 acpi_tb_get_root_table_entry() error: uninitialized symbol 'address32'.

Old smatch warnings:
drivers/acpi/acpica/tbutils.c:201 acpi_tb_get_root_table_entry() error: uninitialized symbol 'address64'.

vim +/address32 +181 drivers/acpi/acpica/tbutils.c

69ec87efa815d6 drivers/acpi/acpica/tbutils.c Lin Ming         2010-04-01  147  
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  148  /*******************************************************************************
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  149   *
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  150   * FUNCTION:    acpi_tb_get_root_table_entry
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  151   *
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  152   * PARAMETERS:  table_entry         - Pointer to the RSDT/XSDT table entry
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  153   *              table_entry_size    - sizeof 32 or 64 (RSDT or XSDT)
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  154   *
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  155   * RETURN:      Physical address extracted from the root table
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  156   *
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  157   * DESCRIPTION: Get one root table entry. Handles 32-bit and 64-bit cases on
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  158   *              both 32-bit and 64-bit platforms
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  159   *
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  160   * NOTE:        acpi_physical_address is 32-bit on 32-bit platforms, 64-bit on
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  161   *              64-bit platforms.
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  162   *
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  163   ******************************************************************************/
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  164  
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  165  static acpi_physical_address
67a119f990063f drivers/acpi/tables/tbutils.c Bob Moore        2008-06-10  166  acpi_tb_get_root_table_entry(u8 *table_entry, u32 table_entry_size)
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  167  {
d56ba92b0ce659 drivers/acpi/acpica/tbutils.c Tamir Duberstein 2023-04-05  168  	u32 address32;
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  169  	u64 address64;
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  170  
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  171  	/*
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  172  	 * Get the table physical address (32-bit for RSDT, 64-bit for XSDT):
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  173  	 * Note: Addresses are 32-bit aligned (not 64) in both RSDT and XSDT
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  174  	 */
671cc68dc61f02 drivers/acpi/acpica/tbutils.c Lv Zheng         2014-01-08  175  	if (table_entry_size == ACPI_RSDT_ENTRY_SIZE) {
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  176  		/*
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  177  		 * 32-bit platform, RSDT: Return 32-bit table entry
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  178  		 * 64-bit platform, RSDT: Expand 32-bit to 64-bit and return
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  179  		 */
d56ba92b0ce659 drivers/acpi/acpica/tbutils.c Tamir Duberstein 2023-04-05  180  		ACPI_MOVE_32_TO_32(&address32, table_entry);
d56ba92b0ce659 drivers/acpi/acpica/tbutils.c Tamir Duberstein 2023-04-05 @181  		return address32;
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  182  	} else {
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  183  		/*
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  184  		 * 32-bit platform, XSDT: Truncate 64-bit to 32-bit and return
ec41f193eadb63 drivers/acpi/acpica/tbutils.c Bob Moore        2009-02-18  185  		 * 64-bit platform, XSDT: Move (unaligned) 64-bit to local,
ec41f193eadb63 drivers/acpi/acpica/tbutils.c Bob Moore        2009-02-18  186  		 *  return 64-bit
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  187  		 */
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  188  		ACPI_MOVE_64_TO_64(&address64, table_entry);
a4bbb810dedaec drivers/acpi/tables/tbutils.c Bob Moore        2007-02-02  189  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
