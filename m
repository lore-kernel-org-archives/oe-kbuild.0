Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7023202963
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 04:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774673225; cv=none; b=iEj1h3HaxM79DSobTTS+otcKVn/Kt3o3LVqVSe83OAQ2QWEuLa4W0/r6VHG+W8KmzJzXawMmvSwYmGzAv+p/f7RR0HscN+6ETgp9/1HEts5aOTSuGxJ6W0y0SrdPJzhRZBAlBEtb3igSV8h4fXuePw1L4oYKby0dWB0na/ctrr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774673225; c=relaxed/simple;
	bh=Kx4V7hYRxh87/1NKucHRBhrxI6DX2tY+KM3nnfiF7uk=;
	h=Date:From:To:Subject:Message-ID; b=Ucqwo3I0O4u4xEXVI7Mr731S3EBTl2qrpaIbfAl94WG0OnmDfAD+anhUXaBmOz+nClIgJzMoaSljZ42gCFjUloi0J6KUCJlcckxxh8zn2Y2UXIN4i0xRCpc9eJM18oNmHyzNfTnfM0O9XpwVzEmLYzdVXjqNXL7Yn1UDaKdfAY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1gGRhzS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1gGRhzS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774673224; x=1806209224;
  h=date:from:to:subject:message-id;
  bh=Kx4V7hYRxh87/1NKucHRBhrxI6DX2tY+KM3nnfiF7uk=;
  b=O1gGRhzSCXYvBCrXR1HgwzfEs0q/e89LlLX/1IXv5sAL+3fBUmSjfM/r
   Ud+GQlYX9uWHfJu0cfXH6Ppq4AuThpHcxEJfJN71HRH5RSX8WB1KteGhM
   jdPtzogQxjpoBLt1fGTOYbioyKDSd3U4BlGUxfWQdue62ipBMf3QGqLLV
   30iPKO4B7xMBq2hz4o9U9hUXHl7/Ce2F9PjTopsve4EVNaFT/xl9SMV2h
   EEI1PZI1dCC8Q6EGnZ8JQW/frK8VKdaZrkfolmlZTnIrteyHMncqUTOY1
   F3CQn0oQ/LJJZFO0uz4Nz6eoG3eroxm8ov7kJdP4eNMI0FZfZzQQ748ws
   g==;
X-CSE-ConnectionGUID: 5bBrjDlQSjSvFHrnWYHH0w==
X-CSE-MsgGUID: qY1Jtp+pS3uFa08XEAgNrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="63296695"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="63296695"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 21:47:02 -0700
X-CSE-ConnectionGUID: h3aFVaReSUa9c7ZTvcycwQ==
X-CSE-MsgGUID: ruSMFr8wQAe1JhCMYYQuLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="229983378"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Mar 2026 21:47:01 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6LZa-000000007dT-3YHa
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 04:46:58 +0000
Date: Sat, 28 Mar 2026 05:46:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ardb:arm-xor-intrinsics 14/33] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202603280540.0gdyOta7-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm-xor-intrinsics
head:   08cc4ab31d9ebd8f4b04679a283bdfa823f8e315
commit: 35dd730d1ab2055b3779965d6f087d8e5aca94d9 [14/33] loongarch: move the XOR code to lib/raid/
:::::: branch date: 12 hours ago
:::::: commit date: 20 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603280540.0gdyOta7-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'it'
#6: 
Move the optimized XOR into lib/raid and include it it in xor.ko

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#161: FILE: lib/raid/xor/loongarch/xor_simd_glue.c:15:
+static void xor_##flavor##_2(unsigned long bytes, unsigned long * __restrict p1,\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#172: FILE: lib/raid/xor/loongarch/xor_simd_glue.c:24:
+static void xor_##flavor##_3(unsigned long bytes, unsigned long * __restrict p1,\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#184: FILE: lib/raid/xor/loongarch/xor_simd_glue.c:34:
+static void xor_##flavor##_4(unsigned long bytes, unsigned long * __restrict p1,\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#196: FILE: lib/raid/xor/loongarch/xor_simd_glue.c:45:
+static void xor_##flavor##_5(unsigned long bytes, unsigned long * __restrict p1,\

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
