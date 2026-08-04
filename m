Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9951539CCF3
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Aug 2026 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833799; cv=none; b=g6drQfmN5ApmEfxKgGWQB7kZ05Cdw4Ag7K9DaVzf3pn0xFwSkWGVPC4veu6hpGY3nJuZgrEKDa5DnNvgy/yPCBM/nrlkXVVcsGzWARHvUDDXXgfO+rFI+Kf5Y9w/VfJydsowNmQHJJ2Cnuc/HG2yI+MjIcyw97xQk2vv3X+uyW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833799; c=relaxed/simple;
	bh=0JcWzY9FEzXCx9U845i5nVUxbK98Ozx/ceYBBt9f1xY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dY3qFribmW5opG0yQNQtFWXOISI7jk3C4H8ZmRuDbRX/I7wxNZWqetD1AjIJ3B9DTD1kGpG0nZeQzks7xCJxRa/AVSVIy0ZQ18rjZWuPkb/UCy6Rn/LlIxL3dMYnd+CawYu4gMrcDPW7rR+XWB0bWaVW1Jk1VrPfClbRAciLz7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jY89d5RD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jY89d5RD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785833798; x=1817369798;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0JcWzY9FEzXCx9U845i5nVUxbK98Ozx/ceYBBt9f1xY=;
  b=jY89d5RDJvA8XZQFSslgQSAXfxCiohZDFkS7Hm7CsAtemheHKq5N7vJw
   YOE206OTyAkWXkW0p/asROS68zljegnHwogy+eQOJDBO5KuWnh+Wcbc7/
   SANUnc16nl3Lnz3SWP5Ls788u0p1bjleRR68hekV4nXKTxVB2LOynfmnd
   DFatwNKLCOz9rHjZb9X+Bhs5ya2HG00RfXZHNKIA+gS03xY61Dn4pM7Zg
   Am49ytuaxg76kbUWOB4O1Qol0maIcxMt9CCx0ycV5apT0zl5tQoK7jvqI
   OZ6kYNIIRM8LyOCdINzG4wJev4OOAcK1O39rJ8ULQDD1z3wHzQz8iilR1
   Q==;
X-CSE-ConnectionGUID: U7YI/VNlQZ65ADBrnmoO3w==
X-CSE-MsgGUID: RF4U/cX9QFGDzFgh+dpjMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86324938"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86324938"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 01:56:37 -0700
X-CSE-ConnectionGUID: mf+Vq7RVQeuWW2B6U7KilQ==
X-CSE-MsgGUID: kvxgUIvkRfu6nMrsQbYegg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="258101799"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Aug 2026 01:56:36 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrAwr-000000009U8-3YNm;
	Tue, 04 Aug 2026 08:56:33 +0000
Date: Tue, 04 Aug 2026 16:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/ep8248e.dtb: Warning (interrupt_map):
 Failed prerequisite 'interrupt_provider'
Message-ID: <202608041606.4RyEq7cn-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   848acc8ffe1b7cd5f1bf427b93069becfebc2c9d
commit: 2442f10c6eae63392452ab84a813dbc1f87c724d powerpc: dts: Build device=
trees of enabled platforms
date:   9 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 9 weeks ago
config: powerpc-randconfig-r062-20260804 (https://download.01.org/0day-ci/a=
rchive/20260804/202608041606.4RyEq7cn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 2442f10c6eae ("powerpc: dts: Build devicetrees of enabled platform=
s")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608041606.4RyEq7cn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/ep8248e.dts:65.9-80.6: Warning (unit_address_vs_re=
g): /localbus@f0010100/bcsr@1,0/mdio: node has a reg or ranges property, bu=
t no unit name
   arch/powerpc/boot/dts/ep8248e.dts:84.9-87.4: Warning (unit_address_vs_re=
g): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/ep8248e.dts:110.10-119.6: Warning (unit_address_vs=
_reg): /soc@f0000000/cpm@119c0/muram: node has a reg or ranges property, bu=
t no unit name
   arch/powerpc/boot/dts/ep8248e.dts:51.19-56.5: Warning (simple_bus_reg): =
/localbus@f0010100/flash@0,3800000: simple-bus unit address format error, e=
xpected "3800000"
   arch/powerpc/boot/dts/ep8248e.dts:58.12-81.5: Warning (simple_bus_reg): =
/localbus@f0010100/bcsr@1,0: simple-bus unit address format error, expected=
 "100000000"
   arch/powerpc/boot/dts/ep8248e.dts:110.10-119.6: Warning (simple_bus_reg)=
: /soc@f0000000/cpm@119c0/muram: simple-bus unit address format error, expe=
cted "0"
   arch/powerpc/boot/dts/ep8248e.dts:101.13-190.5: Warning (interrupt_provi=
der): /soc@f0000000/cpm@119c0: '#interrupt-cells' found, but node is not an=
 interrupt provider
>> arch/powerpc/boot/dts/ep8248e.dtb: Warning (interrupt_map): Failed prere=
quisite 'interrupt_provider'
   arch/powerpc/boot/dts/ep8248e.dts:15.10-22.4: Warning (alias_paths): /al=
iases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/ep8248e.dts:15.10-22.4: Warning (alias_paths): /al=
iases: aliases property name must include only lowercase and '-'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
