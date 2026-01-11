Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEBE1C3C08
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 20:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768161717; cv=none; b=NmLNpn2KYiMP8lE9Yu8ryw8U5SmWtKryzAKBMORENtVb94yfRWjV4BsjmWekuUaut0Q+fZDNkUnPl28V/3Ya0XAl6lXxGSKwqZ5bIpfYsNVhxHiusAloGgNK/8s6D1qcoxqMeTNJiCZipsSljVWwDfiIsus20yVLgcR8BShXRPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768161717; c=relaxed/simple;
	bh=vYogEwjbIyEDz2BUWWK7/XF2+cFqV70FhyP5u2ip0a4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=idnpSCVU2p+7G4YAgVgaA3Hlvbz6WA2KZl/7IPfw80JZyS12DyFslXIIQ5rWQQrsU4itZdFZiuLQECBClF/ZT+PWUtY2mcSrPGNjdF9c6XBJv4JyQVcLY5JJnjtX26K2nbKZIUD3+B+dEeF1yx7CxQCka2demuONRHcUeIaEtOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZtKX9uPK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZtKX9uPK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768161717; x=1799697717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vYogEwjbIyEDz2BUWWK7/XF2+cFqV70FhyP5u2ip0a4=;
  b=ZtKX9uPK9petOKhLf31Tsy9DyJ90FgMOdAvi5/slmjU6dT66s9muyu1g
   tRoD6ChlxHd3d5XZTHAHH9QEGQuBbZPVQnjNqT3eu2vSl0SUo+hUSQjRv
   JCnjEzqjYOfQcH9f/e2al9TQbeS/37dD0xBlrWdyDffDoTIhzio8NAKg7
   udz0c79M7tLRmTESI7bd4yqe+54+t5cVPWNZ01t7Guu8VTlYps3vpd/Q7
   3bQJnWCGxwV8QZWcmAPQdx+Ij3vW1JtC9sK06E91wdtmaNxQaSLNVmT31
   q0WcyaSqYLs8hNfg2nwxsiM5tC45opCFyIdR+agn9YdqYcbawuJHlz4hJ
   g==;
X-CSE-ConnectionGUID: 295SXsEaQKylWaZU4mm56w==
X-CSE-MsgGUID: g769SpjqTmmO+zdRvCHalw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69524813"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69524813"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 12:01:56 -0800
X-CSE-ConnectionGUID: 92vCsCAwTmyoG84YSEV10Q==
X-CSE-MsgGUID: PoN+FnfcR5OPtzVyn27E9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204340373"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jan 2026 12:01:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf1dI-00000000Cem-26HD;
	Sun, 11 Jan 2026 20:01:52 +0000
Date: Mon, 12 Jan 2026 04:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 4/4] Input: Add TouchNetix aXiom I2C Touchscreen
 support
Message-ID: <202601120304.d12GmeKu-lkp@intel.com>
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
In-Reply-To: <20260111-v6-10-topic-touchscreen-axiom-v5-4-f94e0ae266cb@pengutronix.de>
References: <20260111-v6-10-topic-touchscreen-axiom-v5-4-f94e0ae266cb@pengutronix.de>
TO: Marco Felsch <m.felsch@pengutronix.de>

Hi Marco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Felsch/firmware_loader-expand-firmware-error-codes-with-up-to-date-error/20260111-231146
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260111-v6-10-topic-touchscreen-axiom-v5-4-f94e0ae266cb%40pengutronix.de
patch subject: [PATCH v5 4/4] Input: Add TouchNetix aXiom I2C Touchscreen support
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: riscv-randconfig-r072-20260112 (https://download.01.org/0day-ci/archive/20260112/202601120304.d12GmeKu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601120304.d12GmeKu-lkp@intel.com/

New smatch warnings:
drivers/input/touchscreen/touchnetix_axiom.c:2141 axiom_zero_volatile_mem() error: uninitialized symbol 'buf'.

Old smatch warnings:
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting
drivers/input/touchscreen/touchnetix_axiom.c:2143 axiom_zero_volatile_mem() error: uninitialized symbol 'buf'.

vim +/buf +2141 drivers/input/touchscreen/touchnetix_axiom.c

479f045f318bf9 Marco Felsch 2026-01-11  2125  
479f045f318bf9 Marco Felsch 2026-01-11  2126  static int axiom_zero_volatile_mem(struct axiom_data *ts)
479f045f318bf9 Marco Felsch 2026-01-11  2127  {
479f045f318bf9 Marco Felsch 2026-01-11  2128  	int ret, size;
479f045f318bf9 Marco Felsch 2026-01-11  2129  	u8 *buf;
479f045f318bf9 Marco Felsch 2026-01-11  2130  
479f045f318bf9 Marco Felsch 2026-01-11  2131  	/* Zero out the volatile memory except for the user content in u04 */
479f045f318bf9 Marco Felsch 2026-01-11  2132  	ret = axiom_u04_get(ts, &buf);
479f045f318bf9 Marco Felsch 2026-01-11  2133  	if (ret < 0)
479f045f318bf9 Marco Felsch 2026-01-11  2134  		return ret;
479f045f318bf9 Marco Felsch 2026-01-11  2135  	size = ret;
479f045f318bf9 Marco Felsch 2026-01-11  2136  
479f045f318bf9 Marco Felsch 2026-01-11  2137  	ret = axiom_u02_fillconfig(ts);
479f045f318bf9 Marco Felsch 2026-01-11  2138  	if (ret)
479f045f318bf9 Marco Felsch 2026-01-11  2139  		goto out;
479f045f318bf9 Marco Felsch 2026-01-11  2140  
479f045f318bf9 Marco Felsch 2026-01-11 @2141  	ret = axiom_u04_set(ts, buf, size);
479f045f318bf9 Marco Felsch 2026-01-11  2142  out:
479f045f318bf9 Marco Felsch 2026-01-11  2143  	kfree(buf);
479f045f318bf9 Marco Felsch 2026-01-11  2144  	return ret;
479f045f318bf9 Marco Felsch 2026-01-11  2145  }
479f045f318bf9 Marco Felsch 2026-01-11  2146  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
