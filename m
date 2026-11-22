Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795388015;
	b=fGz1cc5N4CeKpwW00VcKC7SnT09UHB8dS84ye7asRKeqZSzXCNyPFzCiARLZAiRNQZoU
	 8eI8iEL8itblDfRc24k5kH0B3E8fhHmCgQf8SVLiEqjPeaXWideM9rd4rtBUwwfx4WUb3
	 tDSG+4IecX9Whx2NeCx7ele1jGrUZPb1EVO5EKl3BAz1E5bvFw8i3d4XTMvRQBF2wyub9
	 D/4O0zab0g/fVP9Oc0/4h1NJHtC26pJFPOvTxljaB8clFoBgZKn1N7V8zDUwIB+JtR2jt
	 cyv0DjY9i8vK95+CkHSrLippOpSIS/wAD5BZ1hMHQGC9BHteBmpNZCZ9EiWkIDakx7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795388015;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xmKIc+rEKYiPJkrzNReK5sCWAFpn9RkzQ/qCLzVLsqM=;
	b=QrhroUo6LFUosY0iIWnaAD0Ozmy8fBFbP51OIBaetKxK/xns9k2E58psQB4JrpSNTYyo
	 yHMVJ+blxLIX9WYEw7S4S8Q85d+FN5m1UrQgFQ1OX7l4wvN1vRFYJAfy9+jOzzhtx59AG
	 7yQFLu+VWj79SAG1DBd50dlmAAmzdCQy+VKvzeCXAdPISROFxXUPP246D5M7nAtvCICUx
	 Ue+PW/ydcsmRL7oYjs6EnOG0LgpbMvosg7XZdSKtfvIQiaGbf4amI3rnY+lKdzaKHUuBe
	 6twg93pCQCCG9E2v0EfgnDYrV4nwxEcl1Be6vUzWKYOuLo68dQ+krh1k30AiYn1pFOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pa0Q3+hQ;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2132606A31A
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 22:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2132606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pa0Q3+hQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795388015; x=1826924015;
  h=date:from:to:cc:subject:message-id;
  bh=tzB5w8xX/6uqXf031zYRo+zWL69Jf/8xmC2rTE+9xP4=;
  b=Pa0Q3+hQzigXt2VRCndMdWTeKgxkG4giT5fvDpMftya0Q2iM3j5/NImX
   MfMGPI/l71bFmI0u1+d/+q38wfiHm+J31YipP7gbh6PRw9E2Lp5vIFulL
   yOCRzEpgRzBO/KK6hx6GocLNIwFaBSvdJHYIwwhYQkkx6aRyULvGs2ywB
   2PQ24D4wr5k0BKLEr1NvNiqeuPd2osahrtBUrITcdscItJlhMLSxlsNGK
   lO5MXwRwo/a4bykuPtoRbeU4ZsQ3HrtjQBERBQ8hvkHOeJsFSJKZfj5uu
   Ytas/pBfSZlI3BzR4ZkEMhS7wZN4rHrrBpcVVIIXNOF9Qv9sEn7urEh+q
   w==;
X-CSE-ConnectionGUID: rMlgaJt6Q6CwYli8jIG/RQ==
X-CSE-MsgGUID: UOSDzpJYTYSMiabfIGTpLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4184083"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4184083"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 14:53:34 -0800
X-CSE-ConnectionGUID: IKiioPs+ROGo3/7AdP0UHw==
X-CSE-MsgGUID: cEnGMOA8RmKqS+4X1VZdjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11279510"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 22 Nov 2026 14:53:33 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVGR8-000000004cg-2N0a;
	Sun, 22 Nov 2026 22:53:30 +0000
Date: Sun, 22 Nov 2026 23:53:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/refcount.o: warning: objtool:
 refcount_warn_saturate+0xa8: unreachable instruction
Message-ID: <20261122234826.IbOM4iu9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jann Horn <jannh@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

Hi Jann,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2dc60bd9975fc8666a13d58410499e06e6799ba9
commit: 5b5224220747029bbaee8ab851cc6c599c48eded refcount: Use CONFIG_BUG_ON_DATA_CORRUPTION for UAF-related errors
date:   7 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 weeks ago
config: loongarch-randconfig-r2301-20261121 (https://download.01.org/0day-ci/archive/20261122/20261122234826.IbOM4iu9-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122234826.IbOM4iu9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5b5224220747 ("refcount: Use CONFIG_BUG_ON_DATA_CORRUPTION for UAF-related errors")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122234826.IbOM4iu9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Assembler messages:
   {standard input}:57: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:139: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
>> lib/refcount.o: warning: objtool: refcount_warn_saturate+0xa8: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
