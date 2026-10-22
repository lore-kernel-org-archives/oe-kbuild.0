Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682586;
	b=VoO/d2pRdQ9H4UH8Dt+ldfoOFgn41IQ+kV16X6EBFYuwaPiNOY7aL/L1VmWeQbleiLIi
	 Z94gua+W0yYqSX/jjUAbh5+9OXC/OkKmiBHBy+JdFuyQzourjgAAVBR99GoVLzBCHuHaq
	 DGXYc6fp3uLYbU/GX2jL7M7C7P04FnO2laYLwffqfz1ml1R1/yCBC8R85QWaVxLnKT1mn
	 mWnJluE2Nh1tLqXZitj7/YhkO5bafWzWJbrDmS/r7lb6FpRx87Pk4L1Uzr2xALYJfluCJ
	 dhh5tUfa4Sb3l4LmZ0uh257UwoBQwFfK2zcb1SHJd0w+eqUTpzYZgfV+wmItdV6FjPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682586;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Oe2/pdVhYZ3zrSUO2uFFQJqWcQCbh20TmWNfUdnAb2E=;
	b=WSbdzv9FBTOEtglp6QcXT3WP6vtsXdVh6jtE65m7G4Xu4um7W6MTa4QC/kSXfk2l/8vo
	 JjlQtuHjRMfXf0tqBzfI2yqhx8AAH9pdFI+FnoiTCUZ6nWR14/pljD/PYedHm+5VW0wDr
	 ZCAfqafDY96KdWq9y/7n/MAiLqi/Swo2GkYiJWPs+kcvkiqPkEwWq/oeRyB6u+XH7ttco
	 Llm+BWakhad3XmWT+jCqz96J3s5nNnRPr7yQ2LezKx1BtyCzALJtoDV5j9L4VO1IzPtxI
	 O9kWL8z2pZvVulEyfvyTGwDmQ7+EYTvKhP9/igxppkhAJBH41IaAhBqYmEq1SRrGA+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k59Egm5K;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1532606ACC6
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Oct 2026 15:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1532606ACC6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k59Egm5K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792682585; x=1824218585;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ld4rW3QVZymFT/UGb6H8KaDIrN5PuNz7TIz5hoEiZPc=;
  b=k59Egm5K5ulEYvV3w4jhX+e5L7SEd2U2nlROQ2hR1sMRvFmBLtQSa2sq
   OSjTNZJOEl7qX7YSPlke5itShJTVFHzhWrT0C5b5xE7Tbiv9V1z/tnGgH
   21fFrntqpBW4VqNaMd8ZuMpzLtPSFxQvCIsxZUakq8oQqJ1aAhDr7vjVz
   nPplCSMUfzW90004Nj9CN0axoqhpjAq2eTGOIgMy7ZmpEHOroqk8yk/mJ
   8jCxT3+1++aLdqeqtGLjXgXcpL5VSe+JcxpTL5nEvNzboPI8cIrRFD1EP
   4QM7BRzviAEVBvZE0SKxFb2hFvHyDpkeuWqFyUY+SNnVAif5XgSVoFE5U
   Q==;
X-CSE-ConnectionGUID: cBcGQB0ZTjOJsGEYapqfoQ==
X-CSE-MsgGUID: na0Sl2zsS3W0b9fHpnOs/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1469032"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1469032"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 08:23:04 -0700
X-CSE-ConnectionGUID: 1tgS/aR7R2C/pUMooRMiCQ==
X-CSE-MsgGUID: 5jf2fmKNSW2QsDjfV9BdMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3779715"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 22 Oct 2026 08:23:03 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJudA-000000000Lf-1T9e;
	Thu, 22 Oct 2026 15:23:00 +0000
Date: Thu, 22 Oct 2026 17:22:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /usr/powerpc64-linux-gnu/include/asm/elf.h:162:9: error:
 unknown type name '__vector128'; did you mean '__vector_quad'?
Message-ID: <202610221719.R80BEDjg-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
commit: 9b93f7e3277490f0356309c9b241eeeaa27ba859 tools/getdelays: use the s=
tatic UAPI headers from tools/include/uapi
date:   7 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 months ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/=
20261022/202610221719.R80BEDjg-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261022/202610221719.R80BEDjg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 9b93f7e32774 ("tools/getdelays: use the static UAPI headers from t=
ools/include/uapi")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610221719.R80BEDjg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from /usr/powerpc64-linux-gnu/include/asm/sigcontext.h:=
14,
                    from /usr/powerpc64-linux-gnu/include/bits/sigcontext.h=
:30,
                    from /usr/powerpc64-linux-gnu/include/signal.h:301,
                    from /usr/powerpc64-linux-gnu/include/sys/wait.h:36,
                    from getdelays.c:25:
>> /usr/powerpc64-linux-gnu/include/asm/elf.h:162:9: error: unknown type na=
me '__vector128'; did you mean '__vector_quad'?
     162 | typedef __vector128 elf_vrreg_t;
         |         ^~~~~~~~~~~
         |         __vector_quad

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
