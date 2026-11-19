Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098934;
	b=IcmdoZRIG9+Qx+wXt+2BkpVK3tBJ0h2NSkOhSb36lGg/6asLEnP4MV84/m4+B3fPxxnP
	 UFzsfwa9t7TofuOBoZYDUdzwQL52mSlgvSBa+2fAvuWYsQxhnLLurXacmQkc5Kl3cnue1
	 10PjIo+Hj7uEiCFUyXuGAaPKLbqZESMerGNfAbO/0CIAqjvGc6H7tuh/W4RE5YANQVVkX
	 Zf5ZXyAzPD2gpc8eCcCuR7G33ya/foHelIqzopRvRr7y5JKym7TJtdpAXRSNfrnGhQcuX
	 mdGwm1wK+TxHf6CKkV5C8WW0LzjfkaeqVOgFVK72jSIE4emFEL0WPAMtbdGakG65zCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098934;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=5Bhg1rbTxqOlbtoacE1vBHIUuSO9cANbDYNyU1vBAvA=;
	b=ri+CF1gquQZcggwr7NOPYt06ZddN+ePvitqRclZGbQ3vf5QlN3Q9tGK/XuqkS4RGuQg6
	 +4sDQVz1yi6ImvsSj1Ip+6NoSshN0+p37f9862RIVOigyDLwPj5hi2M8qAhmMD6KfTu9s
	 oBq9ECid8qSwkneZKQtGRxG4lf8tK1GQWnWsw2W53uEV7MU/YOdSv7+9wRc/LUy/a1MxT
	 lWD0wfKeA34Wti1KUHmNBv/fvHYy0AzfdaO9uQK0ZfZnok+9au1FJPKWZaqF0PYzM5Jb1
	 IVbjTSdHMbf/foxQQzbGHHYq7rNaIEOPZRtD1e6k+1BFjF+/bRJTl2ta/aXnsSzb3fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ojcylfw9;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35206606A325
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 14:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35206606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ojcylfw9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795098934; x=1826634934;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BC6Z0uVPiEr69fxCa89lnn1rb3VOVzw243sQ2s8YFdg=;
  b=Ojcylfw9L/uZWWbTxsh7dLonhmDeaqLJ5EFqLAmvStJMEM5SvneWWPGl
   zCIl4ShK6o0+4V1ZaThh3CSS5waL2i6DeGS8t7myWUXD/EsLBWTR2zWAS
   rx/t2A0q9+f40gyj/q2aaAemeEgpxOyrKaqSwWkhIiAIN26l+9vbP+pYI
   7DZ7dyBj99qlchjv/iLWFA6UQdz989kjlgHKjSItVIm2IUTztGM/mnk71
   211FQEH2NVqc59Q5HA4RggOOeRjOB7ZVhb4iZKAiFO23etFBMU//kpba/
   5Qp7SELTa9OwT6rkoakRMj5dY5raSXIBaFxD3Q5g0dAPL2iisEUlUH6Bn
   g==;
X-CSE-ConnectionGUID: fkg1CDr8QAOh7lrbyudHjQ==
X-CSE-MsgGUID: Zx2fwnnDTEmvF6WzHzR9aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4027179"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4027179"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:35:33 -0800
X-CSE-ConnectionGUID: xAijr0M1SLG9x2lk/zB+Ng==
X-CSE-MsgGUID: ruwG5En3RIu8HPYElj3uqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="12185004"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 19 Nov 2026 06:35:32 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU3EX-000000003nR-1CUv;
	Thu, 19 Nov 2026 14:35:29 +0000
Date: Thu, 19 Nov 2026 15:35:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: base.c:undefined reference to `wmi_evaluate_method'
Message-ID: <20261119153102.pPb0QeKG-lkp@intel.com>
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
:::::: Manual check reason: "too many reports for this commit"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Armin Wolf <W_Armin@gmx.de>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>

Hi Armin,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
commit: 884d53763d304af64a9b795161f9fc3b83a5e3d8 platform/wmi: Remove depen=
dency on CONFIG_X86
date:   5 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 5 weeks ago
config: loongarch-randconfig-r2303-20261119 (https://download.01.org/0day-c=
i/archive/20261119/20261119153102.pPb0QeKG-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261119/20261119153102.pPb0QeKG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 884d53763d30 ("platform/wmi: Remove dependency on CONFIG_X86")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261119153102.pPb0QeKG-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o: in=
 function `wmi_wmmx_mxmi':
>> base.c:(.text+0xb0): undefined reference to `wmi_evaluate_method'
   loongarch64-linux-ld: drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o: in=
 function `mxm_shadow_wmi':
>> base.c:(.text+0x268): undefined reference to `wmi_has_guid'
   loongarch64-linux-ld: base.c:(.text+0x348): undefined reference to `wmi_=
evaluate_method'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
