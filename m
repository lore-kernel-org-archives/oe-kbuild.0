Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594FC7B
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Mar 2023 13:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678542174; x=1710078174;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZBJhYJPrN+RCQynnHei321mbBiqN1qIomclVh0jg1Vc=;
  b=hck19b7hjbeB3ZssGi1ORPJQTFFIfg9swSuuBmq6ChPXjWGuvRpslrmt
   hW6DaC91awEJyeWpIGUIzafMb5NWImEP7k4CqUArssddLmhrSXhi1w1/O
   Ddq0hoQq7cAAlHPLpqgPZqjAIUC+MoA6e7nxCCphrv0bj02/fbfuUkppH
   /KsjS4npUyRuMwcRkbHWFHaggHzLJaT9jXkWyZTf7PogcaexvTJmEBhBl
   jXBEhHTt4vsuM46d6SG4o7DY+llc6m4m667wYtJJQO5478dJuLVZVRWHl
   vN6UZ4vZdGflD2ofHnueuBbywMalmvp/M9bwpuVXuYZtA66Mg2RyoMrLm
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="338459916"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="338459916"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 05:42:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="680507402"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="680507402"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Mar 2023 05:42:52 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pazUq-0004bT-0T;
	Sat, 11 Mar 2023 13:42:52 +0000
Date: Sat, 11 Mar 2023 21:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 1/4] PCI: Introduce pci_dev_for_each_resource()
Message-ID: <202303112149.xD47qKOY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230310171416.23356-2-andriy.shevchenko@linux.intel.com>
References: <20230310171416.23356-2-andriy.shevchenko@linux.intel.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: "Mickaël Salaün" <mic@digikod.net>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Mika Westerberg <mika.westerberg@linux.intel.com>
TO: "Krzysztof Wilczyński" <kw@linux.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Randy Dunlap <rdunlap@infradead.org>
TO: Arnd Bergmann <arnd@arndb.de>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
TO: Niklas Schnelle <schnelle@linux.ibm.com>
TO: "Pali Rohár" <pali@kernel.org>
TO: "Maciej W. Rozycki" <macro@orcam.me.uk>
TO: Juergen Gross <jgross@suse.com>
TO: Dominik Brodowski <linux@dominikbrodowski.net>
TO: linux-kernel@vger.kernel.org
TO: linux-alpha@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-mips@vger.kernel.org
TO: linuxppc-dev@lists.ozlabs.org
TO: linux-sh@vger.kernel.org
TO: sparclinux@vger.kernel.org
TO: linux-pci@vger.kernel.org
TO: xen-devel@lists.xenproject.org
TO: linux-acpi@vger.kernel.org
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Richard Henderson <richard.henderson@linaro.org>
CC: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
CC: Matt Turner <mattst88@gmail.com>
CC: Russell King <linux@armlinux.org.uk>
CC: Andrew Lunn <andrew@lunn.ch>

Hi Andy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus powerpc/next powerpc/fixes linus/master v6.3-rc1 next-20230310]
[cannot apply to soc/for-next davem-sparc/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/PCI-Introduce-pci_dev_for_each_resource/20230311-011642
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20230310171416.23356-2-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v4 1/4] PCI: Introduce pci_dev_for_each_resource()
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230311/202303112149.xD47qKOY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303112149.xD47qKOY-lkp@intel.com/

smatch warnings:
drivers/pnp/quirks.c:248 quirk_system_pci_resources() warn: was && intended here instead of ||?

vim +248 drivers/pnp/quirks.c

0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  228  
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  229  static void quirk_system_pci_resources(struct pnp_dev *dev)
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  230  {
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  231  	struct pci_dev *pdev = NULL;
059b4a086017fb Mika Westerberg 2023-03-10  232  	struct resource *res, *r;
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  233  	int i, j;
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  234  
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  235  	/*
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  236  	 * Some BIOSes have PNP motherboard devices with resources that
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  237  	 * partially overlap PCI BARs.  The PNP system driver claims these
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  238  	 * motherboard resources, which prevents the normal PCI driver from
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  239  	 * requesting them later.
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  240  	 *
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  241  	 * This patch disables the PNP resources that conflict with PCI BARs
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  242  	 * so they won't be claimed by the PNP system driver.
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  243  	 */
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  244  	for_each_pci_dev(pdev) {
059b4a086017fb Mika Westerberg 2023-03-10  245  		pci_dev_for_each_resource(pdev, r, i) {
059b4a086017fb Mika Westerberg 2023-03-10  246  			unsigned long type = resource_type(r);
999ed65ad12e37 Rene Herman     2008-07-25  247  
059b4a086017fb Mika Westerberg 2023-03-10 @248  			if (type != IORESOURCE_IO || type != IORESOURCE_MEM ||
059b4a086017fb Mika Westerberg 2023-03-10  249  			    resource_size(r) == 0)
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  250  				continue;
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  251  
059b4a086017fb Mika Westerberg 2023-03-10  252  			if (r->flags & IORESOURCE_UNSET)
f7834c092c4299 Bjorn Helgaas   2015-03-03  253  				continue;
f7834c092c4299 Bjorn Helgaas   2015-03-03  254  
95ab3669f78306 Bjorn Helgaas   2008-04-28  255  			for (j = 0;
999ed65ad12e37 Rene Herman     2008-07-25  256  			     (res = pnp_get_resource(dev, type, j)); j++) {
aee3ad815dd291 Bjorn Helgaas   2008-06-27  257  				if (res->start == 0 && res->end == 0)
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  258  					continue;
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  259  
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  260  				/*
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  261  				 * If the PNP region doesn't overlap the PCI
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  262  				 * region at all, there's no problem.
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  263  				 */
059b4a086017fb Mika Westerberg 2023-03-10  264  				if (!resource_overlaps(res, r))
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  265  					continue;
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  266  
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  267  				/*
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  268  				 * If the PNP region completely encloses (or is
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  269  				 * at least as large as) the PCI region, that's
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  270  				 * also OK.  For example, this happens when the
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  271  				 * PNP device describes a bridge with PCI
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  272  				 * behind it.
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  273  				 */
059b4a086017fb Mika Westerberg 2023-03-10  274  				if (res->start <= r->start && res->end >= r->end)
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  275  					continue;
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  276  
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  277  				/*
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  278  				 * Otherwise, the PNP region overlaps *part* of
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  279  				 * the PCI region, and that might prevent a PCI
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  280  				 * driver from requesting its resources.
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  281  				 */
c7dabef8a2c59e Bjorn Helgaas   2009-10-27  282  				dev_warn(&dev->dev,
059b4a086017fb Mika Westerberg 2023-03-10  283  					 "disabling %pR because it overlaps %s BAR %d %pR\n",
059b4a086017fb Mika Westerberg 2023-03-10  284  					 res, pci_name(pdev), i, r);
4b34fe156455d2 Bjorn Helgaas   2008-06-02  285  				res->flags |= IORESOURCE_DISABLED;
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  286  			}
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  287  		}
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  288  	}
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  289  }
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  290  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
