Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31BD3A89C4
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 21:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768427541; cv=none; b=L63qUJSMqlnhgbCDRelcl1UD4+NPokVrsHz9vlRuJsJON54PzyRE2HlqvEpjy0BVu1/DHLOK1FqLs1kLAlMZZKTmwOKeOzuRWFo6VWfPvq2n6vbedehiDA5/NQHLLxOCM7erzvuFpvT65mXHpAlIXAzwKazciH9Nj+OscjvCwVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768427541; c=relaxed/simple;
	bh=/KF63Ml/t1XbyBNHLg/WjYXeesE21mplhxjRWr1G1bE=;
	h=Date:From:To:Subject:Message-ID; b=QmUtKeDisLadkTSPnbekyl0aqvigz3sf87AOUxZ6JIfvb81r99d0z9I+WjInoDG00YrALbx4uPMqiYx1AqxXXQ1+eNdsAcCmyR/e2X8fZ9RWvUDk1vaJcy9+vj28+AYkgIrVUVMPJTvirsOcaPaUG6HG0EUlFPRn3WR0IIRja0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGf1/K2F; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGf1/K2F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768427526; x=1799963526;
  h=date:from:to:subject:message-id;
  bh=/KF63Ml/t1XbyBNHLg/WjYXeesE21mplhxjRWr1G1bE=;
  b=PGf1/K2FuPeKOsOk9b2GklOhC+l/rb4/cEYJVfvD1LzlcPCQnHbZexsT
   2Xt4/59OF0t8bbmJgLst5e1wwveT5HqNGCu/teEYWcGT20b2oDA2qTz/w
   VCFsoFREmh5AMc0N9sQs4v2sPPBSAXMr97nZ3ecTdXDjtMOvQATurKrfp
   jXeNMjYGTGjOs7u4F8dcxeDB4keoELrcFygwjTQONUoEQ5XO04qINiava
   NtfdVZ1oatxYK7L3w7LL1Myg6FtSRK+EoopYBqqQ3D6MRTO0McLe3GVII
   zFxsGS5LE1chjjDRt0oUfwfi2mIl1v0pxl9Vr/y34u5v5qitfZgV8Y+h2
   w==;
X-CSE-ConnectionGUID: sNshHrT8SFmFSD3AYo6Z1Q==
X-CSE-MsgGUID: M5EzIJ2fTEugdqILZN86bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69634993"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69634993"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 13:52:01 -0800
X-CSE-ConnectionGUID: plKc3GNtSuSrgS2lvCP6JQ==
X-CSE-MsgGUID: iLN1T3YNSbSabdROEhKYhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="227893157"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jan 2026 13:52:00 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg8mT-000000001Sg-3hiE
	for oe-kbuild@lists.linux.dev;
	Wed, 14 Jan 2026 21:51:57 +0000
Date: Wed, 14 Jan 2026 22:51:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [dhowells-fs:netfs-next 6/15] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202601142259.EVjxeigw-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   27f4af29ae0a894f49b0076e49c549e5042ca2d7
commit: 885c1b2da8ed8cea69f0c6b8cf22bb860cb6c52f [6/15] netfs: Unconditionally decant buffer slice into a bvecq for I/O
:::::: branch date: 9 hours ago
:::::: commit date: 10 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260114/202601142259.EVjxeigw-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#222: FILE: fs/netfs/direct_read.c:205:
+	 * Extract an iterator to represent as much of the the output buffer as

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
