Content-Type: multipart/mixed; boundary="===============2972815298601381284=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/2] Add Intel LGM soc DMA support.
Date: Sat, 27 Jun 2020 08:38:10 +0800
Message-ID: <202006270812.4lsU4qU8%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2972815298601381284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <07e0986a8c63f0e055f26f6cca7587efe36ba3c5.1592895906.git.malli=
karjunax.reddy@linux.intel.com>
References: <07e0986a8c63f0e055f26f6cca7587efe36ba3c5.1592895906.git.mallik=
arjunax.reddy@linux.intel.com>
TO: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
TO: dmaengine(a)vger.kernel.org
TO: vkoul(a)kernel.org
TO: devicetree(a)vger.kernel.org
TO: robh+dt(a)kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: andriy.shevchenko(a)intel.com
CC: chuanhua.lei(a)linux.intel.com
CC: cheol.yong.kim(a)intel.com
CC: qi-ming.wu(a)intel.com
CC: malliamireddy009(a)gmail.com

Hi Amireddy,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v5.8-rc2 next-20200626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Amireddy-Mallikarjuna-redd=
y/Add-Intel-LGM-soc-DMA-support/20200623-172832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/dma/lgm/lgm-dma.c:1030:10: warning: Redundant condition: !ret. '=
ret || (!ret && c->desc_num>255)' is equivalent to 'ret || c->desc_num>255'=
 [redundantCondition]
    if (ret || (!ret && c->desc_num > 255))
            ^
>> drivers/dma/lgm/lgm-dma.c:1208:20: warning: Variable 'c' is not assigned=
 a value. [unassignedVariable]
    struct ldma_chan *c;
                      ^

# https://github.com/0day-ci/linux/commit/2443fca863113add4b0398396f92f4cec=
56a5140
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 2443fca863113add4b0398396f92f4cec56a5140
vim +1030 drivers/dma/lgm/lgm-dma.c

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1004  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1005  /*
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1006   * The configu=
ration stored in the devicetree matches the configuration
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1007   * parameters =
of the peripheral instance and allows the driver to know which
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1008   * features ar=
e implemented and how it should behave. Users only configure
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1009   * what is nec=
essary. All other setting will fall back to default setting
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1010   */
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1011  static int dma=
_parse_chan_dt(struct fwnode_handle *fw_chan, struct ldma_dev *d)
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1012  {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1013  	struct ldma_p=
ort *p;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1014  	struct ldma_c=
han *c;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1015  	u32 v[2], val;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1016  	int ret;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1017  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1018  	ret =3D fwnod=
e_property_read_u32(fw_chan, "reg", &val);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1019  	if (ret)
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1020  		return ret;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1021  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1022  	/* Sanity che=
ck for channel range */
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1023  	if (val >=3D =
d->chan_nrs)
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1024  		return -ENOD=
EV;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1025  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1026  	c =3D &d->cha=
ns[val];
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1027  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1028  	ret =3D fwnod=
e_property_read_u32(fw_chan, "intel,chan-desc_num",
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1029  				       &c-=
>desc_num);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23 @1030  	if (ret || (!=
ret && c->desc_num > 255))
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1031  		c->desc_num =
=3D DMA_DFT_DESC_NUM;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1032  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1033  	/* Default se=
tting has been set before in case of error inputs */
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1034  	if (!fwnode_p=
roperty_read_u32(fw_chan, "intel,chan-pkt-sz", &val)) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1035  		if (val > DM=
A_MAX_PKT_SZ)
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1036  			return -EIN=
VAL;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1037  		c->pkt_sz =
=3D val;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1038  	}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1039  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1040  	if (!fwnode_p=
roperty_read_u32(fw_chan, "intel,chan-data-endian",
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1041  				      &val=
)) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1042  		if (val > DM=
A_ENDIAN_MAX)
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1043  			return -EIN=
VAL;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1044  		c->data_endi=
an =3D val;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1045  	}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1046  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1047  	if (!fwnode_p=
roperty_read_u32(fw_chan, "intel,chan-desc-endian",
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1048  				      &val=
)) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1049  		if (val > DM=
A_ENDIAN_MAX)
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1050  			return -EIN=
VAL;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1051  		c->desc_endi=
an =3D val;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1052  	}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1053  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1054  	if (fwnode_pr=
operty_read_u32(fw_chan, "intel,chan-byte-offset",
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1055  				     &c->b=
off_len))
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1056  		c->boff_len =
=3D 0;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1057  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1058  	if (fwnode_pr=
operty_read_u32(fw_chan, "chan-non-arb-cnt",
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1059  				     &c->n=
onarb_cnt))
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1060  		c->nonarb_cn=
t =3D 0;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1061  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1062  	if (fwnode_pr=
operty_read_u32(fw_chan, "intel,chan-arb-cnt",
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1063  				     &c->a=
rb_cnt))
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1064  		c->arb_cnt =
=3D 0;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1065  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1066  	if (c->arb_cn=
t > c->nonarb_cnt) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1067  		dev_err(d->d=
ev, "arb cnt should be less than no arb cnt\n");
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1068  		return -EINV=
AL;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1069  	}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1070  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1071  	if (!fwnode_p=
roperty_read_u32_array(fw_chan, "intel,chan-hdr-mode", v,
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1072  					    ARRAY=
_SIZE(v))) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1073  		c->hdrm_csum=
 =3D !!v[1];
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1074  		if (!c->hdrm=
_csum) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1075  			if (!v[0] |=
| v[0] > DMA_HDR_LEN_MAX)
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1076  				return -EI=
NVAL;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1077  		}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1078  		c->hdrm_len =
=3D v[0];
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1079  	}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1080  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1081  	if (!fwnode_p=
roperty_read_u32_array(fw_chan, "intel,chan-hw-desc", v,
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1082  					    ARRAY=
_SIZE(v))) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1083  		u32 cnt =3D =
v[1];
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1084  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1085  		if (!cnt) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1086  			dev_err(d->=
dev,
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1087  				"Channel %=
d must allocate descriptor first\n",
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1088  				c->nr);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1089  			return -EIN=
VAL;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1090  		}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1091  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1092  		if (cnt > DM=
A_MAX_DESC_NUM) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1093  			dev_err(d->=
dev,
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1094  				"Channel %=
d descriptor number out of range %d\n",
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1095  				c->nr, cnt=
);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1096  			return -EIN=
VAL;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1097  		}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1098  		c->desc_phys=
 =3D v[0];
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1099  		c->desc_cnt =
=3D cnt;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1100  		c->flags |=
=3D DMA_HW_DESC;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1101  	}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1102  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1103  	/* If channel=
 packet drop enabled, port packet drop should be enabled */
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1104  	c->pden =3D f=
wnode_property_read_bool(fw_chan, "intel,chan-pkt-drop");
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1105  	if (c->pden) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1106  		p =3D c->por=
t;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1107  		/* Config on=
ce on the dma port packet drop */
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1108  		if (!p->pden=
) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1109  			p->pkt_drop=
 =3D DMA_PKT_DROP_EN;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1110  			p->pden =3D=
 true;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1111  		}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1112  	}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1113  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1114  	c->desc_rx_np=
 =3D fwnode_property_read_bool(fw_chan,
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1115  						  "intel=
,chan-desc-rx-nonpost");
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1116  	c->data_endia=
n_en =3D fwnode_property_read_bool(fw_chan,
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1117  						      "i=
ntel,chan-data-endian-en");
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1118  	c->desc_endia=
n_en =3D fwnode_property_read_bool(fw_chan,
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1119  						      "i=
ntel,chan-data-endian-en");
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1120  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1121  	return 0;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1122  }
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1123  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1124  static unsigne=
d int dma_get_channel_node_count(struct ldma_dev *d)
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1125  {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1126  	struct fwnode=
_handle *fwnode =3D dev_fwnode(d->dev);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1127  	struct fwnode=
_handle *fw_chans;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1128  	struct fwnode=
_handle *child;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1129  	unsigned int =
count =3D 0;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1130  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1131  	fw_chans =3D =
fwnode_get_named_child_node(fwnode, "dma-channels");
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1132  	fwnode_for_ea=
ch_child_node(fw_chans, child)
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1133  		count++;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1134  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1135  	return count;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1136  }
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1137  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1138  static int dma=
_parse_port_dt(struct fwnode_handle *fw_port, struct ldma_dev *d)
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1139  {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1140  	struct ldma_p=
ort *p;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1141  	u32 val, v[2];
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1142  	int ret;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1143  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1144  	ret =3D fwnod=
e_property_read_u32(fw_port, "reg", &val);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1145  	if (ret)
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1146  		return ret;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1147  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1148  	/* Sanit chec=
k */
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1149  	if (val >=3D =
d->port_nrs)
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1150  		return -ENOD=
EV;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1151  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1152  	p =3D &d->por=
ts[val];
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1153  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1154  	ret =3D fwnod=
e_property_read_string(fw_port, "intel,port-name", &p->name);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1155  	if (ret) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1156  		dev_err(d->d=
ev, "Failed to get port name ret=3D%d\n", ret);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1157  		return ret;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1158  	}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1159  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1160  	ret =3D fwnod=
e_property_read_u32_array(fw_port, "intel,port-chans", v,
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1161  					     ARRA=
Y_SIZE(v));
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1162  	if (ret) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1163  		dev_err(d->d=
ev, "Failed to get port chan mapping ret=3D%d\n",
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1164  			ret);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1165  		return ret;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1166  	}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1167  	p->chan_start=
 =3D v[0];
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1168  	p->chan_sz =
=3D v[1];
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1169  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1170  	if (fwnode_pr=
operty_read_u32(fw_port, "intel,port-burst", &p->txbl))
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1171  		p->txbl =3D =
DMA_DFT_BURST_V22;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1172  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1173  	if (p->txbl !=
=3D 2 && p->txbl !=3D 4 && p->txbl !=3D 8)
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1174  		return -EINV=
AL;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1175  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1176  	/* TX and RX =
has the same burst length */
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1177  	p->txbl =3D i=
log2(p->txbl);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1178  	p->rxbl =3D p=
->txbl;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1179  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1180  	if (fwnode_pr=
operty_read_u32(fw_port, "intel,port-endian", &p->txendi))
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1181  		p->txendi =
=3D DMA_DFT_ENDIAN;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1182  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1183  	/* TX and RX =
has the same endianness */
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1184  	p->rxendi =3D=
 p->txendi;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1185  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1186  	if (fwnode_pr=
operty_read_u32(fw_port, "intel,port-txwgt", &p->txwgt))
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1187  		p->txwgt =3D=
 DMA_TX_PORT_DFT_WGT;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1188  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1189  	if (!strncmp(=
p->name, "MEMCPY", 4))
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1190  		p->flush_mem=
cpy =3D 1;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1191  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1192  	/*
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1193  	 * Get max av=
ailable channels instead of reading from regsiters
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1194  	 */
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1195  	d->chan_nrs =
=3D dma_get_channel_node_count(d);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1196  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1197  	dev_dbg(d->de=
v, "Port %s burst %d endian %d txwgt %d\n",
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1198  		p->name, p->=
rxbl, p->rxendi, p->txwgt);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1199  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1200  	return 0;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1201  }
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1202  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1203  static int ldm=
a_cfg_init(struct ldma_dev *d)
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1204  {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1205  	struct fwnode=
_handle *fwnode =3D dev_fwnode(d->dev);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1206  	struct fwnode=
_handle *fw_chans, *fw_chan;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1207  	struct fwnode=
_handle *fw_ports, *fw_port;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23 @1208  	struct ldma_c=
han *c;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1209  	struct ldma_p=
ort *p;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1210  	u32 txendi, r=
xendi;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1211  	u32 prop, val;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1212  	int ret, i;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1213  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1214  	if (fwnode_pr=
operty_read_bool(fwnode, "intel,dma-chan-fc"))
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1215  		d->flags |=
=3D DMA_CHAN_FLOW_CTL;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1216  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1217  	if (fwnode_pr=
operty_read_bool(fwnode, "intel,dma-desc-fod"))
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1218  		d->flags |=
=3D DMA_DESC_FTOD;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1219  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1220  	if (fwnode_pr=
operty_read_bool(fwnode, "intel,dma-desc-in-sram"))
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1221  		d->flags |=
=3D DMA_DESC_IN_SRAM;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1222  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1223  	if (fwnode_pr=
operty_read_bool(fwnode, "intel,dma-byte-en"))
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1224  		d->flags |=
=3D DMA_EN_BYTE_EN;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1225  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1226  	if (fwnode_pr=
operty_read_bool(fwnode, "intel,dma-dfetch-ack"))
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1227  		d->flags |=
=3D DMA_VLD_FETCH_ACK;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1228  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1229  	if (fwnode_pr=
operty_read_bool(fwnode, "intel,dma-dburst-wr"))
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1230  		d->flags |=
=3D DMA_DBURST_WR;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1231  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1232  	if (fwnode_pr=
operty_read_bool(fwnode, "intel,dma-drb"))
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1233  		d->flags |=
=3D DMA_DFT_DRB;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1234  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1235  	if (fwnode_pr=
operty_read_u32(fwnode, "intel,dma-polling-cnt",
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1236  				     &d->p=
ollcnt))
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1237  		d->pollcnt =
=3D DMA_DFT_POLL_CNT;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1238  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1239  	if (!fwnode_p=
roperty_read_u32(fwnode, "intel,dma-orrc", &val)) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1240  		if (val > DM=
A_ORRC_MAX_CNT)
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1241  			return -EIN=
VAL;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1242  		d->orrc =3D =
val;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1243  	}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1244  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1245  	if (d->ver > =
DMA_VER22) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1246  		if (fwnode_p=
roperty_read_u32(fwnode, "intel,dma-txendi",
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1247  					     &txe=
ndi))
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1248  			txendi =3D =
DMA_DFT_ENDIAN;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1249  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1250  		if (fwnode_p=
roperty_read_u32(fwnode, "intel,dma-rxendi",
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1251  					     &rxe=
ndi))
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1252  			rxendi =3D =
DMA_DFT_ENDIAN;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1253  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1254  		if (!d->port=
_nrs)
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1255  			return -EIN=
VAL;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1256  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1257  		for (i =3D 0=
; i < d->port_nrs; i++) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1258  			p =3D &d->p=
orts[i];
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1259  			p->rxendi =
=3D rxendi;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1260  			p->txendi =
=3D txendi;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1261  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1262  			if (!fwnode=
_property_read_u32(fwnode, "intel,dma-burst",
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1263  						      &p=
rop)) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1264  				p->rxbl =
=3D prop;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1265  				p->txbl =
=3D prop;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1266  			} else {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1267  				p->rxbl =
=3D DMA_DFT_BURST;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1268  				p->txbl =
=3D DMA_DFT_BURST;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1269  			}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1270  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1271  			p->pkt_drop=
 =3D DMA_PKT_DROP_DIS;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1272  			p->flush_me=
mcpy =3D 0;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1273  		}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1274  	}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1275  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1276  	/* Port speci=
fic, required for dma0 */
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1277  	fw_ports =3D =
fwnode_get_named_child_node(fwnode, "dma-ports");
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1278  	if (!fw_ports=
 && d->ver =3D=3D DMA_VER22) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1279  		dev_err(d->d=
ev, "Failed to get ports settings\n");
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1280  		return -ENOD=
EV;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1281  	}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1282  	if (fw_ports)=
 {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1283  		fwnode_for_e=
ach_child_node(fw_ports, fw_port) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1284  			ret =3D dma=
_parse_port_dt(fw_port, d);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1285  			if (ret) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1286  				fwnode_han=
dle_put(fw_port);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1287  				fwnode_han=
dle_put(fw_ports);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1288  				return -EI=
NVAL;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1289  			}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1290  		}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1291  		fwnode_handl=
e_put(fw_ports);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1292  	}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1293  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1294  	d->chans =3D =
devm_kcalloc(d->dev, d->chan_nrs, sizeof(*c), GFP_KERNEL);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1295  	if (!d->chans)
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1296  		return -ENOM=
EM;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1297  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1298  	/* Channel ba=
sed configuration if available, optional */
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1299  	fw_chans =3D =
fwnode_get_named_child_node(fwnode, "dma-channels");
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1300  	if (fw_chans)=
 {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1301  		fwnode_for_e=
ach_child_node(fw_chans, fw_chan) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1302  			if (dma_par=
se_chan_dt(fw_chan, d)) {
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1303  				fwnode_han=
dle_put(fw_chan);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1304  				fwnode_han=
dle_put(fw_chans);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1305  				return -EI=
NVAL;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1306  			}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1307  		}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1308  		fwnode_handl=
e_put(fw_chans);
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1309  	}
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1310  =

2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1311  	return 0;
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1312  }
2443fca863113a Amireddy Mallikarjuna reddy 2020-06-23  1313  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2972815298601381284==--

