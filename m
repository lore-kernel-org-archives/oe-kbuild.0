Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795339967;
	b=AcidB78vCKssdMNxj1x/6uQGVEM4q7jW3QdJzWo/m17azYOOPadLpRZPk5VVCNN/k2v4
	 ZyExEweFVjA29x3bOWY2fvX8Qjpk4VNBtf/HOMe7dzE8XiFHi6+m1csz4HibsXSnnerM5
	 8ydrHwgUsJ5txh5+NhLMhRSnIpJPJTjpW1mPZm7t0Ios2xzvEZXBs8OkGhL5JTuUppQ5/
	 1zaRyRirlGhUB+2mA3sK02eD6Ae9JvO5f5tFvKtOS9+eNaMyq54UdyKwOBAt7cCXdryKD
	 GL5zNYPT8PeuC4JII5abfVATr8xLvAXFOKqDHSe8tIvAVbQk7VZn1u3EF/shWdUTAMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339967;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=NnRagWPiGdsu0weUIofyzEIPjNzfa7sJcWPyTPk/rKs=;
	b=qe6G/YLshvXrjrcm06+DfWkit8RFzvmPDF8Q8pWPBUfQUkiH8RJ/qWxb/b+952OHvpWl
	 nsrfXKQBcYGjKOuF7FVA4R4k6nay8d5LLhZuh8t6+ZZ6QvrXRoqVHFC4qZDXmR9VU6bXD
	 ne3zUIOZjkZNFxJeOYNSrYWRrhwABO7swmgqwdmOaKPLi+5L2wLu4p3886VkXke4c5XVy
	 5QwI0aNXetOrkmXRTR0a2N/ENas94WNwkkQxnPrtuHCWwwGiTwNqDpXQMN/EGKAlyrFFk
	 /Zc1JqXQMeUwCVFosXcEucBtaUwvzPVHWPa/3SFrjI4tRVx5uxnp4UZAcFTbpqCwvsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OUOtgnJ3;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24107606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 09:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24107606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OUOtgnJ3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795339967; x=1826875967;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Gt57MQk/EV3x7cr3jLlNbV9qVIjN0PpBvGDyjkmuvik=;
  b=OUOtgnJ3Kfa5uNITRqjmvOytMzhisB1yWooo1D+1s5RYBaAYVWASYKSg
   pBL2mg76X6BL2e+Yg+CSiBeMlqZ/isRz88Zw35AniwDNB5iR5/OCOzzHa
   EOzmo2IDi65HGXeWjWKGZf7vszcbZQVt2dG99mlxRLXFHRfPBmrZ2TKuo
   niS0R/3y8MsYItO2sqLISVQoGlf7NjZy5ek2776lLonpymTT/VZ1J7nfF
   TLzMW+/AFJOWzu3x+OliBiUOhYGY/duU+kh1U9DKTUnSaCZI3pZke88XP
   PnayAVI+2Aa0kPYzRztTACzltWcW/f4SgxBIgmIiFBZfzuR9Wlp0z4YQv
   g==;
X-CSE-ConnectionGUID: J1fR+H2ESe2DZersDPemqQ==
X-CSE-MsgGUID: dMbkD2WzRTaFlqwQiK6xFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4197857"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4197857"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 01:32:47 -0800
X-CSE-ConnectionGUID: SAQPDaJ4Q/Gphvqm0cuhUQ==
X-CSE-MsgGUID: 9BcabLVjQMqEkdzyMPr7WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11183713"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 22 Nov 2026 01:32:45 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV3wA-000000004XV-2RtG;
	Sun, 22 Nov 2026 09:32:42 +0000
Date: Sun, 22 Nov 2026 10:31:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/delayed-ref.o: warning: objtool:
 add_delayed_ref_head+0x25c: unreachable instruction
Message-ID: <20261122102227.KXTrWGQ6-lkp@intel.com>
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
:::::: Manual check reason: "loongarch: unreachable instruction"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Miquel Sabat=C3=A9 Sol=C3=A0" <mssola@mssola.com>
CC: David Sterba <dsterba@suse.com>
CC: Filipe Manana <fdmanana@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4843f6873f7c4835e62f2c73ba0fd538e57a2f22
commit: 725e46298876a2cc1f1c3fb22ba69d29102c3ddf btrfs: fix double free of =
qgroup record after failure to add delayed ref head
date:   12 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r2304-20261122 (https://download.01.org/0day-c=
i/archive/20261122/20261122102227.KXTrWGQ6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261122/20261122102227.KXTrWGQ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 725e46298876 ("btrfs: fix double free of qgroup record after failu=
re to add delayed ref head")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122102227.KXTrWGQ6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/delayed-ref.o: warning: objtool: add_delayed_ref_head+0x25c: un=
reachable instruction
   fs/btrfs/delayed-ref.o: warning: objtool: insert_delayed_ref+0x39c: unre=
achable instruction

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
