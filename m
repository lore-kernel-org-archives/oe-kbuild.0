Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2D32F999F
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769438998; cv=none; b=mfVLbqXMBuzh0QUCz0G6uJmTyHjQgnwgcTMB8NCveaXE5JEy5/RjOVeZyXL9t2keX+I95JPLB3bYG44bqSWcBLX39HHXGEiGFXV9ASrviSk7FMhforDMsBR798wB4wK6Hgv1Q5b32IEL/yvTGTJHEMx3TiALiDMWRAFUMpZAFTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769438998; c=relaxed/simple;
	bh=lmhJ3LjYQ/dDcPAyRbfWO/W6YLr2JrZ7VVoHiSFkiz4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e7pmMXAYglv2qM9ElQ+fvVq2piqspjiZqsi5FYCvBfv41vys7eAB9AE8NyeprRWBZQIL34N0R5KL6ogoeURttooYrY82nowXwkKZ3ug5YhrZXQtB1itlqeNJfk5c0yGH27dliVzGrD7Z/W9EcbWRLTHMPFyAhPS+k+odCfvkLEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NL41VEB/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NL41VEB/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769438997; x=1800974997;
  h=date:from:to:cc:subject:message-id;
  bh=lmhJ3LjYQ/dDcPAyRbfWO/W6YLr2JrZ7VVoHiSFkiz4=;
  b=NL41VEB/3TaatKXxn30nmwpMMeznZT4s9XSTMa6nAz5Ex4K8bhu5t8wt
   1cGhcz2gwmko9zmxv/GMPrXOHD2d7o+u+H17HmphzWATtxrfZMkreNVGS
   LWT+q+C1OxASL50qoJ96HSCrHhhQx55kLpb/J5w31NGQZglVhxmAGUJQf
   QMH++s4OXQi2PPnhc/MdJYn0XqVUVRc9elTMTx7hUwn9PKV3srTKwoSol
   BsFqXVGwXNaUf+Tt3ShWT1qRtpC0Rzar/+3e9ceNg11dlHWDoWUAePKSj
   brrR0bMo/CcSVFQfMsL0AC+NHVS52va/ktogUML+MW6SyT98xABjk78OB
   w==;
X-CSE-ConnectionGUID: V1vlKDqySZaoXRCyBO8fhQ==
X-CSE-MsgGUID: E0tWHVeRQLi4lQ/5nO1Qqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81334799"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="81334799"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:49:57 -0800
X-CSE-ConnectionGUID: sA6T8x2jT6eg5MqNol2L1Q==
X-CSE-MsgGUID: uZC1X1hgRQGUeSYnFqv99A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207720982"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Jan 2026 06:49:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkNua-00000000XPM-2q7h;
	Mon, 26 Jan 2026 14:49:52 +0000
Date: Mon, 26 Jan 2026 22:49:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 518/799]
 fs/bcachefs/init/chardev.c:249 bch2_ioctl_disk_remove() warn: 'ca' can also
 be NULL
Message-ID: <202601262244.pCRcXu7I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 383cf0dacfb4922419e7d38a3c22766d62fddc05 [518/799] bcachefs: more __free() conversion
:::::: branch date: 3 months ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-r073-20260126 (https://download.01.org/0day-ci/archive/20260126/202601262244.pCRcXu7I-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601262244.pCRcXu7I-lkp@intel.com/

smatch warnings:
fs/bcachefs/init/chardev.c:249 bch2_ioctl_disk_remove() warn: 'ca' can also be NULL

vim +/ca +249 fs/bcachefs/init/chardev.c

ebb0fa27bb872b fs/bcachefs/chardev.c Kent Overstreet       2025-08-18  229  
1c6fdbd8f2465d fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  230  static long bch2_ioctl_disk_remove(struct bch_fs *c, struct bch_ioctl_disk arg)
1c6fdbd8f2465d fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  231  {
a515d0a50c6e8b fs/bcachefs/chardev.c Tobias Geerinckx-Rice 2021-07-04  232  	if (!capable(CAP_SYS_ADMIN))
a515d0a50c6e8b fs/bcachefs/chardev.c Tobias Geerinckx-Rice 2021-07-04  233  		return -EPERM;
a515d0a50c6e8b fs/bcachefs/chardev.c Tobias Geerinckx-Rice 2021-07-04  234  
1c6fdbd8f2465d fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  235  	if ((arg.flags & ~(BCH_FORCE_IF_DATA_LOST|
1c6fdbd8f2465d fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  236  			   BCH_FORCE_IF_METADATA_LOST|
1c6fdbd8f2465d fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  237  			   BCH_FORCE_IF_DEGRADED|
1c6fdbd8f2465d fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  238  			   BCH_BY_INDEX)) ||
1c6fdbd8f2465d fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  239  	    arg.pad)
1c6fdbd8f2465d fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  240  		return -EINVAL;
1c6fdbd8f2465d fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  241  
635c5791582a65 fs/bcachefs/chardev.c Kent Overstreet       2025-07-14  242  	struct bch_dev *ca = bch2_device_lookup(c, arg.dev, arg.flags);
1c6fdbd8f2465d fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  243  	if (IS_ERR(ca))
1c6fdbd8f2465d fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  244  		return PTR_ERR(ca);
1c6fdbd8f2465d fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  245  
c72d1fe6d35296 fs/bcachefs/chardev.c Kent Overstreet       2025-08-18  246  	CLASS(printbuf, err)();
c72d1fe6d35296 fs/bcachefs/chardev.c Kent Overstreet       2025-08-18  247  	int ret = bch2_dev_remove(c, ca, arg.flags, &err);
c72d1fe6d35296 fs/bcachefs/chardev.c Kent Overstreet       2025-08-18  248  	if (ret)
c72d1fe6d35296 fs/bcachefs/chardev.c Kent Overstreet       2025-08-18 @249  		bch_err(ca, "%s", err.buf);
c72d1fe6d35296 fs/bcachefs/chardev.c Kent Overstreet       2025-08-18  250  	return ret;
1c6fdbd8f2465d fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  251  }
1c6fdbd8f2465d fs/bcachefs/chardev.c Kent Overstreet       2017-03-16  252  

:::::: The code at line 249 was first introduced by commit
:::::: c72d1fe6d3529612bb93391e29c5658acdf0e568 bcachefs: Plumb a printbuf for error strings through ioctls

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
