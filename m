Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F2372639
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Sep 2025 23:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757113409; cv=none; b=dPPx35jj6Ntl0ss3Cy0ZctjnfLbIy2vmd+cFbsuJoC9fQT7jwRWrXqMKQvJrEhQzva1qkK+OjRakg0n3hMFExcWou2AasmF+0ZaTnlFRJ/YnhRvBLhNZciJr34CKIP1+qudIgW6r8ek3Mq5UscqmqI6o+4fZAJL9pbrngsTG59o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757113409; c=relaxed/simple;
	bh=Xi7Cg2IsqHep3Wu6dC+PUVV/miVeG0m/TOsdQ+qXDr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dgpy0CW7MxHB8d923DTkgZq+VtoUX/7EGAUS0h9p4LvvSKW+XNjenBa526RDWrUckDCssJU7esOHP2TRyDKLA7KtDJiRMhCbwvrow2EHz2qrZc2jo+BvoZIWF6C6DaxNb0I+p0fWXJ/Tde5MYiN2IgiwvFaGmUU/rpgDXWdvT6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URO8K3SL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URO8K3SL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757113407; x=1788649407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xi7Cg2IsqHep3Wu6dC+PUVV/miVeG0m/TOsdQ+qXDr0=;
  b=URO8K3SLbhpp7lFoVxuLz5Im9WL3iHc/LUYFu4DXyQtmY8lee3EcYFI3
   vFUlmmOKhWc9HJ2/PpbyvQd+QSEMg6nXT5hVj2ECNcjasRLnws5o/jz/t
   J9arPe40zlE+9ADlUzNW+s6iHpgEtZ97iZFnLdgaSug6786omhtnhGtmB
   miF7idpXk5j5Rt7MEIuiCKsfmCXdllHbpmiVKgd6PxJ9rFYt7b0ekg+AH
   XGNNVADVnF8IU2LX4Wam8/lMZ7AsSfLQRE0S5p3P0vCwniLFzqqv3pDwf
   D4a5pa8fCyDQ8YOUJVR2gHKTEPn70HAexcdh1pEddvWe6Aadm0r4Ll9gL
   A==;
X-CSE-ConnectionGUID: VXMJQhFCSBiyDkd9oMz38Q==
X-CSE-MsgGUID: 7VUo08h2Sb+FNdFgHQmCHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="63109578"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="63109578"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 16:03:27 -0700
X-CSE-ConnectionGUID: /zAdXebWShm8CpQ3xI+CPw==
X-CSE-MsgGUID: jH/RZ+HHSZGh0iJ1OMwcDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="172722739"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Sep 2025 16:03:25 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uufSl-00012R-1a;
	Fri, 05 Sep 2025 23:03:23 +0000
Date: Sat, 6 Sep 2025 07:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:irq/drivers 6/17] ERROR: modpost: __ex_table+0x1890 references
 non-executable section '.debug_frame'
Message-ID: <202509060700.svu93cfq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Fushuai Wang <wangfushuai@baidu.com>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
head:   c2616c5696e85efb2679499d7260f7766b93cff6
commit: b92ff23b12046f70f7f41f1e57e77c498dec35d7 [6/17] irqchip/sifive-plic: Use for_each_present_cpu() instead of for_each_cpu()
:::::: branch date: 34 hours ago
:::::: commit date: 13 days ago
config: riscv-randconfig-001-20250903 (https://download.01.org/0day-ci/archive/20250906/202509060700.svu93cfq-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509060700.svu93cfq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509060700.svu93cfq-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x15a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b0 (section: __ex_table) -> .LASF2916 (section: .debug_str)
ERROR: modpost: __ex_table+0x16b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b4 (section: __ex_table) -> .LASF2918 (section: .debug_str)
ERROR: modpost: __ex_table+0x16b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16bc (section: __ex_table) -> .LASF2920 (section: .debug_str)
ERROR: modpost: __ex_table+0x16bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c0 (section: __ex_table) -> .LASF2922 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c8 (section: __ex_table) -> .LASF2924 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16cc (section: __ex_table) -> .LASF2926 (section: .debug_str)
ERROR: modpost: __ex_table+0x16cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16d4 (section: __ex_table) -> .LASF2928 (section: .debug_str)
ERROR: modpost: __ex_table+0x16d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16d8 (section: __ex_table) -> .LASF2930 (section: .debug_str)
ERROR: modpost: __ex_table+0x16d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16e0 (section: __ex_table) -> .LASF2932 (section: .debug_str)
ERROR: modpost: __ex_table+0x16e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16e4 (section: __ex_table) -> .LASF2934 (section: .debug_str)
ERROR: modpost: __ex_table+0x16e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16ec (section: __ex_table) -> .LASF2936 (section: .debug_str)
ERROR: modpost: __ex_table+0x16ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16f0 (section: __ex_table) -> .LASF2939 (section: .debug_str)
ERROR: modpost: __ex_table+0x16f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16f8 (section: __ex_table) -> .LASF2940 (section: .debug_str)
ERROR: modpost: __ex_table+0x16f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16fc (section: __ex_table) -> .LASF2942 (section: .debug_str)
ERROR: modpost: __ex_table+0x16fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1704 (section: __ex_table) -> .LASF2944 (section: .debug_str)
ERROR: modpost: __ex_table+0x1704 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1708 (section: __ex_table) -> .LASF2946 (section: .debug_str)
ERROR: modpost: __ex_table+0x1708 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1710 (section: __ex_table) -> .LASF2948 (section: .debug_str)
ERROR: modpost: __ex_table+0x1710 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1714 (section: __ex_table) -> .LASF2950 (section: .debug_str)
ERROR: modpost: __ex_table+0x1714 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x171c (section: __ex_table) -> .LASF2952 (section: .debug_str)
ERROR: modpost: __ex_table+0x171c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1720 (section: __ex_table) -> .LASF2954 (section: .debug_str)
ERROR: modpost: __ex_table+0x1720 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1728 (section: __ex_table) -> .LASF2956 (section: .debug_str)
ERROR: modpost: __ex_table+0x1728 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x172c (section: __ex_table) -> .LASF2958 (section: .debug_str)
ERROR: modpost: __ex_table+0x172c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1734 (section: __ex_table) -> .LASF2960 (section: .debug_str)
ERROR: modpost: __ex_table+0x1734 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1738 (section: __ex_table) -> .LASF2962 (section: .debug_str)
ERROR: modpost: __ex_table+0x1738 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1764 (section: __ex_table) -> .LASF3164 (section: .debug_str)
ERROR: modpost: __ex_table+0x1764 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1768 (section: __ex_table) -> .LASF3166 (section: .debug_str)
ERROR: modpost: __ex_table+0x1768 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1770 (section: __ex_table) -> .LASF3168 (section: .debug_str)
ERROR: modpost: __ex_table+0x1770 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1774 (section: __ex_table) -> .LASF3170 (section: .debug_str)
ERROR: modpost: __ex_table+0x1774 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x177c (section: __ex_table) -> .LASF1407 (section: .debug_str)
ERROR: modpost: __ex_table+0x177c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1780 (section: __ex_table) -> .LASF1409 (section: .debug_str)
ERROR: modpost: __ex_table+0x1780 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1788 (section: __ex_table) -> .LASF1411 (section: .debug_str)
ERROR: modpost: __ex_table+0x1788 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x178c (section: __ex_table) -> .LASF1413 (section: .debug_str)
ERROR: modpost: __ex_table+0x178c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1794 (section: __ex_table) -> .LASF1717 (section: .debug_str)
ERROR: modpost: __ex_table+0x1794 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1798 (section: __ex_table) -> .LASF1719 (section: .debug_str)
ERROR: modpost: __ex_table+0x1798 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a0 (section: __ex_table) -> .LASF1721 (section: .debug_str)
ERROR: modpost: __ex_table+0x17a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a4 (section: __ex_table) -> .LASF1723 (section: .debug_str)
ERROR: modpost: __ex_table+0x17a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17ac (section: __ex_table) -> .LASF1725 (section: .debug_str)
ERROR: modpost: __ex_table+0x17ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b0 (section: __ex_table) -> .LASF1727 (section: .debug_str)
ERROR: modpost: __ex_table+0x17b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b8 (section: __ex_table) -> .LASF1729 (section: .debug_str)
ERROR: modpost: __ex_table+0x17b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17bc (section: __ex_table) -> .LASF1723 (section: .debug_str)
ERROR: modpost: __ex_table+0x17bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c4 (section: __ex_table) -> .LASF1732 (section: .debug_str)
ERROR: modpost: __ex_table+0x17c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c8 (section: __ex_table) -> .LASF1734 (section: .debug_str)
ERROR: modpost: __ex_table+0x17c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d0 (section: __ex_table) -> .LASF1736 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d4 (section: __ex_table) -> .LASF1738 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17dc (section: __ex_table) -> .LASF1740 (section: .debug_str)
ERROR: modpost: __ex_table+0x17dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17e0 (section: __ex_table) -> .LASF1742 (section: .debug_str)
ERROR: modpost: __ex_table+0x17e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17e8 (section: __ex_table) -> .LASF1744 (section: .debug_str)
ERROR: modpost: __ex_table+0x17e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17ec (section: __ex_table) -> .LASF1746 (section: .debug_str)
ERROR: modpost: __ex_table+0x17ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1804 (section: __ex_table) -> .L0  (section: __jump_table)
ERROR: modpost: __ex_table+0x1804 references non-executable section '__jump_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1890 (section: __ex_table) -> .L0  (section: .debug_frame)
>> ERROR: modpost: __ex_table+0x1890 references non-executable section '.debug_frame'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18c0 (section: __ex_table) -> .LLST1241 (section: .debug_loc)
ERROR: modpost: __ex_table+0x18c0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18f0 (section: __ex_table) -> .LASF3351 (section: .debug_str)
ERROR: modpost: __ex_table+0x18f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18f4 (section: __ex_table) -> .LASF3353 (section: .debug_str)
ERROR: modpost: __ex_table+0x18f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1900 (section: __ex_table) -> .LLST1028 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1900 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1908 (section: __ex_table) -> .LLST1031 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1908 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1918 (section: __ex_table) -> .LLST1156 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1918 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1920 (section: __ex_table) -> .LLST1158 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1920 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1924 (section: __ex_table) -> .LLST1156 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1924 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1930 (section: __ex_table) -> .LLST1156 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1930 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c8 (section: __ex_table) -> .LASF877 (section: .debug_str)
ERROR: modpost: __ex_table+0x19c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19cc (section: __ex_table) -> .LASF879 (section: .debug_str)
ERROR: modpost: __ex_table+0x19cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d4 (section: __ex_table) -> .LASF881 (section: .debug_str)
ERROR: modpost: __ex_table+0x19d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d8 (section: __ex_table) -> .LASF883 (section: .debug_str)
ERROR: modpost: __ex_table+0x19d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e0 (section: __ex_table) -> .LASF168 (section: .debug_str)
ERROR: modpost: __ex_table+0x19e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e4 (section: __ex_table) -> .LASF170 (section: .debug_str)
ERROR: modpost: __ex_table+0x19e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac4 (section: __ex_table) -> __func__ (section: .rodata)
ERROR: modpost: __ex_table+0x1ac4 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac8 (section: __ex_table) -> __func__ (section: .rodata)
ERROR: modpost: __ex_table+0x1ac8 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad0 (section: __ex_table) -> _entry (section: .rodata)
ERROR: modpost: __ex_table+0x1ad0 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad4 (section: __ex_table) -> _entry (section: .rodata)
ERROR: modpost: __ex_table+0x1ad4 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1adc (section: __ex_table) -> __func__ (section: .rodata)
ERROR: modpost: __ex_table+0x1adc references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae0 (section: __ex_table) -> __func__ (section: .rodata)
ERROR: modpost: __ex_table+0x1ae0 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae8 (section: __ex_table) -> _entry (section: .rodata)
ERROR: modpost: __ex_table+0x1ae8 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aec (section: __ex_table) -> __func__ (section: .rodata)
ERROR: modpost: __ex_table+0x1aec references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1af4 (section: __ex_table) -> _entry (section: .rodata)
ERROR: modpost: __ex_table+0x1af4 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1af8 (section: __ex_table) -> __func__ (section: .rodata)
ERROR: modpost: __ex_table+0x1af8 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b00 (section: __ex_table) -> .LASF3459 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b04 (section: __ex_table) -> .LASF3461 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b0c (section: __ex_table) -> .LASF3463 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b10 (section: __ex_table) -> .LASF3461 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b18 (section: __ex_table) -> .LASF3466 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b1c (section: __ex_table) -> .LASF3461 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b24 (section: __ex_table) -> .LASF3469 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b28 (section: __ex_table) -> .LASF3471 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b30 (section: __ex_table) -> .LASF3473 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b34 (section: __ex_table) -> .LASF3475 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b3c (section: __ex_table) -> .LASF3477 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b40 (section: __ex_table) -> .LASF3475 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b48 (section: __ex_table) -> .LASF3480 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b4c (section: __ex_table) -> .LASF3475 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b54 (section: __ex_table) -> .LASF3483 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b58 (section: __ex_table) -> .LASF3461 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b60 (section: __ex_table) -> .LASF3486 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b64 (section: __ex_table) -> .LASF3488 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b6c (section: __ex_table) -> .LASF3490 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b70 (section: __ex_table) -> .LASF3492 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b78 (section: __ex_table) -> .LASF3494 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b7c (section: __ex_table) -> .LASF3461 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b90 (section: __ex_table) -> .LASF2928 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b94 (section: __ex_table) -> .LASF2930 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bb4 (section: __ex_table) -> .LASF3476 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bb4 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
