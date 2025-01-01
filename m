Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D132D46B5
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Jan 2025 02:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735697213; cv=none; b=sHkmjKAYmst69Vyp5Ewi3B1aLwXxBgaSfxU5R/m5/sAWnzJT4s58uAHWcxF7BFcfFmDMixk4j+5qaBdgG9Ipz+0RLgjT7yNZXUz5KCTdaAcZqRpjcL1KZwFD3+IaBnnPin2b6oMP75imlw/IrpVGNgkKP5yilWyj9DNnB/11zIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735697213; c=relaxed/simple;
	bh=u1jBCYvu8XEC2BYv5EROJ6WYXnogIOzxAi7BsbgpB88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gdiNge/4eQLThgaD21vT6VJj50OVQin7K7nPWOn2339A4EUjYka9fIe8QEHXsEx3lWaV3Y39BPp+txrPugMk+3XErquXElXhjbmaC0l+n6KtWAKPDcv4LtPu9nxEUdWIvYfnCwl/tgAa8PWkVW87VzS3ZEM09aU1uhnkJAhcgFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DF5wzEun; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DF5wzEun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735697211; x=1767233211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u1jBCYvu8XEC2BYv5EROJ6WYXnogIOzxAi7BsbgpB88=;
  b=DF5wzEunxO8CD9NYEpx3fLtCjhraVVj73MBZes6umQRWsCoD2u2adejz
   1klzMtfL74KZBJjlQJd0HDiSsAwba/pLdr+l9X5Ja3VWregYDtnaJHC5L
   az9BkPeGBj09m0vTkvmYyI5faNESSzWtZMw1ZHJB5kYkPIoZEcdImtGHN
   G1VZ57i/iqFOcyFAdhY/04T9uJXYokQV4Ph2r3/tfw0IAwchuIkQf5+Wl
   BFo+bAS43kNLz8gb5hsDVrslC3oA/0czgc098/xLUS+0H3EgjBz22dCdY
   m574t5hXSbibCIg3lwycxIi/E7m6FEjhQqKgvMk+7Q1FO6Uwnx7mbX33x
   g==;
X-CSE-ConnectionGUID: vMziUT1XQ1mCeATZ9YwjVg==
X-CSE-MsgGUID: 82h8E4woQhSAOOFhQaFnvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="53514485"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="53514485"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 18:06:50 -0800
X-CSE-ConnectionGUID: td+6do8PQc2L36raoICtlg==
X-CSE-MsgGUID: CCe672mgRImplFSqJ1+MMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="106147061"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Dec 2024 18:06:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSo8E-0007Zr-0p;
	Wed, 01 Jan 2025 02:06:46 +0000
Date: Wed, 1 Jan 2025 10:06:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/acpi/tables.c:198:5-35: opportunity for
 str_enabled_disabled(( p -> flags & ACPI_MADT_ENABLED ))
Message-ID: <202501010947.0e3GVHNa-lkp@intel.com>
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
TO: Sunil V L <sunilvl@ventanamicro.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
commit: a91a9ffbd3a55a0ae1bb75e2b6e85b2a03f64e8f RISC-V: Add support to build the ACPI core
date:   1 year, 7 months ago
:::::: branch date: 31 hours ago
:::::: commit date: 1 year, 7 months ago
config: riscv-randconfig-r061-20250101 (https://download.01.org/0day-ci/archive/20250101/202501010947.0e3GVHNa-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501010947.0e3GVHNa-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/acpi/tables.c:198:5-35: opportunity for str_enabled_disabled(( p -> flags & ACPI_MADT_ENABLED ))
   drivers/acpi/tables.c:219:5-35: opportunity for str_enabled_disabled(( p -> flags & ACPI_MADT_ENABLED ))
   drivers/acpi/tables.c:229:5-35: opportunity for str_enabled_disabled(( p -> flags & ACPI_MADT_ENABLED ))
>> drivers/acpi/tables.c:71:5-41: opportunity for str_enabled_disabled(( p -> lapic_flags & ACPI_MADT_ENABLED ))
   drivers/acpi/tables.c:81:5-41: opportunity for str_enabled_disabled(( p -> lapic_flags & ACPI_MADT_ENABLED ))
   drivers/acpi/tables.c:175:5-41: opportunity for str_enabled_disabled(( p -> lapic_flags & ACPI_MADT_ENABLED ))

vim +198 drivers/acpi/tables.c

4fc0a7e889e554 Lv Zheng            2014-05-31   57  
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02   58  void acpi_table_print_madt_entry(struct acpi_subtable_header *header)
^1da177e4c3f41 Linus Torvalds      2005-04-16   59  {
^1da177e4c3f41 Linus Torvalds      2005-04-16   60  	if (!header)
^1da177e4c3f41 Linus Torvalds      2005-04-16   61  		return;
^1da177e4c3f41 Linus Torvalds      2005-04-16   62  
^1da177e4c3f41 Linus Torvalds      2005-04-16   63  	switch (header->type) {
^1da177e4c3f41 Linus Torvalds      2005-04-16   64  
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02   65  	case ACPI_MADT_TYPE_LOCAL_APIC:
^1da177e4c3f41 Linus Torvalds      2005-04-16   66  		{
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02   67  			struct acpi_madt_local_apic *p =
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02   68  			    (struct acpi_madt_local_apic *)header;
07f438df228864 Hanjun Guo          2015-03-24   69  			pr_debug("LAPIC (acpi_id[0x%02x] lapic_id[0x%02x] %s)\n",
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02   70  				 p->processor_id, p->id,
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  @71  				 (p->lapic_flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
^1da177e4c3f41 Linus Torvalds      2005-04-16   72  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16   73  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16   74  
7237d3de78ff89 Suresh Siddha       2009-03-30   75  	case ACPI_MADT_TYPE_LOCAL_X2APIC:
7237d3de78ff89 Suresh Siddha       2009-03-30   76  		{
7237d3de78ff89 Suresh Siddha       2009-03-30   77  			struct acpi_madt_local_x2apic *p =
7237d3de78ff89 Suresh Siddha       2009-03-30   78  			    (struct acpi_madt_local_x2apic *)header;
07f438df228864 Hanjun Guo          2015-03-24   79  			pr_debug("X2APIC (apic_id[0x%02x] uid[0x%02x] %s)\n",
7237d3de78ff89 Suresh Siddha       2009-03-30   80  				 p->local_apic_id, p->uid,
730bf5ebb4dfb3 Hanjun Guo          2014-02-20   81  				 (p->lapic_flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
7237d3de78ff89 Suresh Siddha       2009-03-30   82  		}
7237d3de78ff89 Suresh Siddha       2009-03-30   83  		break;
7237d3de78ff89 Suresh Siddha       2009-03-30   84  
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02   85  	case ACPI_MADT_TYPE_IO_APIC:
^1da177e4c3f41 Linus Torvalds      2005-04-16   86  		{
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02   87  			struct acpi_madt_io_apic *p =
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02   88  			    (struct acpi_madt_io_apic *)header;
07f438df228864 Hanjun Guo          2015-03-24   89  			pr_debug("IOAPIC (id[0x%02x] address[0x%08x] gsi_base[%d])\n",
^1da177e4c3f41 Linus Torvalds      2005-04-16   90  				 p->id, p->address, p->global_irq_base);
^1da177e4c3f41 Linus Torvalds      2005-04-16   91  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16   92  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16   93  
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02   94  	case ACPI_MADT_TYPE_INTERRUPT_OVERRIDE:
^1da177e4c3f41 Linus Torvalds      2005-04-16   95  		{
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02   96  			struct acpi_madt_interrupt_override *p =
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02   97  			    (struct acpi_madt_interrupt_override *)header;
730bf5ebb4dfb3 Hanjun Guo          2014-02-20   98  			pr_info("INT_SRC_OVR (bus %d bus_irq %d global_irq %d %s %s)\n",
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02   99  				p->bus, p->source_irq, p->global_irq,
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  100  				mps_inti_flags_polarity[p->inti_flags & ACPI_MADT_POLARITY_MASK],
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  101  				mps_inti_flags_trigger[(p->inti_flags & ACPI_MADT_TRIGGER_MASK) >> 2]);
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  102  			if (p->inti_flags  &
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  103  			    ~(ACPI_MADT_POLARITY_MASK | ACPI_MADT_TRIGGER_MASK))
730bf5ebb4dfb3 Hanjun Guo          2014-02-20  104  				pr_info("INT_SRC_OVR unexpected reserved flags: 0x%x\n",
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  105  					p->inti_flags  &
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  106  					~(ACPI_MADT_POLARITY_MASK | ACPI_MADT_TRIGGER_MASK));
^1da177e4c3f41 Linus Torvalds      2005-04-16  107  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  108  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  109  
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  110  	case ACPI_MADT_TYPE_NMI_SOURCE:
^1da177e4c3f41 Linus Torvalds      2005-04-16  111  		{
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  112  			struct acpi_madt_nmi_source *p =
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  113  			    (struct acpi_madt_nmi_source *)header;
730bf5ebb4dfb3 Hanjun Guo          2014-02-20  114  			pr_info("NMI_SRC (%s %s global_irq %d)\n",
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  115  				mps_inti_flags_polarity[p->inti_flags & ACPI_MADT_POLARITY_MASK],
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  116  				mps_inti_flags_trigger[(p->inti_flags & ACPI_MADT_TRIGGER_MASK) >> 2],
4be44fcd3bf648 Len Brown           2005-08-05  117  				p->global_irq);
^1da177e4c3f41 Linus Torvalds      2005-04-16  118  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  119  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  120  
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  121  	case ACPI_MADT_TYPE_LOCAL_APIC_NMI:
^1da177e4c3f41 Linus Torvalds      2005-04-16  122  		{
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  123  			struct acpi_madt_local_apic_nmi *p =
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  124  			    (struct acpi_madt_local_apic_nmi *)header;
730bf5ebb4dfb3 Hanjun Guo          2014-02-20  125  			pr_info("LAPIC_NMI (acpi_id[0x%02x] %s %s lint[0x%x])\n",
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  126  				p->processor_id,
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  127  				mps_inti_flags_polarity[p->inti_flags & ACPI_MADT_POLARITY_MASK	],
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  128  				mps_inti_flags_trigger[(p->inti_flags & ACPI_MADT_TRIGGER_MASK) >> 2],
4be44fcd3bf648 Len Brown           2005-08-05  129  				p->lint);
7237d3de78ff89 Suresh Siddha       2009-03-30  130  		}
7237d3de78ff89 Suresh Siddha       2009-03-30  131  		break;
7237d3de78ff89 Suresh Siddha       2009-03-30  132  
7237d3de78ff89 Suresh Siddha       2009-03-30  133  	case ACPI_MADT_TYPE_LOCAL_X2APIC_NMI:
7237d3de78ff89 Suresh Siddha       2009-03-30  134  		{
7237d3de78ff89 Suresh Siddha       2009-03-30  135  			u16 polarity, trigger;
7237d3de78ff89 Suresh Siddha       2009-03-30  136  			struct acpi_madt_local_x2apic_nmi *p =
7237d3de78ff89 Suresh Siddha       2009-03-30  137  			    (struct acpi_madt_local_x2apic_nmi *)header;
7237d3de78ff89 Suresh Siddha       2009-03-30  138  
7237d3de78ff89 Suresh Siddha       2009-03-30  139  			polarity = p->inti_flags & ACPI_MADT_POLARITY_MASK;
7237d3de78ff89 Suresh Siddha       2009-03-30  140  			trigger = (p->inti_flags & ACPI_MADT_TRIGGER_MASK) >> 2;
7237d3de78ff89 Suresh Siddha       2009-03-30  141  
730bf5ebb4dfb3 Hanjun Guo          2014-02-20  142  			pr_info("X2APIC_NMI (uid[0x%02x] %s %s lint[0x%x])\n",
7237d3de78ff89 Suresh Siddha       2009-03-30  143  				p->uid,
7237d3de78ff89 Suresh Siddha       2009-03-30  144  				mps_inti_flags_polarity[polarity],
7237d3de78ff89 Suresh Siddha       2009-03-30  145  				mps_inti_flags_trigger[trigger],
7237d3de78ff89 Suresh Siddha       2009-03-30  146  				p->lint);
^1da177e4c3f41 Linus Torvalds      2005-04-16  147  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  148  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  149  
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  150  	case ACPI_MADT_TYPE_LOCAL_APIC_OVERRIDE:
^1da177e4c3f41 Linus Torvalds      2005-04-16  151  		{
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  152  			struct acpi_madt_local_apic_override *p =
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  153  			    (struct acpi_madt_local_apic_override *)header;
0b1be2c085aba9 Vasant Hegde        2022-03-17  154  			pr_info("LAPIC_ADDR_OVR (address[0x%llx])\n",
0b1be2c085aba9 Vasant Hegde        2022-03-17  155  				p->address);
^1da177e4c3f41 Linus Torvalds      2005-04-16  156  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  157  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  158  
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  159  	case ACPI_MADT_TYPE_IO_SAPIC:
^1da177e4c3f41 Linus Torvalds      2005-04-16  160  		{
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  161  			struct acpi_madt_io_sapic *p =
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  162  			    (struct acpi_madt_io_sapic *)header;
07f438df228864 Hanjun Guo          2015-03-24  163  			pr_debug("IOSAPIC (id[0x%x] address[%p] gsi_base[%d])\n",
4be44fcd3bf648 Len Brown           2005-08-05  164  				 p->id, (void *)(unsigned long)p->address,
4be44fcd3bf648 Len Brown           2005-08-05  165  				 p->global_irq_base);
^1da177e4c3f41 Linus Torvalds      2005-04-16  166  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  167  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  168  
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  169  	case ACPI_MADT_TYPE_LOCAL_SAPIC:
^1da177e4c3f41 Linus Torvalds      2005-04-16  170  		{
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  171  			struct acpi_madt_local_sapic *p =
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  172  			    (struct acpi_madt_local_sapic *)header;
07f438df228864 Hanjun Guo          2015-03-24  173  			pr_debug("LSAPIC (acpi_id[0x%02x] lsapic_id[0x%02x] lsapic_eid[0x%02x] %s)\n",
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  174  				 p->processor_id, p->id, p->eid,
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  175  				 (p->lapic_flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
^1da177e4c3f41 Linus Torvalds      2005-04-16  176  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  177  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  178  
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  179  	case ACPI_MADT_TYPE_INTERRUPT_SOURCE:
^1da177e4c3f41 Linus Torvalds      2005-04-16  180  		{
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  181  			struct acpi_madt_interrupt_source *p =
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  182  			    (struct acpi_madt_interrupt_source *)header;
730bf5ebb4dfb3 Hanjun Guo          2014-02-20  183  			pr_info("PLAT_INT_SRC (%s %s type[0x%x] id[0x%04x] eid[0x%x] iosapic_vector[0x%x] global_irq[0x%x]\n",
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  184  				mps_inti_flags_polarity[p->inti_flags & ACPI_MADT_POLARITY_MASK],
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  185  				mps_inti_flags_trigger[(p->inti_flags & ACPI_MADT_TRIGGER_MASK) >> 2],
5f3b1a8b6737b0 Alexey Starikovskiy 2007-02-02  186  				p->type, p->id, p->eid, p->io_sapic_vector,
4be44fcd3bf648 Len Brown           2005-08-05  187  				p->global_irq);
^1da177e4c3f41 Linus Torvalds      2005-04-16  188  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  189  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  190  
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  191  	case ACPI_MADT_TYPE_GENERIC_INTERRUPT:
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  192  		{
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  193  			struct acpi_madt_generic_interrupt *p =
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  194  				(struct acpi_madt_generic_interrupt *)header;
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  195  			pr_debug("GICC (acpi_id[0x%04x] address[%llx] MPIDR[0x%llx] %s)\n",
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  196  				 p->uid, p->base_address,
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  197  				 p->arm_mpidr,
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24 @198  				 (p->flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  199  
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  200  		}
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  201  		break;
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  202  
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  203  	case ACPI_MADT_TYPE_GENERIC_DISTRIBUTOR:
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  204  		{
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  205  			struct acpi_madt_generic_distributor *p =
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  206  				(struct acpi_madt_generic_distributor *)header;
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  207  			pr_debug("GIC Distributor (gic_id[0x%04x] address[%llx] gsi_base[%d])\n",
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  208  				 p->gic_id, p->base_address,
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  209  				 p->global_irq_base);
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  210  		}
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  211  		break;
4c1c8d7a7ebc8b Hanjun Guo          2015-03-24  212  
4125d10d5f7c15 Huacai Chen         2022-11-02  213  	case ACPI_MADT_TYPE_CORE_PIC:
4125d10d5f7c15 Huacai Chen         2022-11-02  214  		{
4125d10d5f7c15 Huacai Chen         2022-11-02  215  			struct acpi_madt_core_pic *p = (struct acpi_madt_core_pic *)header;
4125d10d5f7c15 Huacai Chen         2022-11-02  216  
4125d10d5f7c15 Huacai Chen         2022-11-02  217  			pr_debug("CORE PIC (processor_id[0x%02x] core_id[0x%02x] %s)\n",
4125d10d5f7c15 Huacai Chen         2022-11-02  218  				 p->processor_id, p->core_id,
4125d10d5f7c15 Huacai Chen         2022-11-02  219  				 (p->flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
4125d10d5f7c15 Huacai Chen         2022-11-02  220  		}
4125d10d5f7c15 Huacai Chen         2022-11-02  221  		break;
4125d10d5f7c15 Huacai Chen         2022-11-02  222  
4d02d88d2b9228 Sunil V L           2023-05-15  223  	case ACPI_MADT_TYPE_RINTC:
4d02d88d2b9228 Sunil V L           2023-05-15  224  		{
4d02d88d2b9228 Sunil V L           2023-05-15  225  			struct acpi_madt_rintc *p = (struct acpi_madt_rintc *)header;
4d02d88d2b9228 Sunil V L           2023-05-15  226  
4d02d88d2b9228 Sunil V L           2023-05-15  227  			pr_debug("RISC-V INTC (acpi_uid[0x%04x] hart_id[0x%llx] %s)\n",
4d02d88d2b9228 Sunil V L           2023-05-15  228  				 p->uid, p->hart_id,
4d02d88d2b9228 Sunil V L           2023-05-15  229  				 (p->flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
4d02d88d2b9228 Sunil V L           2023-05-15  230  		}
4d02d88d2b9228 Sunil V L           2023-05-15  231  		break;
4d02d88d2b9228 Sunil V L           2023-05-15  232  
^1da177e4c3f41 Linus Torvalds      2005-04-16  233  	default:
730bf5ebb4dfb3 Hanjun Guo          2014-02-20  234  		pr_warn("Found unsupported MADT entry (type = 0x%x)\n",
^1da177e4c3f41 Linus Torvalds      2005-04-16  235  			header->type);
^1da177e4c3f41 Linus Torvalds      2005-04-16  236  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  237  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  238  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  239  

:::::: The code at line 198 was first introduced by commit
:::::: 4c1c8d7a7ebc8b909493a14b21b233e5377b69aa ACPI / table: Print GIC information when MADT is parsed

:::::: TO: Hanjun Guo <hanjun.guo@linaro.org>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
