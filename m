Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8151DFDE
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Aug 2026 02:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158002; cv=none; b=pSDCrGkm3rIJquf2WLyO/KAzQrVXan7gfLE13FxirwEa539dxRcvq/8oUxQOWd/vDupN86zwZ2yel9Iqj7WrY8W9h85K1GO23dbE67ECm0Ptg3N84TpcLr+Ie/HGb2VJUVUzfPBNWoFGKPrmjvdJoZhUmTWr2QBEcPAvbS61Twk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158002; c=relaxed/simple;
	bh=l9yhINfiMNDyliXLpQ+0cYFwiGbY/L9y+YWD1kExQs0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=coMPnEYU/HLcu/txjvyVSPKVNDfMzuYUep5+SUlWuRMLo8CTDmdCdo+mjNiphiQ98o3+BPVB9MfzwyRjQLJ6++HlToPfkvBwr15aprV0yr4li5BPjhKgGgy/asZERi35FeYxdhJ8FxUgtBIbNIVPOKmJVjoZxU7KntLnIDTyuZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itzPasc9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itzPasc9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786158000; x=1817694000;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=l9yhINfiMNDyliXLpQ+0cYFwiGbY/L9y+YWD1kExQs0=;
  b=itzPasc96+8qN3KUlhlNS0j9pvaT8QYT1yzMdQMMcqxe0nVLrwvQlco0
   V99220Qx2TbQXuORCbHYc1kom79CsOr4B3hQnopxGNWPBLzkVR0l+hNMW
   ys0XAcnPRazONe+Zalv4hxpZ+B/6QQ8zV1Qn8qikygU6ysLqL6Pihyy07
   pqirz7IFJakZgV9DYANvZjt/51a39VFn/80iZQaxdnYoNwBWVbGxdQ1Nm
   lx+FBXmKZXtwYTOmzJ7oFtAaYD2AisEsMqJGp4fCLyxnmZSM/KllMhTqz
   lBEhVPMqz66sclOkQCEjBBmchO0jYj6z8ntbov2zRRJ0xxn8F2aJm31aa
   Q==;
X-CSE-ConnectionGUID: 3xXZBA7kSo6YD9nMBXFMMQ==
X-CSE-MsgGUID: n/KoLZ5WQeWxVP4UFse0iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86979881"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="86979881"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 19:59:59 -0700
X-CSE-ConnectionGUID: 6+F1PeyyRHqaj2gMaBMDcw==
X-CSE-MsgGUID: h5AscTPYSGyPlTZPbpJYSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="261263926"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Aug 2026 19:59:58 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsXHv-00000000JgC-4C2u;
	Sat, 08 Aug 2026 02:59:56 +0000
Date: Sat, 08 Aug 2026 10:59:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/dsa/realtek/rtl8365mb_main.c:1323:2-16:
 opportunity for str_enable_disable(vlan_filtering)
Message-ID: <202608081003.E4JTINYL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Alvin =C5=A0ipraga" <alsi@bang-olufsen.dk>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Linus Walleij <linusw@kernel.org>
CC: Mieczyslaw Nalewaj <namiltd@yahoo.com>
CC: Luiz Angelo Daros de Luca <luizluca@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   bcc44b6785f216eb939226ade6e3910baa30516b
commit: 9da2c8672f77108a1f09232320f22225ab53dde9 net: dsa: realtek: rtl8365=
mb: add VLAN support
date:   8 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-r062-20260808 (https://download.01.org/0day-ci/arc=
hive/20260808/202608081003.E4JTINYL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 9da2c8672f77 ("net: dsa: realtek: rtl8365mb: add VLAN support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202608081003.E4JTINYL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/dsa/realtek/rtl8365mb_main.c:1323:2-16: opportunity for str_=
enable_disable(vlan_filtering)

vim +1323 drivers/net/dsa/realtek/rtl8365mb_main.c

9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1309 =20
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1310  static int rtl8365mb_po=
rt_vlan_filtering(struct dsa_switch *ds, int port,
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1311  					 bool vlan_filteri=
ng,
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1312  					 struct netlink_ex=
t_ack *extack)
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1313  {
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1314  	enum rtl8365mb_frame_i=
ngress accepted_frame, prev_accepted_frame;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1315  	enum rtl8365mb_vlan_eg=
ress_mode mode;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1316  	struct realtek_priv *p=
riv =3D ds->priv;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1317  	u32 configured_ports =
=3D 0;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1318  	struct dsa_port *dp;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1319  	u16 pvid_vid;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1320  	int ret;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1321 =20
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1322  	dev_dbg(priv->dev, "po=
rt %d: %s VLAN filtering\n", port,
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06 @1323  		vlan_filtering ? "ena=
ble" : "disable");
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1324 =20
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1325  	ret =3D rtl8365mb_vlan=
_port_get_framefilter(priv, port,
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1326  						  &prev_accepted_=
frame);
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1327  	if (ret) {
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1328  		NL_SET_ERR_MSG_MOD(ex=
tack,
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1329  				   "Failed to get c=
urrent framefilter");
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1330  		return ret;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1331  	}
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1332 =20
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1333  	/* While filtering, on=
ly accepts untagged frames if PVID is enabled */
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1334  	if (vlan_filtering) {
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1335  		ret =3D rtl8365mb_vla=
n_port_get_pvid(priv, port, &pvid_vid);
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1336  		if (ret)
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1337  			return ret;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1338 =20
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1339  		if (pvid_vid)
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1340  			accepted_frame =3D R=
TL8365MB_FRAME_TYPE_ANY_FRAME;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1341  		else
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1342  			accepted_frame =3D R=
TL8365MB_FRAME_TYPE_TAGGED_ONLY;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1343  	} else {
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1344  		accepted_frame =3D RT=
L8365MB_FRAME_TYPE_ANY_FRAME;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1345  	}
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1346 =20
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1347  	/* When vlan filter is=
 enable/disabled in a bridge, this function is
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1348  	 * called for all memb=
er ports. We need to enable/disable ingress
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1349  	 * VLAN membership che=
ck.
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1350  	 */
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1351  	ret =3D rtl8365mb_port=
_set_ingress_filtering(priv, port, vlan_filtering);
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1352  	if (ret)
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1353  		return ret;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1354 =20
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1355  	/* However, we also en=
able/disable egress filtering because the switch
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1356  	 * still consider the =
egress interface VLAN membership to forward the
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1357  	 * traffic. We enable/=
disable that check disabling/enabling transparent
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1358  	 * VLAN between the in=
gress port and all other available ports.
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1359  	 */
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1360  	dsa_switch_for_each_av=
ailable_port(dp, ds) {
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1361  		/* port isolation wil=
l still keep traffic inside the bridge */
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1362  		ret =3D rtl8365mb_por=
t_set_transparent(priv, port, dp->index,
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1363  						     !vlan_filter=
ing);
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1364  		if (ret)
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1365  			goto undo_transparen=
t;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1366 =20
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1367  		configured_ports |=3D =
BIT(dp->index);
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1368  	}
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1369 =20
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1370  	if (accepted_frame !=
=3D prev_accepted_frame) {
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1371  		ret =3D rtl8365mb_vla=
n_port_set_framefilter(priv, port,
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1372  							  accepted_frame=
);
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1373  		if (ret) {
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1374  			NL_SET_ERR_MSG_MOD(e=
xtack,
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1375  					   "Failed to set =
port framefilter");
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1376  			goto undo_transparen=
t;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1377  		}
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1378  	}
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1379 =20
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1380  	/* When VLAN filtering=
 is disabled, preserve frames exactly as received.
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1381  	 * Otherwise, the VLAN=
 egress pipeline may still alter tag state
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1382  	 * according to VLAN m=
embership and untag configuration.
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1383  	 */
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1384  	if (vlan_filtering)
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1385  		mode =3D RTL8365MB_VL=
AN_EGRESS_MODE_ORIGINAL;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1386  	else
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1387  		mode =3D RTL8365MB_VL=
AN_EGRESS_MODE_REAL_KEEP;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1388 =20
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1389  	ret =3D rtl8365mb_port=
_set_vlan_egress_mode(priv, port, mode);
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1390  	if (ret)
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1391  		goto undo_set_framefi=
lter;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1392 =20
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1393  	return ret;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1394 =20
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1395  undo_set_framefilter:
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1396  	if (prev_accepted_fram=
e !=3D accepted_frame)
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1397  		rtl8365mb_vlan_port_s=
et_framefilter(priv, port,
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1398  						    prev_accepted=
_frame);
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1399  undo_transparent:
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1400  	/* The DSA core guaran=
tees this callback is only invoked on an actual
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1401  	 * state transition, e=
nsuring the previous hardware state was the
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1402  	 * opposite (!vlan_fil=
tering). It is also called during setup but, in
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1403  	 * that case, any fail=
ure here aborts the entire switch initialization.
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1404  	 *
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1405  	 * VLAN_INGRESS and VL=
AN_EGRESS_TRANSPARENT states are directly derived
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1406  	 * from vlan_filtering=
. That way, we can simply undo it without
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1407  	 * checking the curren=
t HW state as we do with VLAN_EGRESS_MODE.
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1408  	 */
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1409  	dsa_switch_for_each_po=
rt(dp, ds) {
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1410  		if (configured_ports =
& BIT(dp->index))
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1411  			rtl8365mb_port_set_t=
ransparent(priv, port, dp->index,
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1412  						       vlan_filte=
ring);
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1413  	}
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1414 =20
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1415  	rtl8365mb_port_set_ing=
ress_filtering(priv, port, !vlan_filtering);
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1416 =20
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1417  	return ret;
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1418  }
9da2c8672f7710 Alvin =C5=A0ipraga 2026-06-06  1419 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
