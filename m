Content-Type: multipart/mixed; boundary="===============4592239102277596919=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [steev:lenovo-x13s-next-20220722 8/142] drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:12:9: sparse: this was the original definition
Date: Thu, 28 Jul 2022 00:17:51 +0800
Message-ID: <202207280019.VGbowqSv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4592239102277596919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:12:9: sparse: this was=
 the original definition"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bjorn Andersson <bjorn.andersson@linaro.org>
CC: Steev Klimaszewski <steev@kali.org>

tree:   https://github.com/steev/linux lenovo-x13s-next-20220722
head:   3908c7f1753c0530f24f55cc23b6c6a7cd0fd3fe
commit: 5269d6cef9825d8d40bb77450e9a4cd5b4d3475f [8/142] phy: qcom-qmp: Add=
 sc8280xp USB/DP combo phys
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-s053-20220727 (https://download.01.org/0day-ci/arc=
hive/20220728/202207280019.VGbowqSv-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/steev/linux/commit/5269d6cef9825d8d40bb77450e9=
a4cd5b4d3475f
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev lenovo-x13s-next-20220722
        git checkout 5269d6cef9825d8d40bb77450e9a4cd5b4d3475f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dr=
iscv SHELL=3D/bin/bash drivers/phy/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:189:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_CLKBUF_ENABLE redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
>> drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:12:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:190:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_TX_EMP_POST1_LVL redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:13:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:191:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_TX_DRV_LVL redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:15:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:192:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_RESET_TSYNC_EN redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:17:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:193:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_PRE_STALL_LDO_BOOST_EN redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:18:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:194:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_TX_BAND redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:19:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:195:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_INTERFACE_SELECT redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:21:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:196:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_RES_CODE_LANE_TX redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:23:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:197:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_RES_CODE_LANE_RX redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:24:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:198:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:25:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:199:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:26:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:200:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_TRANSCEIVER_BIAS_EN redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:31:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:201:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_HIGHZ_DRVR_EN redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:32:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:202:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_TX_POL_INV redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:33:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:203:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_PARRATE_REC_DETECT_IDLE_EN redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:34:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:204:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_LANE_MODE_1 redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:43:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:205:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_LANE_MODE_2 redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:44:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:206:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_RCV_DETECT_LVL_2 redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:49:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:207:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_TRAN_DRVR_EMP_EN redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:56:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:208:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_TX_INTERFACE_MODE redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:57:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:209:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND0_1 redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:64:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:210:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND0_1 redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:65:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:211:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_PWM_GEAR_3_DIVIDER_BAND0_1 redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:66:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:212:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_PWM_GEAR_4_DIVIDER_BAND0_1 redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:67:9: sparse: this w=
as the original definition
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file:
   drivers/phy/qualcomm/phy-qcom-qmp.h:213:9: sparse: sparse: preprocessor =
token QSERDES_V4_TX_VMODE_CTRL1 redefined
   drivers/phy/qualcomm/phy-qcom-edp.c: note: in included file (through dri=
vers/phy/qualcomm/phy-qcom-qmp.h):
   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h:68:9: sparse: this w=
as the original definition

vim +12 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h

32d2cf532515beb Dmitry Baryshkov 2022-07-05    8  =

32d2cf532515beb Dmitry Baryshkov 2022-07-05    9  /* Only for QMP V4 PHY - =
TX registers */
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   10  #define QSERDES_V4_TX_BIS=
T_MODE_LANENO			0x000
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   11  #define QSERDES_V4_TX_BIS=
T_INVERT			0x004
32d2cf532515beb Dmitry Baryshkov 2022-07-05  @12  #define QSERDES_V4_TX_CLK=
BUF_ENABLE			0x008
32d2cf532515beb Dmitry Baryshkov 2022-07-05   13  #define QSERDES_V4_TX_TX_=
EMP_POST1_LVL			0x00c
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   14  #define QSERDES_V4_TX_TX_=
IDLE_LVL_LARGE_AMP		0x010
32d2cf532515beb Dmitry Baryshkov 2022-07-05   15  #define QSERDES_V4_TX_TX_=
DRV_LVL			0x014
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   16  #define QSERDES_V4_TX_TX_=
DRV_LVL_OFFSET			0x018
32d2cf532515beb Dmitry Baryshkov 2022-07-05   17  #define QSERDES_V4_TX_RES=
ET_TSYNC_EN			0x01c
32d2cf532515beb Dmitry Baryshkov 2022-07-05   18  #define QSERDES_V4_TX_PRE=
_STALL_LDO_BOOST_EN		0x020
32d2cf532515beb Dmitry Baryshkov 2022-07-05   19  #define QSERDES_V4_TX_TX_=
BAND				0x024
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   20  #define QSERDES_V4_TX_SLE=
W_CNTL				0x028
32d2cf532515beb Dmitry Baryshkov 2022-07-05   21  #define QSERDES_V4_TX_INT=
ERFACE_SELECT			0x02c
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   22  #define QSERDES_V4_TX_LPB=
_EN				0x030
32d2cf532515beb Dmitry Baryshkov 2022-07-05   23  #define QSERDES_V4_TX_RES=
_CODE_LANE_TX			0x034
32d2cf532515beb Dmitry Baryshkov 2022-07-05   24  #define QSERDES_V4_TX_RES=
_CODE_LANE_RX			0x038
32d2cf532515beb Dmitry Baryshkov 2022-07-05   25  #define QSERDES_V4_TX_RES=
_CODE_LANE_OFFSET_TX		0x03c
32d2cf532515beb Dmitry Baryshkov 2022-07-05   26  #define QSERDES_V4_TX_RES=
_CODE_LANE_OFFSET_RX		0x040
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   27  #define QSERDES_V4_TX_PER=
L_LENGTH1			0x044
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   28  #define QSERDES_V4_TX_PER=
L_LENGTH2			0x048
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   29  #define QSERDES_V4_TX_SER=
DES_BYP_EN_OUT			0x04c
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   30  #define QSERDES_V4_TX_DEB=
UG_BUS_SEL			0x050
32d2cf532515beb Dmitry Baryshkov 2022-07-05   31  #define QSERDES_V4_TX_TRA=
NSCEIVER_BIAS_EN		0x054
32d2cf532515beb Dmitry Baryshkov 2022-07-05   32  #define QSERDES_V4_TX_HIG=
HZ_DRVR_EN			0x058
32d2cf532515beb Dmitry Baryshkov 2022-07-05   33  #define QSERDES_V4_TX_TX_=
POL_INV			0x05c
32d2cf532515beb Dmitry Baryshkov 2022-07-05   34  #define QSERDES_V4_TX_PAR=
RATE_REC_DETECT_IDLE_EN	0x060
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   35  #define QSERDES_V4_TX_BIS=
T_PATTERN1			0x064
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   36  #define QSERDES_V4_TX_BIS=
T_PATTERN2			0x068
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   37  #define QSERDES_V4_TX_BIS=
T_PATTERN3			0x06c
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   38  #define QSERDES_V4_TX_BIS=
T_PATTERN4			0x070
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   39  #define QSERDES_V4_TX_BIS=
T_PATTERN5			0x074
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   40  #define QSERDES_V4_TX_BIS=
T_PATTERN6			0x078
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   41  #define QSERDES_V4_TX_BIS=
T_PATTERN7			0x07c
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   42  #define QSERDES_V4_TX_BIS=
T_PATTERN8			0x080
32d2cf532515beb Dmitry Baryshkov 2022-07-05   43  #define QSERDES_V4_TX_LAN=
E_MODE_1			0x084
32d2cf532515beb Dmitry Baryshkov 2022-07-05   44  #define QSERDES_V4_TX_LAN=
E_MODE_2			0x088
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   45  #define QSERDES_V4_TX_LAN=
E_MODE_3			0x08c
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   46  #define QSERDES_V4_TX_ATB=
_SEL1				0x090
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   47  #define QSERDES_V4_TX_ATB=
_SEL2				0x094
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   48  #define QSERDES_V4_TX_RCV=
_DETECT_LVL			0x098
32d2cf532515beb Dmitry Baryshkov 2022-07-05   49  #define QSERDES_V4_TX_RCV=
_DETECT_LVL_2			0x09c
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   50  #define QSERDES_V4_TX_PRB=
S_SEED1			0x0a0
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   51  #define QSERDES_V4_TX_PRB=
S_SEED2			0x0a4
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   52  #define QSERDES_V4_TX_PRB=
S_SEED3			0x0a8
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   53  #define QSERDES_V4_TX_PRB=
S_SEED4			0x0ac
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   54  #define QSERDES_V4_TX_RES=
ET_GEN				0x0b0
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   55  #define QSERDES_V4_TX_RES=
ET_GEN_MUXES			0x0b4
32d2cf532515beb Dmitry Baryshkov 2022-07-05   56  #define QSERDES_V4_TX_TRA=
N_DRVR_EMP_EN			0x0b8
32d2cf532515beb Dmitry Baryshkov 2022-07-05   57  #define QSERDES_V4_TX_TX_=
INTERFACE_MODE			0x0bc
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   58  #define QSERDES_V4_TX_PWM=
_CTRL				0x0c0
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   59  #define QSERDES_V4_TX_PWM=
_ENCODED_OR_DATA		0x0c4
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   60  #define QSERDES_V4_TX_PWM=
_GEAR_1_DIVIDER_BAND2		0x0c8
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   61  #define QSERDES_V4_TX_PWM=
_GEAR_2_DIVIDER_BAND2		0x0cc
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   62  #define QSERDES_V4_TX_PWM=
_GEAR_3_DIVIDER_BAND2		0x0d0
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   63  #define QSERDES_V4_TX_PWM=
_GEAR_4_DIVIDER_BAND2		0x0d4
32d2cf532515beb Dmitry Baryshkov 2022-07-05   64  #define QSERDES_V4_TX_PWM=
_GEAR_1_DIVIDER_BAND0_1	0x0d8
32d2cf532515beb Dmitry Baryshkov 2022-07-05   65  #define QSERDES_V4_TX_PWM=
_GEAR_2_DIVIDER_BAND0_1	0x0dc
32d2cf532515beb Dmitry Baryshkov 2022-07-05   66  #define QSERDES_V4_TX_PWM=
_GEAR_3_DIVIDER_BAND0_1	0x0e0
32d2cf532515beb Dmitry Baryshkov 2022-07-05   67  #define QSERDES_V4_TX_PWM=
_GEAR_4_DIVIDER_BAND0_1	0x0e4
32d2cf532515beb Dmitry Baryshkov 2022-07-05   68  #define QSERDES_V4_TX_VMO=
DE_CTRL1			0x0e8
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   69  #define QSERDES_V4_TX_ALO=
G_OBSV_BUS_CTRL_1		0x0ec
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   70  #define QSERDES_V4_TX_BIS=
T_STATUS			0x0f0
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   71  #define QSERDES_V4_TX_BIS=
T_ERROR_COUNT1			0x0f4
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   72  #define QSERDES_V4_TX_BIS=
T_ERROR_COUNT2			0x0f8
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   73  #define QSERDES_V4_TX_ALO=
G_OBSV_BUS_STATUS_1		0x0fc
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   74  #define QSERDES_V4_TX_LAN=
E_DIG_CONFIG			0x100
32d2cf532515beb Dmitry Baryshkov 2022-07-05   75  #define QSERDES_V4_TX_PI_=
QEC_CTRL			0x104
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   76  #define QSERDES_V4_TX_PRE=
_EMPH				0x108
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   77  #define QSERDES_V4_TX_SW_=
RESET				0x10c
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   78  #define QSERDES_V4_TX_DCC=
_OFFSET			0x110
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   79  #define QSERDES_V4_TX_DIG=
_BKUP_CTRL			0x114
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   80  #define QSERDES_V4_TX_DEB=
UG_BUS0			0x118
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   81  #define QSERDES_V4_TX_DEB=
UG_BUS1			0x11c
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   82  #define QSERDES_V4_TX_DEB=
UG_BUS2			0x120
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   83  #define QSERDES_V4_TX_DEB=
UG_BUS3			0x124
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   84  #define QSERDES_V4_TX_REA=
D_EQCODE			0x128
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   85  #define QSERDES_V4_TX_REA=
D_OFFSETCODE			0x12c
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   86  #define QSERDES_V4_TX_IA_=
ERROR_COUNTER_LOW		0x130
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   87  #define QSERDES_V4_TX_IA_=
ERROR_COUNTER_HIGH		0x134
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   88  #define QSERDES_V4_TX_VGA=
_READ_CODE			0x138
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   89  #define QSERDES_V4_TX_VTH=
_READ_CODE			0x13c
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   90  #define QSERDES_V4_TX_DFE=
_TAP1_READ_CODE		0x140
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   91  #define QSERDES_V4_TX_DFE=
_TAP2_READ_CODE		0x144
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   92  #define QSERDES_V4_TX_IDA=
C_STATUS_I			0x148
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   93  #define QSERDES_V4_TX_IDA=
C_STATUS_IBAR			0x14c
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   94  #define QSERDES_V4_TX_IDA=
C_STATUS_Q			0x150
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   95  #define QSERDES_V4_TX_IDA=
C_STATUS_QBAR			0x154
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   96  #define QSERDES_V4_TX_IDA=
C_STATUS_A			0x158
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   97  #define QSERDES_V4_TX_IDA=
C_STATUS_ABAR			0x15c
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   98  #define QSERDES_V4_TX_IDA=
C_STATUS_SM_ON			0x160
1195c1dabf41643 Dmitry Baryshkov 2022-07-05   99  #define QSERDES_V4_TX_IDA=
C_STATUS_CAL_DONE		0x164
1195c1dabf41643 Dmitry Baryshkov 2022-07-05  100  #define QSERDES_V4_TX_IDA=
C_STATUS_SIGNERROR		0x168
1195c1dabf41643 Dmitry Baryshkov 2022-07-05  101  #define QSERDES_V4_TX_DCC=
_CAL_STATUS			0x16c
32d2cf532515beb Dmitry Baryshkov 2022-07-05  102  =


:::::: The code at line 12 was first introduced by commit
:::::: 32d2cf532515beb5c2c34a1cbcf9c34d0fb040a8 phy: qcom-qmp: move QSERDES=
 V4 registers to separate headers

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4592239102277596919==--

