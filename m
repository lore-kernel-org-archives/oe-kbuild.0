Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9224754774
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 02:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772504054; cv=none; b=RswlsNxHND+6/cRX/VM6o4hf4tsWR3LxZuY4yYtiojtHprxFF2kpWDa2Za/9z+myGIjrlkJbGuujvfG7QFqehtZ9T55VIMDw+iqbBhtO2vUeJnYBKr4Ld0TPEviGe5kcKSBNe3RQGQ7ilZ2vIIeAnqaxrvgGdLdGIg+LQpRUzNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772504054; c=relaxed/simple;
	bh=pgyXNsFvGRv5cQtJTFDqIgmAaAXLOT/F/2aP2KkSpwY=;
	h=Date:From:To:Subject:Message-ID; b=IeOvHm0Pla3evjZDtgeZaj58MiX9rj2l6KRrnN4Uxo+OdO2h07OSLkowxmRK6D6HGA4zAaAqHI6uy53JOZZ1EtPQ7WfLGptwktBadKLJ3PiUzJZReawLfLzdcvZld3ecs1ozNkyIF3BFiJcPg5a+2gXxcLO7cPFCtrSzVCIyIuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OL/AcMyg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OL/AcMyg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772504052; x=1804040052;
  h=date:from:to:subject:message-id;
  bh=pgyXNsFvGRv5cQtJTFDqIgmAaAXLOT/F/2aP2KkSpwY=;
  b=OL/AcMygw3vfof62fImmXDdygWm412/bXTuTts0BE3yJqhzUXldQ6ik8
   gJtWNX07SVSFGfOYGslotGKvPT0l2yx6tLGya70vtW/11dq6FtbCv9ACY
   0FBq0nnmo632fHxeL0ZKSU1PttSAITuKXfQUE/wgJjVUOYGHV+RA34HvO
   5OAIg6xVAvfvuGI7LJZhH0omD5j2ELkHGfWs2oOWUXMjx08rB/B9iZymE
   Yg/ceG46OLOnHHGZQaJAKND5FeCaW+XCIII1PipirLnuBJ6ENzqA/2Zt4
   JXOwIexwotmwdge38z5t+3mAbyD0BWfS1o+W4RPSudW6ZeZc6r+WbdPXI
   w==;
X-CSE-ConnectionGUID: NBLHEgg0RIaYX7ycIeh7gg==
X-CSE-MsgGUID: z7/wgVE4TauCdrLLxw23BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="83866213"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="83866213"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 18:14:12 -0800
X-CSE-ConnectionGUID: 4tKsU/bjQb2mgsE7CUsf8g==
X-CSE-MsgGUID: OIVKAdRLTNO34x1JFFjdtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="215798012"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 02 Mar 2026 18:14:11 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxFGz-000000001Ld-1pIt
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Mar 2026 02:14:09 +0000
Date: Tue, 03 Mar 2026 03:13:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-nonmm-unstable 67/103] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202603030324.OC1GGvoM-lkp@intel.com>
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
head:   edf9ae1454f27f84c0dd4274c9a0519d2917ff4d
commit: ab0d3cf6e7df7344413f83d1e110c914156906ab [67/103] xor: split xor.h
:::::: branch date: 38 minutes ago
:::::: commit date: 38 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603030324.OC1GGvoM-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#125: FILE: include/linux/raid/xor_impl.h:9:
+	void (*do_2)(unsigned long, unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#126: FILE: include/linux/raid/xor_impl.h:10:
+		     const unsigned long * __restrict);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#127: FILE: include/linux/raid/xor_impl.h:11:
+	void (*do_3)(unsigned long, unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#128: FILE: include/linux/raid/xor_impl.h:12:
+		     const unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#129: FILE: include/linux/raid/xor_impl.h:13:
+		     const unsigned long * __restrict);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#130: FILE: include/linux/raid/xor_impl.h:14:
+	void (*do_4)(unsigned long, unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#131: FILE: include/linux/raid/xor_impl.h:15:
+		     const unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#132: FILE: include/linux/raid/xor_impl.h:16:
+		     const unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#133: FILE: include/linux/raid/xor_impl.h:17:
+		     const unsigned long * __restrict);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#134: FILE: include/linux/raid/xor_impl.h:18:
+	void (*do_5)(unsigned long, unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#135: FILE: include/linux/raid/xor_impl.h:19:
+		     const unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#136: FILE: include/linux/raid/xor_impl.h:20:
+		     const unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#137: FILE: include/linux/raid/xor_impl.h:21:
+		     const unsigned long * __restrict,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#138: FILE: include/linux/raid/xor_impl.h:22:
+		     const unsigned long * __restrict);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
