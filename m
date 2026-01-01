Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFADD1A3029
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jan 2026 01:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767231236; cv=none; b=jBcu2KhJYqelEvFg/063C0p4B+yZnAGaIfHAwsBzc4v9CSBB0BjnUZRJLqX19PBctDtN1tsJs7k6JAn9ctamJeK5VNgEbzKYcU1frBxszPbhjd1yvAJjDVqL+xh/9+Kbf5HNZhNNOL+NdkBWkyrJWE3VYixByhxiqND26wmv084=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767231236; c=relaxed/simple;
	bh=MhQ+Y6Ir2P5RPPrsNHwjSwDzlMr7MPJG/Dw2WpXWgzo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=Zo/bBANhHg0DzHIw2Kz/VttYgLZ1TPvIXJp9Fqz6Qd9FG6GY5x8a7FyKlh8iSQV11yjQUQXx1h7ZIkoSTVluqz1kIR6/PPxGKkNVy4ensnP07LWq/a7dl6hVT7T+Ha2LChnHriFwdpKyQzwmd3J+ScCTo47RZ9ZJ/w18I8n+JR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJLMvO9w; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJLMvO9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767231235; x=1798767235;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MhQ+Y6Ir2P5RPPrsNHwjSwDzlMr7MPJG/Dw2WpXWgzo=;
  b=mJLMvO9wQ5Mn3uuLtLlLtr5p/g8PmIN0pOpyVCv/dl4+o0DrvF+w7+E8
   QYzQsMx9tu730i2mc7MO8ZqJegX+z2ABmPlE088mTQdXdXPwCMPFWalT6
   HPpAVF15xST7KqVEjdOx0CdmT9X1z56jn4Zhphdc96ubYY03NwmeXpBCa
   LWi+D/GXQhKo7u/v/B/koxo5pDM3PukdVihMpE6tbOYLOM/ZV9vtitdcP
   b57dd71DGxTuVPV7vBH33rCZtAzE7ieZU1kwD2rPxqzPrkOTVFsWjRdSU
   hsubZQRmDgwnh1IlsKuj01kuquOj5+BdQo1cMkixroO7834qPedPoyS0T
   w==;
X-CSE-ConnectionGUID: 3M7wgRFSTyuuSSs8PcmnPQ==
X-CSE-MsgGUID: 6Eon3uabQJWo+C+5XNkWEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="86365297"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="86365297"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 17:33:54 -0800
X-CSE-ConnectionGUID: 5DebR+elQP+/u1Ol+CH9Eg==
X-CSE-MsgGUID: l66bD8CcRS6UFDJZSWvSug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="202011799"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 31 Dec 2025 17:33:53 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb7ZX-000000000Ab-3eUK
	for oe-kbuild@lists.linux.dev;
	Thu, 01 Jan 2026 01:33:51 +0000
Date: Thu, 01 Jan 2026 02:33:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: 
 =?us-ascii?Q?[linux-review:Maciej-enczykowski/bpf-fix-for-undefined-fu?=
 =?us-ascii?Q?ture-potential-exploits-of-BPF=5FPROG=5FLOAD/20260101-07?=
 =?us-ascii?Q?2345?= 2/2] checkpatch: ERROR:GLOBAL_INITIALISERS: do not
 initialise globals to 0
Message-ID: <202601010240.ItH4jdKf-lkp@intel.com>
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
TO: "Maciej =C5=BBenczykowski" <maze@google.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Maciej-enczykowski/b=
pf-fix-for-undefined-future-potential-exploits-of-BPF_PROG_LOAD/20260101-07=
2345
head:   e470f4fecb312434f9e90eb110e8a91cb3d89108
commit: e470f4fecb312434f9e90eb110e8a91cb3d89108 [2/2] bpf: 'fix' for undef=
ined future potential exploits of BPF_PROG_LOAD
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260101/202601010240.I=
tH4jdKf-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:GLOBAL_INITIALISERS: do not initialise globals to 0
#95: FILE: kernel/bpf/syscall.c:70:
+int sysctl_disable_bpf_prog_load =3D 0;

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
