Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAD71CAAC
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Aug 2024 23:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723333452; cv=none; b=G5TusXs4Fc+Dsrp3uL/+2W2y2fziJKWCleUhqGG/5bQTcIzYfj6nHQFjd93voWHqU8YCKSCcgNPXJzaMcUGZb+qB6dUxqd9eZMUdrX02kGQWX4I4o+1aYOwr2KXy0MgI40BQjQQmU5lZx6qbCx8J1t6KgndoQnMN185OUKxms+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723333452; c=relaxed/simple;
	bh=3HYDx5KdPjhOHnfyc0bEwD3p7Igxbr2E0IqKWinba9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KG7r/tYf3upRQqMFlfgtHZCg7KhC7DYzSITrNSjn9WdpvI2tLmWxKv0Hy6+auzCjS1WKy4aq4WOstyS7hVnSZZuZWUYXX43i+LwnelRAwcFPx3PyMxP071pShLcsNb5kci6E9+1pDWxxauT0MVRZVuymBnmeKXW653PgCLJg7k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+xjBlPl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+xjBlPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723333450; x=1754869450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3HYDx5KdPjhOHnfyc0bEwD3p7Igxbr2E0IqKWinba9o=;
  b=T+xjBlPlXTD6SqzNhU577HEQtV68q2vbFHHSA81EkdREAhC1UNmnR6P8
   Kzj9g2Wa3L2KTkhHa1cQDb7e288W0ba+2BSeo40n3EeFgw02qQ6yWoGN0
   IGDdWQw/1DXprhXZQQzCbf5/YoD2ZexIJJTJfZET4bxYYN1zIvXnZc1jq
   oMFWLSpeHNERo8LRbr3TYp/AyceaThZa4P5CP7+zJerruOAzcLTJ0kXJH
   GX9jcd6fHSh4rtG56eRwqJJ4gavOcEtJURE9y6rbWgCWdEGLu8ABvqtvv
   Mvy0b+yC+V9ZcpgEMHRdJJj4mhSrgxYYQP3DDtgmZOapHKtaI/Ebh8tR2
   w==;
X-CSE-ConnectionGUID: HrF+bth1R3ecFkI5DZmNSw==
X-CSE-MsgGUID: BE6Ch0XKTrCJiG+2WkP+Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="32868863"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="32868863"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 16:44:09 -0700
X-CSE-ConnectionGUID: TNi0fGsFQwWc1BOCclf41w==
X-CSE-MsgGUID: pjdtr/z3RF65bHn355wAbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="58604298"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 10 Aug 2024 16:44:09 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scvkk-000AOT-20;
	Sat, 10 Aug 2024 23:44:06 +0000
Date: Sun, 11 Aug 2024 07:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1917/3984] drivers/clk/qcom/clk-alpha-pll.c:2129
 zonda_pll_adjust_l_val() warn: replace divide condition '(remainder * 2) /
 prate' with '(remainder * 2) >= prate'
Message-ID: <202408110724.8pqbpDiD-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   61c01d2e181adfba02fe09764f9fca1de2be0dbe
commit: f4973130d255dd4811006f5822d4fa4d0de9d712 [1917/3984] clk: qcom: clk-alpha-pll: Update set_rate for Zonda PLL
:::::: branch date: 2 days ago
:::::: commit date: 10 days ago
config: microblaze-randconfig-r072-20240810 (https://download.01.org/0day-ci/archive/20240811/202408110724.8pqbpDiD-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/

smatch warnings:
drivers/clk/qcom/clk-alpha-pll.c:2129 zonda_pll_adjust_l_val() warn: replace divide condition '(remainder * 2) / prate' with '(remainder * 2) >= prate'

vim +2129 drivers/clk/qcom/clk-alpha-pll.c

f21b6bfecc2760 Jonathan Marek          2021-06-08  2120  
f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2121  static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32 *l)
f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2122  {
f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2123  	u64 remainder, quotient;
f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2124  
f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2125  	quotient = rate;
f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2126  	remainder = do_div(quotient, prate);
f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2127  	*l = quotient;
f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2128  
f4973130d255dd Satya Priya Kakitapalli 2024-07-31 @2129  	if ((remainder * 2) / prate)
f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2130  		*l = *l + 1;
f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2131  }
f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2132  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
