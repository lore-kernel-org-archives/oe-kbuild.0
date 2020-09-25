Content-Type: multipart/mixed; boundary="===============1780639219188694726=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1019/11173] drivers/net/wireless/ath/ath11k/hal_rx.c:115:17: sparse: sparse: dubious: x & !y
Date: Sat, 26 Sep 2020 01:44:34 +0800
Message-ID: <202009260130.ClyzLAkX%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1780639219188694726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Carl Huang <cjhuang@codeaurora.org>
CC: Kalle Valo <kvalo@codeaurora.org>

Hi Carl,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   20dc779fdefc40bf7dd9736cea01704f29228fae
commit: 322b60ceb0f321b4b9c41717f7306c0dbaf0279b [1019/11173] ath11k: do no=
t depend on ARCH_QCOM for ath11k
:::::: branch date: 7 hours ago
:::::: commit date: 6 weeks ago
config: riscv-randconfig-s032-20200925 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-201-g24bdaac6-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D322b60ceb0f321b4b9c41717f7306c0dbaf0279b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 322b60ceb0f321b4b9c41717f7306c0dbaf0279b
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Driscv =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath11k/hal_rx.c:115:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:117:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:119:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:121:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:123:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:125:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:127:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:129:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:131:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:133:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:135:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:137:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:139:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:141:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:143:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:145:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:147:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:149:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:151:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:153:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:155:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:157:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:163:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:167:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:169:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:173:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:175:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:177:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:179:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:181:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:183:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:185:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:187:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:189:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:209:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:213:17: sparse: sparse: dubious=
: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:215:17: sparse: sparse: dubious=
: x & !y
--
>> drivers/net/wireless/ath/ath11k/dp_tx.c:734:23: sparse: sparse: dubious:=
 x & !y
   drivers/net/wireless/ath/ath11k/dp_tx.c:736:23: sparse: sparse: dubious:=
 x & !y
   drivers/net/wireless/ath/ath11k/dp_tx.c:739:23: sparse: sparse: dubious:=
 x & !y
   drivers/net/wireless/ath/ath11k/dp_tx.c:900:23: sparse: sparse: dubious:=
 x & !y
   drivers/net/wireless/ath/ath11k/dp_tx.c:902:23: sparse: sparse: dubious:=
 x & !y

vim +115 drivers/net/wireless/ath/ath11k/hal_rx.c

d5c65159f289537 Kalle Valo 2019-11-23   94  =

d5c65159f289537 Kalle Valo 2019-11-23   95  static int ath11k_hal_reo_cmd_u=
pdate_rx_queue(struct hal_tlv_hdr *tlv,
d5c65159f289537 Kalle Valo 2019-11-23   96  					      struct ath11k_hal_re=
o_cmd *cmd)
d5c65159f289537 Kalle Valo 2019-11-23   97  {
d5c65159f289537 Kalle Valo 2019-11-23   98  	struct hal_reo_update_rx_queue=
 *desc;
d5c65159f289537 Kalle Valo 2019-11-23   99  =

d5c65159f289537 Kalle Valo 2019-11-23  100  	tlv->tl =3D FIELD_PREP(HAL_TLV=
_HDR_TAG, HAL_REO_UPDATE_RX_REO_QUEUE) |
d5c65159f289537 Kalle Valo 2019-11-23  101  		  FIELD_PREP(HAL_TLV_HDR_LEN,=
 sizeof(*desc));
d5c65159f289537 Kalle Valo 2019-11-23  102  =

d5c65159f289537 Kalle Valo 2019-11-23  103  	desc =3D (struct hal_reo_updat=
e_rx_queue *)tlv->value;
d5c65159f289537 Kalle Valo 2019-11-23  104  	memset(&desc->queue_addr_lo, 0,
d5c65159f289537 Kalle Valo 2019-11-23  105  	       (sizeof(*desc) - sizeof=
(struct hal_reo_cmd_hdr)));
d5c65159f289537 Kalle Valo 2019-11-23  106  =

d5c65159f289537 Kalle Valo 2019-11-23  107  	desc->cmd.info0 &=3D ~HAL_REO_=
CMD_HDR_INFO0_STATUS_REQUIRED;
d5c65159f289537 Kalle Valo 2019-11-23  108  	if (cmd->flag & HAL_REO_CMD_FL=
G_NEED_STATUS)
d5c65159f289537 Kalle Valo 2019-11-23  109  		desc->cmd.info0 |=3D HAL_REO_=
CMD_HDR_INFO0_STATUS_REQUIRED;
d5c65159f289537 Kalle Valo 2019-11-23  110  =

d5c65159f289537 Kalle Valo 2019-11-23  111  	desc->queue_addr_lo =3D cmd->a=
ddr_lo;
d5c65159f289537 Kalle Valo 2019-11-23  112  	desc->info0 =3D
d5c65159f289537 Kalle Valo 2019-11-23  113  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_QUEUE_ADDR_HI,
d5c65159f289537 Kalle Valo 2019-11-23  114  			   cmd->addr_hi) |
d5c65159f289537 Kalle Valo 2019-11-23 @115  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_RX_QUEUE_NUM,
d5c65159f289537 Kalle Valo 2019-11-23  116  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_RX_QUEUE_NUM)) |
d5c65159f289537 Kalle Valo 2019-11-23  117  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_VLD,
d5c65159f289537 Kalle Valo 2019-11-23  118  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_VLD)) |
d5c65159f289537 Kalle Valo 2019-11-23  119  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_ASSOC_LNK_DESC_CNT,
d5c65159f289537 Kalle Valo 2019-11-23  120  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_ALDC)) |
d5c65159f289537 Kalle Valo 2019-11-23  121  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_DIS_DUP_DETECTION,
d5c65159f289537 Kalle Valo 2019-11-23  122  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_DIS_DUP_DETECTION)) |
d5c65159f289537 Kalle Valo 2019-11-23  123  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_SOFT_REORDER_EN,
d5c65159f289537 Kalle Valo 2019-11-23  124  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_SOFT_REORDER_EN)) |
d5c65159f289537 Kalle Valo 2019-11-23  125  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_AC,
d5c65159f289537 Kalle Valo 2019-11-23  126  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_AC)) |
d5c65159f289537 Kalle Valo 2019-11-23  127  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_BAR,
d5c65159f289537 Kalle Valo 2019-11-23  128  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_BAR)) |
d5c65159f289537 Kalle Valo 2019-11-23  129  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_RETRY,
d5c65159f289537 Kalle Valo 2019-11-23  130  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_RETRY)) |
d5c65159f289537 Kalle Valo 2019-11-23  131  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_CHECK_2K_MODE,
d5c65159f289537 Kalle Valo 2019-11-23  132  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_CHECK_2K_MODE)) |
d5c65159f289537 Kalle Valo 2019-11-23  133  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_OOR_MODE,
d5c65159f289537 Kalle Valo 2019-11-23  134  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_OOR_MODE)) |
d5c65159f289537 Kalle Valo 2019-11-23  135  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_BA_WINDOW_SIZE,
d5c65159f289537 Kalle Valo 2019-11-23  136  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_BA_WINDOW_SIZE)) |
d5c65159f289537 Kalle Valo 2019-11-23  137  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_PN_CHECK,
d5c65159f289537 Kalle Valo 2019-11-23  138  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_PN_CHECK)) |
d5c65159f289537 Kalle Valo 2019-11-23  139  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_EVEN_PN,
d5c65159f289537 Kalle Valo 2019-11-23  140  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_EVEN_PN)) |
d5c65159f289537 Kalle Valo 2019-11-23  141  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_UNEVEN_PN,
d5c65159f289537 Kalle Valo 2019-11-23  142  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_UNEVEN_PN)) |
d5c65159f289537 Kalle Valo 2019-11-23  143  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_PN_HANDLE_ENABLE,
d5c65159f289537 Kalle Valo 2019-11-23  144  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_PN_HANDLE_ENABLE)) |
d5c65159f289537 Kalle Valo 2019-11-23  145  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_PN_SIZE,
d5c65159f289537 Kalle Valo 2019-11-23  146  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_PN_SIZE)) |
d5c65159f289537 Kalle Valo 2019-11-23  147  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_IGNORE_AMPDU_FLG,
d5c65159f289537 Kalle Valo 2019-11-23  148  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_IGNORE_AMPDU_FLG)) |
d5c65159f289537 Kalle Valo 2019-11-23  149  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_SVLD,
d5c65159f289537 Kalle Valo 2019-11-23  150  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_SVLD)) |
d5c65159f289537 Kalle Valo 2019-11-23  151  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_SSN,
d5c65159f289537 Kalle Valo 2019-11-23  152  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_SSN)) |
d5c65159f289537 Kalle Valo 2019-11-23  153  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_SEQ_2K_ERR,
d5c65159f289537 Kalle Valo 2019-11-23  154  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_SEQ_2K_ERR)) |
d5c65159f289537 Kalle Valo 2019-11-23  155  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_PN_VALID,
d5c65159f289537 Kalle Valo 2019-11-23  156  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_PN_VALID)) |
d5c65159f289537 Kalle Valo 2019-11-23  157  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO0_UPD_PN,
d5c65159f289537 Kalle Valo 2019-11-23  158  			   !!(cmd->upd0 & HAL_REO_CM=
D_UPD0_PN));
d5c65159f289537 Kalle Valo 2019-11-23  159  =

d5c65159f289537 Kalle Valo 2019-11-23  160  	desc->info1 =3D
d5c65159f289537 Kalle Valo 2019-11-23  161  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO1_RX_QUEUE_NUMBER,
d5c65159f289537 Kalle Valo 2019-11-23  162  			   cmd->rx_queue_num) |
d5c65159f289537 Kalle Valo 2019-11-23  163  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO1_VLD,
d5c65159f289537 Kalle Valo 2019-11-23  164  			   !!(cmd->upd1 & HAL_REO_CM=
D_UPD1_VLD)) |
d5c65159f289537 Kalle Valo 2019-11-23  165  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO1_ASSOC_LNK_DESC_COUNTER,
d5c65159f289537 Kalle Valo 2019-11-23  166  			   FIELD_GET(HAL_REO_CMD_UPD=
1_ALDC, cmd->upd1)) |
d5c65159f289537 Kalle Valo 2019-11-23  167  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO1_DIS_DUP_DETECTION,
d5c65159f289537 Kalle Valo 2019-11-23  168  			   !!(cmd->upd1 & HAL_REO_CM=
D_UPD1_DIS_DUP_DETECTION)) |
d5c65159f289537 Kalle Valo 2019-11-23  169  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO1_SOFT_REORDER_EN,
d5c65159f289537 Kalle Valo 2019-11-23  170  			   !!(cmd->upd1 & HAL_REO_CM=
D_UPD1_SOFT_REORDER_EN)) |
d5c65159f289537 Kalle Valo 2019-11-23  171  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO1_AC,
d5c65159f289537 Kalle Valo 2019-11-23  172  			   FIELD_GET(HAL_REO_CMD_UPD=
1_AC, cmd->upd1)) |
d5c65159f289537 Kalle Valo 2019-11-23  173  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO1_BAR,
d5c65159f289537 Kalle Valo 2019-11-23  174  			   !!(cmd->upd1 & HAL_REO_CM=
D_UPD1_BAR)) |
d5c65159f289537 Kalle Valo 2019-11-23  175  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO1_CHECK_2K_MODE,
d5c65159f289537 Kalle Valo 2019-11-23  176  			   !!(cmd->upd1 & HAL_REO_CM=
D_UPD1_CHECK_2K_MODE)) |
d5c65159f289537 Kalle Valo 2019-11-23  177  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO1_RETRY,
d5c65159f289537 Kalle Valo 2019-11-23  178  			   !!(cmd->upd1 & HAL_REO_CM=
D_UPD1_RETRY)) |
d5c65159f289537 Kalle Valo 2019-11-23  179  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO1_OOR_MODE,
d5c65159f289537 Kalle Valo 2019-11-23  180  			   !!(cmd->upd1 & HAL_REO_CM=
D_UPD1_OOR_MODE)) |
d5c65159f289537 Kalle Valo 2019-11-23  181  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO1_PN_CHECK,
d5c65159f289537 Kalle Valo 2019-11-23  182  			   !!(cmd->upd1 & HAL_REO_CM=
D_UPD1_PN_CHECK)) |
d5c65159f289537 Kalle Valo 2019-11-23  183  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO1_EVEN_PN,
d5c65159f289537 Kalle Valo 2019-11-23  184  			   !!(cmd->upd1 & HAL_REO_CM=
D_UPD1_EVEN_PN)) |
d5c65159f289537 Kalle Valo 2019-11-23  185  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO1_UNEVEN_PN,
d5c65159f289537 Kalle Valo 2019-11-23  186  			   !!(cmd->upd1 & HAL_REO_CM=
D_UPD1_UNEVEN_PN)) |
d5c65159f289537 Kalle Valo 2019-11-23  187  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO1_PN_HANDLE_ENABLE,
d5c65159f289537 Kalle Valo 2019-11-23  188  			   !!(cmd->upd1 & HAL_REO_CM=
D_UPD1_PN_HANDLE_ENABLE)) |
d5c65159f289537 Kalle Valo 2019-11-23  189  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO1_IGNORE_AMPDU_FLG,
d5c65159f289537 Kalle Valo 2019-11-23  190  			   !!(cmd->upd1 & HAL_REO_CM=
D_UPD1_IGNORE_AMPDU_FLG));
d5c65159f289537 Kalle Valo 2019-11-23  191  =

d5c65159f289537 Kalle Valo 2019-11-23  192  	if (cmd->pn_size =3D=3D 24)
d5c65159f289537 Kalle Valo 2019-11-23  193  		cmd->pn_size =3D HAL_RX_REO_Q=
UEUE_PN_SIZE_24;
d5c65159f289537 Kalle Valo 2019-11-23  194  	else if (cmd->pn_size =3D=3D 4=
8)
d5c65159f289537 Kalle Valo 2019-11-23  195  		cmd->pn_size =3D HAL_RX_REO_Q=
UEUE_PN_SIZE_48;
d5c65159f289537 Kalle Valo 2019-11-23  196  	else if (cmd->pn_size =3D=3D 1=
28)
d5c65159f289537 Kalle Valo 2019-11-23  197  		cmd->pn_size =3D HAL_RX_REO_Q=
UEUE_PN_SIZE_128;
d5c65159f289537 Kalle Valo 2019-11-23  198  =

d5c65159f289537 Kalle Valo 2019-11-23  199  	if (cmd->ba_window_size < 1)
d5c65159f289537 Kalle Valo 2019-11-23  200  		cmd->ba_window_size =3D 1;
d5c65159f289537 Kalle Valo 2019-11-23  201  =

d5c65159f289537 Kalle Valo 2019-11-23  202  	if (cmd->ba_window_size =3D=3D=
 1)
d5c65159f289537 Kalle Valo 2019-11-23  203  		cmd->ba_window_size++;
d5c65159f289537 Kalle Valo 2019-11-23  204  =

d5c65159f289537 Kalle Valo 2019-11-23  205  	desc->info2 =3D
d5c65159f289537 Kalle Valo 2019-11-23  206  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO2_BA_WINDOW_SIZE,
d5c65159f289537 Kalle Valo 2019-11-23  207  			   cmd->ba_window_size - 1) |
d5c65159f289537 Kalle Valo 2019-11-23  208  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO2_PN_SIZE, cmd->pn_size) |
d5c65159f289537 Kalle Valo 2019-11-23  209  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO2_SVLD,
d5c65159f289537 Kalle Valo 2019-11-23  210  			   !!(cmd->upd2 & HAL_REO_CM=
D_UPD2_SVLD)) |
d5c65159f289537 Kalle Valo 2019-11-23  211  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO2_SSN,
d5c65159f289537 Kalle Valo 2019-11-23  212  			   FIELD_GET(HAL_REO_CMD_UPD=
2_SSN, cmd->upd2)) |
d5c65159f289537 Kalle Valo 2019-11-23  213  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO2_SEQ_2K_ERR,
d5c65159f289537 Kalle Valo 2019-11-23  214  			   !!(cmd->upd2 & HAL_REO_CM=
D_UPD2_SEQ_2K_ERR)) |
d5c65159f289537 Kalle Valo 2019-11-23  215  		FIELD_PREP(HAL_REO_UPD_RX_QUE=
UE_INFO2_PN_ERR,
d5c65159f289537 Kalle Valo 2019-11-23  216  			   !!(cmd->upd2 & HAL_REO_CM=
D_UPD2_PN_ERR));
d5c65159f289537 Kalle Valo 2019-11-23  217  =

d5c65159f289537 Kalle Valo 2019-11-23  218  	return FIELD_GET(HAL_REO_CMD_H=
DR_INFO0_CMD_NUMBER, desc->cmd.info0);
d5c65159f289537 Kalle Valo 2019-11-23  219  }
d5c65159f289537 Kalle Valo 2019-11-23  220  =


:::::: The code at line 115 was first introduced by commit
:::::: d5c65159f2895379e11ca13f62feabe93278985d ath11k: driver for Qualcomm=
 IEEE 802.11ax devices

:::::: TO: Kalle Valo <kvalo@codeaurora.org>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1780639219188694726==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
CMvdAL8BAA==
--===============1780639219188694726==--

