Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA01A93B
	for <oe-kbuild@lists.linux.dev>; Mon,  8 May 2023 09:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683538051; x=1715074051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ijxyftuL73oxGLbEl9QsmVdPQd8yopkNp2v7xmMkzI=;
  b=l+KjHuskya/z7DRl+gZ5znCSN3tl8HamkH1PeXgI15MqatW850FrvMKS
   L7UpgWnbCCTUiAmNk8cXsGIURWuqoFyuEBJkgByGLM/dCBnfAmk+kzYA9
   fufdpd3SZW3U3isOr/ZRV/sIr7E9/hKCRqDNYz0ASd1lSUi2SaDobssB5
   qREym3BDgSDvQm9waX+LU98fAPDvRidNBw/8yylOUFuyYA95qG1a+M/8g
   c8zwqKXuvRqzesNPLbrSwGa3Nprdf0CzMKmNMvp1FjvyTNju658zJ4gWi
   xIcoYSRCNiKh0XbLqXPAnx9PP2lzPvzqaZhihJ5o4iCCa8RJ2sA0Wxebj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="377690485"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="377690485"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 02:27:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="842629469"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="842629469"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 May 2023 02:27:29 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvx9U-0001AP-2r;
	Mon, 08 May 2023 09:27:28 +0000
Date: Mon, 8 May 2023 17:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/acpi/acpica/tbutils.c:181 acpi_tb_get_root_table_entry()
 error: uninitialized symbol 'address32'.
Message-ID: <202305081713.PzqP0LpN-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Tamir Duberstein <tamird@google.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Bob Moore <robert.moore@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac9a78681b921877518763ba0e89202254349d1b
commit: d56ba92b0ce659a235d8ed541c785fdb2f760449 ACPICA: Avoid undefined behavior: load of misaligned address
date:   5 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 weeks ago
config: ia64-randconfig-m031-20230507 (https://download.01.org/0day-ci/archive/20230508/202305081713.PzqP0LpN-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305081713.PzqP0LpN-lkp@intel.com/

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
