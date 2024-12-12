Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B73520ADE7
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 07:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733988181; cv=none; b=C/CXBr+K0nCCx6G/NN1cr6o0ib+9390YFfY9alAPLCf1ZFm5UPi5LhXKKz7lUCq+IUfLcBZF5rQ9UBwqu+yToQ+1qZ2uQt5zEqcDOIwQAu/Vejni/6XoeV0prqac/Zex64LPwFzm9io9MINBXIkBRJCZpds1oddQnB3/3DkeD1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733988181; c=relaxed/simple;
	bh=L/l0MQue1xPzabz1tCaGsICZLv0uNyVuCZhjVKc5kRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LX3ctpqSajPgOg5X0kS5LoYzU1XqFDwiSf/zxz64YYrFs7i3Dqygv8yCuL4DXoiD4QxeXIUrm8mcWjskOpRrjiK0lUmF2nix8dxwVUuQZ9fvDTONw+qN1cAz0BEv8UGcq8Lx1vBjqfRgsdO2jMCH4UHOFgpvUp0YXhGAmyGXi5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nAJ+F1On; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAJ+F1On"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733988179; x=1765524179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L/l0MQue1xPzabz1tCaGsICZLv0uNyVuCZhjVKc5kRM=;
  b=nAJ+F1OnC7s0LMe0aW6jmmNF7nW4ZMDXzR+qeaPlIdefqYIQVHNU0UdH
   6GUcA1Qdv2TrebIwG6CV/Kba3mNwSc2tegUYzMirSve11LQYBVr39gojw
   GgBMRzZqxLhNAHysvaAofv8qv3gn5TGoSi3RZ6gpb1f0P+C2XFZg3EXbY
   HsNU9B+LxepdclQmxVdtMzkZMwrcOK7zJsJO46CefvUreDL/ih5BJfCZe
   kay40a1gtNp9BDjRFZu9JTYXE7Pf4gf6eb+6XfkX+V4ceBXx/2jW7j7Rd
   8WDzzZZ7EUKNnXlINHxO6AwerctA2w8/FE9zdFzknhaMMerh87WNwxdZ9
   A==;
X-CSE-ConnectionGUID: XvFPY0XrTAukwwOIaFNXpg==
X-CSE-MsgGUID: BEh8iaEiRwSBhwVA1tOEBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="51921970"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="51921970"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 23:22:55 -0800
X-CSE-ConnectionGUID: 2peo+0rITtesGxvZUg9VMA==
X-CSE-MsgGUID: hZaL313JRbOQKWY7teh8KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="101247844"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Dec 2024 23:22:53 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLdX7-0007ZL-2z;
	Thu, 12 Dec 2024 07:22:49 +0000
Date: Thu, 12 Dec 2024 15:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/acpi/numa/srat.c:178:5-41: opportunity for
 str_enabled_disabled(( p -> flags & ACPI_SRAT_RINTC_ENABLED ))
Message-ID: <202412121554.ld4S90Hf-lkp@intel.com>
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
TO: Haibo Xu <haibo1.xu@intel.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Sunil V L <sunilvl@ventanamicro.com>
CC: Hanjun Guo <guohanjun@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   231825b2e1ff6ba799c5eaf396d3ab2354e37c6b
commit: 39494aec8a0454f9e8a68d2422d3bd4e5c5ee0c7 ACPI: NUMA: Add handler for SRAT RINTC affinity structure
date:   5 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-104-20241212 (https://download.01.org/0day-ci/archive/20241212/202412121554.ld4S90Hf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412121554.ld4S90Hf-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
   drivers/acpi/numa/srat.c:94:5-39: opportunity for str_enabled_disabled(( p -> flags & ACPI_SRAT_CPU_ENABLED ))
   drivers/acpi/numa/srat.c:123:5-39: opportunity for str_enabled_disabled(( p -> flags & ACPI_SRAT_CPU_ENABLED ))
   drivers/acpi/numa/srat.c:154:5-52: opportunity for str_enabled_disabled(( p -> flags & ACPI_SRAT_GENERIC_AFFINITY_ENABLED ))
   drivers/acpi/numa/srat.c:165:4-51: opportunity for str_enabled_disabled(( p -> flags & ACPI_SRAT_GENERIC_AFFINITY_ENABLED ))
   drivers/acpi/numa/srat.c:135:5-40: opportunity for str_enabled_disabled(( p -> flags & ACPI_SRAT_GICC_ENABLED ))
   drivers/acpi/numa/srat.c:107:5-39: opportunity for str_enabled_disabled(( p -> flags & ACPI_SRAT_MEM_ENABLED ))
>> drivers/acpi/numa/srat.c:178:5-41: opportunity for str_enabled_disabled(( p -> flags & ACPI_SRAT_RINTC_ENABLED ))

vim +178 drivers/acpi/numa/srat.c

762834e8bf46bf drivers/acpi/numa.c      Yasunori Goto       2006-06-23   82  
ae2c6dcf90c5a9 drivers/acpi/numa.c      David Rientjes      2007-07-21   83  static void __init
ae2c6dcf90c5a9 drivers/acpi/numa.c      David Rientjes      2007-07-21   84  acpi_table_print_srat_entry(struct acpi_subtable_header *header)
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16   85  {
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16   86  	switch (header->type) {
15a58ed1214293 drivers/acpi/numa.c      Alexey Starikovskiy 2007-02-02   87  	case ACPI_SRAT_TYPE_CPU_AFFINITY:
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16   88  		{
15a58ed1214293 drivers/acpi/numa.c      Alexey Starikovskiy 2007-02-02   89  			struct acpi_srat_cpu_affinity *p =
15a58ed1214293 drivers/acpi/numa.c      Alexey Starikovskiy 2007-02-02   90  			    (struct acpi_srat_cpu_affinity *)header;
3dda448189af1c drivers/acpi/numa.c      Hanjun Guo          2016-05-24   91  			pr_debug("SRAT Processor (id[0x%02x] eid[0x%02x]) in proximity domain %d %s\n",
15a58ed1214293 drivers/acpi/numa.c      Alexey Starikovskiy 2007-02-02   92  				 p->apic_id, p->local_sapic_eid,
15a58ed1214293 drivers/acpi/numa.c      Alexey Starikovskiy 2007-02-02   93  				 p->proximity_domain_lo,
15a58ed1214293 drivers/acpi/numa.c      Alexey Starikovskiy 2007-02-02   94  				 (p->flags & ACPI_SRAT_CPU_ENABLED) ?
3dda448189af1c drivers/acpi/numa.c      Hanjun Guo          2016-05-24   95  				 "enabled" : "disabled");
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16   96  		}
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16   97  		break;
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16   98  
15a58ed1214293 drivers/acpi/numa.c      Alexey Starikovskiy 2007-02-02   99  	case ACPI_SRAT_TYPE_MEMORY_AFFINITY:
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16  100  		{
15a58ed1214293 drivers/acpi/numa.c      Alexey Starikovskiy 2007-02-02  101  			struct acpi_srat_mem_affinity *p =
15a58ed1214293 drivers/acpi/numa.c      Alexey Starikovskiy 2007-02-02  102  			    (struct acpi_srat_mem_affinity *)header;
b9ced18acf68df drivers/acpi/numa.c      Chao Fan            2018-12-26  103  			pr_debug("SRAT Memory (0x%llx length 0x%llx) in proximity domain %d %s%s%s\n",
b9ced18acf68df drivers/acpi/numa.c      Chao Fan            2018-12-26  104  				 (unsigned long long)p->base_address,
b9ced18acf68df drivers/acpi/numa.c      Chao Fan            2018-12-26  105  				 (unsigned long long)p->length,
19d0cfe9ddfdf7 drivers/acpi/numa.c      Bob Moore           2008-06-10  106  				 p->proximity_domain,
15a58ed1214293 drivers/acpi/numa.c      Alexey Starikovskiy 2007-02-02  107  				 (p->flags & ACPI_SRAT_MEM_ENABLED) ?
15a58ed1214293 drivers/acpi/numa.c      Alexey Starikovskiy 2007-02-02  108  				 "enabled" : "disabled",
15a58ed1214293 drivers/acpi/numa.c      Alexey Starikovskiy 2007-02-02  109  				 (p->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) ?
208f6cc9e5f83c drivers/acpi/numa.c      Davidlohr Bueso     2013-01-09  110  				 " hot-pluggable" : "",
208f6cc9e5f83c drivers/acpi/numa.c      Davidlohr Bueso     2013-01-09  111  				 (p->flags & ACPI_SRAT_MEM_NON_VOLATILE) ?
3dda448189af1c drivers/acpi/numa.c      Hanjun Guo          2016-05-24  112  				 " non-volatile" : "");
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16  113  		}
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16  114  		break;
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16  115  
7237d3de78ff89 drivers/acpi/numa.c      Suresh Siddha       2009-03-30  116  	case ACPI_SRAT_TYPE_X2APIC_CPU_AFFINITY:
7237d3de78ff89 drivers/acpi/numa.c      Suresh Siddha       2009-03-30  117  		{
7237d3de78ff89 drivers/acpi/numa.c      Suresh Siddha       2009-03-30  118  			struct acpi_srat_x2apic_cpu_affinity *p =
7237d3de78ff89 drivers/acpi/numa.c      Suresh Siddha       2009-03-30  119  			    (struct acpi_srat_x2apic_cpu_affinity *)header;
3dda448189af1c drivers/acpi/numa.c      Hanjun Guo          2016-05-24  120  			pr_debug("SRAT Processor (x2apicid[0x%08x]) in proximity domain %d %s\n",
7237d3de78ff89 drivers/acpi/numa.c      Suresh Siddha       2009-03-30  121  				 p->apic_id,
7237d3de78ff89 drivers/acpi/numa.c      Suresh Siddha       2009-03-30  122  				 p->proximity_domain,
7237d3de78ff89 drivers/acpi/numa.c      Suresh Siddha       2009-03-30  123  				 (p->flags & ACPI_SRAT_CPU_ENABLED) ?
3dda448189af1c drivers/acpi/numa.c      Hanjun Guo          2016-05-24  124  				 "enabled" : "disabled");
7237d3de78ff89 drivers/acpi/numa.c      Suresh Siddha       2009-03-30  125  		}
7237d3de78ff89 drivers/acpi/numa.c      Suresh Siddha       2009-03-30  126  		break;
3dda448189af1c drivers/acpi/numa.c      Hanjun Guo          2016-05-24  127  
4bac6fa73db77d drivers/acpi/numa.c      Hanjun Guo          2016-06-17  128  	case ACPI_SRAT_TYPE_GICC_AFFINITY:
4bac6fa73db77d drivers/acpi/numa.c      Hanjun Guo          2016-06-17  129  		{
4bac6fa73db77d drivers/acpi/numa.c      Hanjun Guo          2016-06-17  130  			struct acpi_srat_gicc_affinity *p =
4bac6fa73db77d drivers/acpi/numa.c      Hanjun Guo          2016-06-17  131  			    (struct acpi_srat_gicc_affinity *)header;
4bac6fa73db77d drivers/acpi/numa.c      Hanjun Guo          2016-06-17  132  			pr_debug("SRAT Processor (acpi id[0x%04x]) in proximity domain %d %s\n",
4bac6fa73db77d drivers/acpi/numa.c      Hanjun Guo          2016-06-17  133  				 p->acpi_processor_uid,
4bac6fa73db77d drivers/acpi/numa.c      Hanjun Guo          2016-06-17  134  				 p->proximity_domain,
4bac6fa73db77d drivers/acpi/numa.c      Hanjun Guo          2016-06-17  135  				 (p->flags & ACPI_SRAT_GICC_ENABLED) ?
4bac6fa73db77d drivers/acpi/numa.c      Hanjun Guo          2016-06-17  136  				 "enabled" : "disabled");
4bac6fa73db77d drivers/acpi/numa.c      Hanjun Guo          2016-06-17  137  		}
4bac6fa73db77d drivers/acpi/numa.c      Hanjun Guo          2016-06-17  138  		break;
4bac6fa73db77d drivers/acpi/numa.c      Hanjun Guo          2016-06-17  139  
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  140  	case ACPI_SRAT_TYPE_GENERIC_AFFINITY:
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  141  	{
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  142  		struct acpi_srat_generic_affinity *p =
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  143  			(struct acpi_srat_generic_affinity *)header;
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  144  
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  145  		if (p->device_handle_type == 0) {
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  146  			/*
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  147  			 * For pci devices this may be the only place they
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  148  			 * are assigned a proximity domain
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  149  			 */
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  150  			pr_debug("SRAT Generic Initiator(Seg:%u BDF:%u) in proximity domain %d %s\n",
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  151  				 *(u16 *)(&p->device_handle[0]),
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  152  				 *(u16 *)(&p->device_handle[2]),
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  153  				 p->proximity_domain,
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  154  				 (p->flags & ACPI_SRAT_GENERIC_AFFINITY_ENABLED) ?
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  155  				"enabled" : "disabled");
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  156  		} else {
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  157  			/*
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  158  			 * In this case we can rely on the device having a
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  159  			 * proximity domain reference
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  160  			 */
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  161  			pr_debug("SRAT Generic Initiator(HID=%.8s UID=%.4s) in proximity domain %d %s\n",
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  162  				(char *)(&p->device_handle[0]),
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  163  				(char *)(&p->device_handle[8]),
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  164  				p->proximity_domain,
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  165  				(p->flags & ACPI_SRAT_GENERIC_AFFINITY_ENABLED) ?
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  166  				"enabled" : "disabled");
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  167  		}
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  168  	}
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  169  	break;
39494aec8a0454 drivers/acpi/numa/srat.c Haibo Xu            2024-06-13  170  
39494aec8a0454 drivers/acpi/numa/srat.c Haibo Xu            2024-06-13  171  	case ACPI_SRAT_TYPE_RINTC_AFFINITY:
39494aec8a0454 drivers/acpi/numa/srat.c Haibo Xu            2024-06-13  172  		{
39494aec8a0454 drivers/acpi/numa/srat.c Haibo Xu            2024-06-13  173  			struct acpi_srat_rintc_affinity *p =
39494aec8a0454 drivers/acpi/numa/srat.c Haibo Xu            2024-06-13  174  			    (struct acpi_srat_rintc_affinity *)header;
39494aec8a0454 drivers/acpi/numa/srat.c Haibo Xu            2024-06-13  175  			pr_debug("SRAT Processor (acpi id[0x%04x]) in proximity domain %d %s\n",
39494aec8a0454 drivers/acpi/numa/srat.c Haibo Xu            2024-06-13  176  				 p->acpi_processor_uid,
39494aec8a0454 drivers/acpi/numa/srat.c Haibo Xu            2024-06-13  177  				 p->proximity_domain,
39494aec8a0454 drivers/acpi/numa/srat.c Haibo Xu            2024-06-13 @178  				 (p->flags & ACPI_SRAT_RINTC_ENABLED) ?
39494aec8a0454 drivers/acpi/numa/srat.c Haibo Xu            2024-06-13  179  				 "enabled" : "disabled");
39494aec8a0454 drivers/acpi/numa/srat.c Haibo Xu            2024-06-13  180  		}
39494aec8a0454 drivers/acpi/numa/srat.c Haibo Xu            2024-06-13  181  		break;
39494aec8a0454 drivers/acpi/numa/srat.c Haibo Xu            2024-06-13  182  
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16  183  	default:
ac906a6d56b742 drivers/acpi/numa.c      Hanjun Guo          2016-05-24  184  		pr_warn("Found unsupported SRAT entry (type = 0x%x)\n",
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16  185  			header->type);
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16  186  		break;
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16  187  	}
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16  188  }
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16  189  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
