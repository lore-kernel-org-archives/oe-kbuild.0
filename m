Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CA91D86DC
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 08:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765615224; cv=none; b=icU8zUhis8p3d4OnHjurhUTcxRh5Ac3Dn7Uyq6Tc6vVk6XYJftU+8qZWsSX73N3PN68DJNW1ldd6AddJCTMyZlovfgiNMn/7C36B9w8xHT0UdrxsbkzDCO8d+iKj1zxiBpUF1QW6mCOEXNl3vCM37WFdlE7PGjNkdf5tDu0H2xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765615224; c=relaxed/simple;
	bh=e/nFuK4MTqHAh9Ocv02uxMe4SC7+LYllv/dimHryw+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NUlfAXJhc6oinS6Pyft2l4gO82mpwLSVHDl82WTUebvH+ih2+M9vquAeJtnZoBzwSo9msTkPaUS+YzcoGIuTsCh+LZKh6HxtvlsQhA2pqJMaNKOyo+VJ1daKP/yAN7t457FgEEbgjKAnbogR7f7TqX41UBTSpj/oSGElihgXdSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SH/g1+Oc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SH/g1+Oc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765615223; x=1797151223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e/nFuK4MTqHAh9Ocv02uxMe4SC7+LYllv/dimHryw+o=;
  b=SH/g1+OcbCBnsR4dM91snxl7nxGtTQRwR21MvNzG+FcYQZfJNrZf3FvH
   CAyctc8e3zk0p9BFF+cv4JtI5nhQ88dS2HDiAcGmz42FWpPzWweczXVRV
   gV4wv4X4Tq6cXSDz58Xra9yCDJSx4+OovczN8bzU4JCzeBis8rdxQxgPb
   HSpWWWBUHlxyIx8EQJ85nndyYEDtDzIkn4+0VhQmLkngrr6i8MEftlVef
   u++/Mf15hQC03p4/B5VWIp84x7DMWK0XrmTHo8OVhHsl4A6t5aL7pTmG4
   XxTWo8/5kqK4af1ad65myAD+s1XAyMOhKh539MW+/dndz5niP4TC4F0xG
   A==;
X-CSE-ConnectionGUID: Cw5TCqT2Rse9TAFJq2DK8g==
X-CSE-MsgGUID: aKi7vyieSZm/A4ROF7yZFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67482831"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67482831"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 00:40:20 -0800
X-CSE-ConnectionGUID: FsPCPrR7RIaoxyItOjnuew==
X-CSE-MsgGUID: eY/i/hXpQwO8FYi6Yd009g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="228340276"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Dec 2025 00:40:19 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vULAm-000000007Kz-35GU;
	Sat, 13 Dec 2025 08:40:16 +0000
Date: Sat, 13 Dec 2025 16:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/dispnv50/crcca7d.c:79 crcca7d_set_src()
 error: uninitialized symbol 'primary_crc'.
Message-ID: <202512131635.hxbwDuH4-lkp@intel.com>
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
TO: Ben Skeggs <bskeggs@nvidia.com>
CC: Dave Airlie <airlied@redhat.com>
CC: Timur Tabi <ttabi@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a859eca0e4cc96f63ff125dbe5388d961558b0e9
commit: 6cc6e08d4542473d79ea83d9123d9d35e9c01c92 drm/nouveau/kms: add support for GB20x
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131635.hxbwDuH4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131635.hxbwDuH4-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/dispnv50/crcca7d.c:79 crcca7d_set_src() error: uninitialized symbol 'primary_crc'.

vim +/primary_crc +79 drivers/gpu/drm/nouveau/dispnv50/crcca7d.c

6cc6e08d454247 Ben Skeggs 2025-02-04  41  
6cc6e08d454247 Ben Skeggs 2025-02-04  42  static int
6cc6e08d454247 Ben Skeggs 2025-02-04  43  crcca7d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source,
6cc6e08d454247 Ben Skeggs 2025-02-04  44  		struct nv50_crc_notifier_ctx *ctx)
6cc6e08d454247 Ben Skeggs 2025-02-04  45  {
6cc6e08d454247 Ben Skeggs 2025-02-04  46  	struct nvif_push *push = &head->disp->core->chan.push;
6cc6e08d454247 Ben Skeggs 2025-02-04  47  	const int i = head->base.index;
6cc6e08d454247 Ben Skeggs 2025-02-04  48  	int primary_crc, ret;
6cc6e08d454247 Ben Skeggs 2025-02-04  49  
6cc6e08d454247 Ben Skeggs 2025-02-04  50  	if (!source) {
6cc6e08d454247 Ben Skeggs 2025-02-04  51  		ret = PUSH_WAIT(push, 1);
6cc6e08d454247 Ben Skeggs 2025-02-04  52  		if (ret)
6cc6e08d454247 Ben Skeggs 2025-02-04  53  			return ret;
6cc6e08d454247 Ben Skeggs 2025-02-04  54  
6cc6e08d454247 Ben Skeggs 2025-02-04  55  		PUSH_MTHD(push, NVCA7D, HEAD_SET_CRC_CONTROL(i), 0);
6cc6e08d454247 Ben Skeggs 2025-02-04  56  
6cc6e08d454247 Ben Skeggs 2025-02-04  57  		return crcca7d_set_ctx(head, NULL);
6cc6e08d454247 Ben Skeggs 2025-02-04  58  	}
6cc6e08d454247 Ben Skeggs 2025-02-04  59  
6cc6e08d454247 Ben Skeggs 2025-02-04  60  	switch (source) {
6cc6e08d454247 Ben Skeggs 2025-02-04  61  	case NV50_CRC_SOURCE_TYPE_SOR:
6cc6e08d454247 Ben Skeggs 2025-02-04  62  		primary_crc = NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR(or);
6cc6e08d454247 Ben Skeggs 2025-02-04  63  		break;
6cc6e08d454247 Ben Skeggs 2025-02-04  64  	case NV50_CRC_SOURCE_TYPE_SF:
6cc6e08d454247 Ben Skeggs 2025-02-04  65  		primary_crc = NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SF;
6cc6e08d454247 Ben Skeggs 2025-02-04  66  		break;
6cc6e08d454247 Ben Skeggs 2025-02-04  67  	default:
6cc6e08d454247 Ben Skeggs 2025-02-04  68  		break;
6cc6e08d454247 Ben Skeggs 2025-02-04  69  	}
6cc6e08d454247 Ben Skeggs 2025-02-04  70  
6cc6e08d454247 Ben Skeggs 2025-02-04  71  	ret = crcca7d_set_ctx(head, ctx);
6cc6e08d454247 Ben Skeggs 2025-02-04  72  	if (ret)
6cc6e08d454247 Ben Skeggs 2025-02-04  73  		return ret;
6cc6e08d454247 Ben Skeggs 2025-02-04  74  
6cc6e08d454247 Ben Skeggs 2025-02-04  75  	ret = PUSH_WAIT(push, 2);
6cc6e08d454247 Ben Skeggs 2025-02-04  76  	if (ret)
6cc6e08d454247 Ben Skeggs 2025-02-04  77  		return ret;
6cc6e08d454247 Ben Skeggs 2025-02-04  78  
6cc6e08d454247 Ben Skeggs 2025-02-04 @79  	PUSH_MTHD(push, NVCA7D, HEAD_SET_CRC_CONTROL(i),
6cc6e08d454247 Ben Skeggs 2025-02-04  80  		  NVDEF(NVCA7D, HEAD_SET_CRC_CONTROL, CONTROLLING_CHANNEL, CORE) |
6cc6e08d454247 Ben Skeggs 2025-02-04  81  		  NVDEF(NVCA7D, HEAD_SET_CRC_CONTROL, EXPECT_BUFFER_COLLAPSE, FALSE) |
6cc6e08d454247 Ben Skeggs 2025-02-04  82  		  NVVAL(NVCA7D, HEAD_SET_CRC_CONTROL, PRIMARY_CRC, primary_crc) |
6cc6e08d454247 Ben Skeggs 2025-02-04  83  		  NVDEF(NVCA7D, HEAD_SET_CRC_CONTROL, SECONDARY_CRC, NONE) |
6cc6e08d454247 Ben Skeggs 2025-02-04  84  		  NVDEF(NVCA7D, HEAD_SET_CRC_CONTROL, CRC_DURING_SNOOZE, DISABLE));
6cc6e08d454247 Ben Skeggs 2025-02-04  85  
6cc6e08d454247 Ben Skeggs 2025-02-04  86  	return 0;
6cc6e08d454247 Ben Skeggs 2025-02-04  87  }
6cc6e08d454247 Ben Skeggs 2025-02-04  88  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
