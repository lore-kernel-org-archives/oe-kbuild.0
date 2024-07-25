Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799DFE556
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jul 2024 20:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721940385; cv=none; b=fNqM8kxcUGxa/M/SiFgUPvOf0RD3t1GC3IHRZDW8nwBIDA4TOubZSQntgr1/FxWaC/bCk8rV2qzYV8Izmla+fidJ8qXTZk2HCNKugPi11ihVi+roM+cWue+ZRQmnRAkEoopm2XrVGBEfeq0c2Sn/TGBaNLX8r7zu+StCiM8rNiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721940385; c=relaxed/simple;
	bh=Ug3bkUIF9F0oAoak2MdunOlcPtBUmqhnF/UfYmIEPas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pTQ26VtybdkYzc0Nr0xr4wmDzg6OqTMGX6ZIOnPgTzjPgd3D8pk196nZ2+bShrZQ49u9dRtq40sZBaknXBSlaDOj33g4zTAt+TQDLj2MoDEQErP21F0tdvbvFqim8nMTWXIERipSxtu+EO6ttO3OGlRxdmBaAndwC7f8BsEGUWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mns3Gg/f; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mns3Gg/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721940383; x=1753476383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ug3bkUIF9F0oAoak2MdunOlcPtBUmqhnF/UfYmIEPas=;
  b=mns3Gg/fXDZIamvenU4Ar5no0E8849qL1HCAj3wUw4o+1C+//T8S1XvQ
   WF5+dL00b0CoKBc5xC5iOVen/RpmS5kSqBrbMkUZyulQfZoBuvFxWrgwP
   T0J2Z/X3NUwRjl2tOlQIhVq6urnMmW3xz6avtqpIHvKq+uVfYOi3TyZdy
   eafYLUsvayqv/azcrNiAYKVeVQBtG/BXSKuVyqb10YBIbrXBI/W738dRX
   h1htOoi5RFKiY81Gncp0eLAazvLAFLKn4GJHI4IPKTPzK0SneoaFt20jD
   5KsgGrSH4IEpxtaZ7JgVAu2w+3u0ffTD2E3BT2Q18aXKMCp8WLqL9O5uL
   A==;
X-CSE-ConnectionGUID: TrdSHQryTVuqFT0TsRI6UA==
X-CSE-MsgGUID: eZks+lT6Q6mzLl5hWHuMOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="12719496"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; 
   d="scan'208";a="12719496"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 13:46:23 -0700
X-CSE-ConnectionGUID: 1OwCTnHRRZyb60/KJLWPtA==
X-CSE-MsgGUID: CQWQT8hoQaOWuT3MXgqhiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; 
   d="scan'208";a="57182581"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Jul 2024 13:46:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sX5Lv-000oRa-22;
	Thu, 25 Jul 2024 20:46:19 +0000
Date: Fri, 26 Jul 2024 04:45:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/7] compiler.h: Add __if_constexpr(expr, if_const,
 if_not_const)
Message-ID: <202407260423.iffnNEQE-lkp@intel.com>
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
In-Reply-To: <9751d18defea406fa698630637d8e7db@AcuMS.aculab.com>
References: <9751d18defea406fa698630637d8e7db@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Linus Torvalds'" <torvalds@linuxfoundation.org>
CC: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
CC: "'Christoph Hellwig'" <hch@infradead.org>
CC: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
CC: "'Dan Carpenter'" <dan.carpenter@linaro.org>
CC: "'Arnd Bergmann'" <arnd@kernel.org>
CC: "'Jason@zx2c4.com'" <Jason@zx2c4.com>
CC: "'pedro.falcato@gmail.com'" <pedro.falcato@gmail.com>
CC: "'Mateusz Guzik'" <mjguzik@gmail.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v6.10 next-20240725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Put-all-the-clamp-definitions-together/20240724-224832
base:   linux/master
patch link:    https://lore.kernel.org/r/9751d18defea406fa698630637d8e7db%40AcuMS.aculab.com
patch subject: [PATCH 3/7] compiler.h: Add __if_constexpr(expr, if_const, if_not_const)
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-161-20240725 (https://download.01.org/0day-ci/archive/20240726/202407260423.iffnNEQE-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407260423.iffnNEQE-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/thinkpad_acpi.c:11519 set_ibm_param() error: strcpy() 'val' too large for 'ibms_init[i]->param' (1010102 vs 32)
fs/f2fs/super.c:1157 parse_options() error: strcpy() 'name' too large for 'ext[ext_cnt]' (1010102 vs 8)
fs/f2fs/super.c:1186 parse_options() error: strcpy() 'name' too large for 'noext[noext_cnt]' (1010102 vs 8)

Old smatch warnings:
drivers/platform/x86/thinkpad_acpi.c:1205 tpacpi_new_rfkill() warn: 'atp_rfk->rfkill' is an error pointer or valid
drivers/platform/x86/thinkpad_acpi.c:2642 hotkey_inputdev_close() warn: bitwise AND condition is false here
drivers/platform/x86/thinkpad_acpi.c:3642 hotkey_notify_hotkey() warn: bitwise AND condition is false here

vim +11519 drivers/platform/x86/thinkpad_acpi.c

a5763f2223ce3fd drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-21  11502  
e4dca7b7aa08b22 drivers/platform/x86/thinkpad_acpi.c Kees Cook                   2017-10-17  11503  static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds              2005-04-16  11504  {
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds              2005-04-16  11505  	unsigned int i;
a5763f2223ce3fd drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-21  11506  	struct ibm_struct *ibm;
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds              2005-04-16  11507  
59f91ff11e59491 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-11-18  11508  	if (!kp || !kp->name || !val)
59f91ff11e59491 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-11-18  11509  		return -EINVAL;
59f91ff11e59491 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-11-18  11510  
a5763f2223ce3fd drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-21  11511  	for (i = 0; i < ARRAY_SIZE(ibms_init); i++) {
a5763f2223ce3fd drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-21  11512  		ibm = ibms_init[i].data;
59f91ff11e59491 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-11-18  11513  		if (!ibm || !ibm->name)
59f91ff11e59491 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-11-18  11514  			continue;
a5763f2223ce3fd drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-21  11515  
a5763f2223ce3fd drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-21  11516  		if (strcmp(ibm->name, kp->name) == 0 && ibm->write) {
be51bd4585728ba drivers/platform/x86/thinkpad_acpi.c Andy Shevchenko             2020-05-11  11517  			if (strlen(val) > sizeof(ibms_init[i].param) - 1)
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds              2005-04-16  11518  				return -ENOSPC;
a5763f2223ce3fd drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-21 @11519  			strcpy(ibms_init[i].param, val);
78f81cc4355c31c drivers/acpi/ibm_acpi.c              Borislav Deianov            2005-08-17  11520  			return 0;
78f81cc4355c31c drivers/acpi/ibm_acpi.c              Borislav Deianov            2005-08-17  11521  		}
a5763f2223ce3fd drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-21  11522  	}
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds              2005-04-16  11523  
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds              2005-04-16  11524  	return -EINVAL;
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds              2005-04-16  11525  }
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds              2005-04-16  11526  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
