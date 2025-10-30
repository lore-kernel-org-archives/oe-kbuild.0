Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99127286419
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 05:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761802912; cv=none; b=qeCrUQQMHa5zLA1/JppsG51vSzdCeJRNwJXUtzxDuA52OoBXqTaXzMjKID2KXMUux7x3yL4DY9WBYFsl391/sktVtdejI1uAm60xh+bHrktm6rNVTX2fxOqaHMjQcWi2myD7UAohV0uu1zfTYjQ97pPA1HzqM3fhrYX/5zR4IVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761802912; c=relaxed/simple;
	bh=9ioYHljFo0efRrGvI9O9wNG0mnmdXohvcObvDbEBIxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iXvwMU0mOmEShRTQa/TGI1UaMTipaoduHM58OiLJuegAT3aMqbX82N6MrSI089lFjeMgp0lbLq9qJ+pWyjyJP6ei+Y0NThJguIEcGC7NBA0VkrjlDA4n+CRbmnkdNcq9tdxo1K4CyxE0EJ3RAXWdHxy6JqsVIiWahXuLfwxvhOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EnrvA21t; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EnrvA21t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761802910; x=1793338910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ioYHljFo0efRrGvI9O9wNG0mnmdXohvcObvDbEBIxU=;
  b=EnrvA21tBZwo+ABJjDbe6vlpDBe7Gof+8gEONUgIclmtUS5t8Oj5zpsj
   hVuR2tzxnOucLh1zUoLa4XAjz7UxFvhSx2dJZne9b57H9e8FFp71um4jo
   Yrc5MUhPDAxL/OmD45GHsUX1eLl/zxS35wG95egwigL2csq3Em4XCSZNk
   HdAqV2NnNTdm+BW+5XFKYtRdwhtRMrEwV5jDT4+92m/MKwXrau8aA7CuA
   mujVZOl7iTodUs8yQwWNLSo9vWk2ZC7W6ME7FzgO49QfulaqK5Bohw0vG
   zE6LeRVphtX9v1a4KoqbXdk/8YQW8NJe297R5kZj4xGeYWAU3de7df2Il
   Q==;
X-CSE-ConnectionGUID: vk4uDEUARH6oe3OvY2sI0Q==
X-CSE-MsgGUID: vEEUEKSkR2W6OalrV1tG0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63845646"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="63845646"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 22:41:49 -0700
X-CSE-ConnectionGUID: fVUEp+yJQMCLnp+R7ljw8g==
X-CSE-MsgGUID: +hk7nXZGQAOU53fZBBR/Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="190193831"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 29 Oct 2025 22:41:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vELPu-000LVU-0w;
	Thu, 30 Oct 2025 05:41:46 +0000
Date: Thu, 30 Oct 2025 13:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/staging/gpib/gpio/gpib_bitbang.c:1204:24-31: WARNING:
 Consider using %pe to print PTR_ERR()
Message-ID: <202510301308.JLr3AzNZ-lkp@intel.com>
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
TO: Dave Penkler <dpenkler@gmail.com>

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: 165e8cc3cfec9ef51f3376b0d49b115294f34f3b staging: gpib: Add KBUILD files for GPIB drivers
date:   1 year, 1 month ago
:::::: branch date: 29 hours ago
:::::: commit date: 1 year, 1 month ago
config: loongarch-randconfig-r062-20251030 (https://download.01.org/0day-ci/archive/20251030/202510301308.JLr3AzNZ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510301308.JLr3AzNZ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/staging/gpib/gpio/gpib_bitbang.c:1204:24-31: WARNING: Consider using %pe to print PTR_ERR()

vim +1204 drivers/staging/gpib/gpio/gpib_bitbang.c

4cd654f847693c2 Dave Penkler 2024-09-18  1163  
4cd654f847693c2 Dave Penkler 2024-09-18  1164  static int allocate_gpios(gpib_board_t *board)
4cd654f847693c2 Dave Penkler 2024-09-18  1165  {
4cd654f847693c2 Dave Penkler 2024-09-18  1166  	int j, retval = 0;
4cd654f847693c2 Dave Penkler 2024-09-18  1167  	bool error = false;
4cd654f847693c2 Dave Penkler 2024-09-18  1168  	int table_index = 0;
4cd654f847693c2 Dave Penkler 2024-09-18  1169  	char name[256];
4cd654f847693c2 Dave Penkler 2024-09-18  1170  	struct gpio_desc *desc;
4cd654f847693c2 Dave Penkler 2024-09-18  1171  	struct gpiod_lookup_table *lookup_table;
4cd654f847693c2 Dave Penkler 2024-09-18  1172  
4cd654f847693c2 Dave Penkler 2024-09-18  1173  	if (!board->gpib_dev) {
4cd654f847693c2 Dave Penkler 2024-09-18  1174  		pr_err("NULL gpib dev for board\n");
4cd654f847693c2 Dave Penkler 2024-09-18  1175  		return -ENOENT;
4cd654f847693c2 Dave Penkler 2024-09-18  1176  	}
4cd654f847693c2 Dave Penkler 2024-09-18  1177  
4cd654f847693c2 Dave Penkler 2024-09-18  1178  	lookup_table = lookup_tables[0];
4cd654f847693c2 Dave Penkler 2024-09-18  1179  	lookup_table->dev_id   = dev_name(board->gpib_dev);
4cd654f847693c2 Dave Penkler 2024-09-18  1180  	gpiod_add_lookup_table(lookup_table);
4cd654f847693c2 Dave Penkler 2024-09-18  1181  	dbg_printk(1, "Allocating gpios using table index %d\n", table_index);
4cd654f847693c2 Dave Penkler 2024-09-18  1182  
4cd654f847693c2 Dave Penkler 2024-09-18  1183  	for (j = 0 ; j < NUM_PINS ; j++) {
4cd654f847693c2 Dave Penkler 2024-09-18  1184  		if (gpios_vector[j] < 0)
4cd654f847693c2 Dave Penkler 2024-09-18  1185  			continue;
4cd654f847693c2 Dave Penkler 2024-09-18  1186  		/* name not really used in gpiod_get_index() */
4cd654f847693c2 Dave Penkler 2024-09-18  1187  		sprintf(name, "GPIO%d", gpios_vector[j]);
4cd654f847693c2 Dave Penkler 2024-09-18  1188  try_again:
4cd654f847693c2 Dave Penkler 2024-09-18  1189  		dbg_printk(1, "Allocating gpio %s pin no %d\n", name, gpios_vector[j]);
4cd654f847693c2 Dave Penkler 2024-09-18  1190  		desc = gpiod_get_index(board->gpib_dev, name, gpios_vector[j], GPIOD_IN);
4cd654f847693c2 Dave Penkler 2024-09-18  1191  
4cd654f847693c2 Dave Penkler 2024-09-18  1192  		if (IS_ERR(desc)) {
4cd654f847693c2 Dave Penkler 2024-09-18  1193  			gpiod_remove_lookup_table(lookup_table);
4cd654f847693c2 Dave Penkler 2024-09-18  1194  			table_index++;
4cd654f847693c2 Dave Penkler 2024-09-18  1195  			lookup_table = lookup_tables[table_index];
4cd654f847693c2 Dave Penkler 2024-09-18  1196  			if (lookup_table) {
4cd654f847693c2 Dave Penkler 2024-09-18  1197  				dbg_printk(1, "Allocation failed,  now  using table_index %d\n",
4cd654f847693c2 Dave Penkler 2024-09-18  1198  					   table_index);
4cd654f847693c2 Dave Penkler 2024-09-18  1199  				lookup_table->dev_id = dev_name(board->gpib_dev);
4cd654f847693c2 Dave Penkler 2024-09-18  1200  				gpiod_add_lookup_table(lookup_table);
4cd654f847693c2 Dave Penkler 2024-09-18  1201  				goto try_again;
4cd654f847693c2 Dave Penkler 2024-09-18  1202  			}
4cd654f847693c2 Dave Penkler 2024-09-18  1203  			dbg_printk(0, "Unable to obtain gpio descriptor for pin %d error %ld\n",
4cd654f847693c2 Dave Penkler 2024-09-18 @1204  				   gpios_vector[j], PTR_ERR(desc));
4cd654f847693c2 Dave Penkler 2024-09-18  1205  			error = true;
4cd654f847693c2 Dave Penkler 2024-09-18  1206  			break;
4cd654f847693c2 Dave Penkler 2024-09-18  1207  		}
4cd654f847693c2 Dave Penkler 2024-09-18  1208  		all_descriptors[j] = desc;
4cd654f847693c2 Dave Penkler 2024-09-18  1209  	}
4cd654f847693c2 Dave Penkler 2024-09-18  1210  
4cd654f847693c2 Dave Penkler 2024-09-18  1211  	if (error) { /* undo what already done */
4cd654f847693c2 Dave Penkler 2024-09-18  1212  		release_gpios();
4cd654f847693c2 Dave Penkler 2024-09-18  1213  		retval = -1;
4cd654f847693c2 Dave Penkler 2024-09-18  1214  	}
4cd654f847693c2 Dave Penkler 2024-09-18  1215  	if (lookup_table)
4cd654f847693c2 Dave Penkler 2024-09-18  1216  		gpiod_remove_lookup_table(lookup_table);
4cd654f847693c2 Dave Penkler 2024-09-18  1217  	// Initialize LED trigger
4cd654f847693c2 Dave Penkler 2024-09-18  1218  	led_trigger_register_simple("gpib", &ledtrig_gpib);
4cd654f847693c2 Dave Penkler 2024-09-18  1219  	return retval;
4cd654f847693c2 Dave Penkler 2024-09-18  1220  }
4cd654f847693c2 Dave Penkler 2024-09-18  1221  

:::::: The code at line 1204 was first introduced by commit
:::::: 4cd654f847693c2c60312acfcab25936bb31aa1c staging: gpib: Add gpio bitbang GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
