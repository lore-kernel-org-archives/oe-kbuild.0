Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B870E30F7E9
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 05:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764219880; cv=none; b=kuUC0hU+87SY/OgRZJPANqcswFZ/wSDKD9NW9XSU4341Ktba5wbcxyUO72UoN714gn78q92oxtcuh8ut8WcMp4coTgtVboedeAYB23c85HNbS12royVkojnd23Co9tHGEILFT8FizVpLmKqs7c5NeFoeb0LHM8qnn0hL1Til3jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764219880; c=relaxed/simple;
	bh=PAhhHZ5VzIBuHnNf/pOnU1EvZHTqfcrVdgkUrGx8KDE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fY0n00l7YPfAo3ZzHQL0KSsLOPz2AEYq2FLJwM6XPh5I1KLqNf28YwZHQoymbQWU2Trhs2XIrNROM3JxQD4X5qpJIRdv8Zz+caaYdtb49rpYr11B5ZO14wb1i4pztzzxHCslWuhXI13c6ll130I1vCIvBznSM3uZZdEy21CSbEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UrTF0IvZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UrTF0IvZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764219877; x=1795755877;
  h=date:from:to:subject:message-id:mime-version;
  bh=PAhhHZ5VzIBuHnNf/pOnU1EvZHTqfcrVdgkUrGx8KDE=;
  b=UrTF0IvZWp+Qyb1hoFFu+Q4lUrmYAtiZoC6ejViJapEPJYbMtaDd+pCp
   q6I4h5vIeSZlG76k5gmpDo3Fs9AujRkkGaoSypQ1sbvbL8g2THuGrTLoU
   rli22OYSONnoxoJ8IUiLbGCVSOm5qlwOib34uL0spq0J1EbecanhyobnV
   1joFZ7MNe0ky8y3c+wTWct1wM1IXJNoT4viBuybxbIoXe3Uh94PTYZ2WN
   FAhEvOmbxybmNCSYvRqD8rzI7t/5iPPDa0OcGYcxVe0Mo2RQkK2gy9the
   7omtS0t3bd4KpA9OD6w7jECyeWeDVFby/sa+4od35ZdcYcJTCkRCQwKlC
   Q==;
X-CSE-ConnectionGUID: Bg7mg1iLRxWQutPc0401IQ==
X-CSE-MsgGUID: i4mW9uJAQSWwUeAmDQ8AYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66210781"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66210781"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 21:04:35 -0800
X-CSE-ConnectionGUID: KeMp7VG2ThCogq4zLdYuGQ==
X-CSE-MsgGUID: +NbXkzhZSme6tkKG8nH75Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="193151410"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 26 Nov 2025 21:04:35 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOUBE-000000001cb-22ph
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 05:04:32 +0000
Date: Thu, 27 Nov 2025 06:04:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [broonie-ci:fileWFQw2x 21/62] checkpatch: WARNING:BAD_SIGN_OFF:
 Unexpected content after email: 'Srinivas Kandagatla
 <srinivas.kandagatla@oss.qualcomm.com>> ---', should be: 'Srinivas
 Kandagatla <srinivas.kandagatla@oss.qualcomm.com> (---)'
Message-ID: <202511270605.kSlTxGft-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jonathan Marek <jonathan@marek.ca>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileWFQw2x
head:   9d3fcd0ebe91c2079b4aeaffc7493a0bb2ad45f2
commit: 902f497a1ff5d275d2f48c2422d8a9eaa2174dee [21/62] ASoC: codecs: lpass-wsa-macro: remove useless gain read/write sequence
:::::: branch date: 11 hours ago
:::::: commit date: 7 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270605.kSlTxGft-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>> ---', should be: 'Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com> (---)'
#13: 
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>> ---

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
