Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032101C3C08
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Feb 2026 16:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770912160; cv=none; b=c3df5WBsuAtPqDdfpNeeAwPAs2bH7AF4kblKcCFywK5VhwUpV0sWuLPJ4X/s4rFzBJkso/8mZ4rMct7KVu/AIqZ+4InPXUlMApYlEYElfi8okjXS8pRmgaKM9GUovsxP4kXB8eAhGU/nRtslbwfPIQidbZjyM6sbwcsoh4u+2Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770912160; c=relaxed/simple;
	bh=IzR34K4z9prmfvNZgWB3wIprKzim76ZHNQZrqv0klng=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=gMtSvzyGFzUror7ZKxUztZh8bw9RD9WlgFumPG8V5yg8TW034MQek1RfvqI3sCHhYA+0mzu9OQom9mjGKdlHzMkmlphtmqzZH4CJD68Tj42Q73QNcfXaGBX0JHNRV0p9Yu6Gi3oUCDCobbKYuTEO0srephtFHCOpvioiiHqS6Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZdETinHC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZdETinHC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770912159; x=1802448159;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IzR34K4z9prmfvNZgWB3wIprKzim76ZHNQZrqv0klng=;
  b=ZdETinHCwFHtiJRVZOlLr0QdJfuualepx+tkm+pWDn49szaYZIBmjCbY
   SZPvFOCkg45/6ZBz02GyR/ZG1ax6nu6zV5SaXvHZ71Vo+V+xXzyGxPHpu
   p6BaaPzLVEFsKwX7+QcZgwb6fFchyjLZHczV84y97fk3+xSzgMVO+5XJo
   2V0Q0qIXLp/fnqOGfdOFQABMeHOBYPOCKZx1gcA5l+Oj5xlnDVpXbGUPd
   riIHXNRv9mRihcKWydPqyiqRJMM2hhpC95pfC5i9uRo77856kBv80CA+j
   WfMYba236x7kEv7EyczSCJDzVwhHLBO7Lbo2qEers2bHxhparG5wuuz4C
   A==;
X-CSE-ConnectionGUID: 5ykVi9FXTzyOitNF20LU4A==
X-CSE-MsgGUID: Oqbvk9avRGemcybiFNV6ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71112948"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="71112948"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 08:02:38 -0800
X-CSE-ConnectionGUID: l22pY+M5QxW2E9ZGTJf5qQ==
X-CSE-MsgGUID: UN8jfwcPR067Kkvi3NjICw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="212469919"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 12 Feb 2026 08:02:38 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqZ9H-000000001Ll-1UkZ
	for oe-kbuild@lists.linux.dev;
	Thu, 12 Feb 2026 16:02:35 +0000
Date: Thu, 12 Feb 2026 17:02:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-sparc64-generic-2 7/18]
 checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'pages'
Message-ID: <202602121746.T3WmGwUd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "high confidence checkpatch report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/vdso-sparc64-generic-2
head:   c692bde3cf75e971e791ea0c4922f9b5da7161e3
commit: ba511cd0022adfdfe0804f3da18c5dc4644e1e94 [7/18] vdso/datastore: All=
ocate data pages dynamically
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260212/202602121746.T=
3WmGwUd-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'pages'
#22:=20
The data pages pages need to be order-0, non-compound pages so that the

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
