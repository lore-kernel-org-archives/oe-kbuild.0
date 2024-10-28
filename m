Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FC11EA84
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Oct 2024 22:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730154511; cv=none; b=p2TBECr2rWNNb6NWFn+mzplNsRzKFXbabppsrQlZJMK0YlsJF2WhLxb6+T+zry0vn3rVzn6Z1N+wFrDmewMgrR2xzlqYqPxgVHD4wPgoMS1yuVvTXowatI0mwoAvYIpWGyE3PBjgelsAFWiXuiLKoZCYK+Cvx4t+fxZXRgNbL7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730154511; c=relaxed/simple;
	bh=Wj1T3WNYlFJyDPtyBmEOWT5xLTr0g/9OXXP2K7mmtGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sbY7yYjC5gHOj7t9uC3CfKV4LdVFMmkq2cMDXKW2/gvZaZdrbZSDto9jJnu9+WF1J/4D3+RxeazPSFor2S8s66MIFrUp6eL7MHqxo7L01BRlpDKBtBjrnPQkXlcPzAuIJiqDcqSpkWOOxIUWmQy16KMx3ZztNQcq29upT3G/92c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLmPZaGH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLmPZaGH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730154508; x=1761690508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wj1T3WNYlFJyDPtyBmEOWT5xLTr0g/9OXXP2K7mmtGQ=;
  b=MLmPZaGHw6hk7x/D1IPEn9NYU9DMZxPCkafMKwrm3PFdgrJmrPi61W4m
   vMv8LFVdrdggtgVWL+JVUYSYVB/FCtWEe4OrCDbXnBvN6CasGP6lsqyR1
   YxktcrPnL4We2PdL/DmpMka3/mQ5aywC7t8GU4sKdbGxy00yiqRptz4Oh
   6W0jVV0J4mDfVI9RzGChuBgsyFGO0sNlegjyoeoF4XleENmG+NpLAkT0V
   KAL7g+w1PDhSFZC2WsGgAY2BBJtMt9Y/UHLaMsJPSEWLd6QyqrQoEaJa2
   4CD0K33LSpbAyt7XM/4DaKooCW4MLiCIHdAIDzng0b0+Wc+1WzgNkrnwf
   A==;
X-CSE-ConnectionGUID: o8P/8c/rR3eJ7cdj+CEkgw==
X-CSE-MsgGUID: yNblw89VRf+DOfaqBe1VvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29981100"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="29981100"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 15:28:28 -0700
X-CSE-ConnectionGUID: Ogyy4umqS+SgkZ4/ngXeZA==
X-CSE-MsgGUID: 4DdpBfyVR6u1yZrzofsGEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="81809223"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Oct 2024 15:28:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5YDo-000cxI-2k;
	Mon, 28 Oct 2024 22:28:24 +0000
Date: Tue, 29 Oct 2024 06:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/xe/xe_devcoredump.c:184:21-22: WARNING opportunity
 for min()
Message-ID: <202410290618.4QDbggAx-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Matthew Brost <matthew.brost@intel.com>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   81983758430957d9a5cb3333fe324fd70cf63e7e
commit: 4f04d07c0a94b0b30db839e44f1b8364a1b508ac drm/xe: Faster devcoredump
date:   3 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 3 months ago
config: arc-randconfig-r051-20241029 (https://download.01.org/0day-ci/archive/20241029/202410290618.4QDbggAx-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410290618.4QDbggAx-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_devcoredump.c:184:21-22: WARNING opportunity for min()

vim +184 drivers/gpu/drm/xe/xe_devcoredump.c

4f04d07c0a94b0 Matthew Brost 2024-08-01  162  
4f04d07c0a94b0 Matthew Brost 2024-08-01  163  static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
4f04d07c0a94b0 Matthew Brost 2024-08-01  164  				   size_t count, void *data, size_t datalen)
4f04d07c0a94b0 Matthew Brost 2024-08-01  165  {
4f04d07c0a94b0 Matthew Brost 2024-08-01  166  	struct xe_devcoredump *coredump = data;
4f04d07c0a94b0 Matthew Brost 2024-08-01  167  	struct xe_devcoredump_snapshot *ss;
4f04d07c0a94b0 Matthew Brost 2024-08-01  168  	ssize_t byte_copied;
4f04d07c0a94b0 Matthew Brost 2024-08-01  169  
4f04d07c0a94b0 Matthew Brost 2024-08-01  170  	if (!coredump)
4f04d07c0a94b0 Matthew Brost 2024-08-01  171  		return -ENODEV;
4f04d07c0a94b0 Matthew Brost 2024-08-01  172  
4f04d07c0a94b0 Matthew Brost 2024-08-01  173  	ss = &coredump->snapshot;
4f04d07c0a94b0 Matthew Brost 2024-08-01  174  
4f04d07c0a94b0 Matthew Brost 2024-08-01  175  	/* Ensure delayed work is captured before continuing */
4f04d07c0a94b0 Matthew Brost 2024-08-01  176  	flush_work(&ss->work);
4f04d07c0a94b0 Matthew Brost 2024-08-01  177  
4f04d07c0a94b0 Matthew Brost 2024-08-01  178  	if (!ss->read.buffer)
4f04d07c0a94b0 Matthew Brost 2024-08-01  179  		return -ENODEV;
4f04d07c0a94b0 Matthew Brost 2024-08-01  180  
4f04d07c0a94b0 Matthew Brost 2024-08-01  181  	if (offset >= ss->read.size)
4f04d07c0a94b0 Matthew Brost 2024-08-01  182  		return 0;
4f04d07c0a94b0 Matthew Brost 2024-08-01  183  
4f04d07c0a94b0 Matthew Brost 2024-08-01 @184  	byte_copied = count < ss->read.size - offset ? count :
4f04d07c0a94b0 Matthew Brost 2024-08-01  185  		ss->read.size - offset;
4f04d07c0a94b0 Matthew Brost 2024-08-01  186  	memcpy(buffer, ss->read.buffer + offset, byte_copied);
4f04d07c0a94b0 Matthew Brost 2024-08-01  187  
4f04d07c0a94b0 Matthew Brost 2024-08-01  188  	return byte_copied;
4f04d07c0a94b0 Matthew Brost 2024-08-01  189  }
4f04d07c0a94b0 Matthew Brost 2024-08-01  190  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
