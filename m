Content-Type: multipart/mixed; boundary="===============3422313542768691080=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [frank-w-bpi-r2-4.14:6.0-r2pro-pcie 37/54] drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_bt.c:504:31: error: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 28 Aug 2022 23:50:01 +0800
Message-ID: <202208282352.Y9pk8O3m-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3422313542768691080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.0-r2pro-pcie
head:   e7a7198c81420b9ac5e6eb578ab451a7fb3ccde3
commit: c36a133b79dd4a4424c35e5f22159636e150da96 [37/54] mt6625l: remove HC=
I_QUIRK_BROKEN_ERR_DATA_REPORTING
:::::: branch date: 30 hours ago
:::::: commit date: 6 days ago
config: arm-randconfig-c002-20220824 (https://download.01.org/0day-ci/archi=
ve/20220828/202208282352.Y9pk8O3m-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/frank-w/BPI-R2-4.14/commit/c36a133b79dd4a4424c=
35e5f22159636e150da96
        git remote add frank-w-bpi-r2-4.14 https://github.com/frank-w/BPI-R=
2-4.14
        git fetch --no-tags frank-w-bpi-r2-4.14 6.0-r2pro-pcie
        git checkout c36a133b79dd4a4424c35e5f22159636e150da96
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c:272:5: error: no previous prototype for 'hci_recv_fragment' [-Werror=
=3Dmissing-prototypes]
     272 | int hci_recv_fragment(struct hci_dev *hdev, int type, void *data=
, int count)
         |     ^~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c:294:1: error: no previous prototype for 'hex_dump' [-Werror=3Dmissing-=
prototypes]
     294 | hex_dump(char *prefix, char *p, int len)
         | ^~~~~~~~
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c:457:5: error: no previous prototype for 'mtk_bt_hci_init' [-Werror=3Dm=
issing-prototypes]
     457 | int mtk_bt_hci_init(void)
         |     ^~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c:529:6: error: no previous prototype for 'BT_event_cb' [-Werror=3Dmissi=
ng-prototypes]
     529 | VOID BT_event_cb(VOID)
         |      ^~~~~~~~~~~
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c:542:14: error: no previous prototype for 'BT_poll' [-Werror=3Dmissing-=
prototypes]
     542 | unsigned int BT_poll(struct file *filp, poll_table *wait)
         |              ^~~~~~~
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c:568:9: error: no previous prototype for 'BT_write' [-Werror=3Dmissing-=
prototypes]
     568 | ssize_t BT_write(struct file *filp, const char __user *buf, size=
_t count, loff_t *f_pos)
         |         ^~~~~~~~
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c:622:9: error: no previous prototype for 'BT_read' [-Werror=3Dmissing-p=
rototypes]
     622 | ssize_t BT_read(struct file *filp, char __user *buf, size_t coun=
t, loff_t *f_pos)
         |         ^~~~~~~
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c:683:6: error: no previous prototype for 'BT_unlocked_ioctl' [-Werror=
=3Dmissing-prototypes]
     683 | long BT_unlocked_ioctl(struct file *filp, unsigned int cmd, unsi=
gned long arg)
         |      ^~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c:728:6: error: no previous prototype for 'BT_compat_ioctl' [-Werror=3Dm=
issing-prototypes]
     728 | long BT_compat_ioctl(struct file *filp, unsigned int cmd, unsign=
ed long arg)
         |      ^~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c: In function 'bt_cdev_rst_cb':
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_chrdev_=
bt.c:504:31: error: use of uninitialized value '<unknown>' [CWE-457] [-Werr=
or=3Danalyzer-use-of-uninitialized-value]
     504 |         ENUM_WMTRSTMSG_TYPE_T rst_msg;
         |                               ^~~~~~~
     'bt_cdev_rst_cb': event 1
       |
       |  504 |         ENUM_WMTRSTMSG_TYPE_T rst_msg;
       |      |                               ^~~~~~~
       |      |                               |
       |      |                               (1) use of uninitialized valu=
e '<unknown>' here
       |
   cc1: all warnings being treated as errors


vim +504 drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/stp_c=
hrdev_bt.c

51e2c94a1a250e Frank Wunderlich 2022-08-21  496  =

51e2c94a1a250e Frank Wunderlich 2022-08-21  497  =

51e2c94a1a250e Frank Wunderlich 2022-08-21  498  static VOID bt_cdev_rst_cb=
(ENUM_WMTDRV_TYPE_T src,
51e2c94a1a250e Frank Wunderlich 2022-08-21  499  			   ENUM_WMTDRV_TYPE_T d=
st, ENUM_WMTMSG_TYPE_T type, PVOID buf, UINT32 sz)
51e2c94a1a250e Frank Wunderlich 2022-08-21  500  {
51e2c94a1a250e Frank Wunderlich 2022-08-21  501  	/*
51e2c94a1a250e Frank Wunderlich 2022-08-21  502  	   Handle whole chip rese=
t messages
51e2c94a1a250e Frank Wunderlich 2022-08-21  503  	 */
51e2c94a1a250e Frank Wunderlich 2022-08-21 @504  	ENUM_WMTRSTMSG_TYPE_T rst=
_msg;
51e2c94a1a250e Frank Wunderlich 2022-08-21  505  =

51e2c94a1a250e Frank Wunderlich 2022-08-21  506  	if (sz <=3D sizeof(ENUM_W=
MTRSTMSG_TYPE_T)) {
51e2c94a1a250e Frank Wunderlich 2022-08-21  507  		memcpy((PINT8)&rst_msg, =
(PINT8)buf, sz);
51e2c94a1a250e Frank Wunderlich 2022-08-21  508  		BT_DBG_FUNC("src =3D %d,=
 dst =3D %d, type =3D %d, buf =3D 0x%x sz =3D %d, max =3D %d\n", src,
51e2c94a1a250e Frank Wunderlich 2022-08-21  509  			     dst, type, rst_msg=
, sz, WMTRSTMSG_RESET_MAX);
51e2c94a1a250e Frank Wunderlich 2022-08-21  510  		if ((src =3D=3D WMTDRV_T=
YPE_WMT) && (dst =3D=3D WMTDRV_TYPE_BT)
51e2c94a1a250e Frank Wunderlich 2022-08-21  511  		    && (type =3D=3D WMTM=
SG_TYPE_RESET)) {
51e2c94a1a250e Frank Wunderlich 2022-08-21  512  			if (rst_msg =3D=3D WMTR=
STMSG_RESET_START) {
51e2c94a1a250e Frank Wunderlich 2022-08-21  513  				BT_INFO_FUNC("BT reset=
 start!\n");
51e2c94a1a250e Frank Wunderlich 2022-08-21  514  				rstflag =3D 1;
51e2c94a1a250e Frank Wunderlich 2022-08-21  515  				wake_up_interruptible(=
&inq);
51e2c94a1a250e Frank Wunderlich 2022-08-21  516  =

51e2c94a1a250e Frank Wunderlich 2022-08-21  517  			} else if (rst_msg =3D=
=3D WMTRSTMSG_RESET_END) {
51e2c94a1a250e Frank Wunderlich 2022-08-21  518  				BT_INFO_FUNC("BT reset=
 end!\n");
51e2c94a1a250e Frank Wunderlich 2022-08-21  519  				rstflag =3D 2;
51e2c94a1a250e Frank Wunderlich 2022-08-21  520  				wake_up_interruptible(=
&inq);
51e2c94a1a250e Frank Wunderlich 2022-08-21  521  			}
51e2c94a1a250e Frank Wunderlich 2022-08-21  522  		}
51e2c94a1a250e Frank Wunderlich 2022-08-21  523  	} else {
51e2c94a1a250e Frank Wunderlich 2022-08-21  524  		/* Invalid message forma=
t */
51e2c94a1a250e Frank Wunderlich 2022-08-21  525  		BT_WARN_FUNC("Invalid me=
ssage format!\n");
51e2c94a1a250e Frank Wunderlich 2022-08-21  526  	}
51e2c94a1a250e Frank Wunderlich 2022-08-21  527  }
51e2c94a1a250e Frank Wunderlich 2022-08-21  528  =


:::::: The code@line 504 was first introduced by commit
:::::: 51e2c94a1a250eca4240fa872012ad2741a8d606 mt6625l: add driver folder =
from 5.19

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3422313542768691080==--

