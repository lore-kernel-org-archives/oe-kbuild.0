Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506221;
	b=Ic2nq9IyZNm6cyn+OwANI/Hd8bSKvtfmdO9cUsUO/dyHhAHQ9T9gIl1o1pIqgssSXLqL
	 4QmD8jaEIBH/QroM3kwLzH0UI1LOgWy0RjerNfSUBVRpZbZbDJZQIwEkvjqj6IPXzCbPQ
	 c3LSSJVEhfeVXxCctBno2BCgzFmY53Abxp0E9dJUXWPeGruCiI0OpnGZDKcKOh5tL4gE4
	 NH3uVjvPDIiJM74fOTMSMsQ1G+nUK033uu+WIOjipAljFJqtinA9cQ3QUMHZYjLwwTmcx
	 AtU6afJMxfUh0PlJ+JbZE/kjxO9l74vmfGiu9JUyX4avj5utwlKuM6LYnhIcuh0eMyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506221;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=QvcCjwUzKSsLJGIniBzk2yX/YcQNp+l9X/CW8Fa++qs=;
	b=HpEh0i9Pu3tBf32FpJ9HaA+D2ya8BSs4Ci3QrgLkwowTByzAMjk7UlaiJzsrMa8MBJ4w
	 9B0fezGuBbUr7r8tfR19HfyalIwcLnmRXeZNxbiibvaFMn6KbpdXENSYjlMFg32QpiVwi
	 A9mvJ2Lg+spBO/4QiCqt/QJwKOtykzuIYI6skqXYsXX+lqL/yD54m67CxTbrTr5QkJdZl
	 Dgh2yMW0pf7qXOyqi0J0CBs02206R2bE+xFgenk3ZPwBYPqGEonf6ho2/yuqr2i8YJoJT
	 n0nlZ72O2v6pZGLUFX/UmbDLVv/kt6NpF2IwUczFXgbMgNKgqzBxa7X9A85upXxv9fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XKRKUCbV;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AF7606A31E
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Nov 2026 07:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59AF7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XKRKUCbV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795506220; x=1827042220;
  h=date:from:to:cc:subject:message-id;
  bh=QraJ+4G7PelY52lC0kaY2R+qcy65CvtFJ4eZVvUgKJA=;
  b=XKRKUCbVUgaGn/PPyB1aW+rmZCdpw/erosPp5vcvAVu3ZMuf8QaomCpp
   4t5EEFdJ2Z0nWyAqjChYHTrehTW4c0WuRYyiy5PMMrNYDCU0e2wmBZCur
   Z/xB7b6PxCq1qO3NVwllLQD2wUIiSUHBnOgT2Hz5KbBDlo7+Ce5dtbcRf
   EZS/qnsPLQPeEz/UYOmpx4GsB8Se3vT+SEi18spTQXNlPMD9ndnzQyN1/
   DlOa55IF7FB/l1n4dpYXAqGNadnKJek21LC9bXuNtqPAfoym9hbxvHcwM
   jUHLkCIPQobfec+osVclHFM6gZUin+yYk3me8/4Ct9+80/kn+C1zl9BQy
   g==;
X-CSE-ConnectionGUID: vnzg/Q/GRUy1LPnexKclLw==
X-CSE-MsgGUID: irX0X9jRRSee7mD3fqDDMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4344222"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4344222"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 23:26:24 -0800
X-CSE-ConnectionGUID: wgwp86MQQWSV2bMqEnZp5A==
X-CSE-MsgGUID: Hcfi5BDOQ86w3cme3H9a1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11467538"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Nov 2026 23:15:33 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVkkV-00000001OkE-1CK4;
	Tue, 24 Nov 2026 07:15:31 +0000
Date: Tue, 24 Nov 2026 15:14:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lpieralisi:b4/acpi-static-table-irq-probe-defer-v2 3/10]
 drivers/acpi/property.c:1803:43: error: call to undeclared function
 'FIELD_GET'; ISO C99 and later do not support implicit function declarations
Message-ID: <20261124150646.xogKI57T-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git b4/acpi-static-table-irq-probe-defer-v2
head:   ca8bd1758c478a6d6f4ee72816f935c38cdb1169
commit: c692f3d86b735adeead52e7d58f1b943135cfaae [3/10] ACPI: Introduce irq_get() for static fwnodes
:::::: branch date: 17 hours ago
:::::: commit date: 19 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261124/20261124150646.xogKI57T-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124150646.xogKI57T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261124150646.xogKI57T-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/acpi/property.c:16:
   include/linux/acpi.h:126:15: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     126 |         irq->flags = ACPI_STATIC_IRQ_FLAGS(trigger, polarity);
         |                      ^
   include/linux/acpi.h:71:3: note: expanded from macro 'ACPI_STATIC_IRQ_FLAGS'
      71 |         (FIELD_PREP(ACPI_STATIC_IRQ_TRIGGER_MASK, (trigger))    | \
         |          ^
>> drivers/acpi/property.c:1803:43: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1803 |         return acpi_register_gsi(NULL, irq->gsi, ACPI_STATIC_IRQ_TRIGGER(irq->flags),
         |                                                  ^
   include/linux/acpi.h:75:2: note: expanded from macro 'ACPI_STATIC_IRQ_TRIGGER'
      75 |         FIELD_GET(ACPI_STATIC_IRQ_TRIGGER_MASK, (flags))
         |         ^
   2 errors generated.


vim +/FIELD_GET +1803 drivers/acpi/property.c

c692f3d86b735ad Lorenzo Pieralisi 2026-09-04  1791  
c692f3d86b735ad Lorenzo Pieralisi 2026-09-04  1792  static int acpi_static_fwnode_irq_get(const struct fwnode_handle *fwnode,
c692f3d86b735ad Lorenzo Pieralisi 2026-09-04  1793  				      unsigned int index)
c692f3d86b735ad Lorenzo Pieralisi 2026-09-04  1794  {
c692f3d86b735ad Lorenzo Pieralisi 2026-09-04  1795  	const struct acpi_static_fwnode *node = container_of(fwnode,
c692f3d86b735ad Lorenzo Pieralisi 2026-09-04  1796  						struct acpi_static_fwnode, fwnode);
c692f3d86b735ad Lorenzo Pieralisi 2026-09-04  1797  	const struct acpi_static_irq *irq;
c692f3d86b735ad Lorenzo Pieralisi 2026-09-04  1798  
c692f3d86b735ad Lorenzo Pieralisi 2026-09-04  1799  	if (index >= node->irq_count)
c692f3d86b735ad Lorenzo Pieralisi 2026-09-04  1800  		return -ENXIO;
c692f3d86b735ad Lorenzo Pieralisi 2026-09-04  1801  
c692f3d86b735ad Lorenzo Pieralisi 2026-09-04  1802  	irq = &node->irqs[index];
c692f3d86b735ad Lorenzo Pieralisi 2026-09-04 @1803  	return acpi_register_gsi(NULL, irq->gsi, ACPI_STATIC_IRQ_TRIGGER(irq->flags),
c692f3d86b735ad Lorenzo Pieralisi 2026-09-04  1804  				 ACPI_STATIC_IRQ_POLARITY(irq->flags));
c692f3d86b735ad Lorenzo Pieralisi 2026-09-04  1805  }
c692f3d86b735ad Lorenzo Pieralisi 2026-09-04  1806  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
