Content-Type: multipart/mixed; boundary="===============8422361277817835474=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xlnx:xlnx_rebase_v5.4 1634/1765] drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1058:17: sparse: sparse: incompatible types in comparison expression (different type sizes):
Date: Thu, 22 Jul 2021 21:59:00 +0800
Message-ID: <202107222141.POa9vmIa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8422361277817835474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Harini Katakam <harini.katakam@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.4
head:   2f686fa6c0bf7fa168dc45dd7ce1359217212911
commit: c4c5319b6b2b797e9e9b5a38340fc77168ef022f [1634/1765] net: xilinx: a=
xiethernet: Add check for transmit data FIFO vacancy
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: s390-randconfig-s031-20210722 (attached as .config)
compiler: s390-linux-gcc (GCC) 10.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/Xilinx/linux-xlnx/commit/c4c5319b6b2b797e9e9b5=
a38340fc77168ef022f
        git remote add xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xlnx xlnx_rebase_v5.4
        git checkout c4c5319b6b2b797e9e9b5a38340fc77168ef022f
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-10.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Ds=
390 SHELL=3D/bin/bash drivers/net/ethernet/xilinx/ drivers/regulator/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1253:17: sparse: spars=
e: mixing declarations and code
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1058:17: sparse: spars=
e: incompatible types in comparison expression (different type sizes):
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1058:17: sparse:    un=
signed long *
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1058:17: sparse:    un=
signed int *
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1496:37: sparse: spars=
e: incorrect type in assignment (different base types) @@     expected unsi=
gned int [addressable] [usertype] sec @@     got restricted __be32 [usertyp=
e] @@
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1496:37: sparse:     e=
xpected unsigned int [addressable] [usertype] sec
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1496:37: sparse:     g=
ot restricted __be32 [usertype]
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1497:38: sparse: spars=
e: incorrect type in assignment (different base types) @@     expected unsi=
gned int [addressable] [usertype] nsec @@     got restricted __be32 [userty=
pe] @@
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1497:38: sparse:     e=
xpected unsigned int [addressable] [usertype] nsec
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1497:38: sparse:     g=
ot restricted __be32 [usertype]
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1533:37: sparse: spars=
e: cast to restricted __be32
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1533:35: sparse: spars=
e: incorrect type in assignment (different base types) @@     expected rest=
ricted __wsum [usertype] csum @@     got unsigned int [usertype] @@
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1533:35: sparse:     e=
xpected restricted __wsum [usertype] csum
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1533:35: sparse:     g=
ot unsigned int [usertype]
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: note: in included fil=
e (through arch/s390/include/asm/io.h, include/linux/scatterlist.h, include=
/linux/dma-mapping.h, ...):
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32

vim +1058 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1035  =

7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1036  	if (msg_ty=
pe =3D=3D TX_TS_OP_NOOP) {
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1037  		buf[0] =
=3D TX_TS_OP_NOOP;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1038  	} else if =
(msg_type =3D=3D TX_TS_OP_ONESTEP) {
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1039  		buf[0] =
=3D TX_TS_OP_ONESTEP;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1040  		buf[1] =
=3D TX_TS_CSUM_UPDATE;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1041  		buf[4] =
=3D TX_PTP_TS_OFFSET;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1042  		buf[6] =
=3D TX_PTP_CSUM_OFFSET;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1043  	} else {
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1044  		buf[0] =
=3D TX_TS_OP_TWOSTEP;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1045  		buf[2] =
=3D cur_p->ptp_tx_ts_tag & 0xFF;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1046  		buf[3] =
=3D (cur_p->ptp_tx_ts_tag >> 8) & 0xFF;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1047  	}
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1048  =

7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1049  	if (lp->ax=
ienet_config->mactype =3D=3D XAXIENET_1G ||
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1050  	    lp->ax=
ienet_config->mactype =3D=3D XAXIENET_2_5G) {
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1051  		memcpy(&v=
al, buf, AXIENET_TS_HEADER_LEN);
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1052  		swab64s(&=
val);
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1053  		memcpy(bu=
f, &val, AXIENET_TS_HEADER_LEN);
cc1dbf40f6648461 Harini Katakam               2020-09-24  1054  	} else if =
(lp->axienet_config->mactype =3D=3D XAXIENET_10G_25G ||
cc1dbf40f6648461 Harini Katakam               2020-09-24  1055  		   lp->ax=
ienet_config->mactype =3D=3D XAXIENET_MRMAC) {
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1056  		memcpy(&t=
mp, buf, XXVENET_TS_HEADER_LEN);
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1057  		/* Check =
for Transmit Data FIFO Vacancy */
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29 @1058  		spin_lock=
_irqsave(&lp->ptp_tx_lock, flags);
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1059  		if (!axie=
net_txts_ior(lp, XAXIFIFO_TXTS_TDFV)) {
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1060  			spin_unl=
ock_irqrestore(&lp->ptp_tx_lock, flags);
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1061  			return N=
ETDEV_TX_BUSY;
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1062  		}
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1063  		axienet_t=
xts_iow(lp, XAXIFIFO_TXTS_TXFD, tmp);
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1064  		axienet_t=
xts_iow(lp, XAXIFIFO_TXTS_TLR,
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1065  				 XXVENE=
T_TS_HEADER_LEN);
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1066  		spin_unlo=
ck_irqrestore(&lp->ptp_tx_lock, flags);
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1067  	}
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1068  =

c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1069  	return 0;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1070  }
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1071  #endif
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1072  =

bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1073  #ifdef CONF=
IG_XILINX_TSN
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1074  static inli=
ne u16 get_tsn_queue(u8 pcp, u16 num_tc)
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1075  {
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1076  	u16 queue =
=3D 0;
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1077  =

bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1078  	/* For 3 q=
ueue system, RE queue is 1 and ST queue is 2
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1079  	 * For 2 q=
ueue system, ST queue is 1. BE queue is always 0
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1080  	 */
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1081  	if (pcp =
=3D=3D 4) {
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1082  		if (num_t=
c =3D=3D 2)
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1083  			queue =
=3D 1;
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1084  		else
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1085  			queue =
=3D 2;
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1086  	} else if =
((num_tc =3D=3D 3) && (pcp =3D=3D 2 || pcp =3D=3D 3)) {
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1087  		queue =3D=
 1;
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1088  	}
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1089  =

bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1090  	return que=
ue;
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1091  }
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1092  =

bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1093  static inli=
ne u16 tsn_queue_mapping(const struct sk_buff *skb, u16 num_tc)
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1094  {
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1095  	int queue =
=3D 0;
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1096  	u16 vlan_t=
ci;
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1097  	u8 pcp;
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1098  =

bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1099  	struct eth=
hdr *hdr =3D (struct ethhdr *)skb->data;
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1100  	u16 ether_=
type =3D ntohs(hdr->h_proto);
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1101  =

bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1102  	if (unlike=
ly(ether_type =3D=3D ETH_P_8021Q)) {
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1103  		struct vl=
an_ethhdr *vhdr =3D (struct vlan_ethhdr *)skb->data;
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1104  =

bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1105  		/* ether_=
type =3D ntohs(vhdr->h_vlan_encapsulated_proto); */
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1106  =

bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1107  		vlan_tci =
=3D ntohs(vhdr->h_vlan_TCI);
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1108  =

bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1109  		pcp =3D (=
vlan_tci & VLAN_PRIO_MASK) >> VLAN_PRIO_SHIFT;
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1110  		pr_debug(=
"vlan_tci: %x\n", vlan_tci);
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1111  		pr_debug(=
"pcp: %d\n", pcp);
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1112  =

bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1113  		queue =3D=
 get_tsn_queue(pcp, num_tc);
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1114  	}
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1115  	pr_debug("=
selected queue: %d\n", queue);
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1116  	return que=
ue;
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1117  }
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1118  #endif
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1119  =

51054464602520b2 Saurabh Sengar               2020-01-24  1120  #ifdef CONF=
IG_XILINX_AXI_EMAC_HWTSTAMP
51054464602520b2 Saurabh Sengar               2020-01-24  1121  static int =
axienet_skb_tstsmp(struct sk_buff **__skb, struct axienet_dma_q *q,
51054464602520b2 Saurabh Sengar               2020-01-24  1122  			      st=
ruct net_device *ndev)
8a3b7a252dca9fb2 Daniel Borkmann              2012-01-19  1123  {
51054464602520b2 Saurabh Sengar               2020-01-24  1124  #ifdef CONF=
IG_AXIENET_HAS_MCDMA
51054464602520b2 Saurabh Sengar               2020-01-24  1125  	struct axi=
mcdma_bd *cur_p;
51054464602520b2 Saurabh Sengar               2020-01-24  1126  #else
8a3b7a252dca9fb2 Daniel Borkmann              2012-01-19  1127  	struct axi=
dma_bd *cur_p;
51054464602520b2 Saurabh Sengar               2020-01-24  1128  #endif
51054464602520b2 Saurabh Sengar               2020-01-24  1129  	struct axi=
enet_local *lp =3D netdev_priv(ndev);
51054464602520b2 Saurabh Sengar               2020-01-24  1130  	struct sk_=
buff *old_skb =3D *__skb;
51054464602520b2 Saurabh Sengar               2020-01-24  1131  	struct sk_=
buff *skb =3D *__skb;
8a3b7a252dca9fb2 Daniel Borkmann              2012-01-19  1132  =

51054464602520b2 Saurabh Sengar               2020-01-24  1133  #ifdef CONF=
IG_AXIENET_HAS_MCDMA
51054464602520b2 Saurabh Sengar               2020-01-24  1134  	cur_p =3D =
&q->txq_bd_v[q->tx_bd_tail];
51054464602520b2 Saurabh Sengar               2020-01-24  1135  #else
51054464602520b2 Saurabh Sengar               2020-01-24  1136  	cur_p =3D =
&q->tx_bd_v[q->tx_bd_tail];
51054464602520b2 Saurabh Sengar               2020-01-24  1137  #endif
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1138  =

7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1139  	if ((((lp-=
>tstamp_config.tx_type =3D=3D HWTSTAMP_TX_ONESTEP_SYNC) ||
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1140  	      (lp-=
>tstamp_config.tx_type =3D=3D HWTSTAMP_TX_ON)) ||
51054464602520b2 Saurabh Sengar               2020-01-24  1141  	       lp-=
>eth_hasptp) && (lp->axienet_config->mactype !=3D
12cccb2f4376e346 Harini Katakam               2020-09-24  1142  	       XAX=
IENET_10G_25G) &&
12cccb2f4376e346 Harini Katakam               2020-09-24  1143  	       (lp=
->axienet_config->mactype !=3D XAXIENET_MRMAC)) {
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1144  		u8 *tmp;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1145  		struct sk=
_buff *new_skb;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1146  =

51054464602520b2 Saurabh Sengar               2020-01-24  1147  		if (skb_h=
eadroom(old_skb) < AXIENET_TS_HEADER_LEN) {
51054464602520b2 Saurabh Sengar               2020-01-24  1148  			new_skb =
=3D
51054464602520b2 Saurabh Sengar               2020-01-24  1149  			skb_real=
loc_headroom(old_skb,
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1150  					     A=
XIENET_TS_HEADER_LEN);
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1151  			if (!new=
_skb) {
51054464602520b2 Saurabh Sengar               2020-01-24  1152  				dev_err=
(&ndev->dev, "failed to allocate new socket buffer\n");
51054464602520b2 Saurabh Sengar               2020-01-24  1153  				dev_kfr=
ee_skb_any(old_skb);
51054464602520b2 Saurabh Sengar               2020-01-24  1154  				return =
NETDEV_TX_BUSY;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1155  			}
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1156  =

7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1157  			/*  Tran=
sfer the ownership to the
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1158  			 *  new =
socket buffer if required
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1159  			 */
51054464602520b2 Saurabh Sengar               2020-01-24  1160  			if (old_=
skb->sk)
51054464602520b2 Saurabh Sengar               2020-01-24  1161  				skb_set=
_owner_w(new_skb, old_skb->sk);
51054464602520b2 Saurabh Sengar               2020-01-24  1162  			dev_kfre=
e_skb_any(old_skb);
51054464602520b2 Saurabh Sengar               2020-01-24  1163  			*__skb =
=3D new_skb;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1164  			skb =3D =
new_skb;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1165  		}
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1166  =

7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1167  		tmp =3D s=
kb_push(skb, AXIENET_TS_HEADER_LEN);
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1168  		memset(tm=
p, 0, AXIENET_TS_HEADER_LEN);
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1169  		cur_p->pt=
p_tx_ts_tag++;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1170  =

7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1171  		if (skb_s=
hinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) {
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1172  			if (lp->=
tstamp_config.tx_type =3D=3D
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1173  				HWTSTAM=
P_TX_ONESTEP_SYNC) {
51054464602520b2 Saurabh Sengar               2020-01-24  1174  				axienet=
_create_tsheader(tmp,
51054464602520b2 Saurabh Sengar               2020-01-24  1175  							TX_T=
S_OP_ONESTEP
51054464602520b2 Saurabh Sengar               2020-01-24  1176  							, q);
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1177  			} else {
51054464602520b2 Saurabh Sengar               2020-01-24  1178  				axienet=
_create_tsheader(tmp,
51054464602520b2 Saurabh Sengar               2020-01-24  1179  							TX_T=
S_OP_TWOSTEP
51054464602520b2 Saurabh Sengar               2020-01-24  1180  							, q);
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1181  				skb_shi=
nfo(skb)->tx_flags
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1182  						|=3D =
SKBTX_IN_PROGRESS;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1183  				cur_p->=
ptp_tx_skb =3D
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1184  					(unsig=
ned long)skb_get(skb);
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1185  			}
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1186  		}
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1187  	} else if =
((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) &&
cc1dbf40f6648461 Harini Katakam               2020-09-24  1188  			  (lp->a=
xienet_config->mactype =3D=3D XAXIENET_10G_25G ||
cc1dbf40f6648461 Harini Katakam               2020-09-24  1189  			   lp->a=
xienet_config->mactype =3D=3D XAXIENET_MRMAC)) {
c3aa16e3cab96fc5 Harini Katakam               2020-09-24  1190  			cur_p->p=
tp_tx_ts_tag =3D prandom_u32_max(XAXIFIFO_TXTS_TAG_MAX) + 1;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1191  			dev_dbg(=
lp->dev, "tx_tag:[%04x]\n",
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1192  				cur_p->=
ptp_tx_ts_tag);
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1193  			if (lp->=
tstamp_config.tx_type =3D=3D HWTSTAMP_TX_ONESTEP_SYNC) {
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1194  				if (axi=
enet_create_tsheader(lp->tx_ptpheader,
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1195  							    =
TX_TS_OP_ONESTEP,
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1196  							    =
q))
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1197  					return=
 NETDEV_TX_BUSY;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1198  			} else {
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1199  				if (axi=
enet_create_tsheader(lp->tx_ptpheader,
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1200  							    =
TX_TS_OP_TWOSTEP,
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1201  							    =
q))
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1202  					return=
 NETDEV_TX_BUSY;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1203  				skb_shi=
nfo(skb)->tx_flags |=3D SKBTX_IN_PROGRESS;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1204  				cur_p->=
ptp_tx_skb =3D (phys_addr_t)skb_get(skb);
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1205  			}
cc1dbf40f6648461 Harini Katakam               2020-09-24  1206  	} else if =
(lp->axienet_config->mactype =3D=3D XAXIENET_10G_25G ||
cc1dbf40f6648461 Harini Katakam               2020-09-24  1207  		   lp->ax=
ienet_config->mactype =3D=3D XAXIENET_MRMAC) {
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1208  			dev_dbg(=
lp->dev, "tx_tag:NOOP\n");
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1209  			if (axie=
net_create_tsheader(lp->tx_ptpheader,
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1210  						    T=
X_TS_OP_NOOP, q))
c4c5319b6b2b797e Radhey Shyam Pandey          2020-09-29  1211  				return =
NETDEV_TX_BUSY;
51054464602520b2 Saurabh Sengar               2020-01-24  1212  	}
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1213  =

51054464602520b2 Saurabh Sengar               2020-01-24  1214  	return NET=
DEV_TX_OK;
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1215  }
7aee9da192ba5721 Appana Durga Kedareswara Rao 2020-01-24  1216  #endif
51054464602520b2 Saurabh Sengar               2020-01-24  1217  =

51054464602520b2 Saurabh Sengar               2020-01-24  1218  static int =
axienet_queue_xmit(struct sk_buff *skb,
51054464602520b2 Saurabh Sengar               2020-01-24  1219  			      st=
ruct net_device *ndev, u16 map)
51054464602520b2 Saurabh Sengar               2020-01-24  1220  {
51054464602520b2 Saurabh Sengar               2020-01-24  1221  	u32 ii;
51054464602520b2 Saurabh Sengar               2020-01-24  1222  	u32 num_fr=
ag;
51054464602520b2 Saurabh Sengar               2020-01-24  1223  	u32 csum_s=
tart_off;
51054464602520b2 Saurabh Sengar               2020-01-24  1224  	u32 csum_i=
ndex_off;
51054464602520b2 Saurabh Sengar               2020-01-24  1225  	dma_addr_t=
 tail_p;
51054464602520b2 Saurabh Sengar               2020-01-24  1226  	struct axi=
enet_local *lp =3D netdev_priv(ndev);
51054464602520b2 Saurabh Sengar               2020-01-24  1227  #ifdef CONF=
IG_AXIENET_HAS_MCDMA
51054464602520b2 Saurabh Sengar               2020-01-24  1228  	struct axi=
mcdma_bd *cur_p;
51054464602520b2 Saurabh Sengar               2020-01-24  1229  #else
51054464602520b2 Saurabh Sengar               2020-01-24  1230  	struct axi=
dma_bd *cur_p;
51054464602520b2 Saurabh Sengar               2020-01-24  1231  #endif
51054464602520b2 Saurabh Sengar               2020-01-24  1232  	unsigned l=
ong flags;
51054464602520b2 Saurabh Sengar               2020-01-24  1233  	struct axi=
enet_dma_q *q;
51054464602520b2 Saurabh Sengar               2020-01-24  1234  =

12cccb2f4376e346 Harini Katakam               2020-09-24  1235  	if (lp->ax=
ienet_config->mactype =3D=3D XAXIENET_10G_25G ||
12cccb2f4376e346 Harini Katakam               2020-09-24  1236  	    lp->ax=
ienet_config->mactype =3D=3D XAXIENET_MRMAC) {
51054464602520b2 Saurabh Sengar               2020-01-24  1237  		/* Need t=
o manually pad the small frames in case of XXV MAC
51054464602520b2 Saurabh Sengar               2020-01-24  1238  		 * becaus=
e the pad field is not added by the IP. We must present
51054464602520b2 Saurabh Sengar               2020-01-24  1239  		 * a pack=
et that meets the minimum length to the IP core.
51054464602520b2 Saurabh Sengar               2020-01-24  1240  		 * When t=
he IP core is configured to calculate and add the FCS
51054464602520b2 Saurabh Sengar               2020-01-24  1241  		 * to the=
 packet the minimum packet length is 60 bytes.
e29146f6c284821d Appana Durga Kedareswara Rao 2020-01-24  1242  		 */
51054464602520b2 Saurabh Sengar               2020-01-24  1243  		if (eth_s=
kb_pad(skb)) {
51054464602520b2 Saurabh Sengar               2020-01-24  1244  			ndev->st=
ats.tx_dropped++;
51054464602520b2 Saurabh Sengar               2020-01-24  1245  			return N=
ETDEV_TX_OK;
51054464602520b2 Saurabh Sengar               2020-01-24  1246  		}
51054464602520b2 Saurabh Sengar               2020-01-24  1247  	}
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1248  =

bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1249  #ifdef CONF=
IG_XILINX_TSN
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1250  	if (unlike=
ly(lp->is_tsn)) {
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1251  		map =3D t=
sn_queue_mapping(skb, lp->num_tc);
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1252  #ifdef CONF=
IG_XILINX_TSN_PTP
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13 @1253  		const str=
uct ethhdr *eth;
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1254  =

bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1255  		eth =3D (=
struct ethhdr *)skb->data;
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1256  		/* check =
if skb is a PTP frame ? */
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1257  		if (eth->=
h_proto =3D=3D htons(ETH_P_1588))
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1258  			return a=
xienet_ptp_xmit(skb, ndev);
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1259  #endif
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1260  		if (lp->t=
emac_no =3D=3D XAE_TEMAC2) {
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1261  			dev_kfre=
e_skb_any(skb);
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1262  			return N=
ETDEV_TX_OK;
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1263  		}
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1264  	}
bbcf6f9bb1bc2063 Saurabh Sengar               2020-02-13  1265  #endif
51054464602520b2 Saurabh Sengar               2020-01-24  1266  	num_frag =
=3D skb_shinfo(skb)->nr_frags;
51054464602520b2 Saurabh Sengar               2020-01-24  1267  =

51054464602520b2 Saurabh Sengar               2020-01-24  1268  	q =3D lp->=
dq[map];
51054464602520b2 Saurabh Sengar               2020-01-24  1269  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8422361277817835474==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
j2uCxroUAQA=
--===============8422361277817835474==--

