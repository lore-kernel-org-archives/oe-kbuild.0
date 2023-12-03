Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C65A3B
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 06:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KA0Xg+gb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585169; x=1733121169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rIOMY+5VJpXjzn/UU/m+AnDhFCWDqREpmHk+y8CPuZo=;
  b=KA0Xg+gbd/aefyYJxU0EBBx6rxkes/s6NozlyCfxEBJK8yyxIyXx0v7Z
   HfgFxtxI+RXmZjtMJoaS4CjPumj63Vm4mATwTLw2drEDET2hr6U631FJE
   NOedysXYkm9a5sDfs48joo8SqGXGJVyqN0YCAqdOSPPaLi2mwLzHADgLi
   o6vq0rfNr+iVD9TyjQFDJmXidvFjXVjz71eAyiKXagh0QVDtAHWUROojN
   hhKNLqhLaPULfzJ9+Eqq21ufkUI1BFJVJQDq5ImQ/D7BAhnJsttH2Q8lQ
   etUUr7W71DC8s206B9FHQH+u5XfBLm+NyxMSlJmdH+hMHAukVBcE4YNXN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="15180404"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="15180404"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="914081658"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="914081658"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2023 22:32:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g20-0006LF-11;
	Sun, 03 Dec 2023 06:32:44 +0000
Date: Sun, 3 Dec 2023 14:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/phy.h:177:20: warning: '%02x' directive output may be
 truncated writing between 2 and 8 bytes into a region of size between 0 and
 60
Message-ID: <202312030750.8gvEYmTS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Florian Fainelli <f.fainelli@gmail.com>

Hi Florian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 7f7b7574555e2189135098885208821d0acd4850 net: ethernet: broadcom: Drop dependency on OF
date:   5 years ago
:::::: branch date: 23 hours ago
:::::: commit date: 5 years ago
config: x86_64-randconfig-161-20230927 (https://download.01.org/0day-ci/archive/20231203/202312030750.8gvEYmTS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231203/202312030750.8gvEYmTS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312030750.8gvEYmTS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/broadcom/genet/bcmmii.c:20:
   drivers/net/ethernet/broadcom/genet/bcmmii.c: In function 'bcmgenet_mii_pd_init':
>> include/linux/phy.h:177:20: warning: '%02x' directive output may be truncated writing between 2 and 8 bytes into a region of size between 0 and 60 [-Wformat-truncation=]
     177 | #define PHY_ID_FMT "%s:%02x"
         |                    ^~~~~~~~~
   drivers/net/ethernet/broadcom/genet/bcmmii.c:495:53: note: in expansion of macro 'PHY_ID_FMT'
     495 |                 snprintf(phy_name, MII_BUS_ID_SIZE, PHY_ID_FMT,
         |                                                     ^~~~~~~~~~
   include/linux/phy.h:177:24: note: format string is defined here
     177 | #define PHY_ID_FMT "%s:%02x"
         |                        ^~~~
   include/linux/phy.h:177:20: note: using the range [0, 4294967295] for directive argument
     177 | #define PHY_ID_FMT "%s:%02x"
         |                    ^~~~~~~~~
   drivers/net/ethernet/broadcom/genet/bcmmii.c:495:53: note: in expansion of macro 'PHY_ID_FMT'
     495 |                 snprintf(phy_name, MII_BUS_ID_SIZE, PHY_ID_FMT,
         |                                                     ^~~~~~~~~~
   drivers/net/ethernet/broadcom/genet/bcmmii.c:495:17: note: 'snprintf' output between 4 and 70 bytes into a destination of size 61
     495 |                 snprintf(phy_name, MII_BUS_ID_SIZE, PHY_ID_FMT,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     496 |                          mdio_bus_id, pd->phy_address);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/genet/bcmmii.o: warning: objtool: bcmgenet_mii_register()+0x3f9: sibling call from callable instruction with modified stack frame
   drivers/net/ethernet/broadcom/genet/bcmmii.o: warning: objtool: bcmgenet_mii_pd_init()+0x1b3: sibling call from callable instruction with modified stack frame
   drivers/net/ethernet/broadcom/genet/bcmmii.o: warning: objtool: bcmgenet_mii_config()+0xca: sibling call from callable instruction with modified stack frame
   drivers/net/ethernet/broadcom/genet/bcmmii.o: warning: objtool: bcmgenet_mii_probe()+0x242: sibling call from callable instruction with modified stack frame

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BACKLIGHT_CLASS_DEVICE
   Depends on [n]: HAS_IOMEM [=y] && BACKLIGHT_LCD_SUPPORT [=n]
   Selected by [y]:
   - SAMSUNG_Q10 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && ACPI [=y]
   Selected by [m]:
   - ACPI_CMPC [=m] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && ACPI [=y] && INPUT [=y] && (RFKILL [=y] || RFKILL [=y]=n)


vim +177 include/linux/phy.h

00db8189d984d6 Andy Fleming 2005-07-30  175  
a4d00f179fcec7 Kumar Gala   2006-01-11  176  /* Used when trying to connect to a specific phy (mii bus id:phy device id) */
9d9326d3bc0ea9 Andy Fleming 2008-04-09 @177  #define PHY_ID_FMT "%s:%02x"
9d9326d3bc0ea9 Andy Fleming 2008-04-09  178  

:::::: The code at line 177 was first introduced by commit
:::::: 9d9326d3bc0ea9a8bbe40bf3e5e66c7b9858caa0 phy: Change mii_bus id field to a string

:::::: TO: Andy Fleming <afleming@freescale.com>
:::::: CC: Jeff Garzik <jgarzik@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
