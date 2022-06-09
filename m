Content-Type: multipart/mixed; boundary="===============9074818005275327989=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [frank-w-bpi-r2-4.14:5.19-rc 8/11] drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/include/stp_dbg.h:61:20: error: 'gStpDbgType' defined but not used
Date: Thu, 09 Jun 2022 20:07:58 +0800
Message-ID: <202206092049.hod40byN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9074818005275327989==
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

tree:   https://github.com/frank-w/BPI-R2-4.14 5.19-rc
head:   fa34f89f09ed26613abc1cfe06895f259bfb66a0
commit: 80e5f963a4f1916e2438b4df73b922da7b4a150b [8/11] mt6625l: include wi=
fi-code
:::::: branch date: 22 hours ago
:::::: commit date: 3 days ago
config: arm-randconfig-s032-20220607 (https://download.01.org/0day-ci/archi=
ve/20220609/202206092049.hod40byN-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-26-gb3cf30ba-dirty
        # https://github.com/frank-w/BPI-R2-4.14/commit/80e5f963a4f1916e243=
8b4df73b922da7b4a150b
        git remote add frank-w-bpi-r2-4.14 https://github.com/frank-w/BPI-R=
2-4.14
        git fetch --no-tags frank-w-bpi-r2-4.14 5.19-rc
        git checkout 80e5f963a4f1916e2438b4df73b922da7b4a150b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm SHELL=3D/bin/bash

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
>> drivers/misc/mediatek/connectivity/common/common_detect/wmt_detect_pwr.c=
:51:5: error: no previous prototype for '_wmt_detect_output_low' [-Werror=
=3Dmissing-prototypes]
      51 | int _wmt_detect_output_low(unsigned int id)
         |     ^~~~~~~~~~~~~~~~~~~~~~
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
>> cc1: error: drivers/misc/mediatek/mach/mt7623/include/mach: No such file=
 or directory [-Werror=3Dmissing-include-dirs]
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
>> cc1: error: drivers/misc/mediatek/mach/mt7623/include/mach: No such file=
 or directory [-Werror=3Dmissing-include-dirs]
   cc1: all warnings being treated as errors
--
>> cc1: error: drivers/misc/mediatek/mach/mt7623/include/mach: No such file=
 or directory [-Werror=3Dmissing-include-dirs]
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/stp_dbg.c: =
In function 'stp_dbg_nl_bind':
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pri/stp_dbg.c:1=
254:15: error: variable 'mydata' set but not used [-Werror=3Dunused-but-set=
-variable]
    1254 |         char *mydata;
         |               ^~~~~~
   cc1: all warnings being treated as errors
--
>> cc1: error: drivers/misc/mediatek/mach/mt7623/include/mach: No such file=
 or directory [-Werror=3Dmissing-include-dirs]
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


vim +/gStpDbgType +61 drivers/misc/mediatek/connectivity/common/conn_soc/li=
nux/pri/include/stp_dbg.h

6815c045ef9784 Frank Wunderlich 2022-06-05  60  =

6815c045ef9784 Frank Wunderlich 2022-06-05 @61  static char *const gStpDbgT=
ype[] =3D {
6815c045ef9784 Frank Wunderlich 2022-06-05  62  	"< BT>",
6815c045ef9784 Frank Wunderlich 2022-06-05  63  	"< FM>",
6815c045ef9784 Frank Wunderlich 2022-06-05  64  	"<GPS>",
6815c045ef9784 Frank Wunderlich 2022-06-05  65  	"<WiFi>",
6815c045ef9784 Frank Wunderlich 2022-06-05  66  	"<WMT>",
6815c045ef9784 Frank Wunderlich 2022-06-05  67  	"<STP>",
6815c045ef9784 Frank Wunderlich 2022-06-05  68  	"<DBG>",
6815c045ef9784 Frank Wunderlich 2022-06-05  69  	"<WAKEINT>",
6815c045ef9784 Frank Wunderlich 2022-06-05  70  	"<UNKNOWN>"
6815c045ef9784 Frank Wunderlich 2022-06-05  71  };
6815c045ef9784 Frank Wunderlich 2022-06-05  72  =


:::::: The code at line 61 was first introduced by commit
:::::: 6815c045ef97845d09668ec6d432b76e69497faa mt6625l: add driver from 5.=
18

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9074818005275327989==--

