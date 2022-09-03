Content-Type: multipart/mixed; boundary="===============1038769609669303067=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/isdn/hardware/mISDN/hfcsusb.c:1695:16: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sat, 03 Sep 2022 21:54:49 +0800
Message-ID: <202209032118.HAAV9IXB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1038769609669303067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/isdn/hardware/mISDN/hfcsusb.c:1695:16: warning: use of uninitializ=
ed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d895ec7938c431fe61a731939da76a6461bc6133
commit: f68f2ff91512c199ec24883001245912afc17873 fortify: Detect struct mem=
ber overflows in memcpy() at compile-time
date:   7 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20220830 (https://download.01.org/0day-ci/archi=
ve/20220903/202209032118.HAAV9IXB-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df68f2ff91512c199ec24883001245912afc17873
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f68f2ff91512c199ec24883001245912afc17873
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/isdn/hardware/mISDN/hfcsusb.c: In function 'setup_hfcsusb':
>> drivers/isdn/hardware/mISDN/hfcsusb.c:1695:16: warning: use of uninitial=
ized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1695 |         u_char b;
         |                ^
     'setup_hfcsusb': event 1
       |
       | 1695 |         u_char b;
       |      |                ^
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' h=
ere
       |

vim +1695 drivers/isdn/hardware/mISDN/hfcsusb.c

69f52adb2d534a Karsten Keil        2009-01-09  1688  =

69f52adb2d534a Karsten Keil        2009-01-09  1689  =

69f52adb2d534a Karsten Keil        2009-01-09  1690  /* Hardware Initializa=
tion */
6c2959aa7b81b8 Hannes Eder         2009-02-12  1691  static int
69f52adb2d534a Karsten Keil        2009-01-09  1692  setup_hfcsusb(struct h=
fcsusb *hw)
69f52adb2d534a Karsten Keil        2009-01-09  1693  {
d8a1de3d5bb881 Juliana Rodrigueiro 2019-07-31  1694  	void *dmabuf =3D kmal=
loc(sizeof(u_char), GFP_KERNEL);
69f52adb2d534a Karsten Keil        2009-01-09 @1695  	u_char b;
d8a1de3d5bb881 Juliana Rodrigueiro 2019-07-31  1696  	int ret;
69f52adb2d534a Karsten Keil        2009-01-09  1697  =

69f52adb2d534a Karsten Keil        2009-01-09  1698  	if (debug & DBG_HFC_C=
ALL_TRACE)
69f52adb2d534a Karsten Keil        2009-01-09  1699  		printk(KERN_DEBUG "%=
s: %s\n", hw->name, __func__);
69f52adb2d534a Karsten Keil        2009-01-09  1700  =

d8a1de3d5bb881 Juliana Rodrigueiro 2019-07-31  1701  	if (!dmabuf)
d8a1de3d5bb881 Juliana Rodrigueiro 2019-07-31  1702  		return -ENOMEM;
d8a1de3d5bb881 Juliana Rodrigueiro 2019-07-31  1703  =

d8a1de3d5bb881 Juliana Rodrigueiro 2019-07-31  1704  	ret =3D read_reg_atom=
ic(hw, HFCUSB_CHIP_ID, dmabuf);
d8a1de3d5bb881 Juliana Rodrigueiro 2019-07-31  1705  =

d8a1de3d5bb881 Juliana Rodrigueiro 2019-07-31  1706  	memcpy(&b, dmabuf, si=
zeof(u_char));
d8a1de3d5bb881 Juliana Rodrigueiro 2019-07-31  1707  	kfree(dmabuf);
d8a1de3d5bb881 Juliana Rodrigueiro 2019-07-31  1708  =

69f52adb2d534a Karsten Keil        2009-01-09  1709  	/* check the chip id =
*/
d8a1de3d5bb881 Juliana Rodrigueiro 2019-07-31  1710  	if (ret !=3D 1) {
69f52adb2d534a Karsten Keil        2009-01-09  1711  		printk(KERN_DEBUG "%=
s: %s: cannot read chip id\n",
69f52adb2d534a Karsten Keil        2009-01-09  1712  		       hw->name, __f=
unc__);
69f52adb2d534a Karsten Keil        2009-01-09  1713  		return 1;
69f52adb2d534a Karsten Keil        2009-01-09  1714  	}
69f52adb2d534a Karsten Keil        2009-01-09  1715  	if (b !=3D HFCUSB_CHI=
PID) {
69f52adb2d534a Karsten Keil        2009-01-09  1716  		printk(KERN_DEBUG "%=
s: %s: Invalid chip id 0x%02x\n",
69f52adb2d534a Karsten Keil        2009-01-09  1717  		       hw->name, __f=
unc__, b);
69f52adb2d534a Karsten Keil        2009-01-09  1718  		return 1;
69f52adb2d534a Karsten Keil        2009-01-09  1719  	}
69f52adb2d534a Karsten Keil        2009-01-09  1720  =

69f52adb2d534a Karsten Keil        2009-01-09  1721  	/* first set the need=
ed config, interface and alternate */
3c76c58fca03c1 David S. Miller     2011-04-17  1722  	(void) usb_set_interf=
ace(hw->dev, hw->if_used, hw->alt_used);
69f52adb2d534a Karsten Keil        2009-01-09  1723  =

69f52adb2d534a Karsten Keil        2009-01-09  1724  	hw->led_state =3D 0;
69f52adb2d534a Karsten Keil        2009-01-09  1725  =

69f52adb2d534a Karsten Keil        2009-01-09  1726  	/* init the backgroun=
d machinery for control requests */
69f52adb2d534a Karsten Keil        2009-01-09  1727  	hw->ctrl_read.bReques=
tType =3D 0xc0;
69f52adb2d534a Karsten Keil        2009-01-09  1728  	hw->ctrl_read.bReques=
t =3D 1;
69f52adb2d534a Karsten Keil        2009-01-09  1729  	hw->ctrl_read.wLength=
 =3D cpu_to_le16(1);
69f52adb2d534a Karsten Keil        2009-01-09  1730  	hw->ctrl_write.bReque=
stType =3D 0x40;
69f52adb2d534a Karsten Keil        2009-01-09  1731  	hw->ctrl_write.bReque=
st =3D 0;
69f52adb2d534a Karsten Keil        2009-01-09  1732  	hw->ctrl_write.wLengt=
h =3D 0;
69f52adb2d534a Karsten Keil        2009-01-09  1733  	usb_fill_control_urb(=
hw->ctrl_urb, hw->dev, hw->ctrl_out_pipe,
69f52adb2d534a Karsten Keil        2009-01-09  1734  			     (u_char *)&hw-=
>ctrl_write, NULL, 0,
69f52adb2d534a Karsten Keil        2009-01-09  1735  			     (usb_complete_=
t)ctrl_complete, hw);
69f52adb2d534a Karsten Keil        2009-01-09  1736  =

69f52adb2d534a Karsten Keil        2009-01-09  1737  	reset_hfcsusb(hw);
69f52adb2d534a Karsten Keil        2009-01-09  1738  	return 0;
69f52adb2d534a Karsten Keil        2009-01-09  1739  }
69f52adb2d534a Karsten Keil        2009-01-09  1740  =


:::::: The code at line 1695 was first introduced by commit
:::::: 69f52adb2d534afc41fcc658f155e01f0b322f9e mISDN: Add HFC USB driver

:::::: TO: Karsten Keil <kkeil@suse.de>
:::::: CC: Karsten Keil <kkeil@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1038769609669303067==--

