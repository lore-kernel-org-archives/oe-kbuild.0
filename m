Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795923EBF2F
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 06:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769321936; cv=none; b=A5zP5YcDejdiTShZJm67NevI2qejXuDHuZywNYHxsi1giuW4eOB5LdyfzbezUIUJHhY3KRZnOsNLd3tl0+zJpNZ7z6tH5DmDRZ1wOb9PUuTG30i8T3jFxpPKcJ7Q8Bvf9N6qriPHsVLtwysCzdBqyucjL7WISMW0fZKlW/1Z7/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769321936; c=relaxed/simple;
	bh=ion/JmxJObOUwoS3zj7VoHqtc+gF+LcZlum9TzIt+bE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=apE/+34Jup9QO/Duy0pFQM5ajm6gCuOajA1lX3TPCH3qzCbOpFn3NVh+WZiApNNrOCmxQh3iy2F4ijKJni5f16KJn3GJ0vXAboFW9q8kbPm3dar/rXDg8WlQpLZOXTLZ2DZ23bfuyPebbFRFYwTPjHXX4TD8T1oowSeSebo0j0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0hB7oU6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0hB7oU6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769321934; x=1800857934;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ion/JmxJObOUwoS3zj7VoHqtc+gF+LcZlum9TzIt+bE=;
  b=E0hB7oU6Gefj5dUEadr2XgJ0Rnokt1tE24gGOhvCkfT3jVEopHv+Tipc
   +TtfioSBZ5xwbUOBVaMVraM8wtjk3ErbQzex35lMSGFRCYhjbVG+h7DUx
   6i+4VNpND3+AVd2B70ZZdQv3KF5BemxYnP4eHsSVpi0WhgjvxIh+r61QD
   enNJJgENkntOn7xR68iFTZWA81/ib+Gl2RTstSfXvGZiKN0dMpr/GMPsb
   P1iSnntv4LqjAjXtHaBijEkdVhnfTcf38ipuq47KrsI3gCBld2tzRnMNh
   d3XGU69VWxV4xvohyAzHpQggq8gKg4yrHD06RCffGn+2hjTYepBKeNM9U
   A==;
X-CSE-ConnectionGUID: /vLx4GyaRxWZMT4nkGqUGg==
X-CSE-MsgGUID: XnZUfs3fTCqUg6NlbjJ7Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70241890"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="70241890"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 22:18:52 -0800
X-CSE-ConnectionGUID: Wr6fv1p5RpaqY3Yi+qYoRg==
X-CSE-MsgGUID: 2l7UPldcQ5iDdg0O69qUug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="212246648"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Jan 2026 22:18:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjtST-00000000VpU-1n5r;
	Sun, 25 Jan 2026 06:18:49 +0000
Date: Sun, 25 Jan 2026 14:18:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-uapi-libc 5/7]
 ./usr/include/linux/bpf_perf_event.h:14:28: error: field 'regs' has
 incomplete type
Message-ID: <202601251402.Eifyo0nq-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/kbuild-uapi-libc
head:   42f8899f5959bce93a899d194c5b14d2a809bd31
commit: dad08d57845cdf10080325af1084b1a1f6bfc05f [5/7] can compile
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/2026012=
5/202601251402.Eifyo0nq-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260125/202601251402.Eifyo0nq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601251402.Eifyo0nq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/bpf_perf_event.h:14:28: error: field 'regs' has inco=
mplete type
      14 |         bpf_user_pt_regs_t regs;
         |                            ^~~~

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
