Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692356;
	b=fRGpee39CZpMVerTabeLlZjrRZfQxebgsSqWXpgaUZUKHtiN6MfY5dIQtrsB/rI6JgXp
	 Zht0j2RLbVrHdW0LJK/FeaJCxmYEoc4Pn8O/HKzqdMGwVTDcgnkaW7h2EjlpsJ2Q0gOVo
	 leUJKLKN9Sqam+cbM9nNkhjdDCavjStg9LVCqGkF6sE97m6N660rKPduJ44QnsvSTlQLu
	 ileVw26ImqWwfZLi4QjlSxy7TG/XZnhEncFE7+ZyiPIRKlQseQgoM64wDVU+j1hOpf6yt
	 EQiWcbG/P7MMIDWCtSERiaxrrFTg4C11o3gT0SRsQdPtsUktVbiELcDjwI//NTJuF8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692356;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=9PNJRlTcIufbwNqkg/NxfzJyMBtvH+XFHdwhYcQ8Z14=;
	b=PP7mKymA4KPXx/iWEXHeuKi3JM/ywmzj3eiBfUYutw+KqJUU2eA4GlfW1lD8rSknzZFC
	 /hIAxwlNUxVHYmSyTI7EJrXpM3KfT1a/RSQ2tffsnu21Ndw0kGmM+kbqXDM51NwIPUXmV
	 aW1P3KLtrjODP7CT01krCNiJ7Qk8GCLMg4lQWIanYnxHx0ywUEjNKqnuMP/tp9kCD+iMp
	 OezSeJMs6CggKn2kJMKz0keABU+dsIKBn095Mx+ZqiaqsFCc7S8QUBIN6cioV4A6ENf4U
	 RgjPcB1QKKoeOnrsaESp0f5Zkqpjq3s4vFJBshWsuvzSVIyfiEBAMCP+ws6wcL/f5Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SEzTI8rQ;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C348606A330
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Nov 2026 07:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C348606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SEzTI8rQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793692355; x=1825228355;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Ts8DuOdsoT2xNJObbq3ZF2tATjyaFBbKfCRIsHQFOnk=;
  b=SEzTI8rQuhyej8nMPnu6MGjMpg9cpL6KWQyR3Je+sJNZo6GqlH4Hf9cg
   rRMjBxW8SCi7Qh+/B3+zdBQUyq+YJsfm7a4m/jvxC0XxQKbESN5bVmmKi
   r5GwJXZBsxO30tVqZn+h0rXEQjoVOC4Hdcwx76zj3YSlxBLPCI0MMXB9G
   ryWu/PKnAfiK5eFsQjVPDrqMTDkWoeJNY3tfa0nyNV1MZYkgab8Ocn1pw
   VgC9HLH6tB3z7fAiHS7DvdJNbjYgy/jckv2mUwoLl0IIcfwLadHSEfZgb
   gUBkanYJbetp4Dptmz+RbwQNouAdi5ze+o50gv9Ex7imFcyJwjLbODyAR
   w==;
X-CSE-ConnectionGUID: GKHIF4iwQsqTcYlA0BcVhg==
X-CSE-MsgGUID: DQbZ9sqzTKOf+iIncna0Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2283648"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2283648"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 23:51:07 -0800
X-CSE-ConnectionGUID: uQaPZrhkTkOGC4lqujc4jA==
X-CSE-MsgGUID: NeBSqBK6TAqYdN+OcKXPGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6517977"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Nov 2026 23:51:06 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xO9IN-00000000iT2-37Xw;
	Tue, 03 Nov 2026 07:51:03 +0000
Date: Tue, 3 Nov 2026 15:50:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 06/16] accel/thames: Create a context per client on
 device open
Message-ID: <202611031532.mfcuAJrN-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261023-thames-v3-6-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-6-3ab40aa17157@tomeuvizoso.net>
TO: Tomeu Vizoso <tomeu.vizoso@gmail.com>
TO: Nishanth Menon <nm@ti.com>
TO: "Andrew F. Davis" <afd@ti.com>
TO: Randolph Sapp <rs@ti.com>
TO: Jonathan Humphreys <j-humphreys@ti.com>
TO: Andrei Aldea <a-aldea@ti.com>
TO: Chirag Shilwant <c-shilwant@ti.com>
TO: Vignesh Raghavendra <vigneshr@ti.com>
TO: Beleswar Padhi <b-padhi@ti.com>
TO: Tero Kristo <kristo@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Oded Gabbay <ogabbay@kernel.org>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Sumit Semwal <sumit.semwal@linaro.org>
TO: "Christian König" <christian.koenig@amd.com>
TO: Robert Nelson <robertcnelson@gmail.com>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Jani Nikula <jani.nikula@linux.intel.com>
TO: Tvrtko Ursulin <tursulin@ursulin.net>
TO: Markus Elfring <Markus.Elfring@web.de>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Mathieu Poirier <mathieu.poirier@linaro.org>
TO: Suman Anna <s-anna@ti.com>
TO: Kees Cook <kees@kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>

Hi Tomeu,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1ecab8b0bad393750c60cc3819ce9c256595463c]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomeu-Vizoso/dt-bindings-remoteproc-k3-dsp-Add-the-L2-auxiliary-and-DRU-regions/20261023-083926
base:   1ecab8b0bad393750c60cc3819ce9c256595463c
patch link:    https://lore.kernel.org/r/20261023-thames-v3-6-3ab40aa17157%40tomeuvizoso.net
patch subject: [PATCH v3 06/16] accel/thames: Create a context per client on device open
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261103/202611031532.mfcuAJrN-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 65303e81f481bbfe386b8596423f94c43198ba94)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611031532.mfcuAJrN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611031532.mfcuAJrN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/io-pgtable-arm.c:443:6: error: assigning to 'arm_lpae_iopte' (aka 'unsigned long long') from incompatible type 'void'
     443 |         old = cmpxchg64_relaxed(ptep, curr, new);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=y]
   Selected by [m]:
   - DRM_ACCEL_THAMES [=m] && DRM [=m] && DRM_ACCEL [=y] && TI_K3_DSP_REMOTEPROC [=m] && REMOTEPROC [=y] && MAILBOX [=y]


vim +443 drivers/iommu/io-pgtable-arm.c

c896c132b01895 Laurent Pinchart   2014-12-14  423  
fb3a95795da53d Robin Murphy       2017-06-22  424  static arm_lpae_iopte arm_lpae_install_table(arm_lpae_iopte *table,
fb3a95795da53d Robin Murphy       2017-06-22  425  					     arm_lpae_iopte *ptep,
2c3d273eabe8b1 Robin Murphy       2017-06-22  426  					     arm_lpae_iopte curr,
9abe2ac834851a Hector Martin      2021-11-20  427  					     struct arm_lpae_io_pgtable *data)
fb3a95795da53d Robin Murphy       2017-06-22  428  {
2c3d273eabe8b1 Robin Murphy       2017-06-22  429  	arm_lpae_iopte old, new;
9abe2ac834851a Hector Martin      2021-11-20  430  	struct io_pgtable_cfg *cfg = &data->iop.cfg;
e1d3c0fd701df8 Will Deacon        2014-11-14  431  
adb77e757680dc Mostafa Saleh      2026-05-13  432  	new = paddr_to_iopte(virt_to_phys(table), data) | ARM_LPAE_PTE_TYPE_TABLE;
fb3a95795da53d Robin Murphy       2017-06-22  433  	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_NS)
fb3a95795da53d Robin Murphy       2017-06-22  434  		new |= ARM_LPAE_PTE_NSTABLE;
e1d3c0fd701df8 Will Deacon        2014-11-14  435  
77f3445866c39d Will Deacon        2017-06-23  436  	/*
77f3445866c39d Will Deacon        2017-06-23  437  	 * Ensure the table itself is visible before its PTE can be.
77f3445866c39d Will Deacon        2017-06-23  438  	 * Whilst we could get away with cmpxchg64_release below, this
77f3445866c39d Will Deacon        2017-06-23  439  	 * doesn't have any ordering semantics when !CONFIG_SMP.
77f3445866c39d Will Deacon        2017-06-23  440  	 */
77f3445866c39d Will Deacon        2017-06-23  441  	dma_wmb();
2c3d273eabe8b1 Robin Murphy       2017-06-22  442  
2c3d273eabe8b1 Robin Murphy       2017-06-22 @443  	old = cmpxchg64_relaxed(ptep, curr, new);
2c3d273eabe8b1 Robin Murphy       2017-06-22  444  
4f41845b340783 Will Deacon        2019-06-25  445  	if (cfg->coherent_walk || (old & ARM_LPAE_PTE_SW_SYNC))
2c3d273eabe8b1 Robin Murphy       2017-06-22  446  		return old;
2c3d273eabe8b1 Robin Murphy       2017-06-22  447  
2c3d273eabe8b1 Robin Murphy       2017-06-22  448  	/* Even if it's not ours, there's no point waiting; just kick it */
41e1eb2546e9c8 Isaac J. Manjarres 2021-06-16  449  	__arm_lpae_sync_pte(ptep, 1, cfg);
2c3d273eabe8b1 Robin Murphy       2017-06-22  450  	if (old == curr)
2c3d273eabe8b1 Robin Murphy       2017-06-22  451  		WRITE_ONCE(*ptep, new | ARM_LPAE_PTE_SW_SYNC);
2c3d273eabe8b1 Robin Murphy       2017-06-22  452  
2c3d273eabe8b1 Robin Murphy       2017-06-22  453  	return old;
e1d3c0fd701df8 Will Deacon        2014-11-14  454  }
e1d3c0fd701df8 Will Deacon        2014-11-14  455  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
