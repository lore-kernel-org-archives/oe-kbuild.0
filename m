Content-Type: multipart/mixed; boundary="===============4998754426215510218=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hverkuil-media:for-v5.13i 10/19] drivers/media/platform/qcom/camss/camss-csid-170.c:423:13: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour
Date: Wed, 17 Mar 2021 09:25:05 +0800
Message-ID: <202103170900.PwvojLgT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4998754426215510218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Robert Foss <robert.foss@linaro.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>
CC: Andrey Konovalov <andrey.konovalov@linaro.org>

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v5.13i
head:   32bfacd5437d0c4637f763c86b186f794ea09f09
commit: d192a4a60b8932ebd491e75bd7ee502a9477309a [10/19] media: camss: Add =
support for CSID hardware version Titan 170
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/platform/qcom/camss/camss-csid-170.c:423:13: warning: Shif=
ting signed 32-bit value by 31 bits is undefined behaviour [shiftTooManyBit=
sSigned]
     val |=3D  1 << RDI_CFG0_ENABLE;
               ^
--
>> drivers/media/platform/qcom/camss/camss-ispif.c:934:18: warning: Variabl=
e 'fmt->colorspace' is reassigned a value before the old one has been used.=
 'break;' missing? [redundantAssignInSwitch]
    fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
                    ^
   drivers/media/platform/qcom/camss/camss-ispif.c:921:19: note: Variable '=
fmt->colorspace' is reassigned a value before the old one has been used. 'b=
reak;' missing?
     fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
                     ^
   drivers/media/platform/qcom/camss/camss-ispif.c:934:18: note: Variable '=
fmt->colorspace' is reassigned a value before the old one has been used. 'b=
reak;' missing?
    fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
                    ^

vim +423 drivers/media/platform/qcom/camss/camss-csid-170.c

d192a4a60b8932 Robert Foss 2021-03-16  328  =

d192a4a60b8932 Robert Foss 2021-03-16  329  static void csid_configure_stre=
am(struct csid_device *csid, u8 enable)
d192a4a60b8932 Robert Foss 2021-03-16  330  {
d192a4a60b8932 Robert Foss 2021-03-16  331  	struct csid_testgen_config *tg=
 =3D &csid->testgen;
d192a4a60b8932 Robert Foss 2021-03-16  332  	u32 val;
d192a4a60b8932 Robert Foss 2021-03-16  333  	u32 phy_sel =3D 0;
d192a4a60b8932 Robert Foss 2021-03-16  334  	u8 lane_cnt =3D csid->phy.lane=
_cnt;
d192a4a60b8932 Robert Foss 2021-03-16  335  	struct v4l2_mbus_framefmt *inp=
ut_format =3D &csid->fmt[MSM_CSID_PAD_SRC];
d192a4a60b8932 Robert Foss 2021-03-16  336  	const struct csid_format *form=
at =3D csid_get_fmt_entry(csid->formats, csid->nformats,
d192a4a60b8932 Robert Foss 2021-03-16  337  							      input_format->code=
);
d192a4a60b8932 Robert Foss 2021-03-16  338  =

d192a4a60b8932 Robert Foss 2021-03-16  339  	if (!lane_cnt)
d192a4a60b8932 Robert Foss 2021-03-16  340  		lane_cnt =3D 4;
d192a4a60b8932 Robert Foss 2021-03-16  341  =

d192a4a60b8932 Robert Foss 2021-03-16  342  	if (!tg->enabled)
d192a4a60b8932 Robert Foss 2021-03-16  343  		phy_sel =3D csid->phy.csiphy_=
id;
d192a4a60b8932 Robert Foss 2021-03-16  344  =

d192a4a60b8932 Robert Foss 2021-03-16  345  	if (enable) {
d192a4a60b8932 Robert Foss 2021-03-16  346  		u8 vc =3D 0; /* Virtual Chann=
el 0 */
d192a4a60b8932 Robert Foss 2021-03-16  347  		u8 dt_id =3D vc * 4;
d192a4a60b8932 Robert Foss 2021-03-16  348  =

d192a4a60b8932 Robert Foss 2021-03-16  349  		if (tg->enabled) {
d192a4a60b8932 Robert Foss 2021-03-16  350  			/* Config Test Generator */
d192a4a60b8932 Robert Foss 2021-03-16  351  			vc =3D 0xa;
d192a4a60b8932 Robert Foss 2021-03-16  352  =

d192a4a60b8932 Robert Foss 2021-03-16  353  			/* configure one DT, infinit=
e frames */
d192a4a60b8932 Robert Foss 2021-03-16  354  			val =3D vc << TPG_VC_CFG0_VC=
_NUM;
d192a4a60b8932 Robert Foss 2021-03-16  355  			val |=3D INTELEAVING_MODE_ON=
E_SHOT << TPG_VC_CFG0_LINE_INTERLEAVING_MODE;
d192a4a60b8932 Robert Foss 2021-03-16  356  			val |=3D 0 << TPG_VC_CFG0_NU=
M_FRAMES;
d192a4a60b8932 Robert Foss 2021-03-16  357  			writel_relaxed(val, csid->ba=
se + CSID_TPG_VC_CFG0);
d192a4a60b8932 Robert Foss 2021-03-16  358  =

d192a4a60b8932 Robert Foss 2021-03-16  359  			val =3D 0x740 << TPG_VC_CFG1=
_H_BLANKING_COUNT;
d192a4a60b8932 Robert Foss 2021-03-16  360  			val |=3D 0x3ff << TPG_VC_CFG=
1_V_BLANKING_COUNT;
d192a4a60b8932 Robert Foss 2021-03-16  361  			writel_relaxed(val, csid->ba=
se + CSID_TPG_VC_CFG1);
d192a4a60b8932 Robert Foss 2021-03-16  362  =

d192a4a60b8932 Robert Foss 2021-03-16  363  			writel_relaxed(0x12345678, c=
sid->base + CSID_TPG_LFSR_SEED);
d192a4a60b8932 Robert Foss 2021-03-16  364  =

d192a4a60b8932 Robert Foss 2021-03-16  365  			val =3D input_format->height=
 & 0x1fff << TPG_DT_n_CFG_0_FRAME_HEIGHT;
d192a4a60b8932 Robert Foss 2021-03-16  366  			val |=3D input_format->width=
 & 0x1fff << TPG_DT_n_CFG_0_FRAME_WIDTH;
d192a4a60b8932 Robert Foss 2021-03-16  367  			writel_relaxed(val, csid->ba=
se + CSID_TPG_DT_n_CFG_0(0));
d192a4a60b8932 Robert Foss 2021-03-16  368  =

d192a4a60b8932 Robert Foss 2021-03-16  369  			val =3D DATA_TYPE_RAW_10BIT =
<< TPG_DT_n_CFG_1_DATA_TYPE;
d192a4a60b8932 Robert Foss 2021-03-16  370  			writel_relaxed(val, csid->ba=
se + CSID_TPG_DT_n_CFG_1(0));
d192a4a60b8932 Robert Foss 2021-03-16  371  =

d192a4a60b8932 Robert Foss 2021-03-16  372  			val =3D tg->mode << TPG_DT_n=
_CFG_2_PAYLOAD_MODE;
d192a4a60b8932 Robert Foss 2021-03-16  373  			val |=3D 0xBE << TPG_DT_n_CF=
G_2_USER_SPECIFIED_PAYLOAD;
d192a4a60b8932 Robert Foss 2021-03-16  374  			val |=3D format->decode_form=
at << TPG_DT_n_CFG_2_ENCODE_FORMAT;
d192a4a60b8932 Robert Foss 2021-03-16  375  			writel_relaxed(val, csid->ba=
se + CSID_TPG_DT_n_CFG_2(0));
d192a4a60b8932 Robert Foss 2021-03-16  376  =

d192a4a60b8932 Robert Foss 2021-03-16  377  			writel_relaxed(0, csid->base=
 + CSID_TPG_COLOR_BARS_CFG);
d192a4a60b8932 Robert Foss 2021-03-16  378  =

d192a4a60b8932 Robert Foss 2021-03-16  379  			writel_relaxed(0, csid->base=
 + CSID_TPG_COLOR_BOX_CFG);
d192a4a60b8932 Robert Foss 2021-03-16  380  		}
d192a4a60b8932 Robert Foss 2021-03-16  381  =

d192a4a60b8932 Robert Foss 2021-03-16  382  		val =3D 1 << RDI_CFG0_BYTE_CN=
TR_EN;
d192a4a60b8932 Robert Foss 2021-03-16  383  		val |=3D 1 << RDI_CFG0_FORMAT=
_MEASURE_EN;
d192a4a60b8932 Robert Foss 2021-03-16  384  		val |=3D 1 << RDI_CFG0_TIMEST=
AMP_EN;
d192a4a60b8932 Robert Foss 2021-03-16  385  		val |=3D DECODE_FORMAT_PAYLOA=
D_ONLY << RDI_CFG0_DECODE_FORMAT;
d192a4a60b8932 Robert Foss 2021-03-16  386  		val |=3D DATA_TYPE_RAW_10BIT =
<< RDI_CFG0_DATA_TYPE;
d192a4a60b8932 Robert Foss 2021-03-16  387  		val |=3D vc << RDI_CFG0_VIRTU=
AL_CHANNEL;
d192a4a60b8932 Robert Foss 2021-03-16  388  		val |=3D dt_id << RDI_CFG0_DT=
_ID;
d192a4a60b8932 Robert Foss 2021-03-16  389  		writel_relaxed(val, csid->bas=
e + CSID_RDI_CFG0(0));
d192a4a60b8932 Robert Foss 2021-03-16  390  =

d192a4a60b8932 Robert Foss 2021-03-16  391  		/* CSID_TIMESTAMP_STB_POST_IR=
Q */
d192a4a60b8932 Robert Foss 2021-03-16  392  		val =3D 2 << RDI_CFG1_TIMESTA=
MP_STB_SEL;
d192a4a60b8932 Robert Foss 2021-03-16  393  		writel_relaxed(val, csid->bas=
e + CSID_RDI_CFG1(0));
d192a4a60b8932 Robert Foss 2021-03-16  394  =

d192a4a60b8932 Robert Foss 2021-03-16  395  		val =3D 1;
d192a4a60b8932 Robert Foss 2021-03-16  396  		writel_relaxed(val, csid->bas=
e + CSID_RDI_FRM_DROP_PERIOD(0));
d192a4a60b8932 Robert Foss 2021-03-16  397  =

d192a4a60b8932 Robert Foss 2021-03-16  398  		val =3D 0;
d192a4a60b8932 Robert Foss 2021-03-16  399  		writel_relaxed(0, csid->base =
+ CSID_RDI_FRM_DROP_PATTERN(0));
d192a4a60b8932 Robert Foss 2021-03-16  400  =

d192a4a60b8932 Robert Foss 2021-03-16  401  		val =3D 1;
d192a4a60b8932 Robert Foss 2021-03-16  402  		writel_relaxed(val, csid->bas=
e + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(0));
d192a4a60b8932 Robert Foss 2021-03-16  403  =

d192a4a60b8932 Robert Foss 2021-03-16  404  		val =3D 0;
d192a4a60b8932 Robert Foss 2021-03-16  405  		writel_relaxed(val, csid->bas=
e + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(0));
d192a4a60b8932 Robert Foss 2021-03-16  406  =

d192a4a60b8932 Robert Foss 2021-03-16  407  		val =3D 1;
d192a4a60b8932 Robert Foss 2021-03-16  408  		writel_relaxed(val, csid->bas=
e + CSID_RDI_RPP_PIX_DROP_PERIOD(0));
d192a4a60b8932 Robert Foss 2021-03-16  409  =

d192a4a60b8932 Robert Foss 2021-03-16  410  		val =3D 0;
d192a4a60b8932 Robert Foss 2021-03-16  411  		writel_relaxed(val, csid->bas=
e + CSID_RDI_RPP_PIX_DROP_PATTERN(0));
d192a4a60b8932 Robert Foss 2021-03-16  412  =

d192a4a60b8932 Robert Foss 2021-03-16  413  		val =3D 1;
d192a4a60b8932 Robert Foss 2021-03-16  414  		writel_relaxed(val, csid->bas=
e + CSID_RDI_RPP_LINE_DROP_PERIOD(0));
d192a4a60b8932 Robert Foss 2021-03-16  415  =

d192a4a60b8932 Robert Foss 2021-03-16  416  		val =3D 0;
d192a4a60b8932 Robert Foss 2021-03-16  417  		writel_relaxed(val, csid->bas=
e + CSID_RDI_RPP_LINE_DROP_PATTERN(0));
d192a4a60b8932 Robert Foss 2021-03-16  418  =

d192a4a60b8932 Robert Foss 2021-03-16  419  		val =3D 0;
d192a4a60b8932 Robert Foss 2021-03-16  420  		writel_relaxed(val, csid->bas=
e + CSID_RDI_CTRL(0));
d192a4a60b8932 Robert Foss 2021-03-16  421  =

d192a4a60b8932 Robert Foss 2021-03-16  422  		val =3D readl_relaxed(csid->b=
ase + CSID_RDI_CFG0(0));
d192a4a60b8932 Robert Foss 2021-03-16 @423  		val |=3D  1 << RDI_CFG0_ENABL=
E;
d192a4a60b8932 Robert Foss 2021-03-16  424  		writel_relaxed(val, csid->bas=
e + CSID_RDI_CFG0(0));
d192a4a60b8932 Robert Foss 2021-03-16  425  	}
d192a4a60b8932 Robert Foss 2021-03-16  426  =

d192a4a60b8932 Robert Foss 2021-03-16  427  	if (tg->enabled) {
d192a4a60b8932 Robert Foss 2021-03-16  428  		val =3D enable << TPG_CTRL_TE=
ST_EN;
d192a4a60b8932 Robert Foss 2021-03-16  429  		val |=3D 1 << TPG_CTRL_FS_PKT=
_EN;
d192a4a60b8932 Robert Foss 2021-03-16  430  		val |=3D 1 << TPG_CTRL_FE_PKT=
_EN;
d192a4a60b8932 Robert Foss 2021-03-16  431  		val |=3D (lane_cnt - 1) << TP=
G_CTRL_NUM_ACTIVE_LANES;
d192a4a60b8932 Robert Foss 2021-03-16  432  		val |=3D 0x64 << TPG_CTRL_CYC=
LES_BETWEEN_PKTS;
d192a4a60b8932 Robert Foss 2021-03-16  433  		val |=3D 0xA << TPG_CTRL_NUM_=
TRAIL_BYTES;
d192a4a60b8932 Robert Foss 2021-03-16  434  		writel_relaxed(val, csid->bas=
e + CSID_TPG_CTRL);
d192a4a60b8932 Robert Foss 2021-03-16  435  	}
d192a4a60b8932 Robert Foss 2021-03-16  436  =

d192a4a60b8932 Robert Foss 2021-03-16  437  	val =3D (lane_cnt - 1) << CSI2=
_RX_CFG0_NUM_ACTIVE_LANES;
d192a4a60b8932 Robert Foss 2021-03-16  438  	val |=3D csid->phy.lane_assign=
 << CSI2_RX_CFG0_DL0_INPUT_SEL;
d192a4a60b8932 Robert Foss 2021-03-16  439  	val |=3D phy_sel << CSI2_RX_CF=
G0_PHY_NUM_SEL;
d192a4a60b8932 Robert Foss 2021-03-16  440  	writel_relaxed(val, csid->base=
 + CSID_CSI2_RX_CFG0);
d192a4a60b8932 Robert Foss 2021-03-16  441  =

d192a4a60b8932 Robert Foss 2021-03-16  442  	val =3D 1 << CSI2_RX_CFG1_PACK=
ET_ECC_CORRECTION_EN;
d192a4a60b8932 Robert Foss 2021-03-16  443  	val |=3D 1 << CSI2_RX_CFG1_MIS=
R_EN;
d192a4a60b8932 Robert Foss 2021-03-16  444  	writel_relaxed(val, csid->base=
 + CSID_CSI2_RX_CFG1); // csi2_vc_mode_shift_val ?
d192a4a60b8932 Robert Foss 2021-03-16  445  =

d192a4a60b8932 Robert Foss 2021-03-16  446  	/* error irqs start at BIT(11)=
 */
d192a4a60b8932 Robert Foss 2021-03-16  447  	writel_relaxed(~0u, csid->base=
 + CSID_CSI2_RX_IRQ_MASK);
d192a4a60b8932 Robert Foss 2021-03-16  448  =

d192a4a60b8932 Robert Foss 2021-03-16  449  	/* RDI irq */
d192a4a60b8932 Robert Foss 2021-03-16  450  	writel_relaxed(~0u, csid->base=
 + CSID_TOP_IRQ_MASK);
d192a4a60b8932 Robert Foss 2021-03-16  451  =

d192a4a60b8932 Robert Foss 2021-03-16  452  	val =3D 1 << RDI_CTRL_HALT_CMD;
d192a4a60b8932 Robert Foss 2021-03-16  453  	writel_relaxed(val, csid->base=
 + CSID_RDI_CTRL(0));
d192a4a60b8932 Robert Foss 2021-03-16  454  }
d192a4a60b8932 Robert Foss 2021-03-16  455  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4998754426215510218==--

