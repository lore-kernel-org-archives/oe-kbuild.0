Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B6A209F43
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 04:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914709; cv=none; b=gc4Vw7D/8cHaIrLz38xBfpoyY2vySpyV6iR+wxofCUHejW8nzIYtWhi9N8tuYsjLMrShMgySoUcvG/b42iVzoAffGaQjrB592r5C7YwOwu7taB4XHLPxTe3tAkExFwqcyyDaKr/zSstpSSCUMCup6AXATWmtgicoHctY1A28SBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914709; c=relaxed/simple;
	bh=MIIdV//RB/lasR+keZKBGn9VvVWMs7K304fIngSeSYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bZ8xKaLUOUbBjzQYA6hTFvgY3q7ZlMsWSBA6l7BawpAGVOf3S7E1z0dsVycyB5OzQLB5967woIUOb9c2L2uH9KiB2a60utCbFxtbl7qInfYmqn8w6NGUJTJRsCUvcVC+cM66dEX3KTuQZk1nk8mY631llHxak2HSy5+s+/CgkRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQo7iRNL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQo7iRNL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790914707; x=1822450707;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MIIdV//RB/lasR+keZKBGn9VvVWMs7K304fIngSeSYw=;
  b=iQo7iRNLzF0ICXSuJWdpZrOs24FChHlS4Wzh1Y81/Nphn1tWEIhejDkg
   FxDbw4lvjLKxeS2eOc0XmM7SZVRdRoIDFaxNcEydAuC8EIFLf5k7SLpm7
   vPyUAJHt1xbw2hWlvtVlnUNwMjj8JJM6kXKF8WokDX5jSWm+TVMtzHIlC
   ExEKk2nhjIyONjAGVa+dq63y9ejyuSPlj82jYtcFyYaOsW7yFCAEYkf/I
   mWAHIM9Hhu8NyEMuKBdf5FPxm7qJwu4BEmOOp+uh+B8iG1hxMfgksvRNd
   57y5XoNtuudZ/g1s55Gllhhf2zmxiW3Nt9p5wFoaPPNs4Q00TaK41QUFG
   g==;
X-CSE-ConnectionGUID: 8zmSWb6fTb+wweeww3ep1w==
X-CSE-MsgGUID: fiMXD3JSROG+BHvbO2Y38w==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="109168083"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="109168083"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 21:18:27 -0700
X-CSE-ConnectionGUID: 6ixl7lJrTpyw1djDBLK7LA==
X-CSE-MsgGUID: TWx0nJsZTrGPkZCaXSHReA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="177290"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 01 Oct 2026 21:18:26 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCUj1-00000000SdH-2qdB;
	Fri, 02 Oct 2026 04:18:23 +0000
Date: Fri, 02 Oct 2026 12:18:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/dsa/rzn1_a5psw.c:212:24: error: initializing
 'struct a5psw_of_data *' with an expression of type 'const struct
 a5psw_of_data *' discards qualifiers
Message-ID: <202610021252.YrOjM8eB-lkp@intel.com>
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
:::::: Manual check reason: "bisect to a FBC not belonging to original linu=
x-review patches: branch: linux-review/Prabhakar/net-dsa-tag_rzn1_a5psw-Dro=
p-redundant-ETH_P_DSA_A5PSW-definition/20261001-164314, commit: e3604cddc3c=
79985021de1aea0e3f482ab64022a"
::::::=20

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: 0day robot <lkp@intel.com>

Hi Lad,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/Prabhakar/net-dsa-ta=
g_rzn1_a5psw-Drop-redundant-ETH_P_DSA_A5PSW-definition/20261001-164314
head:   467636555a7aff5e3f2d57fbc61f81c19a28bef8
commit: e3604cddc3c79985021de1aea0e3f482ab64022a net: dsa: rzn1-a5psw: Add =
fixed frame length workaround for management port
date:   11 hours ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm-defconfig (https://download.01.org/0day-ci/archive/20261002/202=
610021252.YrOjM8eB-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f6=
09f950d2e80addf5566623013db68394334db)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261002/202610021252.YrOjM8eB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610021252.YrOjM8eB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/dsa/rzn1_a5psw.c:212:24: error: initializing 'struct a5psw_o=
f_data *' with an expression of type 'const struct a5psw_of_data *' discard=
s qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     212 |         struct a5psw_of_data *of_data =3D a5psw->of_data;
         |                               ^         ~~~~~~~~~~~~~~
   1 error generated.


vim +212 drivers/net/dsa/rzn1_a5psw.c

888cdb892b61d7 Cl=C3=A9ment L=C3=A9ger 2022-06-24  208 =20
888cdb892b61d7 Cl=C3=A9ment L=C3=A9ger 2022-06-24  209  static int a5psw_po=
rt_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
888cdb892b61d7 Cl=C3=A9ment L=C3=A9ger 2022-06-24  210  {
888cdb892b61d7 Cl=C3=A9ment L=C3=A9ger 2022-06-24  211  	struct a5psw *a5ps=
w =3D ds->priv;
e3604cddc3c799 Lad Prabhakar 2026-10-01 @212  	struct a5psw_of_data *of_dat=
a =3D a5psw->of_data;
e3604cddc3c799 Lad Prabhakar 2026-10-01  213 =20
e3604cddc3c799 Lad Prabhakar 2026-10-01  214  	if (dsa_is_cpu_port(ds, port=
) && of_data->management_port_fixed_frame_len)
e3604cddc3c799 Lad Prabhakar 2026-10-01  215  		return 0;
888cdb892b61d7 Cl=C3=A9ment L=C3=A9ger 2022-06-24  216 =20
888cdb892b61d7 Cl=C3=A9ment L=C3=A9ger 2022-06-24  217  	new_mtu +=3D ETH_H=
LEN + A5PSW_EXTRA_MTU_LEN + ETH_FCS_LEN;
e3604cddc3c799 Lad Prabhakar 2026-10-01  218 =20
888cdb892b61d7 Cl=C3=A9ment L=C3=A9ger 2022-06-24  219  	a5psw_reg_writel(a=
5psw, A5PSW_FRM_LENGTH(port), new_mtu);
888cdb892b61d7 Cl=C3=A9ment L=C3=A9ger 2022-06-24  220 =20
888cdb892b61d7 Cl=C3=A9ment L=C3=A9ger 2022-06-24  221  	return 0;
888cdb892b61d7 Cl=C3=A9ment L=C3=A9ger 2022-06-24  222  }
888cdb892b61d7 Cl=C3=A9ment L=C3=A9ger 2022-06-24  223 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
