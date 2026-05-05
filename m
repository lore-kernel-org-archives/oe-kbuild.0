Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F3017BA6
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 02:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777948168; cv=none; b=YDanaUiIXJltEfPdbEDjqqOJf4RMa5v2wzTfEvWUo01DkmWTBvVu5GxuYP6giwMuBrokx9USPv9BHWV51TT3Cc7pBlJ9V9WVf2UphP0NlUOYgJy+RYdgqw89MOA/nFWVmXAT5Dga+VLWO7QDEycAr7SKkn/3To+iEKHhvnvpg4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777948168; c=relaxed/simple;
	bh=pIoU0L40mcbpykACGu5un2TZzMdZOZ4YAzCDmwVGy2U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gAc/OPSjY2C8pvFCJXChynyQiz/la+UkfYz/j0AhJURhpkqLIF80XhAAWg/CAavPmnoAG4aKusrCb+h8xhPsoHk42HaIozKDyiD2USSfxvn4M1wfXHsJUFsDHvyUvzLJRgjgmOeozLNpgJ+bCH2aau7zJ8n1N51kC8K8NM8nW54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLxPSv8C; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLxPSv8C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777948166; x=1809484166;
  h=date:from:to:cc:subject:message-id;
  bh=pIoU0L40mcbpykACGu5un2TZzMdZOZ4YAzCDmwVGy2U=;
  b=fLxPSv8C0c9kcs2VnTos+m7glEUhMY1Fss/YaqO/n1w2Lzb56ATJiNOO
   8Os+YIQTqm/0sXs6XZMANiXEhHBpVolOT8N0A4qNuC2XtEjRvsZ9Uw9R3
   XabbAyxERbeYKRINQ9hoAa44yrBD2bmNj8HzT6pxpQ8I5Z1SJzbQDOivN
   svF1EOjeckLQGZe3DnLvI7TufLNWbZL3NLPfRofTc9HA3dRNUq7ajNqeN
   5w9u/JoYmgyKSB4yBGmxXCoVJI6LkWt/WzExwhIU7+ypYk10KENXDF7KG
   Z8PvrEGfScgLMekG4/ZQr1x4QTlN3KKPinX28fmB+9NC6jxrSZTty1HgF
   Q==;
X-CSE-ConnectionGUID: xx15q4MMT/qT8whXh0R2Vg==
X-CSE-MsgGUID: AU7XG6V9SbylP9ZecXQyEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89400913"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="89400913"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 19:29:25 -0700
X-CSE-ConnectionGUID: KY1DPQCOQ/CHa+cXfjIuog==
X-CSE-MsgGUID: JtgjbPOjRES+Cj4Yx/2nHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="232547041"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 May 2026 19:29:24 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK5X8-000000004AZ-1b3A;
	Tue, 05 May 2026 02:29:16 +0000
Date: Tue, 05 May 2026 10:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/nouveau/nouveau_abi16.c:63:2-8: preceding
 lock on line 61
Message-ID: <202605051002.OlOdbU8N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tiwei Bie <tiwei.btw@antgroup.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d35786de28116ecf78797a62b84e6bf3c45aa5a
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   1 year ago
:::::: branch date: 28 hours ago
:::::: commit date: 1 year ago
config: um-randconfig-r054-20260505 (https://download.01.org/0day-ci/archive/20260505/202605051002.OlOdbU8N-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a0e2cb6a9063 ("um: Add VFIO-based virtual PCI driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605051002.OlOdbU8N-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nouveau_abi16.c:63:2-8: preceding lock on line 61

vim +63 drivers/gpu/drm/nouveau/nouveau_abi16.c

ebb945a94bba2c Ben Skeggs 2012-07-20  56  
786a57ef2cebb2 Ben Skeggs 2015-11-03  57  struct nouveau_abi16 *
786a57ef2cebb2 Ben Skeggs 2015-11-03  58  nouveau_abi16_get(struct drm_file *file_priv)
786a57ef2cebb2 Ben Skeggs 2015-11-03  59  {
786a57ef2cebb2 Ben Skeggs 2015-11-03  60  	struct nouveau_cli *cli = nouveau_cli(file_priv);
786a57ef2cebb2 Ben Skeggs 2015-11-03 @61  	mutex_lock(&cli->mutex);
786a57ef2cebb2 Ben Skeggs 2015-11-03  62  	if (nouveau_abi16(file_priv))
786a57ef2cebb2 Ben Skeggs 2015-11-03 @63  		return cli->abi16;
786a57ef2cebb2 Ben Skeggs 2015-11-03  64  	mutex_unlock(&cli->mutex);
786a57ef2cebb2 Ben Skeggs 2015-11-03  65  	return NULL;
786a57ef2cebb2 Ben Skeggs 2015-11-03  66  }
786a57ef2cebb2 Ben Skeggs 2015-11-03  67  

:::::: The code at line 63 was first introduced by commit
:::::: 786a57ef2cebb2d09d7f152b0ed4f1da1d368073 drm/nouveau/abi16: introduce locked variant of nouveau_abi16_get()

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
