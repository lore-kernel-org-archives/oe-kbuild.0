Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B9F3DC4D9
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 16:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838615; cv=none; b=bfYNHnNlfbemwm0CbqMco2a5LIjQ9vPpgrs17bBV3aot4MxDqPIxkuGHgoM1aW8Qi2zqY6TSBlabsdV0P0IE4+BsdcFjqg9LHg0dFh79Gy00v4nw/4+3D9NI6MAADSfWwqohjzwAC59jGLns3orUOqjgP5vF5g2wimx7tzxOFyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838615; c=relaxed/simple;
	bh=89sqB6LD0WOr4uazVS7umH2mbtzpPvQxAbxpefDc9m4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YywTR2wMtI8NTL5yeJF3RdIjq/v2qNu5m6Pmn68Ez63UE56QdVrrCDV5G+dBwAmhcLwYnLDj0tUq0cxibIelXFQpMCfO7j3jBbCn3IxgpMED4iwTXkIQXFtfTRqVfie6i5mZygWTOEVbaXf1eZQ8TZHxFbBqUmQgp4Jdos/BR5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbRtnYy0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbRtnYy0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775838612; x=1807374612;
  h=date:from:to:cc:subject:message-id;
  bh=89sqB6LD0WOr4uazVS7umH2mbtzpPvQxAbxpefDc9m4=;
  b=gbRtnYy0GxXkngAg3cEx/GGZndknwvj/RKEAGIO1Wq7fNTbdVOPWz+fa
   OZ9gwfn+kejr8HLSaTe5ErkE9O2MraAkDkMwY8dfXGograWk5PDoL4+x3
   I8ZSP88KDL+yQF3e1x+FCSbwNHCozblOkv08IhBFEVYaJuiDofxRzXajw
   xZ8WbTae/PQ/8WyknYe3jKbLiDbGm6cdQszUfTFbdIWK8sNfzWAUvg0ns
   mhIWx6GwI+BfsKZnjO2ynLqvQGLH+lpoPOGmzqoEJPt+eBoQF5O+URj8x
   2+rHIGfPZM0wOjl9PmRuwVX9vuDAZULE8wMnASpFLL7Nl0e/YZKTh4YLo
   Q==;
X-CSE-ConnectionGUID: DcM5snT4Tv+QeM37CLy9ow==
X-CSE-MsgGUID: 09QXVEUoQiKtpfm/vzOeXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="80749614"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="80749614"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 09:30:12 -0700
X-CSE-ConnectionGUID: DDx+j/9xTUSahSCGHbYx8A==
X-CSE-MsgGUID: 8TYN3NegTJOv27kT8gI9Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="234053475"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 10 Apr 2026 09:30:11 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBEkD-00000000AvR-0hEr;
	Fri, 10 Apr 2026 16:30:09 +0000
Date: Fri, 10 Apr 2026 18:29:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tglx-devel:cleanups 15/38] drivers/ptp/ptp_vmclock.c:78:18:
 error: '__int128' is not supported on this target
Message-ID: <202604101824.Dnmbk8as-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thomas Gleixner <tglx@kernel.org>

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   c8e6e3529d3137cb0aba79b565eb04ab8f346829
commit: f0a1b67a6272b9131b4803169e10e5893e40892a [15/38] ptp: ptp_vmclock: Replace get_cycles() usage
:::::: branch date: 55 minutes ago
:::::: commit date: 5 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260410/202604101824.Dnmbk8as-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101824.Dnmbk8as-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604101824.Dnmbk8as-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/ptp/ptp_vmclock.c: In function 'mul_u64_u64_shr_add_u64':
>> drivers/ptp/ptp_vmclock.c:78:18: error: '__int128' is not supported on this target
      78 |         unsigned __int128 res = (unsigned __int128)delta * period;
         |                  ^~~~~~~~
   drivers/ptp/ptp_vmclock.c:78:43: error: '__int128' is not supported on this target
      78 |         unsigned __int128 res = (unsigned __int128)delta * period;
         |                                           ^~~~~~~~
>> drivers/ptp/ptp_vmclock.c:82:23: warning: right shift count >= width of type [-Wshift-count-overflow]
      82 |         *res_hi = res >> 64;
         |                       ^~
   In file included from ./include/linux/device.h:15,
                    from ./include/linux/acpi.h:15,
                    from drivers/ptp/ptp_vmclock.c:11:
   drivers/ptp/ptp_vmclock.c: In function 'vmclock_probe':
>> drivers/ptp/ptp_vmclock.c:686:31: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     686 |                 dev_info(dev, "Region too small (0x%llx)\n",
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   ./include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/ptp/ptp_vmclock.c:686:17: note: in expansion of macro 'dev_info'
     686 |                 dev_info(dev, "Region too small (0x%llx)\n",
         |                 ^~~~~~~~
   drivers/ptp/ptp_vmclock.c:686:55: note: format string is defined here
     686 |                 dev_info(dev, "Region too small (0x%llx)\n",
         |                                                    ~~~^
         |                                                       |
         |                                                       long long unsigned int
         |                                                    %x


vim +/__int128 +78 drivers/ptp/ptp_vmclock.c

20503272422693 David Woodhouse 2024-10-06  62  
20503272422693 David Woodhouse 2024-10-06  63  #define VMCLOCK_FIELD_PRESENT(_c, _f)			  \
20503272422693 David Woodhouse 2024-10-06  64  	(le32_to_cpu((_c)->size) >= (offsetof(struct vmclock_abi, _f) +	\
20503272422693 David Woodhouse 2024-10-06  65  				     sizeof((_c)->_f)))
20503272422693 David Woodhouse 2024-10-06  66  
20503272422693 David Woodhouse 2024-10-06  67  /*
20503272422693 David Woodhouse 2024-10-06  68   * Multiply a 64-bit count by a 64-bit tick 'period' in units of seconds >> 64
20503272422693 David Woodhouse 2024-10-06  69   * and add the fractional second part of the reference time.
20503272422693 David Woodhouse 2024-10-06  70   *
20503272422693 David Woodhouse 2024-10-06  71   * The result is a 128-bit value, the top 64 bits of which are seconds, and
20503272422693 David Woodhouse 2024-10-06  72   * the low 64 bits are (seconds >> 64).
20503272422693 David Woodhouse 2024-10-06  73   */
20503272422693 David Woodhouse 2024-10-06  74  static uint64_t mul_u64_u64_shr_add_u64(uint64_t *res_hi, uint64_t delta,
20503272422693 David Woodhouse 2024-10-06  75  					uint64_t period, uint8_t shift,
20503272422693 David Woodhouse 2024-10-06  76  					uint64_t frac_sec)
20503272422693 David Woodhouse 2024-10-06  77  {
20503272422693 David Woodhouse 2024-10-06 @78  	unsigned __int128 res = (unsigned __int128)delta * period;
20503272422693 David Woodhouse 2024-10-06  79  
20503272422693 David Woodhouse 2024-10-06  80  	res >>= shift;
20503272422693 David Woodhouse 2024-10-06  81  	res += frac_sec;
20503272422693 David Woodhouse 2024-10-06 @82  	*res_hi = res >> 64;
20503272422693 David Woodhouse 2024-10-06  83  	return (uint64_t)res;
20503272422693 David Woodhouse 2024-10-06  84  }
20503272422693 David Woodhouse 2024-10-06  85  

:::::: The code at line 78 was first introduced by commit
:::::: 20503272422693d793b84f88bf23fe4e955d3a33 ptp: Add support for the AMZNC10C 'vmclock' device

:::::: TO: David Woodhouse <dwmw@amazon.co.uk>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
