Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CDF1D31B2
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Oct 2024 20:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728591336; cv=none; b=W1s06TKLZcHi1aNP5e4DPsq+uFQ2Mr35/n1ve3gNzEbsqrW91KCsj4zR0BgMSipM1ovpXISXYbD2UFCe+6a5Ny8fQINe9ElRJWZqWwcNuj64omnrzbDoTSoSY/n0iJgv00cp9ZfciY/NngG6MT1FnvjM4zdvt6IrWyR9AZCfwS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728591336; c=relaxed/simple;
	bh=tyAiSG/LxDMVlfBcNpGBeBRUCK3x9SVbJimeV1hG+Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VIQo3sz0j6h6pKvn4fyjpxzQvsDvj+/AT5fc/VaDv3z3zBRNl7CSvc4Lx/WZO8PNX1RQQi6TWZtEOiEVr3tShnunAHKnF4BxL7gipHI6UKkB2EsNx/jWHDQydfOymmRThSu9ChesU4mQzbViJS9ewAc+NWzEMJFekpzu7Y277hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBWiQj1J; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBWiQj1J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728591334; x=1760127334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tyAiSG/LxDMVlfBcNpGBeBRUCK3x9SVbJimeV1hG+Ks=;
  b=EBWiQj1JADPcDwvoUAekECUcSf7OTeSKSfQ7op4IwQiFqA3PMErn/cI2
   DqH9dPg3PVY30z55+16U2F+4AWozoZ2yp+fkiEJFbgmCjxcqvHbkBoDHr
   3Sq6njt9ziXAM0nPoVLGxZxs9XktQeYw6P7tyNSY6RzZUsXVDzUcaKzqh
   FeZKcX/KNDDnDXJIRft1FBLnks/vpBk51xObWcbS3yIHqO2Evq7wFImZC
   nUC/K0Fg3+3GJFS14j8gruWEJVHZg/JzPVN5CZGVD6XleTfhBK92/xCD4
   AdpBpLGyfvAruqORAoh7KdmRpY8tOcaRDdSZb8FEdSdJbmD5zYoglF36h
   A==;
X-CSE-ConnectionGUID: iqcRgbRaRHuUDWsg8ebW3w==
X-CSE-MsgGUID: 9PxxF/FiToS1EhLfloX9EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="39371545"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="39371545"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 13:15:33 -0700
X-CSE-ConnectionGUID: zGQOwWVsQGmrCA6T7u/kpQ==
X-CSE-MsgGUID: qobLJGB8QC2fUSUn2Wt0gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="81515428"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Oct 2024 13:15:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syzZJ-000BDx-0B;
	Thu, 10 Oct 2024 20:15:29 +0000
Date: Fri, 11 Oct 2024 04:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] cleanup: adjust scoped_guard() to avoid potential
 warning
Message-ID: <202410110433.LIopXfvW-lkp@intel.com>
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
In-Reply-To: <20241009114446.14873-1-przemyslaw.kitszel@intel.com>
References: <20241009114446.14873-1-przemyslaw.kitszel@intel.com>
TO: Przemek Kitszel <przemyslaw.kitszel@intel.com>
TO: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: amadeuszx.slawinski@linux.intel.com
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: nex.sw.ncis.osdt.itp.upstreaming@intel.com
CC: netdev@vger.kernel.org
CC: Markus Elfring <Markus.Elfring@web.de>
CC: Przemek Kitszel <przemyslaw.kitszel@intel.com>
CC: Dan Carpenter <error27@gmail.com>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Hi Przemek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 44badc908f2c85711cb18e45e13119c10ad3a05f]

url:    https://github.com/intel-lab-lkp/linux/commits/Przemek-Kitszel/cleanup-adjust-scoped_guard-to-avoid-potential-warning/20241009-194608
base:   44badc908f2c85711cb18e45e13119c10ad3a05f
patch link:    https://lore.kernel.org/r/20241009114446.14873-1-przemyslaw.kitszel%40intel.com
patch subject: [PATCH v2] cleanup: adjust scoped_guard() to avoid potential warning
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-161-20241010 (https://download.01.org/0day-ci/archive/20241011/202410110433.LIopXfvW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410110433.LIopXfvW-lkp@intel.com/

smatch warnings:
drivers/hv/hv_balloon.c:716 hv_mem_hot_add() warn: iterator 'i' not incremented

vim +/i +716 drivers/hv/hv_balloon.c

1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  705  
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  706  static void hv_mem_hot_add(unsigned long start, unsigned long size,
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  707  				unsigned long pfn_count,
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  708  				struct hv_hotadd_state *has)
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  709  {
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  710  	int ret = 0;
ed07ec93e83ec4 K. Y. Srinivasan  2013-07-14  711  	int i, nid;
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  712  	unsigned long start_pfn;
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  713  	unsigned long processed_pfn;
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  714  	unsigned long total_pfn = pfn_count;
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  715  
8852ebf1948d94 Michael Kelley    2024-05-03 @716  	for (i = 0; i < (size/ha_pages_in_chunk); i++) {
8852ebf1948d94 Michael Kelley    2024-05-03  717  		start_pfn = start + (i * ha_pages_in_chunk);
eece30b9f0046c Vitaly Kuznetsov  2016-08-24  718  
4f74fb30ea21d8 Mitchell Levy     2023-08-07  719  		scoped_guard(spinlock_irqsave, &dm_device.ha_lock) {
8852ebf1948d94 Michael Kelley    2024-05-03  720  			has->ha_end_pfn += ha_pages_in_chunk;
8852ebf1948d94 Michael Kelley    2024-05-03  721  			processed_pfn = umin(total_pfn, ha_pages_in_chunk);
bb3ca38ef7aa56 Michael Kelley    2024-05-03  722  			total_pfn -= processed_pfn;
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  723  			has->covered_end_pfn += processed_pfn;
4f74fb30ea21d8 Mitchell Levy     2023-08-07  724  		}
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  725  
bc58ebd506c369 David Hildenbrand 2020-04-06  726  		reinit_completion(&dm_device.ol_waitevent);
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  727  
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  728  		nid = memory_add_physaddr_to_nid(PFN_PHYS(start_pfn));
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  729  		ret = add_memory(nid, PFN_PHYS((start_pfn)),
8852ebf1948d94 Michael Kelley    2024-05-03  730  				 HA_BYTES_IN_CHUNK, MHP_MERGE_RESOURCE);
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  731  
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  732  		if (ret) {
223e1e4d2c16fe Vitaly Kuznetsov  2018-03-04  733  			pr_err("hot_add memory failed error is %d\n", ret);
7f4f2302a11173 K. Y. Srinivasan  2013-03-18  734  			if (ret == -EEXIST) {
7f4f2302a11173 K. Y. Srinivasan  2013-03-18  735  				/*
7f4f2302a11173 K. Y. Srinivasan  2013-03-18  736  				 * This error indicates that the error
7f4f2302a11173 K. Y. Srinivasan  2013-03-18  737  				 * is not a transient failure. This is the
7f4f2302a11173 K. Y. Srinivasan  2013-03-18  738  				 * case where the guest's physical address map
7f4f2302a11173 K. Y. Srinivasan  2013-03-18  739  				 * precludes hot adding memory. Stop all further
7f4f2302a11173 K. Y. Srinivasan  2013-03-18  740  				 * memory hot-add.
7f4f2302a11173 K. Y. Srinivasan  2013-03-18  741  				 */
7f4f2302a11173 K. Y. Srinivasan  2013-03-18  742  				do_hot_add = false;
7f4f2302a11173 K. Y. Srinivasan  2013-03-18  743  			}
4f74fb30ea21d8 Mitchell Levy     2023-08-07  744  			scoped_guard(spinlock_irqsave, &dm_device.ha_lock) {
8852ebf1948d94 Michael Kelley    2024-05-03  745  				has->ha_end_pfn -= ha_pages_in_chunk;
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  746  				has->covered_end_pfn -=  processed_pfn;
4f74fb30ea21d8 Mitchell Levy     2023-08-07  747  			}
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  748  			break;
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  749  		}
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  750  
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  751  		/*
bc58ebd506c369 David Hildenbrand 2020-04-06  752  		 * Wait for memory to get onlined. If the kernel onlined the
bc58ebd506c369 David Hildenbrand 2020-04-06  753  		 * memory when adding it, this will return directly. Otherwise,
bc58ebd506c369 David Hildenbrand 2020-04-06  754  		 * it will wait for user space to online the memory. This helps
bc58ebd506c369 David Hildenbrand 2020-04-06  755  		 * to avoid adding memory faster than it is getting onlined. As
bc58ebd506c369 David Hildenbrand 2020-04-06  756  		 * adding succeeded, it is ok to proceed even if the memory was
bc58ebd506c369 David Hildenbrand 2020-04-06  757  		 * not onlined in time.
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  758  		 */
bc58ebd506c369 David Hildenbrand 2020-04-06  759  		wait_for_completion_timeout(&dm_device.ol_waitevent, 5 * HZ);
ae339336dc950b K. Y. Srinivasan  2014-04-23  760  		post_status(&dm_device);
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  761  	}
1cac8cd4d146b6 K. Y. Srinivasan  2013-03-15  762  }
9aa8b50b2b3d3a K. Y. Srinivasan  2012-11-14  763  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
