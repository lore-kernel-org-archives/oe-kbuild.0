Content-Type: multipart/mixed; boundary="===============9043180653758396162=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:256:52: warning: Same value in both branches of ternary operator. [duplicateValueTernary]
Date: Thu, 03 Feb 2022 22:06:46 +0800
Message-ID: <202202032122.xaHXyhEF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9043180653758396162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Kalle Valo <kvalo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   88808fbbead481aedb46640a5ace69c58287f56a
commit: f7d55d2e439fa4430755d69a5d7ad16d43a5ebe6 mt76: mt7921: fix build re=
gression
date:   8 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 8 weeks ago
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:256:52: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    txd_len =3D cmd & MCU_UNI_PREFIX ? sizeof(*uni_txd) : sizeof(*mcu_txd);
                                                      ^

vim +256 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c

1c099ab44727c8 Sean Wang        2021-01-28  226  =

fe0195f7563314 Sean Wang        2021-10-19  227  int mt7921_mcu_fill_messag=
e(struct mt76_dev *mdev, struct sk_buff *skb,
1c099ab44727c8 Sean Wang        2021-01-28  228  			    int cmd, int *wait_=
seq)
1c099ab44727c8 Sean Wang        2021-01-28  229  {
1c099ab44727c8 Sean Wang        2021-01-28  230  	struct mt7921_dev *dev =
=3D container_of(mdev, struct mt7921_dev, mt76);
1c099ab44727c8 Sean Wang        2021-01-28  231  	int txd_len, mcu_cmd =3D =
cmd & MCU_CMD_MASK;
1c099ab44727c8 Sean Wang        2021-01-28  232  	struct mt7921_uni_txd *un=
i_txd;
1c099ab44727c8 Sean Wang        2021-01-28  233  	struct mt7921_mcu_txd *mc=
u_txd;
1c099ab44727c8 Sean Wang        2021-01-28  234  	__le32 *txd;
1c099ab44727c8 Sean Wang        2021-01-28  235  	u32 val;
1c099ab44727c8 Sean Wang        2021-01-28  236  	u8 seq;
1c099ab44727c8 Sean Wang        2021-01-28  237  =

a2a6cd54eec464 Lorenzo Bianconi 2021-03-07  238  	switch (cmd) {
a2a6cd54eec464 Lorenzo Bianconi 2021-03-07  239  	case MCU_UNI_CMD_HIF_CTRL:
a2a6cd54eec464 Lorenzo Bianconi 2021-03-07  240  	case MCU_UNI_CMD_SUSPEND:
a2a6cd54eec464 Lorenzo Bianconi 2021-03-07  241  	case MCU_UNI_CMD_OFFLOAD:
a2a6cd54eec464 Lorenzo Bianconi 2021-03-07  242  		mdev->mcu.timeout =3D HZ=
 / 3;
a2a6cd54eec464 Lorenzo Bianconi 2021-03-07  243  		break;
a2a6cd54eec464 Lorenzo Bianconi 2021-03-07  244  	default:
a2a6cd54eec464 Lorenzo Bianconi 2021-03-07  245  		mdev->mcu.timeout =3D 3 =
* HZ;
a2a6cd54eec464 Lorenzo Bianconi 2021-03-07  246  		break;
a2a6cd54eec464 Lorenzo Bianconi 2021-03-07  247  	}
1c099ab44727c8 Sean Wang        2021-01-28  248  =

1c099ab44727c8 Sean Wang        2021-01-28  249  	seq =3D ++dev->mt76.mcu.m=
sg_seq & 0xf;
1c099ab44727c8 Sean Wang        2021-01-28  250  	if (!seq)
1c099ab44727c8 Sean Wang        2021-01-28  251  		seq =3D ++dev->mt76.mcu.=
msg_seq & 0xf;
1c099ab44727c8 Sean Wang        2021-01-28  252  =

fe0195f7563314 Sean Wang        2021-10-19  253  	if (cmd =3D=3D MCU_CMD_FW=
_SCATTER)
1c099ab44727c8 Sean Wang        2021-01-28  254  		goto exit;
1c099ab44727c8 Sean Wang        2021-01-28  255  =

1c099ab44727c8 Sean Wang        2021-01-28 @256  	txd_len =3D cmd & MCU_UNI=
_PREFIX ? sizeof(*uni_txd) : sizeof(*mcu_txd);
1c099ab44727c8 Sean Wang        2021-01-28  257  	txd =3D (__le32 *)skb_pus=
h(skb, txd_len);
1c099ab44727c8 Sean Wang        2021-01-28  258  =

1c099ab44727c8 Sean Wang        2021-01-28  259  	val =3D FIELD_PREP(MT_TXD=
0_TX_BYTES, skb->len) |
1c099ab44727c8 Sean Wang        2021-01-28  260  	      FIELD_PREP(MT_TXD0_=
PKT_FMT, MT_TX_TYPE_CMD) |
1c099ab44727c8 Sean Wang        2021-01-28  261  	      FIELD_PREP(MT_TXD0_=
Q_IDX, MT_TX_MCU_PORT_RX_Q0);
1c099ab44727c8 Sean Wang        2021-01-28  262  	txd[0] =3D cpu_to_le32(va=
l);
1c099ab44727c8 Sean Wang        2021-01-28  263  =

1c099ab44727c8 Sean Wang        2021-01-28  264  	val =3D MT_TXD1_LONG_FORM=
AT |
1c099ab44727c8 Sean Wang        2021-01-28  265  	      FIELD_PREP(MT_TXD1_=
HDR_FORMAT, MT_HDR_FORMAT_CMD);
1c099ab44727c8 Sean Wang        2021-01-28  266  	txd[1] =3D cpu_to_le32(va=
l);
1c099ab44727c8 Sean Wang        2021-01-28  267  =

1c099ab44727c8 Sean Wang        2021-01-28  268  	if (cmd & MCU_UNI_PREFIX)=
 {
1c099ab44727c8 Sean Wang        2021-01-28  269  		uni_txd =3D (struct mt79=
21_uni_txd *)txd;
1c099ab44727c8 Sean Wang        2021-01-28  270  		uni_txd->len =3D cpu_to_=
le16(skb->len - sizeof(uni_txd->txd));
1c099ab44727c8 Sean Wang        2021-01-28  271  		uni_txd->option =3D MCU_=
CMD_UNI_EXT_ACK;
1c099ab44727c8 Sean Wang        2021-01-28  272  		uni_txd->cid =3D cpu_to_=
le16(mcu_cmd);
1c099ab44727c8 Sean Wang        2021-01-28  273  		uni_txd->s2d_index =3D M=
CU_S2D_H2N;
1c099ab44727c8 Sean Wang        2021-01-28  274  		uni_txd->pkt_type =3D MC=
U_PKT_ID;
1c099ab44727c8 Sean Wang        2021-01-28  275  		uni_txd->seq =3D seq;
1c099ab44727c8 Sean Wang        2021-01-28  276  =

1c099ab44727c8 Sean Wang        2021-01-28  277  		goto exit;
1c099ab44727c8 Sean Wang        2021-01-28  278  	}
1c099ab44727c8 Sean Wang        2021-01-28  279  =

1c099ab44727c8 Sean Wang        2021-01-28  280  	mcu_txd =3D (struct mt792=
1_mcu_txd *)txd;
1c099ab44727c8 Sean Wang        2021-01-28  281  	mcu_txd->len =3D cpu_to_l=
e16(skb->len - sizeof(mcu_txd->txd));
1c099ab44727c8 Sean Wang        2021-01-28  282  	mcu_txd->pq_id =3D cpu_to=
_le16(MCU_PQ_ID(MT_TX_PORT_IDX_MCU,
1c099ab44727c8 Sean Wang        2021-01-28  283  					       MT_TX_MCU_PORT=
_RX_Q0));
1c099ab44727c8 Sean Wang        2021-01-28  284  	mcu_txd->pkt_type =3D MCU=
_PKT_ID;
1c099ab44727c8 Sean Wang        2021-01-28  285  	mcu_txd->seq =3D seq;
1c099ab44727c8 Sean Wang        2021-01-28  286  =

1c099ab44727c8 Sean Wang        2021-01-28  287  	switch (cmd & ~MCU_CMD_MA=
SK) {
1c099ab44727c8 Sean Wang        2021-01-28  288  	case MCU_FW_PREFIX:
1c099ab44727c8 Sean Wang        2021-01-28  289  		mcu_txd->set_query =3D M=
CU_Q_NA;
1c099ab44727c8 Sean Wang        2021-01-28  290  		mcu_txd->cid =3D mcu_cmd;
1c099ab44727c8 Sean Wang        2021-01-28  291  		break;
1c099ab44727c8 Sean Wang        2021-01-28  292  	case MCU_CE_PREFIX:
1c099ab44727c8 Sean Wang        2021-01-28  293  		if (cmd & MCU_QUERY_MASK)
1c099ab44727c8 Sean Wang        2021-01-28  294  			mcu_txd->set_query =3D =
MCU_Q_QUERY;
1c099ab44727c8 Sean Wang        2021-01-28  295  		else
1c099ab44727c8 Sean Wang        2021-01-28  296  			mcu_txd->set_query =3D =
MCU_Q_SET;
1c099ab44727c8 Sean Wang        2021-01-28  297  		mcu_txd->cid =3D mcu_cmd;
1c099ab44727c8 Sean Wang        2021-01-28  298  		break;
1c099ab44727c8 Sean Wang        2021-01-28  299  	default:
1c099ab44727c8 Sean Wang        2021-01-28  300  		mcu_txd->cid =3D MCU_CMD=
_EXT_CID;
1c099ab44727c8 Sean Wang        2021-01-28  301  		if (cmd & MCU_QUERY_PREF=
IX || cmd =3D=3D MCU_EXT_CMD_EFUSE_ACCESS)
1c099ab44727c8 Sean Wang        2021-01-28  302  			mcu_txd->set_query =3D =
MCU_Q_QUERY;
1c099ab44727c8 Sean Wang        2021-01-28  303  		else
1c099ab44727c8 Sean Wang        2021-01-28  304  			mcu_txd->set_query =3D =
MCU_Q_SET;
1c099ab44727c8 Sean Wang        2021-01-28  305  		mcu_txd->ext_cid =3D mcu=
_cmd;
1c099ab44727c8 Sean Wang        2021-01-28  306  		mcu_txd->ext_cid_ack =3D=
 1;
1c099ab44727c8 Sean Wang        2021-01-28  307  		break;
1c099ab44727c8 Sean Wang        2021-01-28  308  	}
1c099ab44727c8 Sean Wang        2021-01-28  309  =

1c099ab44727c8 Sean Wang        2021-01-28  310  	mcu_txd->s2d_index =3D MC=
U_S2D_H2N;
1c099ab44727c8 Sean Wang        2021-01-28  311  	WARN_ON(cmd =3D=3D MCU_EX=
T_CMD_EFUSE_ACCESS &&
1c099ab44727c8 Sean Wang        2021-01-28  312  		mcu_txd->set_query !=3D =
MCU_Q_QUERY);
1c099ab44727c8 Sean Wang        2021-01-28  313  =

1c099ab44727c8 Sean Wang        2021-01-28  314  exit:
1c099ab44727c8 Sean Wang        2021-01-28  315  	if (wait_seq)
1c099ab44727c8 Sean Wang        2021-01-28  316  		*wait_seq =3D seq;
1c099ab44727c8 Sean Wang        2021-01-28  317  =

fe0195f7563314 Sean Wang        2021-10-19  318  	return 0;
1c099ab44727c8 Sean Wang        2021-01-28  319  }
fe0195f7563314 Sean Wang        2021-10-19  320  EXPORT_SYMBOL_GPL(mt7921_m=
cu_fill_message);
1c099ab44727c8 Sean Wang        2021-01-28  321  =


:::::: The code at line 256 was first introduced by commit
:::::: 1c099ab44727c8e42fe4de4d91b53cec3ef02860 mt76: mt7921: add MCU suppo=
rt

:::::: TO: Sean Wang <sean.wang@mediatek.com>
:::::: CC: Felix Fietkau <nbd@nbd.name>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9043180653758396162==--

