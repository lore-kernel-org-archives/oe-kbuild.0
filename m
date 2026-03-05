Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8D4377563
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 10:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707492; cv=none; b=ns1O82vJcA2oTg2P4XUrCb6PQkFHbDlsOc65Qnt0QftfvFOSY+ck3HaDS1iDfnOWDxjS+cIVRVsb3m5S2WvWivHXmG/3ptZ95XMEYWqx1ReGOaw5MumkSfFlvKlfc0QrRu67e8m043yz3dn97XHzCP6KcJXTTjYNQH40YC0Dakk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707492; c=relaxed/simple;
	bh=xYrZs/JoeePu6e25L7Fx1/5AVHE6Gsi3gX+72JC5jEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Qq/J6Gul0hEuJ2yVs8XFnGVkl+AhW5gpxQBdBb1wf5eg9aoj7E83CqKatDRwy5SOBGQ8BCpg1ZW+tYhUExlhpH0+B6yK/kxFiY5cDzctL24MmJd4ZCr88/Vk2evUV0vITtEDtehoYK4jCCHr8Ox5EOD/IBR5RMv4bPb5EGuUBe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vso4D2C8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vso4D2C8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772707490; x=1804243490;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xYrZs/JoeePu6e25L7Fx1/5AVHE6Gsi3gX+72JC5jEE=;
  b=Vso4D2C8Znj+RTyfrECbAKuVRZ6nwkGC2TfIxgNwkveL2LuasOd7Egnl
   G5WgApVt4BHpGMUxDLLfj8oa/8ygnKzyJFgan8ZcKmbgWr2r4Vie+0qNn
   E6IC4/hfRyDKWcoQDFB7A4DwGP1SpY3Bkqk+0kXWaATvXkTDH7gwSRd4n
   DTDVhtjvbiIn9ErvnJGkJeSLK4/ixny8dY0+6HSV7DhVwFA3qYLznK9Hk
   BPQgJrKLfvE/mohBAmQ8Wg03a/32ImEM2Za9U8pB4d/H+baExTFtYHF2G
   TspuWwAjPY9njtAX4ppAV4jNqdvIWBJIdTFp12OHKieGhnJjJUNY180rh
   g==;
X-CSE-ConnectionGUID: N900MwvjRUGK+FnQRfbCcA==
X-CSE-MsgGUID: /A9GpH50QTWt1/4lTqW3Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73761856"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="73761856"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 02:44:50 -0800
X-CSE-ConnectionGUID: EvyA4gKdTNqjQjsF0u9FKQ==
X-CSE-MsgGUID: 6OhQEWo3SM6SZfGE26BNAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="218648754"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Mar 2026 02:44:48 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy6CE-000000000UW-0T6s;
	Thu, 05 Mar 2026 10:44:46 +0000
Date: Thu, 05 Mar 2026 18:43:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pci:wip/2603-farhan-s390-err-v10 1/9] drivers/pci/slot.c:40
 address_read_file() warn: impossible condition '(slot->number == -1) =>
 (0-u16max == (-1))'
Message-ID: <202603051816.NIWQx7m0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-pci@vger.kernel.org
TO: Farhan Ali <alifm@linux.ibm.com>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: Niklas Schnelle <schnelle@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git wip/260=
3-farhan-s390-err-v10
head:   d72875f0a4958f51f7196e6fada9357799418a52
commit: 77c0762d2e847cf2e8d6d79e6f88a1c2b1ca4d06 [1/9] PCI: Allow per funct=
ion PCI slots
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-r071-20260305 (https://download.01.org/0day-ci/arch=
ive/20260305/202603051816.NIWQx7m0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603051816.NIWQx7m0-lkp@intel.com/

smatch warnings:
drivers/pci/slot.c:40 address_read_file() warn: impossible condition '(slot=
->number =3D=3D -1) =3D> (0-u16max =3D=3D (-1))'

vim +40 drivers/pci/slot.c

f46753c5e354b8 Alex Chiang          2008-06-10  37 =20
f46753c5e354b8 Alex Chiang          2008-06-10  38  static ssize_t address_=
read_file(struct pci_slot *slot, char *buf)
f46753c5e354b8 Alex Chiang          2008-06-10  39  {
77c0762d2e847c Farhan Ali           2026-03-02 @40  	if (slot->number =3D=
=3D -1)
f8cf6e513ec4f0 Krzysztof Wilczy=C5=84ski 2021-06-03  41  		return sysfs_emi=
t(buf, "%04x:%02x\n",
f46753c5e354b8 Alex Chiang          2008-06-10  42  				  pci_domain_nr(slo=
t->bus),
f46753c5e354b8 Alex Chiang          2008-06-10  43  				  slot->bus->number=
);
f8cf6e513ec4f0 Krzysztof Wilczy=C5=84ski 2021-06-03  44 =20
f8cf6e513ec4f0 Krzysztof Wilczy=C5=84ski 2021-06-03  45  	return sysfs_emit=
(buf, "%04x:%02x:%02x\n",
f46753c5e354b8 Alex Chiang          2008-06-10  46  			  pci_domain_nr(slot=
->bus),
f46753c5e354b8 Alex Chiang          2008-06-10  47  			  slot->bus->number,
f46753c5e354b8 Alex Chiang          2008-06-10  48  			  slot->number);
f46753c5e354b8 Alex Chiang          2008-06-10  49  }
f46753c5e354b8 Alex Chiang          2008-06-10  50 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
