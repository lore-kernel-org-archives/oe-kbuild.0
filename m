Content-Type: multipart/mixed; boundary="===============7895996384342253978=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wwan/qcom_bam_dmux.c:507 bam_dmux_cmd_data() warn: potential spectre issue 'dmux->netdevs' [r]
Date: Tue, 15 Feb 2022 06:36:14 +0800
Message-ID: <202202150600.4Sde40jv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7895996384342253978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Stephan Gerhold <stephan@gerhold.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d567f5db412ed52de0b3b3efca4a451263de6108
commit: 21a0ffd9b38c61d79b5ade54893b0f59f2e8c2c3 net: wwan: Add Qualcomm BA=
M-DMUX WWAN network driver
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: s390-randconfig-m031-20220214 (https://download.01.org/0day-ci/arch=
ive/20220215/202202150600.4Sde40jv-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/wwan/qcom_bam_dmux.c:507 bam_dmux_cmd_data() warn: potential sp=
ectre issue 'dmux->netdevs' [r]
drivers/net/wwan/qcom_bam_dmux.c:509 bam_dmux_cmd_data() warn: possible spe=
ctre second half.  'netdev'

vim +507 drivers/net/wwan/qcom_bam_dmux.c

21a0ffd9b38c61 Stephan Gerhold 2021-11-27  501  =

21a0ffd9b38c61 Stephan Gerhold 2021-11-27  502  static void bam_dmux_cmd_da=
ta(struct bam_dmux_skb_dma *skb_dma)
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  503  {
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  504  	struct bam_dmux *dmux =3D =
skb_dma->dmux;
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  505  	struct sk_buff *skb =3D sk=
b_dma->skb;
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  506  	struct bam_dmux_hdr *hdr =
=3D (struct bam_dmux_hdr *)skb->data;
21a0ffd9b38c61 Stephan Gerhold 2021-11-27 @507  	struct net_device *netdev =
=3D dmux->netdevs[hdr->ch];
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  508  =

21a0ffd9b38c61 Stephan Gerhold 2021-11-27 @509  	if (!netdev || !netif_runn=
ing(netdev)) {
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  510  		dev_warn(dmux->dev, "Data=
 for inactive channel %u\n", hdr->ch);
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  511  		return;
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  512  	}
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  513  =

21a0ffd9b38c61 Stephan Gerhold 2021-11-27  514  	if (hdr->len > BAM_DMUX_MA=
X_DATA_SIZE) {
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  515  		dev_err(dmux->dev, "Data =
larger than buffer? (%u > %u)\n",
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  516  			hdr->len, (u16)BAM_DMUX_=
MAX_DATA_SIZE);
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  517  		return;
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  518  	}
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  519  =

21a0ffd9b38c61 Stephan Gerhold 2021-11-27  520  	skb_dma->skb =3D NULL; /* =
Hand over to network stack */
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  521  =

21a0ffd9b38c61 Stephan Gerhold 2021-11-27  522  	skb_pull(skb, sizeof(*hdr)=
);
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  523  	skb_trim(skb, hdr->len);
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  524  	skb->dev =3D netdev;
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  525  =

21a0ffd9b38c61 Stephan Gerhold 2021-11-27  526  	/* Only Raw-IP/QMAP is sup=
ported by this driver */
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  527  	switch (skb->data[0] & 0xf=
0) {
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  528  	case 0x40:
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  529  		skb->protocol =3D htons(E=
TH_P_IP);
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  530  		break;
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  531  	case 0x60:
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  532  		skb->protocol =3D htons(E=
TH_P_IPV6);
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  533  		break;
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  534  	default:
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  535  		skb->protocol =3D htons(E=
TH_P_MAP);
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  536  		break;
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  537  	}
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  538  =

21a0ffd9b38c61 Stephan Gerhold 2021-11-27  539  	netif_receive_skb(skb);
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  540  }
21a0ffd9b38c61 Stephan Gerhold 2021-11-27  541  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7895996384342253978==--

