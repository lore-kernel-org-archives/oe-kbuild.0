Content-Type: multipart/mixed; boundary="===============2743719590850542202=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [frank-w-bpi-r2-4.14:5.19-r3 8/34] drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/include/stp_dbg.h:61:20: error: 'gStpDbgType' defined but not used
Date: Mon, 04 Jul 2022 04:04:21 +0800
Message-ID: <202207040418.7qwKe9II-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2743719590850542202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/include/stp_d=
bg.h:61:20: error: 'gStpDbgType' defined but not used [-Werror=3Dunused-con=
st-variable=3D]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 5.19-r3
head:   5da787e43dff1667c0e847b9d6ca1e5ad83b5ded
commit: 38795507c8e76948a0f37e0234ef667513ba5f46 [8/34] mt6625l: include wi=
fi-code
:::::: branch date: 6 hours ago
:::::: commit date: 8 days ago
config: arm-randconfig-s032-20220703 (https://download.01.org/0day-ci/archi=
ve/20220704/202207040418.7qwKe9II-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/frank-w/BPI-R2-4.14/commit/38795507c8e76948a0f=
37e0234ef667513ba5f46
        git remote add frank-w-bpi-r2-4.14 https://github.com/frank-w/BPI-R=
2-4.14
        git fetch --no-tags frank-w-bpi-r2-4.14 5.19-r3
        git checkout 38795507c8e76948a0f37e0234ef667513ba5f46
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm SHELL=3D/bin/bash arch/arm/ drivers/misc/mediatek/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/misc/mediatek/connectivity/common/conn_soc=
/core/wmt_ctrl.c:49:
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/include/stp=
_dbg.h:61:20: error: 'gStpDbgType' defined but not used [-Werror=3Dunused-c=
onst-variable=3D]
      61 | static char *const gStpDbgType[] =3D {
         |                    ^~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from drivers/misc/mediatek/connectivity/common/conn_soc=
/core/btm_core.c:18:
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/include/stp=
_dbg.h:61:20: error: 'gStpDbgType' defined but not used [-Werror=3Dunused-c=
onst-variable=3D]
      61 | static char *const gStpDbgType[] =3D {
         |                    ^~~~~~~~~~~
   drivers/misc/mediatek/connectivity/common/conn_soc/core/btm_core.c: In f=
unction '_stp_btm_put_dump_to_nl':
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/btm_core.c:139:3=
4: error: array subscript 'STP_PACKET_T {aka struct stp_dbg_pkt}[0]' is par=
tly outside array bounds of 'UINT8[2048]' {aka 'unsigned char[2048]'} [-Wer=
ror=3Darray-bounds]
     139 |                         len =3D pkt->hdr.len;
         |                                  ^~
   drivers/misc/mediatek/connectivity/common/conn_soc/core/btm_core.c:116:2=
2: note: while referencing 'buf'
     116 |         static UINT8 buf[2048];
         |                      ^~~
   drivers/misc/mediatek/connectivity/common/conn_soc/core/btm_core.c: In f=
unction '_stp_btm_handler':
   drivers/misc/mediatek/connectivity/common/conn_soc/core/btm_core.c:257:3=
3: error: array subscript 'STP_PACKET_T {aka struct stp_dbg_pkt}[0]' is par=
tly outside array bounds of 'UINT8[2048]' {aka 'unsigned char[2048]'} [-Wer=
ror=3Darray-bounds]
     257 |                                 memcpy(&tmp[0], pkt->raw, pkt->h=
dr.len);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/misc/mediatek/connectivity/common/conn_soc/core/btm_core.c:239:2=
2: note: while referencing 'buf'
     239 |         static UINT8 buf[2048];
         |                      ^~~
   cc1: all warnings being treated as errors
--
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/stp_dbg.c: =
In function 'stp_dbg_nl_bind':
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/stp_dbg.c:1=
254:15: error: variable 'mydata' set but not used [-Werror=3Dunused-but-set=
-variable]
    1254 |         char *mydata;
         |               ^~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/wmt_dev.c:1=
597:14: error: no previous prototype for 'wmt_dev_is_file_exist' [-Werror=
=3Dmissing-prototypes]
    1597 | MTK_WCN_BOOL wmt_dev_is_file_exist(PUINT8 pFileName)
         |              ^~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/wmt_dev.c:1=
645:14: error: no previous prototype for 'wmt_dev_tra_bitf_update' [-Werror=
=3Dmissing-prototypes]
    1645 | extern INT32 wmt_dev_tra_bitf_update(void)
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/wmt_dev.c: =
In function 'WMT_unlocked_ioctl':
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/wmt_dev.c:1=
985:32: error: variable 'u4Wait' set but not used [-Werror=3Dunused-but-set=
-variable]
    1985 |                         UINT32 u4Wait;
         |                                ^~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/wmt_dev.c:2=
154:42: error: variable 'pTemp' set but not used [-Werror=3Dunused-but-set-=
variable]
    2154 |                         P_WMT_PATCH_INFO pTemp =3D NULL;
         |                                          ^~~~~
   cc1: all warnings being treated as errors
--
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/wmt_exp.c:1=
31:14: error: no previous prototype for '_mtk_wcn_wmt_func_off' [-Werror=3D=
missing-prototypes]
     131 | MTK_WCN_BOOL _mtk_wcn_wmt_func_off(ENUM_WMTDRV_TYPE_T type)
         |              ^~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/wmt_exp.c:1=
53:14: error: no previous prototype for '_mtk_wcn_wmt_func_on' [-Werror=3Dm=
issing-prototypes]
     153 | MTK_WCN_BOOL _mtk_wcn_wmt_func_on(ENUM_WMTDRV_TYPE_T type)
         |              ^~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/wmt_exp.c:1=
89:6: error: no previous prototype for '_mtk_wcn_wmt_therm_ctrl' [-Werror=
=3Dmissing-prototypes]
     189 | INT8 _mtk_wcn_wmt_therm_ctrl(ENUM_WMTTHERM_TYPE_T eType)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/wmt_exp.c:2=
54:22: error: no previous prototype for '_mtk_wcn_wmt_hwver_get' [-Werror=
=3Dmissing-prototypes]
     254 | ENUM_WMTHWVER_TYPE_T _mtk_wcn_wmt_hwver_get(VOID)
         |                      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/wmt_exp.c:2=
69:14: error: no previous prototype for '_mtk_wcn_wmt_dsns_ctrl' [-Werror=
=3Dmissing-prototypes]
     269 | MTK_WCN_BOOL _mtk_wcn_wmt_dsns_ctrl(ENUM_WMTDSNS_TYPE_T eType)
         |              ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/wmt_exp.c:3=
30:7: error: no previous prototype for '_mtk_wcn_wmt_msgcb_reg' [-Werror=3D=
missing-prototypes]
     330 | INT32 _mtk_wcn_wmt_msgcb_reg(ENUM_WMTDRV_TYPE_T eType, PF_WMT_CB=
 pCb)
         |       ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/wmt_exp.c:3=
42:7: error: no previous prototype for '_mtk_wcn_wmt_msgcb_unreg' [-Werror=
=3Dmissing-prototypes]
     342 | INT32 _mtk_wcn_wmt_msgcb_unreg(ENUM_WMTDRV_TYPE_T eType)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/wmt_exp.c:3=
54:7: error: no previous prototype for '_mtk_wcn_stp_wmt_sdio_op_reg' [-Wer=
ror=3Dmissing-prototypes]
     354 | INT32 _mtk_wcn_stp_wmt_sdio_op_reg(PF_WMT_SDIO_PSOP own_cb)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/wmt_exp.c:3=
67:7: error: no previous prototype for '_mtk_wcn_stp_wmt_sdio_host_awake' [=
-Werror=3Dmissing-prototypes]
     367 | INT32 _mtk_wcn_stp_wmt_sdio_host_awake(VOID)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/wmt_exp.c:3=
80:14: error: no previous prototype for '_mtk_wcn_wmt_assert' [-Werror=3Dmi=
ssing-prototypes]
     380 | MTK_WCN_BOOL _mtk_wcn_wmt_assert(ENUM_WMTDRV_TYPE_T type, UINT32=
 reason)
         |              ^~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/wmt_exp.c:6=
08:6: error: no previous prototype for 'mtk_wcn_wmt_set_wifi_ver' [-Werror=
=3Dmissing-prototypes]
     608 | VOID mtk_wcn_wmt_set_wifi_ver(UINT32 Value)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/osal.c: In =
function 'osal_snprintf':
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/osal.c:168:=
9: error: function 'osal_snprintf' might be a candidate for 'gnu_printf' fo=
rmat attribute [-Werror=3Dsuggest-attribute=3Dformat]
     168 |         iRet =3D vsnprintf(buf, len, fmt, args);
         |         ^~~~
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/osal.c: In =
function 'osal_err_print':
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/osal.c:180:=
9: error: function 'osal_err_print' might be a candidate for 'gnu_printf' f=
ormat attribute [-Werror=3Dsuggest-attribute=3Dformat]
     180 |         vsnprintf(tempString, DBG_LOG_STR_SIZE, str, args);
         |         ^~~~~~~~~
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/osal.c: In =
function 'osal_dbg_print':
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/osal.c:194:=
9: error: function 'osal_dbg_print' might be a candidate for 'gnu_printf' f=
ormat attribute [-Werror=3Dsuggest-attribute=3Dformat]
     194 |         vsnprintf(tempString, DBG_LOG_STR_SIZE, str, args);
         |         ^~~~~~~~~
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/osal.c: In =
function 'osal_warn_print':
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/osal.c:208:=
9: error: function 'osal_warn_print' might be a candidate for 'gnu_printf' =
format attribute [-Werror=3Dsuggest-attribute=3Dformat]
     208 |         vsnprintf(tempString, DBG_LOG_STR_SIZE, str, args);
         |         ^~~~~~~~~
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/osal.c: In =
function 'osal_sprintf':
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/osal.c:251:=
9: error: function 'osal_sprintf' might be a candidate for 'gnu_printf' for=
mat attribute [-Werror=3Dsuggest-attribute=3Dformat]
     251 |         iRet =3D vsnprintf(str, DBG_LOG_STR_SIZE, format, args);
         |         ^~~~
   cc1: all warnings being treated as errors
--
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/bgw_desense=
.c: In function 'nl_data_handler':
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/bgw_desense=
.c:105:13: error: variable 'len' set but not used [-Werror=3Dunused-but-set=
-variable]
     105 |         int len;
         |             ^~~
   cc1: all warnings being treated as errors
--
>> drivers/misc/mediatek/connectivity/common/conn_soc/mt7623/wmt_plat_alps.=
c:255:13: error: no previous prototype for 'wmt_plat_bgf_irq_isr' [-Werror=
=3Dmissing-prototypes]
     255 | irqreturn_t wmt_plat_bgf_irq_isr(INT32 i, VOID *arg)
         |             ^~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/mt7623/wmt_plat_alps.=
c:296:8: error: no previous prototype for 'wmt_plat_soc_co_clock_flag_get' =
[-Werror=3Dmissing-prototypes]
     296 | UINT32 wmt_plat_soc_co_clock_flag_get(VOID)
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/misc/mediatek/connectivity/common/conn_soc=
/mt7623/wmt_plat_alps.c:39:
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/include/stp=
_dbg.h:61:20: error: 'gStpDbgType' defined but not used [-Werror=3Dunused-c=
onst-variable=3D]
      61 | static char *const gStpDbgType[] =3D {
         |                    ^~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/misc/mediatek/connectivity/common/conn_soc/mt7623/mtk_wcn_consys=
_hw.c:191:6: error: no previous prototype for 'mtk_wcn_consys_power_on' [-W=
error=3Dmissing-prototypes]
     191 | VOID mtk_wcn_consys_power_on(VOID)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/mt7623/mtk_wcn_consys=
_hw.c:207:6: error: no previous prototype for 'mtk_wcn_consys_power_off' [-=
Werror=3Dmissing-prototypes]
     207 | VOID mtk_wcn_consys_power_off(VOID)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/mt7623/mtk_wcn_consys=
_hw.c:224:7: error: no previous prototype for 'mtk_wcn_consys_hw_reg_ctrl' =
[-Werror=3Dmissing-prototypes]
     224 | INT32 mtk_wcn_consys_hw_reg_ctrl(UINT32 on, UINT32 co_clock_type)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/mt7623/mtk_wcn_consys=
_hw.c:335:7: error: no previous prototype for 'mtk_wcn_consys_hw_gpio_ctrl'=
 [-Werror=3Dmissing-prototypes]
     335 | INT32 mtk_wcn_consys_hw_gpio_ctrl(UINT32 on)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/mt7623/mtk_wcn_consys=
_hw.c:539:7: error: no previous prototype for 'mtk_wcn_consys_hw_restore' [=
-Werror=3Dmissing-prototypes]
     539 | INT32 mtk_wcn_consys_hw_restore(struct device *device)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/mt7623/mtk_wcn_consys=
_hw.c:592:5: error: no previous prototype for 'reserve_memory_consys_fn' [-=
Werror=3Dmissing-prototypes]
     592 | int reserve_memory_consys_fn(struct reserved_mem *rmem)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/common/conn_soc/mt7623/mtk_wcn_consys=
_hw.c: In function 'mtk_wcn_consys_get_pinctrl':
>> drivers/misc/mediatek/connectivity/common/conn_soc/mt7623/mtk_wcn_consys=
_hw.c:713:17: error: old-style function definition [-Werror=3Dold-style-def=
inition]
     713 | struct pinctrl *mtk_wcn_consys_get_pinctrl()
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c:272:5: error: no previous prototype for 'hci_recv_fragment' [-Werror=
=3Dmissing-prototypes]
     272 | int hci_recv_fragment(struct hci_dev *hdev, int type, void *data=
, int count)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c:294:1: error: no previous prototype for 'hex_dump' [-Werror=3Dmissing-=
prototypes]
     294 | hex_dump(char *prefix, char *p, int len)
         | ^~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c:457:5: error: no previous prototype for 'mtk_bt_hci_init' [-Werror=3Dm=
issing-prototypes]
     457 | int mtk_bt_hci_init(void)
         |     ^~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c:529:6: error: no previous prototype for 'BT_event_cb' [-Werror=3Dmissi=
ng-prototypes]
     529 | VOID BT_event_cb(VOID)
         |      ^~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c:542:14: error: no previous prototype for 'BT_poll' [-Werror=3Dmissing-=
prototypes]
     542 | unsigned int BT_poll(struct file *filp, poll_table *wait)
         |              ^~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c:568:9: error: no previous prototype for 'BT_write' [-Werror=3Dmissing-=
prototypes]
     568 | ssize_t BT_write(struct file *filp, const char __user *buf, size=
_t count, loff_t *f_pos)
         |         ^~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c:622:9: error: no previous prototype for 'BT_read' [-Werror=3Dmissing-p=
rototypes]
     622 | ssize_t BT_read(struct file *filp, char __user *buf, size_t coun=
t, loff_t *f_pos)
         |         ^~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c:683:6: error: no previous prototype for 'BT_unlocked_ioctl' [-Werror=
=3Dmissing-prototypes]
     683 | long BT_unlocked_ioctl(struct file *filp, unsigned int cmd, unsi=
gned long arg)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c:728:6: error: no previous prototype for 'BT_compat_ioctl' [-Werror=3Dm=
issing-prototypes]
     728 | long BT_compat_ioctl(struct file *filp, unsigned int cmd, unsign=
ed long arg)
         |      ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/wmt_chrdev_=
wifi.c:101:6: error: no previous prototype for 'register_set_p2p_mode_handl=
er' [-Werror=3Dmissing-prototypes]
     101 | VOID register_set_p2p_mode_handler(set_p2p_mode handler)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/wmt_chrdev_=
wifi.c:159:6: error: no previous prototype for 'register_set_dbg_level_hand=
ler' [-Werror=3Dmissing-prototypes]
     159 | VOID register_set_dbg_level_handler(set_dbg_level handler)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/wmt_chrdev_=
wifi.c:211:7: error: no previous prototype for 'wifi_reset_start' [-Werror=
=3Dmissing-prototypes]
     211 | INT32 wifi_reset_start(VOID)
         |       ^~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/wmt_chrdev_=
wifi.c:248:7: error: no previous prototype for 'wifi_reset_end' [-Werror=3D=
missing-prototypes]
     248 | INT32 wifi_reset_end(ENUM_RESET_STATUS_T status)
         |       ^~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/wmt_chrdev_=
wifi.c:336:9: error: no previous prototype for 'WIFI_write' [-Werror=3Dmiss=
ing-prototypes]
     336 | ssize_t WIFI_write(struct file *filp, const char __user *buf, si=
ze_t count, loff_t *f_pos)
         |         ^~~~~~~~~~
   cc1: all warnings being treated as errors


sparse warnings: (new ones prefixed by >>)
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_func.c:118:1=
8: sparse: sparse: symbol 'eediPinOhRegs' was not declared. Should it be st=
atic?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_func.c:146:1=
8: sparse: sparse: symbol 'eediPinOlRegs' was not declared. Should it be st=
atic?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_func.c:169:1=
8: sparse: sparse: symbol 'eedoPinOhRegs' was not declared. Should it be st=
atic?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_func.c:192:1=
8: sparse: sparse: symbol 'eedoPinOlRegs' was not declared. Should it be st=
atic?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_func.c:216:1=
8: sparse: sparse: symbol 'gsyncPinOnRegs' was not declared. Should it be s=
tatic?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_func.c:225:1=
8: sparse: sparse: symbol 'gsyncPinOffRegs' was not declared. Should it be =
static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_func.c:234:1=
4: sparse: sparse: symbol 'gCmbPinCtrl' was not declared. Should it be stat=
ic?
--
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_ic_soc.c:175=
2:60: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/mtk_wcn_stub_alp=
s.c:34:5: sparse: sparse: symbol 'gCmbStubLogLevel' was not declared. Shoul=
d it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/mtk_wcn_stub_alp=
s.c:86:20: sparse: sparse: symbol 'g_sdio_1v_autok_wk' was not declared. Sh=
ould it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/mtk_wcn_stub_alp=
s.c:88:5: sparse: sparse: symbol 'gConnectivityChipId' was not declared. Sh=
ould it be static?
--
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:36=
:23: sparse: sparse: symbol 'mtk_wcn_stp_send_data_f' was not declared. Sho=
uld it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:37=
:23: sparse: sparse: symbol 'mtk_wcn_stp_send_data_raw_f' was not declared.=
 Should it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:38=
:25: sparse: sparse: symbol 'mtk_wcn_stp_parser_data_f' was not declared. S=
hould it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:39=
:23: sparse: sparse: symbol 'mtk_wcn_stp_receive_data_f' was not declared. =
Should it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:40=
:26: sparse: sparse: symbol 'mtk_wcn_stp_is_rxqueue_empty_f' was not declar=
ed. Should it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:41=
:20: sparse: sparse: symbol 'mtk_wcn_stp_is_ready_f' was not declared. Shou=
ld it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:42=
:23: sparse: sparse: symbol 'mtk_wcn_stp_set_bluez_f' was not declared. Sho=
uld it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:43=
:23: sparse: sparse: symbol 'mtk_wcn_stp_if_tx_f' was not declared. Should =
it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:44=
:23: sparse: sparse: symbol 'mtk_wcn_stp_if_rx_f' was not declared. Should =
it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:45=
:26: sparse: sparse: symbol 'mtk_wcn_stp_reg_event_cb_f' was not declared. =
Should it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:46=
:29: sparse: sparse: symbol 'mtk_wcn_stp_reg_tx_event_cb_f' was not declare=
d. Should it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:47=
:32: sparse: sparse: symbol 'mtk_wcn_stp_coredump_start_get_f' was not decl=
ared. Should it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:50=
:23: sparse: sparse: symbol 'mtk_wcn_wmt_func_on_f' was not declared. Shoul=
d it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:51=
:23: sparse: sparse: symbol 'mtk_wcn_wmt_func_off_f' was not declared. Shou=
ld it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:52=
:24: sparse: sparse: symbol 'mtk_wcn_wmt_therm_ctrl_f' was not declared. Sh=
ould it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:53=
:23: sparse: sparse: symbol 'mtk_wcn_wmt_hwver_get_f' was not declared. Sho=
uld it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:54=
:23: sparse: sparse: symbol 'mtk_wcn_wmt_dsns_ctrl_f' was not declared. Sho=
uld it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:55=
:23: sparse: sparse: symbol 'mtk_wcn_wmt_msgcb_reg_f' was not declared. Sho=
uld it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:56=
:25: sparse: sparse: symbol 'mtk_wcn_wmt_msgcb_unreg_f' was not declared. S=
hould it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:57=
:25: sparse: sparse: symbol 'mtk_wcn_wmt_sdio_op_reg_f' was not declared. S=
hould it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:58=
:29: sparse: sparse: symbol 'mtk_wcn_wmt_sdio_host_awake_f' was not declare=
d. Should it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:59=
:20: sparse: sparse: symbol 'mtk_wcn_wmt_assert_f' was not declared. Should=
 it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:60=
:28: sparse: sparse: symbol 'mtk_wcn_wmt_assert_timeout_f' was not declared=
. Should it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:61=
:25: sparse: sparse: symbol 'mtk_wcn_wmt_ic_info_get_f' was not declared. S=
hould it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_stp_exp.c:62=
:22: sparse: sparse: symbol 'mtk_wcn_wmt_psm_ctrl_f' was not declared. Shou=
ld it be static?
--
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/psm_core.c:20:7:=
 sparse: sparse: symbol 'gPsmDbgLevel' was not declared. Should it be stati=
c?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/psm_core.c:21:14=
: sparse: sparse: symbol 'stp_psm_i' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/psm_core.c:24:18=
: sparse: sparse: symbol 'g_stp_psm_dbg' was not declared. Should it be sta=
tic?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/psm_core.c:27:23=
: sparse: sparse: symbol 'g_stp_psm_opid_dbg' was not declared. Should it b=
e static?
--
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/stp_exp.c:7=
2:73: sparse: sparse: Using plain integer as NULL pointer
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/stp_exp.c:7=
3:76: sparse: sparse: Using plain integer as NULL pointer
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/stp_exp.c:8=
7:26: sparse: sparse: Using plain integer as NULL pointer
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/stp_exp.c:1=
09:92: sparse: sparse: Using plain integer as NULL pointer
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/stp_exp.c:1=
39:49: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_core.c:52:16=
: sparse: sparse: symbol 'gpWmtFuncOps' was not declared. Should it be stat=
ic?
>> drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_core.c:1210:=
75: sparse: sparse: Using plain integer as NULL pointer
   drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_core.c:1271:=
75: sparse: sparse: Using plain integer as NULL pointer
   drivers/misc/mediatek/connectivity/common/conn_soc/core/wmt_core.c:1327:=
75: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/stp_btif.c:=
60:15: sparse: sparse: symbol 'stpBtifId' was not declared. Should it be st=
atic?
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/stp_btif.c:=
61:15: sparse: sparse: symbol 'pBtifRef' was not declared. Should it be sta=
tic?

vim +/gStpDbgType +61 drivers/misc/mediatek/connectivity/common/conn_soc/li=
nux/pri/include/stp_dbg.h

762944ce0113d0 Frank Wunderlich 2022-06-05  60  =

762944ce0113d0 Frank Wunderlich 2022-06-05 @61  static char *const gStpDbgT=
ype[] =3D {
762944ce0113d0 Frank Wunderlich 2022-06-05  62  	"< BT>",
762944ce0113d0 Frank Wunderlich 2022-06-05  63  	"< FM>",
762944ce0113d0 Frank Wunderlich 2022-06-05  64  	"<GPS>",
762944ce0113d0 Frank Wunderlich 2022-06-05  65  	"<WiFi>",
762944ce0113d0 Frank Wunderlich 2022-06-05  66  	"<WMT>",
762944ce0113d0 Frank Wunderlich 2022-06-05  67  	"<STP>",
762944ce0113d0 Frank Wunderlich 2022-06-05  68  	"<DBG>",
762944ce0113d0 Frank Wunderlich 2022-06-05  69  	"<WAKEINT>",
762944ce0113d0 Frank Wunderlich 2022-06-05  70  	"<UNKNOWN>"
762944ce0113d0 Frank Wunderlich 2022-06-05  71  };
762944ce0113d0 Frank Wunderlich 2022-06-05  72  =


:::::: The code at line 61 was first introduced by commit
:::::: 762944ce0113d06981bb5cb2b4fd151ccbcc82ab mt6625l: add driver from 5.=
18

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2743719590850542202==--

