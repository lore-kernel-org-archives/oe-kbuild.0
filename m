Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEA117993
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 04:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790916149; cv=none; b=fqvZ2Ht6TZx3MnTRHXO39/LFrfeTDDaYJSALWwu3vCnfja56fXdNiUcgUBrYn/S4vk1IGCx/88pxuKMehC1KOuP9UU4cs5xUm0TUr/RCsw1mF3W3bmleYkCynxrs2TC+sgz/440RU4BUavm7hD5qPEJvPltB8T7nS5Q4RK0G27E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790916149; c=relaxed/simple;
	bh=T2yj5j87b1DA4wEdqPyvHbkEWpnnSC2a3wMqTO/FVoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Fd+7dFvctkOo4+Pj+jTjZkupRa0s+pTlZIkZJc4Vfs9lcuUbzwv9uS/DotZGLLoJYQ7ymG8YkEX5aHieifHjoPctPwdga0e2Iaxx2nd909G9p+zEu05OPpT5g89tX7Fzk0HQcOMb2TagWdTV0NpHmJjVm32xODX+RztA6zWwYX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WgnfQGvY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WgnfQGvY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790916148; x=1822452148;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=T2yj5j87b1DA4wEdqPyvHbkEWpnnSC2a3wMqTO/FVoo=;
  b=WgnfQGvYzkvRB8tKFcfoFsInz7vlczS2eaY8UV16+OJz6+XsGoZDF3Pu
   KnEqCSlETx03jeFdnVIxqGsGcXE7ggQfFBmggRPpbWJUhnU33NCkFun+N
   ARLLNn1sO/T0r39KR2Xs+9YAdAisBPlYrQrqvjdWiQJIhIBaG2NKjxWqh
   3ykH1Odr2mPqt+xWXjVpYbovSERNLm3C25hmcU4wqdEwpuLYeBlKwLbAk
   OwV/ONv9O1h30jQkZPPzVBLq/ceiiZSlj5THDphTeWLCEA9cXSD06kkw6
   U9sKUPZzGI+0U3mxqKCeJFhM8XraiTadcvkxBEjYk7nO8Esupb8aw5dqR
   g==;
X-CSE-ConnectionGUID: lzyIfHuUQBeRPoDl+dRgEw==
X-CSE-MsgGUID: ZNoM1UrzQj+zCttrR7D7ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90450858"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90450858"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 21:42:27 -0700
X-CSE-ConnectionGUID: SrfYf/MHQy6/Kg1kkEc8yg==
X-CSE-MsgGUID: 23ScbY0SSeWjiXbuoRzZwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="276278906"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Oct 2026 21:42:26 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCV6G-00000000SeL-280H;
	Fri, 02 Oct 2026 04:42:24 +0000
Date: Fri, 02 Oct 2026 12:42:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/dsa/rzn1_a5psw.c:212:41: warning: initialization
 discards 'const' qualifier from pointer target type
Message-ID: <202610021225.9Q1Nppoh-lkp@intel.com>
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
date:   12 hours ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20261002=
/202610021225.9Q1Nppoh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261002/202610021225.9Q1Nppoh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610021225.9Q1Nppoh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/dsa/rzn1_a5psw.c: In function 'a5psw_port_change_mtu':
>> drivers/net/dsa/rzn1_a5psw.c:212:41: warning: initialization discards 'c=
onst' qualifier from pointer target type [-Wdiscarded-qualifiers]
     212 |         struct a5psw_of_data *of_data =3D a5psw->of_data;
         |                                         ^~~~~


vim +/const +212 drivers/net/dsa/rzn1_a5psw.c

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
