Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C477E34CFDC
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Mar 2026 12:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773576637; cv=none; b=gr/fvOhU81y/lVZLaxbC22qcqzexDZnrWXMd0KcQB/214F6ykOnoZnd/xYqRQ7A5Env9IYOe1zhqsbbBv0P961/cL8vDWhClOWLBaBVnMFzBj/M3d0n1MSOgmf4IbB6AEq6z0vH0dE0cbSj7mfdk86pUzgaFbkmhXMLJciYEbS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773576637; c=relaxed/simple;
	bh=u7Q6hN5lV2/8VPVdCAT/9sVRP4pC24UgVIgmF5mr6GU=;
	h=Date:From:To:Subject:Message-ID; b=ez9c+qFtDjt3Hp3/eRx5OW9cIf2CupNgeWpK2bf/U1DWd1LpBmySSL6YtdZMyQ+FFUPD3O5d/VtP5LdIQ1UEZGKOtBhk0p6VOnp4AXs1N/trI6ErQf9QFeVQUYcPaDaOEsPocxsTEXVPODvjMZ+xBY4+VuUqYN9IUpEXsUfWvnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEiN1sOP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEiN1sOP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773576636; x=1805112636;
  h=date:from:to:subject:message-id;
  bh=u7Q6hN5lV2/8VPVdCAT/9sVRP4pC24UgVIgmF5mr6GU=;
  b=EEiN1sOPlBSWkEFANe+ObmzlCijiGobW7PDi0F27f9MlpGxXC4wI+MeU
   hsd53Q3GQ2V+xrTKzD0yrAPOahI2TZB3Q0j1WmNmGjUz2xGzm9D+Ym9F3
   vmAlHeG6tVxaMkcs+1pZzi/ndpkPhudTuBG3gwQbG7c3CYROoFm7xbTi4
   HSeMXP5Cw/rQyEcCCBmtqOR4hggXDHStAMg+fVc3HyorAZrxzJE5nD8/T
   XBf7GHyHlRuZBhgMQ4atjiB8Vx4NjdmQHyyIZo4YGd26Fyx870l6uLlDl
   S2gYDjmVvTuhzTi8Ak6hbQMfrnrkZDEfc+DXYW53Z/g3jZw7NsWUpYwXC
   Q==;
X-CSE-ConnectionGUID: alyZDogPTa+ZmD41LbzJHw==
X-CSE-MsgGUID: Z32oL08dSBSCEsHoI2duzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="86092303"
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="86092303"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 05:10:35 -0700
X-CSE-ConnectionGUID: OmW4/BCgSfCgkvdSPB4KhA==
X-CSE-MsgGUID: zOFn6MwGShicYF+xWG3Wkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="259525262"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 15 Mar 2026 05:10:34 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1kIi-0000000042T-0aqV
	for oe-kbuild@lists.linux.dev;
	Sun, 15 Mar 2026 12:10:32 +0000
Date: Sun, 15 Mar 2026 13:10:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-nonmm-unstable 57/112] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202603151307.8jRnoNqx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   f24237270454953662a56f4163837ebd026d6fe7
commit: fada020e6990ed4edd01eb1d5ade0b73f1e8d491 [57/112] xor: split xor.h
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260315/202603151307.8jRnoNqx-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#140: FILE: include/linux/raid/xor_impl.h:9:
+	void (*do_2)(unsigned long, unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#141: FILE: include/linux/raid/xor_impl.h:10:
+		     const unsigned long * __restrict);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#142: FILE: include/linux/raid/xor_impl.h:11:
+	void (*do_3)(unsigned long, unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#143: FILE: include/linux/raid/xor_impl.h:12:
+		     const unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#144: FILE: include/linux/raid/xor_impl.h:13:
+		     const unsigned long * __restrict);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#145: FILE: include/linux/raid/xor_impl.h:14:
+	void (*do_4)(unsigned long, unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#146: FILE: include/linux/raid/xor_impl.h:15:
+		     const unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#147: FILE: include/linux/raid/xor_impl.h:16:
+		     const unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#148: FILE: include/linux/raid/xor_impl.h:17:
+		     const unsigned long * __restrict);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#149: FILE: include/linux/raid/xor_impl.h:18:
+	void (*do_5)(unsigned long, unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#150: FILE: include/linux/raid/xor_impl.h:19:
+		     const unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#151: FILE: include/linux/raid/xor_impl.h:20:
+		     const unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#152: FILE: include/linux/raid/xor_impl.h:21:
+		     const unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#153: FILE: include/linux/raid/xor_impl.h:22:
+		     const unsigned long * __restrict);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
