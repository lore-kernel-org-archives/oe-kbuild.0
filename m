Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140AF220F2D
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Aug 2026 13:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786283949; cv=none; b=S1lmdn7fT/TRnlyiYA7sbWtHJSb/+pIBXtDKdKw+vmRW1h3eXzjgArlyA2E0p0oCRepOR+RjK0BzXynu7PUcQ/gVhQQWAfV//ep/p6rf6pGbe0R8EzLPx5y5kA29yz1TB2gep3tq5HXfcm4dw++gI0kKfJB+icDsw65m++QdUEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786283949; c=relaxed/simple;
	bh=i8vqmGaCnwtRbd2tLbs0dnkDw7Yl2nvXdFTTRGaPhS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=h4ztllNb/2Ob/VtfdvPAvyEbWZfekUYVdLUXQOO1WlTjxM/K4/10gL/de8hVoIulXksOOCuSmecuY2JGaRU2PGcrzvjlNakLNCgDiF5LZ3dZcX3nLO5i+ZSHA57RmU3+nYRGxd+7be7VKNbkZqF2DhEpYe60ePu6qAdsRxfNVno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZW7U5ltO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZW7U5ltO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786283946; x=1817819946;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=i8vqmGaCnwtRbd2tLbs0dnkDw7Yl2nvXdFTTRGaPhS8=;
  b=ZW7U5ltOGS41vCenO8p0hFr3yRiuCrqJERA8oS1oxcuyhftwq2VwcTtc
   N9G8qgsAsn5vzNfSpAEcl4kZzke4fDBBrLZZ0e1SGiEZc+1oPWPUYnknp
   CCjEy7ERaeKKeZQM+cn2ZAY3mVUekVx36MJBorLggiLSXo2nvctHWSXXY
   XA+okZbh3lLH3mcTJoUXY9kKVOoxGqYBM2/FRQddYO/y1aw0maLhBCPwW
   G51PlXBdpJnLj2JYrf68UKG3xbDOXCp5a1aKf1JmSNKC2x7BR6vDFvIr1
   rSRGlRHedBsaJG042rHrm8/B9DRgCJdJy0xGb2ivSXzyQfjjN109E9pff
   g==;
X-CSE-ConnectionGUID: tWPuar1CT0mlk/oLXPXRHw==
X-CSE-MsgGUID: 31QBPlZ8Q46D+6nuZGnTOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="85933941"
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="85933941"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 06:59:05 -0700
X-CSE-ConnectionGUID: VYdKN1fTTK68onx8fJgATg==
X-CSE-MsgGUID: FBH2XMpFSsmM7GGK20zOkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="266672913"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Aug 2026 06:59:04 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wt43J-00000000LuT-395d;
	Sun, 09 Aug 2026 13:59:01 +0000
Date: Sun, 09 Aug 2026 21:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bluetooth-next:master 48/84]
 drivers/bluetooth/btmrvl_sdio.c:819 btmrvl_sdio_card_to_host() error: double
 free of 'skb' (line 802)
Message-ID: <202608092117.q9Xn4qx0-lkp@intel.com>
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
CC: linux-bluetooth@vger.kernel.org
TO: Zijun Hu <zijun.hu@oss.qualcomm.com>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth=
-next.git master
head:   43a556b2fd43f2df6dded59c2e26560a27874c24
commit: 760163572bb0ab79857c11aafb6eb33e697a22a0 [48/84] Bluetooth: btmrvl_=
sdio: Do not free HCI_VENDOR_PKT frame by hci_recv_frame()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20260809 (https://download.01.org/0day-ci/archi=
ve/20260809/202608092117.q9Xn4qx0-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e98466=
48fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608092117.q9Xn4qx0-lkp@intel.com/

smatch warnings:
drivers/bluetooth/btmrvl_sdio.c:819 btmrvl_sdio_card_to_host() error: doubl=
e free of 'skb' (line 802)

vim +/skb +819 drivers/bluetooth/btmrvl_sdio.c

789221ecc87011 Bing Zhao          2009-06-02  701 =20
789221ecc87011 Bing Zhao          2009-06-02  702  static int btmrvl_sdio_c=
ard_to_host(struct btmrvl_private *priv)
789221ecc87011 Bing Zhao          2009-06-02  703  {
789221ecc87011 Bing Zhao          2009-06-02  704  	u16 buf_len =3D 0;
42632805f5f2d7 Andrei Emeltchenko 2012-09-28  705  	int ret, num_blocks, bl=
ksz;
789221ecc87011 Bing Zhao          2009-06-02  706  	struct sk_buff *skb =3D =
NULL;
789221ecc87011 Bing Zhao          2009-06-02  707  	u32 type;
9376e4a5a318e1 Markus Elfring     2018-03-12  708  	u8 *payload;
789221ecc87011 Bing Zhao          2009-06-02  709  	struct hci_dev *hdev =
=3D priv->btmrvl_dev.hcidev;
789221ecc87011 Bing Zhao          2009-06-02  710  	struct btmrvl_sdio_card=
 *card =3D priv->btmrvl_dev.card;
789221ecc87011 Bing Zhao          2009-06-02  711 =20
789221ecc87011 Bing Zhao          2009-06-02  712  	if (!card || !card->fun=
c) {
789221ecc87011 Bing Zhao          2009-06-02  713  		BT_ERR("card or functi=
on is NULL!");
789221ecc87011 Bing Zhao          2009-06-02  714  		ret =3D -EINVAL;
789221ecc87011 Bing Zhao          2009-06-02  715  		goto exit;
789221ecc87011 Bing Zhao          2009-06-02  716  	}
789221ecc87011 Bing Zhao          2009-06-02  717 =20
789221ecc87011 Bing Zhao          2009-06-02  718  	/* Read the length of d=
ata to be transferred */
789221ecc87011 Bing Zhao          2009-06-02  719  	ret =3D btmrvl_sdio_rea=
d_rx_len(card, &buf_len);
789221ecc87011 Bing Zhao          2009-06-02  720  	if (ret < 0) {
789221ecc87011 Bing Zhao          2009-06-02  721  		BT_ERR("read rx_len fa=
iled");
789221ecc87011 Bing Zhao          2009-06-02  722  		ret =3D -EIO;
789221ecc87011 Bing Zhao          2009-06-02  723  		goto exit;
789221ecc87011 Bing Zhao          2009-06-02  724  	}
789221ecc87011 Bing Zhao          2009-06-02  725 =20
789221ecc87011 Bing Zhao          2009-06-02  726  	blksz =3D SDIO_BLOCK_SI=
ZE;
e678bad515f06d Andrei Emeltchenko 2012-09-28  727  	num_blocks =3D DIV_ROUN=
D_UP(buf_len, blksz);
789221ecc87011 Bing Zhao          2009-06-02  728 =20
789221ecc87011 Bing Zhao          2009-06-02  729  	if (buf_len <=3D SDIO_H=
EADER_LEN
42632805f5f2d7 Andrei Emeltchenko 2012-09-28  730  	    || (num_blocks * bl=
ksz) > ALLOC_BUF_SIZE) {
789221ecc87011 Bing Zhao          2009-06-02  731  		BT_ERR("invalid packet=
 length: %d", buf_len);
789221ecc87011 Bing Zhao          2009-06-02  732  		ret =3D -EINVAL;
789221ecc87011 Bing Zhao          2009-06-02  733  		goto exit;
789221ecc87011 Bing Zhao          2009-06-02  734  	}
789221ecc87011 Bing Zhao          2009-06-02  735 =20
789221ecc87011 Bing Zhao          2009-06-02  736  	/* Allocate buffer */
436018eee5eaf1 Jia-Ju Bai         2018-07-23  737  	skb =3D bt_skb_alloc(nu=
m_blocks * blksz + BTSDIO_DMA_ALIGN, GFP_KERNEL);
1f438c6138ac57 Prasanna Karthik   2015-09-25  738  	if (!skb) {
789221ecc87011 Bing Zhao          2009-06-02  739  		BT_ERR("No free skb");
6ea81c415574ac Wei Yongjun        2013-06-05  740  		ret =3D -ENOMEM;
789221ecc87011 Bing Zhao          2009-06-02  741  		goto exit;
789221ecc87011 Bing Zhao          2009-06-02  742  	}
789221ecc87011 Bing Zhao          2009-06-02  743 =20
3318b2362bf052 Bing Zhao          2009-07-08  744  	if ((unsigned long) skb=
->data & (BTSDIO_DMA_ALIGN - 1)) {
3318b2362bf052 Bing Zhao          2009-07-08  745  		skb_put(skb, (unsigned=
 long) skb->data &
3318b2362bf052 Bing Zhao          2009-07-08  746  					(BTSDIO_DMA_ALIGN -=
 1));
3318b2362bf052 Bing Zhao          2009-07-08  747  		skb_pull(skb, (unsigne=
d long) skb->data &
3318b2362bf052 Bing Zhao          2009-07-08  748  					(BTSDIO_DMA_ALIGN -=
 1));
789221ecc87011 Bing Zhao          2009-06-02  749  	}
789221ecc87011 Bing Zhao          2009-06-02  750 =20
3318b2362bf052 Bing Zhao          2009-07-08  751  	payload =3D skb->data;
789221ecc87011 Bing Zhao          2009-06-02  752 =20
789221ecc87011 Bing Zhao          2009-06-02  753  	ret =3D sdio_readsb(car=
d->func, payload, card->ioport,
42632805f5f2d7 Andrei Emeltchenko 2012-09-28  754  			  num_blocks * blksz);
789221ecc87011 Bing Zhao          2009-06-02  755  	if (ret < 0) {
789221ecc87011 Bing Zhao          2009-06-02  756  		BT_ERR("readsb failed:=
 %d", ret);
789221ecc87011 Bing Zhao          2009-06-02  757  		ret =3D -EIO;
789221ecc87011 Bing Zhao          2009-06-02  758  		goto exit;
789221ecc87011 Bing Zhao          2009-06-02  759  	}
789221ecc87011 Bing Zhao          2009-06-02  760 =20
789221ecc87011 Bing Zhao          2009-06-02  761  	/* This is SDIO specifi=
c header length: byte[2][1][0], type: byte[3]
789221ecc87011 Bing Zhao          2009-06-02  762  	 * (HCI_COMMAND =3D 1, =
ACL_DATA =3D 2, SCO_DATA =3D 3, 0xFE =3D Vendor)
789221ecc87011 Bing Zhao          2009-06-02  763  	 */
789221ecc87011 Bing Zhao          2009-06-02  764 =20
789221ecc87011 Bing Zhao          2009-06-02  765  	buf_len =3D payload[0];
9cb23dd4b63615 Andrei Emeltchenko 2012-09-28  766  	buf_len |=3D payload[1]=
 << 8;
9cb23dd4b63615 Andrei Emeltchenko 2012-09-28  767  	buf_len |=3D payload[2]=
 << 16;
9cb23dd4b63615 Andrei Emeltchenko 2012-09-28  768 =20
9cb23dd4b63615 Andrei Emeltchenko 2012-09-28  769  	if (buf_len > blksz * n=
um_blocks) {
9cb23dd4b63615 Andrei Emeltchenko 2012-09-28  770  		BT_ERR("Skip incorrect=
 packet: hdrlen %d buffer %d",
9cb23dd4b63615 Andrei Emeltchenko 2012-09-28  771  		       buf_len, blksz =
* num_blocks);
9cb23dd4b63615 Andrei Emeltchenko 2012-09-28  772  		ret =3D -EIO;
9cb23dd4b63615 Andrei Emeltchenko 2012-09-28  773  		goto exit;
9cb23dd4b63615 Andrei Emeltchenko 2012-09-28  774  	}
9cb23dd4b63615 Andrei Emeltchenko 2012-09-28  775 =20
789221ecc87011 Bing Zhao          2009-06-02  776  	type =3D payload[3];
789221ecc87011 Bing Zhao          2009-06-02  777 =20
789221ecc87011 Bing Zhao          2009-06-02  778  	switch (type) {
789221ecc87011 Bing Zhao          2009-06-02  779  	case HCI_ACLDATA_PKT:
789221ecc87011 Bing Zhao          2009-06-02  780  	case HCI_SCODATA_PKT:
789221ecc87011 Bing Zhao          2009-06-02  781  	case HCI_EVENT_PKT:
618e8bc228cda7 Marcel Holtmann    2015-11-05  782  		hci_skb_pkt_type(skb) =
=3D type;
789221ecc87011 Bing Zhao          2009-06-02  783  		skb_put(skb, buf_len);
789221ecc87011 Bing Zhao          2009-06-02  784  		skb_pull(skb, SDIO_HEA=
DER_LEN);
789221ecc87011 Bing Zhao          2009-06-02  785 =20
ea1e76a3f92f85 Andrei Emeltchenko 2012-06-13  786  		if (type =3D=3D HCI_EV=
ENT_PKT) {
ea1e76a3f92f85 Andrei Emeltchenko 2012-06-13  787  			if (btmrvl_check_evtp=
kt(priv, skb))
e1a26170692dc1 Marcel Holtmann    2013-10-10  788  				hci_recv_frame(hdev,=
 skb);
2c2453f3e46139 Andrei Emeltchenko 2012-07-09  789  		} else {
e1a26170692dc1 Marcel Holtmann    2013-10-10  790  			hci_recv_frame(hdev, =
skb);
2c2453f3e46139 Andrei Emeltchenko 2012-07-09  791  		}
ea1e76a3f92f85 Andrei Emeltchenko 2012-06-13  792 =20
789221ecc87011 Bing Zhao          2009-06-02  793  		hdev->stat.byte_rx +=
=3D buf_len;
789221ecc87011 Bing Zhao          2009-06-02  794  		break;
789221ecc87011 Bing Zhao          2009-06-02  795 =20
789221ecc87011 Bing Zhao          2009-06-02  796  	case MRVL_VENDOR_PKT:
618e8bc228cda7 Marcel Holtmann    2015-11-05  797  		hci_skb_pkt_type(skb) =
=3D HCI_VENDOR_PKT;
789221ecc87011 Bing Zhao          2009-06-02  798  		skb_put(skb, buf_len);
789221ecc87011 Bing Zhao          2009-06-02  799  		skb_pull(skb, SDIO_HEA=
DER_LEN);
789221ecc87011 Bing Zhao          2009-06-02  800 =20
789221ecc87011 Bing Zhao          2009-06-02  801  		if (btmrvl_process_eve=
nt(priv, skb))
760163572bb0ab Zijun Hu           2026-07-25 @802  			kfree_skb(skb);
789221ecc87011 Bing Zhao          2009-06-02  803 =20
789221ecc87011 Bing Zhao          2009-06-02  804  		hdev->stat.byte_rx +=
=3D buf_len;
789221ecc87011 Bing Zhao          2009-06-02  805  		break;
789221ecc87011 Bing Zhao          2009-06-02  806 =20
789221ecc87011 Bing Zhao          2009-06-02  807  	default:
af901ca181d92a Andr=C3=A9 Goddard Rosa 2009-11-14  808  		BT_ERR("Unknown p=
acket type:%d", type);
78c1b8e822a0bc Andrei Emeltchenko 2012-10-10  809  		BT_ERR("hex: %*ph", bl=
ksz * num_blocks, payload);
789221ecc87011 Bing Zhao          2009-06-02  810 =20
789221ecc87011 Bing Zhao          2009-06-02  811  		kfree_skb(skb);
789221ecc87011 Bing Zhao          2009-06-02  812  		skb =3D NULL;
789221ecc87011 Bing Zhao          2009-06-02  813  		break;
789221ecc87011 Bing Zhao          2009-06-02  814  	}
789221ecc87011 Bing Zhao          2009-06-02  815 =20
789221ecc87011 Bing Zhao          2009-06-02  816  exit:
789221ecc87011 Bing Zhao          2009-06-02  817  	if (ret) {
789221ecc87011 Bing Zhao          2009-06-02  818  		hdev->stat.err_rx++;
789221ecc87011 Bing Zhao          2009-06-02 @819  		kfree_skb(skb);
789221ecc87011 Bing Zhao          2009-06-02  820  	}
789221ecc87011 Bing Zhao          2009-06-02  821 =20
789221ecc87011 Bing Zhao          2009-06-02  822  	return ret;
789221ecc87011 Bing Zhao          2009-06-02  823  }
789221ecc87011 Bing Zhao          2009-06-02  824 =20

:::::: The code at line 819 was first introduced by commit
:::::: 789221ecc870117b77e354d488d5d29f15410de8 Bluetooth: Add Marvell BT-o=
ver-SDIO driver

:::::: TO: Bing Zhao <bzhao@marvell.com>
:::::: CC: Marcel Holtmann <marcel@holtmann.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
