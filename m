Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D7539D6C7
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Apr 2026 13:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776346858; cv=none; b=e88zPEsMrNP+Elktv7NyVz8phWHjvRKMOHlDPMmVT9eOxX1jLvrwlBOnZUIRvScp6XcgRYWZns5Uwq1y4Wjlt4jvezZb40vewSdCWeCkKB66YZvwN1LLKPo+flZkR9UaQGCihpXsYjwwO9t9BigOl2lx/0KZeOu1tNfxya1x798=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776346858; c=relaxed/simple;
	bh=wJtDv2OtOwzrIr+WguE50vbWe+FbI13hXAcPerSJ/8U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SmVzpegZuebASsgX91RqR2d2hEBhVKKoQF0D2W/oHTQV4GpqcMdfgGDl5o/yAcBA3ps/prFIuaz3UbzDgx9qi+7NcM6TJWD80L19kQEI1M0WOpUvIQDa8VVv9TBZtZa+LV1V5nQ8pO/78ThhLj8s78xrAMJjOXfjspBTiSDnVAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bxB8E7iT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bxB8E7iT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776346857; x=1807882857;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wJtDv2OtOwzrIr+WguE50vbWe+FbI13hXAcPerSJ/8U=;
  b=bxB8E7iTz9MgBIy5D0C57m2Rp1KUvXO6E9gYdnoORUWU4Uik2bNkz4tC
   6v7RrNVD6JrjU9Flya2nBgeG9sVJXT1YWhMOeKg6xQYbAc8hIei+QiL2k
   PlTVv8nlwxEgk7DiAcLjXQ7bepyH0e28QrCSBVjv8A6ENr4ckTQsIRC8O
   A7Rz3jc8ErfsgPop3LustVR34wi6ubRSjMglhtmvwMSIMJ0zbR2jolb6B
   o4JixC1OwWy+GlOZ+VFwTPn2n3rflPWyRxyXA5zc3jU8qUyuvQONXT/I4
   /inC9jbwFHEtX5LS3bCGKWymKJ2pCL0b+hBPkGvTl967wA96rP9N86U3+
   Q==;
X-CSE-ConnectionGUID: +fcn86fTSTiWE9+RAaL2Mw==
X-CSE-MsgGUID: xuuDgo+jTcGaH9HZNcyKUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94751497"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94751497"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 06:40:54 -0700
X-CSE-ConnectionGUID: rzRXFYR7TI2V+8E7jV2jgg==
X-CSE-MsgGUID: rtcMR4dhS9eienUDTp37GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="253981062"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Apr 2026 06:40:52 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDMxe-000000001da-07ho;
	Thu, 16 Apr 2026 13:40:50 +0000
Date: Thu, 16 Apr 2026 21:40:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5270/13951] ERROR: modpost:
 __ex_table+0x21e4 references non-executable section '.init.rodata'
Message-ID: <202604162154.51Sd81fI-lkp@intel.com>
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
:::::: Manual check reason: "riscv arch toolchain issue"
::::::=20

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: "David E. Box" <david.e.box@linux.intel.com>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   936c21068d7ade00325e40d82bfd2f3f29d9f659
commit: 22fa2ebc11a164e1ea529da6c356e3e01aef8ac8 [5270/13951] platform/x86/=
intel/vsec: Plumb ACPI PMT discovery tables through vsec
:::::: branch date: 25 hours ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-002-20260415 (https://download.01.org/0day-ci/arch=
ive/20260416/202604162154.51Sd81fI-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260416/202604162154.51Sd81fI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604162154.51Sd81fI-lkp@intel.com/

Note: the linux-next/master HEAD 936c21068d7ade00325e40d82bfd2f3f29d9f659 b=
uilds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x20b8 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20bc (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20bc references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20c4 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20c4 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20c8 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20c8 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20d0 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20d0 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20d4 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20d4 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20dc (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20dc references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20e0 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20e0 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20e8 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20e8 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20ec (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20ec references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20f4 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20f4 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20f8 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20f8 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2100 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2100 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2104 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2104 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x210c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x210c references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2110 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2110 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2118 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2118 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x211c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x211c references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2124 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2124 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2128 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2128 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2130 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2130 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2134 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2134 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x213c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x213c references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2140 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2140 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2148 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2148 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x214c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x214c references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2154 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2154 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2158 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2158 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2160 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2160 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2164 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2164 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x216c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x216c references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2170 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2170 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2178 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2178 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x217c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x217c references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2184 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2184 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2188 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2188 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2190 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2190 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2194 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2194 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x219c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x219c references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21a0 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21a0 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21a8 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21a8 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21ac (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21ac references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21b4 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21b4 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21b8 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21b8 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21c0 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21c0 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21c4 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21c4 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21cc (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21cc references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21d0 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21d0 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21d8 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21d8 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21dc (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21dc references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21e4 (section: =
__ex_table) -> emmc_250m_parents (section: .init.rodata)
>> ERROR: modpost: __ex_table+0x21e4 references non-executable section '.in=
it.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21e8 (section: =
__ex_table) -> f_26m_adc_parents (section: .init.rodata)
ERROR: modpost: __ex_table+0x21e8 references non-executable section '.init.=
rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21f0 (section: =
__ex_table) -> .L.str.67 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x21f0 references non-executable section '.rodat=
a.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21f4 (section: =
__ex_table) -> da_u2_refsel_parents (section: .init.rodata)
ERROR: modpost: __ex_table+0x21f4 references non-executable section '.init.=
rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21fc (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21fc references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2200 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2200 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2208 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2208 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x220c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x220c references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2214 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2214 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2218 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2218 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2220 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2220 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2224 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2224 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x222c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x222c references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2230 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2230 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2238 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2238 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x223c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x223c references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2244 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2244 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2248 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2248 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2250 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2250 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2254 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2254 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x225c (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x225c references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2260 (section: =
__ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2260 references non-executable section '.debug=
_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2268 (section: =
__ex_table) -> gcc_ufs_clkref_clk (section: .data)
ERROR: modpost: __ex_table+0x2268 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x226c (section: =
__ex_table) -> gcc_mss_gpll0_div_clk_src (section: .data)
ERROR: modpost: __ex_table+0x226c references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2274 (section: =
__ex_table) -> ssc_xo_clk (section: .data)
ERROR: modpost: __ex_table+0x2274 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2278 (section: =
__ex_table) -> hlos1_vote_lpass_core_smmu_clk (section: .data)
ERROR: modpost: __ex_table+0x2278 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2280 (section: =
__ex_table) -> hlos1_vote_lpass_adsp (section: .data)
ERROR: modpost: __ex_table+0x2280 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2284 (section: =
__ex_table) -> gcc_parent_map_1 (section: .rodata)
ERROR: modpost: __ex_table+0x2284 references non-executable section '.rodat=
a'
WARNING: modpost: vmlinux: section mismatch in reference: 0x228c (section: =
__ex_table) -> gcc_parent_map_0 (section: .rodata)
ERROR: modpost: __ex_table+0x228c references non-executable section '.rodat=
a'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2290 (section: =
__ex_table) -> .L.str.12 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x2290 references non-executable section '.rodat=
a.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2298 (section: =
__ex_table) -> .compoundliteral.25 (section: .data)
ERROR: modpost: __ex_table+0x2298 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x229c (section: =
__ex_table) -> .L.str.33 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x229c references non-executable section '.rodat=
a.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22a4 (section: =
__ex_table) -> .compoundliteral.43 (section: .data)
ERROR: modpost: __ex_table+0x22a4 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22a8 (section: =
__ex_table) -> .compoundliteral.50 (section: .data)
ERROR: modpost: __ex_table+0x22a8 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22b0 (section: =
__ex_table) -> .compoundliteral.59 (section: .data)
ERROR: modpost: __ex_table+0x22b0 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22b4 (section: =
__ex_table) -> .L.str.67 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x22b4 references non-executable section '.rodat=
a.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22bc (section: =
__ex_table) -> .compoundliteral.80 (section: .data)
ERROR: modpost: __ex_table+0x22bc references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22c0 (section: =
__ex_table) -> .L.str.88 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x22c0 references non-executable section '.rodat=
a.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22c8 (section: =
__ex_table) -> .compoundliteral.101 (section: .data)
ERROR: modpost: __ex_table+0x22c8 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22cc (section: =
__ex_table) -> .L.str.108 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x22cc references non-executable section '.rodat=
a.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22d4 (section: =
__ex_table) -> .compoundliteral.118 (section: .data)
ERROR: modpost: __ex_table+0x22d4 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22d8 (section: =
__ex_table) -> .compoundliteral.125 (section: .data)
ERROR: modpost: __ex_table+0x22d8 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22e0 (section: =
__ex_table) -> .compoundliteral.137 (section: .data)
ERROR: modpost: __ex_table+0x22e0 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22e4 (section: =
__ex_table) -> .compoundliteral.144 (section: .data)
ERROR: modpost: __ex_table+0x22e4 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22ec (section: =
__ex_table) -> .compoundliteral.153 (section: .data)
ERROR: modpost: __ex_table+0x22ec references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22f0 (section: =
__ex_table) -> .compoundliteral.160 (section: .data)
ERROR: modpost: __ex_table+0x22f0 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22f8 (section: =
__ex_table) -> .compoundliteral.172 (section: .data)
ERROR: modpost: __ex_table+0x22f8 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22fc (section: =
__ex_table) -> .compoundliteral.179 (section: .data)
ERROR: modpost: __ex_table+0x22fc references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2304 (section: =
__ex_table) -> .compoundliteral.191 (section: .data)
ERROR: modpost: __ex_table+0x2304 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2308 (section: =
__ex_table) -> .compoundliteral.198 (section: .data)
ERROR: modpost: __ex_table+0x2308 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2310 (section: =
__ex_table) -> .compoundliteral.207 (section: .data)
ERROR: modpost: __ex_table+0x2310 references non-executable section '.data'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
