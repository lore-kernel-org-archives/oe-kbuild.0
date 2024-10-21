Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6DA198A17
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 23:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729551839; cv=none; b=e9O0gXcE5tLHnZtwI/D+juvn4eh+pgKzNNKHQwGo4PUyFpgGkOlShb5IzaaTHtXk7tKH4G9yuEo4AKWqe0e38xyxAdUAhMLcT0qt2RrfaFdIWJnkTkpTqtIGs+CITOSjYFILZhvM7qOi16FWo/uuQKh5I0e/wVp0wRz8rnDuDeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729551839; c=relaxed/simple;
	bh=ijsFyPeV6iCxW9inlUvw7ycFz47asXAyPwCe4ok6zcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ERZScdY9pyRPIkxqAmvRrn8NRg8XaAMh8EanxG3pmSx+ifJ1rcPTyoMhkq2/oiDrj5ocEaT0AHVcQH7clsaWhsAi3+RCX+YB01GaMxhAaEsWVZHM5IcIPq8pEEgV3H1FozkiL/doPZvc4Z6Ia+R+4mrRHlz0ubzJG2lZo+sHwh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Togptmxd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Togptmxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729551837; x=1761087837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ijsFyPeV6iCxW9inlUvw7ycFz47asXAyPwCe4ok6zcI=;
  b=Togptmxdq3xUHay+zHCduQU3slS+r+9f7wrqj4nQk1JDq2lZ3BNzfAak
   js9ileFDq1PmNhHf4yVLIDOw77SOPHbWnHAMfWGsU9F2HNHNC9OqNsl/f
   vjlOy7rOTqp2pTeXDwUlbs8dnr8KYCyrW+/54sKTSmXnL7BHk6vqoxK8e
   dKU3r3CHSgBvic0s9G8hdtr53ohefOuOFhFlXPNg1XxZ2YbxGpOaAH/sk
   aj+R11rtzrohCXnBp7XGSPgIZOCGP9RL1AhFzQB3vHr26G9yM0le/TloI
   e7t8Bz6NL607nyjgRVSSIK91tD+FHX2GHxznHstFQFFyU/GfdP2+NJ1TF
   A==;
X-CSE-ConnectionGUID: Ynvq/ecQTdWDNiFW6O0VsQ==
X-CSE-MsgGUID: mPe9LlR1TZyppa8pFd27EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29159851"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="29159851"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 16:03:56 -0700
X-CSE-ConnectionGUID: oulqZvSXRECHJncF4ZaYIg==
X-CSE-MsgGUID: itmMlQ6RTAKmG7jQM+ciNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="110432445"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Oct 2024 16:03:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t31RI-000SiS-1q;
	Mon, 21 Oct 2024 23:03:52 +0000
Date: Tue, 22 Oct 2024 07:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4661/6324]
 drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c:297 gve_alloc_buffer()
 warn: missing unwind goto?
Message-ID: <202410220707.izQCzKBa-lkp@intel.com>
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
TO: Harshitha Ramamurthy <hramamurthy@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Praveen Kaligineedi <pkaligineedi@google.com>
CC: Shailend Chand <shailend@google.com>
CC: Willem de Bruijn <willemb@google.com>
CC: Jacob Keller <jacob.e.keller@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   63b3ff03d91ae8f875fe8747c781a521f78cde17
commit: ebdfae0d377b487eabb739c55a13a2ab29f21f36 [4661/6324] gve: adopt page pool for DQ RDA mode
:::::: branch date: 17 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-r072-20241021 (https://download.01.org/0day-ci/archive/20241022/202410220707.izQCzKBa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410220707.izQCzKBa-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c:297 gve_alloc_buffer() warn: missing unwind goto?

vim +297 drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c

ebdfae0d377b48 Harshitha Ramamurthy 2024-10-14  280  
ebdfae0d377b48 Harshitha Ramamurthy 2024-10-14  281  int gve_alloc_buffer(struct gve_rx_ring *rx, struct gve_rx_desc_dqo *desc)
ebdfae0d377b48 Harshitha Ramamurthy 2024-10-14  282  {
ebdfae0d377b48 Harshitha Ramamurthy 2024-10-14  283  	struct gve_rx_buf_state_dqo *buf_state;
ebdfae0d377b48 Harshitha Ramamurthy 2024-10-14  284  
ebdfae0d377b48 Harshitha Ramamurthy 2024-10-14  285  	if (rx->dqo.page_pool) {
ebdfae0d377b48 Harshitha Ramamurthy 2024-10-14  286  		buf_state = gve_alloc_buf_state(rx);
ebdfae0d377b48 Harshitha Ramamurthy 2024-10-14  287  		if (WARN_ON_ONCE(!buf_state))
ebdfae0d377b48 Harshitha Ramamurthy 2024-10-14  288  			return -ENOMEM;
ebdfae0d377b48 Harshitha Ramamurthy 2024-10-14  289  
ebdfae0d377b48 Harshitha Ramamurthy 2024-10-14  290  		if (gve_alloc_from_page_pool(rx, buf_state))
ebdfae0d377b48 Harshitha Ramamurthy 2024-10-14  291  			goto free_buf_state;
ebdfae0d377b48 Harshitha Ramamurthy 2024-10-14  292  	} else {
ebdfae0d377b48 Harshitha Ramamurthy 2024-10-14  293  		buf_state = gve_get_recycled_buf_state(rx);
ebdfae0d377b48 Harshitha Ramamurthy 2024-10-14  294  		if (unlikely(!buf_state)) {
ebdfae0d377b48 Harshitha Ramamurthy 2024-10-14  295  			buf_state = gve_alloc_buf_state(rx);
ebdfae0d377b48 Harshitha Ramamurthy 2024-10-14  296  			if (unlikely(!buf_state))
ebdfae0d377b48 Harshitha Ramamurthy 2024-10-14 @297  				return -ENOMEM;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
