Content-Type: multipart/mixed; boundary="===============0591860554917033096=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [l1k:smsc95xx_5.17 56/887] drivers/usb/core/otg_productlist.h:142 is_targeted() warn: ignoring unreachable code.
Date: Fri, 08 Apr 2022 22:41:22 +0800
Message-ID: <202204082255.h01hr1wZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0591860554917033096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: popcornmix <popcornmix@gmail.com>
CC: Kari Suvanto <karis79@gmail.com>
CC: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
CC: Phil Elwell <phil@raspberrypi.org>
CC: Malik Olivier Boussejra <malik@boussejra.com>
CC: Paul Zimmerman <paulz@synopsys.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Lukas Wunner <lukas@wunner.de>
CC: Nathan Chancellor <natechancellor@gmail.com>
CC: Dave Stevenson <dave.stevenson@raspberrypi.org>
CC: Michael Zoran <mzoran@crowfest.net>
CC: "Marek Beh=C3=BAn" <marek.behun@nic.cz>
CC: Jonathan Bell <jonathan@raspberrypi.org>
CC: Hui Wang <hui.wang@canonical.com>
CC: Zixuan Wang <wangzixuan@sjtu.edu.cn>

tree:   https://github.com/l1k/linux smsc95xx_5.17
head:   05d68ced287b30f62f18f95b5476135ef669804a
commit: a8197852bb8f1f6804cff9442d426888e97aaed3 [56/887] Add dwc_otg driver
:::::: branch date: 9 hours ago
:::::: commit date: 3 weeks ago
config: m68k-randconfig-m031-20220408 (https://download.01.org/0day-ci/arch=
ive/20220408/202204082255.h01hr1wZ-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/usb/core/otg_productlist.h:142 is_targeted() warn: ignoring unreach=
able code.
drivers/usb/core/message.c:2155 usb_set_configuration() warn: curly braces =
intended?

vim +142 drivers/usb/core/otg_productlist.h

a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01   88  =

a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01   89  =

^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16   90  static int is_targeted(struct usb_device *dev)
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16   91  {
f8f02d5c671f79 drivers/usb/core/otg_productlist.h Greg Kroah-Hartman 2020-0=
6-18   92  	struct usb_device_id	*id =3D productlist_table;
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16   93  =

^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16   94  	/* HNP test device is _never_ targeted (see OTG spec 6.6.6) */
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16   95  	if ((le16_to_cpu(dev->descriptor.idVendor) =3D=3D 0x1a0a &&
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16   96  	     le16_to_cpu(dev->descriptor.idProduct) =3D=3D 0xbadd))
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16   97  		return 0;
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16   98  =

e5dff0e80463cc drivers/usb/core/otg_whitelist.h   Macpaul Lin        2015-0=
1-23   99  	/* OTG PET device is always targeted (see OTG 2.0 ECN 6.4.2) */
e5dff0e80463cc drivers/usb/core/otg_whitelist.h   Macpaul Lin        2015-0=
1-23  100  	if ((le16_to_cpu(dev->descriptor.idVendor) =3D=3D 0x1a0a &&
e5dff0e80463cc drivers/usb/core/otg_whitelist.h   Macpaul Lin        2015-0=
1-23  101  	     le16_to_cpu(dev->descriptor.idProduct) =3D=3D 0x0200))
e5dff0e80463cc drivers/usb/core/otg_whitelist.h   Macpaul Lin        2015-0=
1-23  102  		return 1;
e5dff0e80463cc drivers/usb/core/otg_whitelist.h   Macpaul Lin        2015-0=
1-23  103  =

^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  104  	/* NOTE: can't use usb_match_id() since interface caches
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  105  	 * aren't set up yet. this is cut/paste from that code.
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  106  	 */
f8f02d5c671f79 drivers/usb/core/otg_productlist.h Greg Kroah-Hartman 2020-0=
6-18  107  	for (id =3D productlist_table; id->match_flags; id++) {
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  108  		if ((id->match_flags & USB_DEVICE_ID_MATCH_VENDOR) &&
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  109  		    id->idVendor !=3D le16_to_cpu(dev->descriptor.idVendor))
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  110  			continue;
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  111  =

^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  112  		if ((id->match_flags & USB_DEVICE_ID_MATCH_PRODUCT) &&
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  113  		    id->idProduct !=3D le16_to_cpu(dev->descriptor.idProduct))
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  114  			continue;
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  115  =

^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  116  		/* No need to test id->bcdDevice_lo !=3D 0, since 0 is never
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  117  		   greater than any unsigned number. */
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  118  		if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_LO) &&
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  119  		    (id->bcdDevice_lo > le16_to_cpu(dev->descriptor.bcdDevice)=
))
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  120  			continue;
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  121  =

^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  122  		if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_HI) &&
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  123  		    (id->bcdDevice_hi < le16_to_cpu(dev->descriptor.bcdDevice)=
))
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  124  			continue;
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  125  =

^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  126  		if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_CLASS) &&
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  127  		    (id->bDeviceClass !=3D dev->descriptor.bDeviceClass))
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  128  			continue;
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  129  =

^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  130  		if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_SUBCLASS) &&
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  131  		    (id->bDeviceSubClass !=3D dev->descriptor.bDeviceSubClass))
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  132  			continue;
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  133  =

^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  134  		if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_PROTOCOL) &&
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  135  		    (id->bDeviceProtocol !=3D dev->descriptor.bDeviceProtocol))
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  136  			continue;
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  137  =

^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  138  		return 1;
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  139  		/* NOTE: can't use usb_match_id() since interface caches
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  140  		 * aren't set up yet. this is cut/paste from that code.
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  141  		 */
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01 @142  		for (id =3D productlist_table; id->match_flags; id++) {
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  143  #ifdef DEBUG
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  144  			dev_dbg(&dev->dev,
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  145  				"ID: V:%04x P:%04x DC:%04x SC:%04x PR:%04x \n",
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  146  				id->idVendor,
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  147  				id->idProduct,
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  148  				id->bDeviceClass,
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  149  				id->bDeviceSubClass,
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  150  				id->bDeviceProtocol);
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  151  #endif
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  152  =

a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  153  			if ((id->match_flags & USB_DEVICE_ID_MATCH_VENDOR) &&
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  154  			    id->idVendor !=3D le16_to_cpu(dev->descriptor.idVendor))
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  155  				continue;
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  156  =

a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  157  			if ((id->match_flags & USB_DEVICE_ID_MATCH_PRODUCT) &&
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  158  			    id->idProduct !=3D le16_to_cpu(dev->descriptor.idProduct))
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  159  				continue;
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  160  =

a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  161  			/* No need to test id->bcdDevice_lo !=3D 0, since 0 is never
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  162  			   greater than any unsigned number. */
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  163  			if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_LO) &&
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  164  			    (id->bcdDevice_lo > le16_to_cpu(dev->descriptor.bcdDevice=
)))
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  165  				continue;
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  166  =

a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  167  			if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_HI) &&
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  168  			    (id->bcdDevice_hi < le16_to_cpu(dev->descriptor.bcdDevice=
)))
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  169  				continue;
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  170  =

a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  171  			if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_CLASS) &&
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  172  			    (id->bDeviceClass !=3D dev->descriptor.bDeviceClass))
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  173  				continue;
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  174  =

a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  175  			if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_SUBCLASS) &&
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  176  			    (id->bDeviceSubClass !=3D dev->descriptor.bDeviceSubClass=
))
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  177  				continue;
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  178  =

a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  179  			if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_PROTOCOL) &&
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  180  			    (id->bDeviceProtocol !=3D dev->descriptor.bDeviceProtocol=
))
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  181  				continue;
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  182  =

a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  183  			return 1;
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  184  		}
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  185  	}
a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  186  =

a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  187  	/* add other match criteria here ... */
026f3fcbb0fc51 drivers/usb/core/otg_whitelist.h   Peter Chen         2014-0=
8-19  188  =

a8197852bb8f1f drivers/usb/core/otg_productlist.h popcornmix         2013-0=
5-01  189  	report_errors(dev);
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  190  	return 0;
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  191  }
^1da177e4c3f41 drivers/usb/core/otg_whitelist.h   Linus Torvalds     2005-0=
4-16  192  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0591860554917033096==--

