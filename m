Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5268427C162
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jun 2026 01:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056019; cv=none; b=MY10nj2RRrYQxkDjbo15/uJOgn3Fpw/QWv+GYBxGDDED6ooJW5xQdzkuXByQEQRHVVGtnAqtcgHtVkSFkJNJpUqSZq1nv7md4lNC+egxqp+fsob+ih9zSjvwEjgOAfz/4elPJAEWn/wn5qMbe/G/Jekaci4H/GTAbNsA+ShimpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056019; c=relaxed/simple;
	bh=aAfuC7KXo5YUO42QfRCl7oBPywxnjuXV3E1t1OqHraQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Zr5yT4tUABS8Y9mLoP7dUU7VYXqmqchYrVbe+QsDfg5JpYMq6lGbwMyyDMwXoCLX6rVK0jTa35mM5libMNoz9cGZZiRi16uv0jtB5SAH3ybZBfdRXVmD3s+BDRARjPQSKy24XLDet2cRFlYpFdNx71aP8B3JbbsTQUDMlk5eLbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byQG6zDl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byQG6zDl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781056017; x=1812592017;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aAfuC7KXo5YUO42QfRCl7oBPywxnjuXV3E1t1OqHraQ=;
  b=byQG6zDlLCDe7uVvoSsYjs83l5rpI8AexLLrp/75Yq3qQ7pKwpDN2/yK
   oxT+lqGXOPUQBf+X1Nrd4TF336O/bucKUVWi2WWvFg4JguVbQmYy7OKKL
   xrRglBbyNfgzLAmkH3q2eWWkZaockyGdLnNmy8uXGaCa8HzxXMk1aSu5s
   j4bccL+/cPDoKbSlRNkxgtjAMMKwCCv99tyuo4Pwiw5LNOWNLgQLFSpAS
   GQcV2pD8LU520pTG2SAFb53N8pn7URfeK5fImjriPKmPK1WZwmKz4XOYP
   V8FYyW81qIxt/OXOBn0vngdmK83E3c9PpnYYFsgq/94MhqS6LAEvU3c72
   A==;
X-CSE-ConnectionGUID: R9MF6JVgQ8iNWyl8EeKK3Q==
X-CSE-MsgGUID: x36cXS3TQR6/JHNlgWN42g==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81841931"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81841931"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 18:46:56 -0700
X-CSE-ConnectionGUID: 93Yn2X15S5eth9f435QblQ==
X-CSE-MsgGUID: HR4k7vsyQ0iwTiW6Id0OGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="245173089"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Jun 2026 18:46:54 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX81s-00000000KmU-0qdt;
	Wed, 10 Jun 2026 01:46:52 +0000
Date: Wed, 10 Jun 2026 09:46:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9242/12670]
 arch/powerpc/boot/dts/fsp2.dtb: Warning (interrupt_map): Failed prerequisite
 'interrupt_provider'
Message-ID: <202606100954.Js25uNeq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   49e02880ec0a8c378e811bc9d85da188d7c6204c
commit: 2442f10c6eae63392452ab84a813dbc1f87c724d [9242/12670] powerpc: dts:=
 Build devicetrees of enabled platforms
:::::: branch date: 7 hours ago
:::::: commit date: 8 days ago
config: powerpc-randconfig-r053-20260610 (https://download.01.org/0day-ci/a=
rchive/20260610/202606100954.Js25uNeq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606100954.Js25uNeq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsp2.dts:384.7-607.4: Warning (unit_address_vs_reg=
): /plb4: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsp2.dts:392.24-397.5: Warning (interrupt_provider=
): /plb4/plb6-system-hung-irq: '#interrupt-cells' found, but node is not an=
 interrupt provider
   arch/powerpc/boot/dts/fsp2.dts:399.16-404.5: Warning (interrupt_provider=
): /plb4/l2-error-irq: '#interrupt-cells' found, but node is not an interru=
pt provider
   arch/powerpc/boot/dts/fsp2.dts:406.17-411.5: Warning (interrupt_provider=
): /plb4/plb6-plb4-irq: '#interrupt-cells' found, but node is not an interr=
upt provider
   arch/powerpc/boot/dts/fsp2.dts:413.16-418.5: Warning (interrupt_provider=
): /plb4/plb4-ahb-irq: '#interrupt-cells' found, but node is not an interru=
pt provider
   arch/powerpc/boot/dts/fsp2.dts:420.18-425.5: Warning (interrupt_provider=
): /plb4/opbd-error-irq: '#interrupt-cells' found, but node is not an inter=
rupt provider
   arch/powerpc/boot/dts/fsp2.dts:427.17-432.5: Warning (interrupt_provider=
): /plb4/cmu-error-irq: '#interrupt-cells' found, but node is not an interr=
upt provider
   arch/powerpc/boot/dts/fsp2.dts:434.18-439.5: Warning (interrupt_provider=
): /plb4/conf-error-irq: '#interrupt-cells' found, but node is not an inter=
rupt provider
   arch/powerpc/boot/dts/fsp2.dts:441.13-446.5: Warning (interrupt_provider=
): /plb4/mc-ue-irq: '#interrupt-cells' found, but node is not an interrupt =
provider
   arch/powerpc/boot/dts/fsp2.dts:448.21-453.5: Warning (interrupt_provider=
): /plb4/reset-warning-irq: '#interrupt-cells' found, but node is not an in=
terrupt provider
>> arch/powerpc/boot/dts/fsp2.dtb: Warning (interrupt_map): Failed prerequi=
site 'interrupt_provider'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
