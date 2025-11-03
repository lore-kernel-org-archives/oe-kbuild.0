Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CB831DD9B
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Nov 2025 18:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762195905; cv=none; b=Dm2+UzABh0ihV+erD8SmVPT9rI1pnXBFbGfUvzW0cu2mTDpTb4cf0mEElLi2HRN2q2gzpa0w4jV2F5lE6XW++h47aoJkUtG6SiA956rUo2nyGl0AaMoYnbgs5W0hCQ9WNJWtlLQqenR0libew1lQnU/P4CsIDkr1mwFuQonUzM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762195905; c=relaxed/simple;
	bh=XcWxd3q1uzAep2KwQ1L78w9RhBiFKEkjrrnqvBuV3g4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UiWGo78N4jNTKuxuiMVzTRkytH5USBLeAOklWNQrgnsjFyFS/1egD3PMTj7tgpTK4uO1VTPLndWqb0w7c26bwsSz0QulEopdSAvKqJkN/6fGh1DQYoxdr0frql/WV8aoFolUUB7wz2b6bGXcDFER3EACjVj5HGZa5u7xVdEejpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6Y0ZZ2R; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6Y0ZZ2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762195904; x=1793731904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XcWxd3q1uzAep2KwQ1L78w9RhBiFKEkjrrnqvBuV3g4=;
  b=F6Y0ZZ2R/a7Gpzes7BvvcjSO1XKo4r0F3NYplHl5h73aKtogRf7T5OtI
   y2V739urBaC701JXSYLT8A4TptCzbV0w3TkCdAxoVa8f81x1I1SumcPHZ
   2J09L+U4qZhvHKiEqTo1GgGDinaGgHjJVIfRv8sbF6BcQag8bEf7DoZz1
   NXYhrAb7xbSh4u/folDf7Mkdzw9so4f7IP24FczUL+QgUznN6o7iKqC4f
   T+GlPB7Kgh0t3tDPL5sgKohSRyQlXXj8sPkJU9iU/H2D1kT3G8fmSjrDj
   1OaGz0GQFVysNPrJS86yp5r+z6H6IagY6Wp7jdnoMJY4zAoYYwf1uM+Il
   w==;
X-CSE-ConnectionGUID: 49zwM4I5RgCQoIvjL329kQ==
X-CSE-MsgGUID: 63a843L2RlGqWg0qUyPA2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="66893164"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="66893164"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 10:51:43 -0800
X-CSE-ConnectionGUID: PNuk4bl8T+mVaHO9Xt6CAg==
X-CSE-MsgGUID: clm6l5f+Sre7O8mZYhkpDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="186630814"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 03 Nov 2025 10:51:38 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFzeR-000QTY-12;
	Mon, 03 Nov 2025 18:51:35 +0000
Date: Tue, 4 Nov 2025 02:51:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] efistub/smbios: Add fallback for SMBIOS record lookup
Message-ID: <202511040131.8yGeRa6u-lkp@intel.com>
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
In-Reply-To: <20251102001411.108385-1-francescopompo2@gmail.com>
References: <20251102001411.108385-1-francescopompo2@gmail.com>
TO: Francesco Pompo <francescopompo2@gmail.com>
TO: Ard Biesheuvel <ardb@kernel.org>
CC: linux-efi@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Francesco Pompo <francescopompo2@gmail.com>

Hi Francesco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on efi/next]
[also build test WARNING on linus/master v6.18-rc4 next-20251103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Francesco-Pompo/efistub-smbios-Add-fallback-for-SMBIOS-record-lookup/20251102-081803
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20251102001411.108385-1-francescopompo2%40gmail.com
patch subject: [PATCH] efistub/smbios: Add fallback for SMBIOS record lookup
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251103 (https://download.01.org/0day-ci/archive/20251104/202511040131.8yGeRa6u-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511040131.8yGeRa6u-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/libstub/smbios.c:55 verify_ep_int_checksum() error: buffer overflow 'ptr' 5 <= 14

vim +/ptr +55 drivers/firmware/efi/libstub/smbios.c

d45578057224c4 Francesco Pompo 2025-11-02  47  
d45578057224c4 Francesco Pompo 2025-11-02  48  static bool verify_ep_int_checksum(const struct smbios_entry_point *ep)
d45578057224c4 Francesco Pompo 2025-11-02  49  {
d45578057224c4 Francesco Pompo 2025-11-02  50  	const u8 *ptr = (u8 *)&ep->int_anchor;
d45578057224c4 Francesco Pompo 2025-11-02  51  	u8 sum = 0;
d45578057224c4 Francesco Pompo 2025-11-02  52  	int i;
d45578057224c4 Francesco Pompo 2025-11-02  53  
d45578057224c4 Francesco Pompo 2025-11-02  54  	for (i = 0; i < 15; i++)
d45578057224c4 Francesco Pompo 2025-11-02 @55  		sum += ptr[i];
d45578057224c4 Francesco Pompo 2025-11-02  56  
d45578057224c4 Francesco Pompo 2025-11-02  57  	return sum == 0;
d45578057224c4 Francesco Pompo 2025-11-02  58  }
d45578057224c4 Francesco Pompo 2025-11-02  59  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
