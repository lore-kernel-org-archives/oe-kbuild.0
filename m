Content-Type: multipart/mixed; boundary="===============6497336583315132765=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 5/5] spi: tegra210-quad: combined sequence mode
Date: Thu, 24 Feb 2022 11:42:58 +0800
Message-ID: <202202241115.MFFaDVz5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6497336583315132765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220222175611.58051-6-kyarlagadda@nvidia.com>
References: <20220222175611.58051-6-kyarlagadda@nvidia.com>
TO: Krishna Yarlagadda <kyarlagadda@nvidia.com>
TO: broonie(a)kernel.org
TO: thierry.reding(a)gmail.com
TO: jonathanh(a)nvidia.com
TO: linux-spi(a)vger.kernel.org
TO: linux-tegra(a)vger.kernel.org
CC: skomatineni(a)nvidia.com
CC: ldewangan(a)nvidia.com
CC: robh+dt(a)kernel.org
CC: devicetree(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: p.zabel(a)pengutronix.de
CC: Krishna Yarlagadda <kyarlagadda@nvidia.com>

Hi Krishna,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on v5.17-rc5 next-20220222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Krishna-Yarlagadda/Tegra-Q=
UAD-SPI-combined-sequence-mode/20220223-015906
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for=
-next
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: riscv-randconfig-m031-20220222 (https://download.01.org/0day-ci/arc=
hive/20220224/202202241115.MFFaDVz5-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/spi/spi-tegra210-quad.c:1148 tegra_qspi_combined_seq_xfer() error: =
uninitialized symbol 'ret'.

Old smatch warnings:
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: in=
consistent indenting

vim +/ret +1148 drivers/spi/spi-tegra210-quad.c

3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1032  =

3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1033  static int tegra_qspi_c=
ombined_seq_xfer(struct tegra_qspi *tqspi,
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1034  					struct spi_message=
 *msg)
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1035  {
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1036  	bool is_first_msg =3D =
true;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1037  	struct spi_transfer *x=
fer;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1038  	struct spi_device *spi=
 =3D msg->spi;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1039  	u8 transfer_phase =3D =
0;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1040  	u32 cmd1 =3D 0, dma_ct=
l =3D 0;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1041  	int ret;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1042  	u32 address_value =3D =
0;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1043  	u32 cmd_config =3D 0, =
addr_config =3D 0;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1044  	u8 cmd_value =3D 0, le=
n =3D 0, val =3D 0;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1045  =

3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1046  	/* Enable Combined seq=
uence mode */
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1047  	val =3D tegra_qspi_rea=
dl(tqspi, QSPI_GLOBAL_CONFIG);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1048  	val |=3D QSPI_CMB_SEQ_=
EN;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1049  	tegra_qspi_writel(tqsp=
i, val, QSPI_GLOBAL_CONFIG);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1050  	/* Process individual =
transfer list */
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1051  	list_for_each_entry(xf=
er, &msg->transfers, transfer_list) {
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1052  		switch (transfer_phas=
e) {
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1053  		case CMD_TRANSFER:
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1054  			/* X1 SDR mode */
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1055  			cmd_config =3D tegra=
_qspi_cmd_config(false, 0,
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1056  							   xfer->len);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1057  			cmd_value =3D *((con=
st u8 *)(xfer->tx_buf));
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1058  			break;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1059  		case ADDR_TRANSFER:
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1060  			len =3D xfer->len;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1061  			/* X1 SDR mode */
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1062  			addr_config =3D tegr=
a_qspi_addr_config(false, 0,
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1063  							     xfer->len);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1064  			address_value =3D *(=
(const u32 *)(xfer->tx_buf));
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1065  			break;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1066  		case DATA_TRANSFER:
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1067  			/* Program Command, =
Address value in register */
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1068  			tegra_qspi_writel(tq=
spi, cmd_value, QSPI_CMB_SEQ_CMD);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1069  			tegra_qspi_writel(tq=
spi, address_value,
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1070  					  QSPI_CMB_SEQ_ADD=
R);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1071  			/* Program Command a=
nd Address config in register */
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1072  			tegra_qspi_writel(tq=
spi, cmd_config,
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1073  					  QSPI_CMB_SEQ_CMD=
_CFG);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1074  			tegra_qspi_writel(tq=
spi, addr_config,
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1075  					  QSPI_CMB_SEQ_ADD=
R_CFG);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1076  =

3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1077  			reinit_completion(&t=
qspi->xfer_completion);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1078  			cmd1 =3D tegra_qspi_=
setup_transfer_one(spi, xfer,
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1079  							     is_first_ms=
g);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1080  			ret =3D tegra_qspi_s=
tart_transfer_one(spi, xfer,
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1081  							    cmd1);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1082  =

3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1083  			if (ret < 0) {
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1084  				dev_err(tqspi->dev,=
 "Failed to start transfer-one: %d\n",
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1085  					ret);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1086  				return ret;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1087  			}
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1088  =

3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1089  			is_first_msg =3D fal=
se;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1090  			ret =3D wait_for_com=
pletion_timeout
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1091  					(&tqspi->xfer_comp=
letion,
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1092  					QSPI_DMA_TIMEOUT);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1093  =

3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1094  			if (WARN_ON(ret =3D=
=3D 0)) {
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1095  				dev_err(tqspi->dev,=
 "QSPI Transfer failed with timeout: %d\n",
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1096  					ret);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1097  				if (tqspi->is_curr_=
dma_xfer &&
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1098  				    (tqspi->cur_dir=
ection & DATA_DIR_TX))
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1099  					dmaengine_terminat=
e_all
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1100  						(tqspi->tx_dma_ch=
an);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1101  =

3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1102  				if (tqspi->is_curr_=
dma_xfer &&
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1103  				    (tqspi->cur_dir=
ection & DATA_DIR_RX))
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1104  					dmaengine_terminat=
e_all
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1105  						(tqspi->rx_dma_ch=
an);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1106  =

3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1107  				/* Abort transfer b=
y resetting pio/dma bit */
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1108  				if (!tqspi->is_curr=
_dma_xfer) {
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1109  					cmd1 =3D tegra_qsp=
i_readl
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1110  							(tqspi,
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1111  							 QSPI_COMMAND1);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1112  					cmd1 &=3D ~QSPI_PI=
O;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1113  					tegra_qspi_writel
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1114  							(tqspi, cmd1,
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1115  							 QSPI_COMMAND1);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1116  				} else {
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1117  					dma_ctl =3D tegra_=
qspi_readl
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1118  							(tqspi,
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1119  							 QSPI_DMA_CTL);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1120  					dma_ctl &=3D ~QSPI=
_DMA_EN;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1121  					tegra_qspi_writel(=
tqspi, dma_ctl,
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1122  							  QSPI_DMA_CTL);
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1123  				}
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1124  =

3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1125  				/* Reset controller=
 if timeout happens */
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1126  				if (device_reset(tq=
spi->dev) < 0)
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1127  					dev_warn_once(tqsp=
i->dev,
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1128  						      "device res=
et failed\n");
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1129  				ret =3D -EIO;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1130  				goto exit;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1131  			}
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1132  =

3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1133  			if (tqspi->tx_status=
 ||  tqspi->rx_status) {
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1134  				dev_err(tqspi->dev,=
 "QSPI Transfer failed\n");
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1135  				tqspi->tx_status =
=3D 0;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1136  				tqspi->rx_status =
=3D 0;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1137  				ret =3D -EIO;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1138  				goto exit;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1139  			}
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1140  		default:
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1141  			goto exit;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1142  		}
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1143  		msg->actual_length +=
=3D xfer->len;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1144  		transfer_phase++;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1145  	}
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1146  =

3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1147  exit:
3b852b330b0b83 Krishna Yarlagadda 2022-02-22 @1148  	msg->status =3D ret;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1149  =

3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1150  	return ret;
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1151  }
3b852b330b0b83 Krishna Yarlagadda 2022-02-22  1152  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6497336583315132765==--

