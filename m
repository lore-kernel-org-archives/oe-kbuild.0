Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED1B20F979
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jan 2025 14:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737641614; cv=none; b=FniIOaJ4gO02640xOBaV9BncmJwvW579NntwE/DJBPuDKHA8qVtyCFItNme+s6dyD3ogY0Ab5f2mKtGnJ5gDCgAgQap5hrNZd04UEcq20kU5IWN4FnwuVGLscgQNSdQ8HWPIxkOw0Ye5mWJjnksDc2P/TnQkfqpslhJzQbZWso8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737641614; c=relaxed/simple;
	bh=WwxM1TrXWlCURinCqt0M7YTq9/TNCRcQdHrgZd4XEbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e8q2oragQ770aBwJsJ4dSQXkeDBOThCr2CtnMUPcTN7hXVao4SI5mzS9+SoZIrwNvHbtkwx6zlLwaw6bFOI/kjwmgW8Fa1q7QnDOeKItHhAyJF3DGkMaMlknmJRitjfNebvqdylpMgTuV8Nd89h1r6ARUvMimHil4b065/j3mP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZUjHXQ8Q; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUjHXQ8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737641613; x=1769177613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WwxM1TrXWlCURinCqt0M7YTq9/TNCRcQdHrgZd4XEbQ=;
  b=ZUjHXQ8QV20YGbtTmujh9aRhRA+utPJnGC3XQLeNiz9r8H3RvWis/w2r
   Y0xql33UF6NVV1ap4gWsFl2fhgJgFknD7xEjh+ef0ytrqtBWjH1VloL0o
   6I+1mVs8/0aGWzcdrO+zBhJHmn8NJK5WgB4x4CtiLCYjirCdg+CcKA8ma
   ss1Bi2xSBVR1jwMfvPbfZXnxnA1GmQzq2a+aL537Hm9Gj+YkTWe8O1nQM
   QjGkZTOKpRzUXnNtC9dOt9JguXG1vNh2Dys/bx2aVfw11cKe9R32VAGoy
   yUGSQLeRqeDllNdYeGhBnMNycjosuul7OnPpHfnEuFB3G7MtJn6x9ayuB
   Q==;
X-CSE-ConnectionGUID: tHdIWFqMTbGUqRziVZISaA==
X-CSE-MsgGUID: 1yH+KKIkTfOhV2k/FkJoiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38306745"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="38306745"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 06:13:32 -0800
X-CSE-ConnectionGUID: ZarqHC6sRRmh2+oS0wW6gw==
X-CSE-MsgGUID: 07thf/IZTGChVyL0XaqjWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="107284253"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jan 2025 06:13:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taxxY-000bEx-2X;
	Thu, 23 Jan 2025 14:13:28 +0000
Date: Thu, 23 Jan 2025 22:12:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [zen:6.13/zen-sauce 8/31]
 arch/arm/boot/compressed/atags_to_fdt.c:218:1: warning: the frame size of
 1296 bytes is larger than 1280 bytes
Message-ID: <202501232235.BTbDI8vL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: steven@liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 6.13/zen-sauce
head:   ae96db84281e1b10aee61ef832aabd0941743e99
commit: 532c154f9710e705de5a6085c4aff795c7e65f59 [8/31] ZEN: Disable stack conservation for GCC
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm-randconfig-003-20250123 (https://download.01.org/0day-ci/archive/20250123/202501232235.BTbDI8vL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501232235.BTbDI8vL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501232235.BTbDI8vL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm/boot/compressed/atags_to_fdt.c: In function 'atags_to_fdt':
>> arch/arm/boot/compressed/atags_to_fdt.c:218:1: warning: the frame size of 1296 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     218 | }
         | ^


vim +218 arch/arm/boot/compressed/atags_to_fdt.c

31d0b9f9982f8e Ben Dooks             2018-10-12  121  
b90b9a38251e9c Nicolas Pitre         2011-09-13  122  /*
b90b9a38251e9c Nicolas Pitre         2011-09-13  123   * Convert and fold provided ATAGs into the provided FDT.
b90b9a38251e9c Nicolas Pitre         2011-09-13  124   *
4716e2e34a22a8 Geert Uytterhoeven    2021-05-19  125   * Return values:
b90b9a38251e9c Nicolas Pitre         2011-09-13  126   *    = 0 -> pretend success
b90b9a38251e9c Nicolas Pitre         2011-09-13  127   *    = 1 -> bad ATAG (may retry with another possible ATAG pointer)
b90b9a38251e9c Nicolas Pitre         2011-09-13  128   *    < 0 -> error from libfdt
b90b9a38251e9c Nicolas Pitre         2011-09-13  129   */
b90b9a38251e9c Nicolas Pitre         2011-09-13  130  int atags_to_fdt(void *atag_list, void *fdt, int total_space)
b90b9a38251e9c Nicolas Pitre         2011-09-13  131  {
b90b9a38251e9c Nicolas Pitre         2011-09-13  132  	struct tag *atag = atag_list;
faefd550c45d8d Gregory CLEMENT       2013-05-15  133  	/* In the case of 64 bits memory size, need to reserve 2 cells for
faefd550c45d8d Gregory CLEMENT       2013-05-15  134  	 * address and size for each bank */
43fa593eb7eec9 Ben Dooks (Codethink  2019-10-11  135) 	__be32 mem_reg_property[2 * 2 * NR_BANKS];
b90b9a38251e9c Nicolas Pitre         2011-09-13  136  	int memcount = 0;
faefd550c45d8d Gregory CLEMENT       2013-05-15  137  	int ret, memsize;
b90b9a38251e9c Nicolas Pitre         2011-09-13  138  
b90b9a38251e9c Nicolas Pitre         2011-09-13  139  	/* make sure we've got an aligned pointer */
b90b9a38251e9c Nicolas Pitre         2011-09-13  140  	if ((u32)atag_list & 0x3)
b90b9a38251e9c Nicolas Pitre         2011-09-13  141  		return 1;
b90b9a38251e9c Nicolas Pitre         2011-09-13  142  
b90b9a38251e9c Nicolas Pitre         2011-09-13  143  	/* if we get a DTB here we're done already */
43fa593eb7eec9 Ben Dooks (Codethink  2019-10-11  144) 	if (*(__be32 *)atag_list == cpu_to_fdt32(FDT_MAGIC))
b90b9a38251e9c Nicolas Pitre         2011-09-13  145  	       return 0;
b90b9a38251e9c Nicolas Pitre         2011-09-13  146  
b90b9a38251e9c Nicolas Pitre         2011-09-13  147  	/* validate the ATAG */
b90b9a38251e9c Nicolas Pitre         2011-09-13  148  	if (atag->hdr.tag != ATAG_CORE ||
b90b9a38251e9c Nicolas Pitre         2011-09-13  149  	    (atag->hdr.size != tag_size(tag_core) &&
b90b9a38251e9c Nicolas Pitre         2011-09-13  150  	     atag->hdr.size != 2))
b90b9a38251e9c Nicolas Pitre         2011-09-13  151  		return 1;
b90b9a38251e9c Nicolas Pitre         2011-09-13  152  
b90b9a38251e9c Nicolas Pitre         2011-09-13  153  	/* let's give it all the room it could need */
b90b9a38251e9c Nicolas Pitre         2011-09-13  154  	ret = fdt_open_into(fdt, fdt, total_space);
b90b9a38251e9c Nicolas Pitre         2011-09-13  155  	if (ret < 0)
b90b9a38251e9c Nicolas Pitre         2011-09-13  156  		return ret;
b90b9a38251e9c Nicolas Pitre         2011-09-13  157  
b90b9a38251e9c Nicolas Pitre         2011-09-13  158  	for_each_tag(atag, atag_list) {
b90b9a38251e9c Nicolas Pitre         2011-09-13  159  		if (atag->hdr.tag == ATAG_CMDLINE) {
d0f34a11ddab9b Richard Genoud        2012-06-26  160  			/* Append the ATAGS command line to the device tree
d0f34a11ddab9b Richard Genoud        2012-06-26  161  			 * command line.
d0f34a11ddab9b Richard Genoud        2012-06-26  162  			 * NB: This means that if the same parameter is set in
d0f34a11ddab9b Richard Genoud        2012-06-26  163  			 * the device tree and in the tags, the one from the
d0f34a11ddab9b Richard Genoud        2012-06-26  164  			 * tags will be chosen.
d0f34a11ddab9b Richard Genoud        2012-06-26  165  			 */
d0f34a11ddab9b Richard Genoud        2012-06-26  166  			if (do_extend_cmdline)
d0f34a11ddab9b Richard Genoud        2012-06-26  167  				merge_fdt_bootargs(fdt,
d0f34a11ddab9b Richard Genoud        2012-06-26  168  						   atag->u.cmdline.cmdline);
d0f34a11ddab9b Richard Genoud        2012-06-26  169  			else
b90b9a38251e9c Nicolas Pitre         2011-09-13  170  				setprop_string(fdt, "/chosen", "bootargs",
b90b9a38251e9c Nicolas Pitre         2011-09-13  171  					       atag->u.cmdline.cmdline);
b90b9a38251e9c Nicolas Pitre         2011-09-13  172  		} else if (atag->hdr.tag == ATAG_MEM) {
b90b9a38251e9c Nicolas Pitre         2011-09-13  173  			if (memcount >= sizeof(mem_reg_property)/4)
b90b9a38251e9c Nicolas Pitre         2011-09-13  174  				continue;
a106b21a352517 Marc Zyngier          2012-04-11  175  			if (!atag->u.mem.size)
a106b21a352517 Marc Zyngier          2012-04-11  176  				continue;
faefd550c45d8d Gregory CLEMENT       2013-05-15  177  			memsize = get_cell_size(fdt);
faefd550c45d8d Gregory CLEMENT       2013-05-15  178  
faefd550c45d8d Gregory CLEMENT       2013-05-15  179  			if (memsize == 2) {
faefd550c45d8d Gregory CLEMENT       2013-05-15  180  				/* if memsize is 2, that means that
faefd550c45d8d Gregory CLEMENT       2013-05-15  181  				 * each data needs 2 cells of 32 bits,
faefd550c45d8d Gregory CLEMENT       2013-05-15  182  				 * so the data are 64 bits */
43fa593eb7eec9 Ben Dooks (Codethink  2019-10-11  183) 				__be64 *mem_reg_prop64 =
43fa593eb7eec9 Ben Dooks (Codethink  2019-10-11  184) 					(__be64 *)mem_reg_property;
faefd550c45d8d Gregory CLEMENT       2013-05-15  185  				mem_reg_prop64[memcount++] =
faefd550c45d8d Gregory CLEMENT       2013-05-15  186  					cpu_to_fdt64(atag->u.mem.start);
faefd550c45d8d Gregory CLEMENT       2013-05-15  187  				mem_reg_prop64[memcount++] =
faefd550c45d8d Gregory CLEMENT       2013-05-15  188  					cpu_to_fdt64(atag->u.mem.size);
faefd550c45d8d Gregory CLEMENT       2013-05-15  189  			} else {
faefd550c45d8d Gregory CLEMENT       2013-05-15  190  				mem_reg_property[memcount++] =
faefd550c45d8d Gregory CLEMENT       2013-05-15  191  					cpu_to_fdt32(atag->u.mem.start);
faefd550c45d8d Gregory CLEMENT       2013-05-15  192  				mem_reg_property[memcount++] =
faefd550c45d8d Gregory CLEMENT       2013-05-15  193  					cpu_to_fdt32(atag->u.mem.size);
faefd550c45d8d Gregory CLEMENT       2013-05-15  194  			}
faefd550c45d8d Gregory CLEMENT       2013-05-15  195  
b90b9a38251e9c Nicolas Pitre         2011-09-13  196  		} else if (atag->hdr.tag == ATAG_INITRD2) {
b90b9a38251e9c Nicolas Pitre         2011-09-13  197  			uint32_t initrd_start, initrd_size;
b90b9a38251e9c Nicolas Pitre         2011-09-13  198  			initrd_start = atag->u.initrd.start;
b90b9a38251e9c Nicolas Pitre         2011-09-13  199  			initrd_size = atag->u.initrd.size;
b90b9a38251e9c Nicolas Pitre         2011-09-13  200  			setprop_cell(fdt, "/chosen", "linux,initrd-start",
b90b9a38251e9c Nicolas Pitre         2011-09-13  201  					initrd_start);
b90b9a38251e9c Nicolas Pitre         2011-09-13  202  			setprop_cell(fdt, "/chosen", "linux,initrd-end",
b90b9a38251e9c Nicolas Pitre         2011-09-13  203  					initrd_start + initrd_size);
31d0b9f9982f8e Ben Dooks             2018-10-12  204  		} else if (atag->hdr.tag == ATAG_SERIAL) {
31d0b9f9982f8e Ben Dooks             2018-10-12  205  			char serno[16+2];
31d0b9f9982f8e Ben Dooks             2018-10-12  206  			hex_str(serno, atag->u.serialnr.high);
31d0b9f9982f8e Ben Dooks             2018-10-12  207  			hex_str(serno+8, atag->u.serialnr.low);
31d0b9f9982f8e Ben Dooks             2018-10-12  208  			setprop_string(fdt, "/", "serial-number", serno);
b90b9a38251e9c Nicolas Pitre         2011-09-13  209  		}
b90b9a38251e9c Nicolas Pitre         2011-09-13  210  	}
b90b9a38251e9c Nicolas Pitre         2011-09-13  211  
faefd550c45d8d Gregory CLEMENT       2013-05-15  212  	if (memcount) {
faefd550c45d8d Gregory CLEMENT       2013-05-15  213  		setprop(fdt, "/memory", "reg", mem_reg_property,
faefd550c45d8d Gregory CLEMENT       2013-05-15  214  			4 * memcount * memsize);
faefd550c45d8d Gregory CLEMENT       2013-05-15  215  	}
b90b9a38251e9c Nicolas Pitre         2011-09-13  216  
b90b9a38251e9c Nicolas Pitre         2011-09-13  217  	return fdt_pack(fdt);
b90b9a38251e9c Nicolas Pitre         2011-09-13 @218  }

:::::: The code at line 218 was first introduced by commit
:::::: b90b9a38251e9c89c34179eccde57411ceb5f1aa ARM: zImage: allow supplementing appended DTB with traditional ATAG data

:::::: TO: Nicolas Pitre <nicolas.pitre@linaro.org>
:::::: CC: Nicolas Pitre <nico@fluxnic.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
