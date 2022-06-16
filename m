Content-Type: multipart/mixed; boundary="===============2426076066207277441=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/bluetooth/btusb.c:1272:44: warning: dereference of NULL '*(struct btusb_data *)MEM[(const struct device *)hdev_23(D) + 2664B].driver_data.isoc_rx_ep' [CWE-476]
Date: Thu, 16 Jun 2022 19:10:49 +0800
Message-ID: <202206161925.Vop21YEA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2426076066207277441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/bluetooth/btusb.c:1272:44: warning: dereference of NULL '*(struct =
btusb_data *)MEM[(const struct device *)hdev_23(D) + 2664B].driver_data.iso=
c_rx_ep' [CWE-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Benjamin Berg <bberg@redhat.com>
CC: Marcel Holtmann <marcel@holtmann.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   30306f6194cadcc29c77f6ddcd416a75bf5c0232
commit: 744451c162a514044a912cbbd64b7a386035cc5b Bluetooth: hci_sync: Push =
sync command cancellation to workqueue
date:   6 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220615 (https://download.01.org/0day-ci/archi=
ve/20220616/202206161925.Vop21YEA-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D744451c162a514044a912cbbd64b7a386035cc5b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 744451c162a514044a912cbbd64b7a386035cc5b
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/arm/include/uapi/asm/byteorder.h:22,
                    from include/asm-generic/bitops/le.h:7,
                    from arch/arm/include/asm/bitops.h:268,
                    from include/linux/bitops.h:33,
                    from include/linux/kernel.h:13,
                    from include/linux/kernfs.h:9,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/dmi.h:6,
                    from drivers/bluetooth/btusb.c:9:
   drivers/bluetooth/btusb.c: In function 'btusb_submit_isoc_urb':
>> drivers/bluetooth/btusb.c:1272:44: warning: dereference of NULL '*(struc=
t btusb_data *)MEM[(const struct device *)hdev_23(D) + 2664B].driver_data.i=
soc_rx_ep' [CWE-476] [-Wanalyzer-null-dereference]
    1272 |         size =3D le16_to_cpu(data->isoc_rx_ep->wMaxPacketSize) *
   include/uapi/linux/byteorder/little_endian.h:36:51: note: in definition =
of macro '__le16_to_cpu'
      36 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   drivers/bluetooth/btusb.c:1272:16: note: in expansion of macro 'le16_to_=
cpu'
    1272 |         size =3D le16_to_cpu(data->isoc_rx_ep->wMaxPacketSize) *
         |                ^~~~~~~~~~~
     'btusb_work': events 1-2
       |
       | 1849 | static void btusb_work(struct work_struct *work)
       |      |             ^~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'btusb_work'
       |......
       | 1856 |         if (data->sco_num > 0) {
       |      |            ~ =

       |      |            |
       |      |            (2) following 'true' branch...
       |
     'btusb_work': event 3
       |
       |include/asm-generic/bitops/non-atomic.h:118:27:
       |  118 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER=
_LONG-1)));
       |      |                       ~~~~^~~~~~~~~~~~~~
       |      |                           |
       |      |                           (3) ...to here
       |
     'btusb_work': events 4-6
       |
       |drivers/bluetooth/btusb.c:1857:20:
       | 1857 |                 if (!test_bit(BTUSB_DID_ISO_RESUME, &data->=
flags)) {
       |      |                    ^
       |      |                    |
       |      |                    (4) following 'false' branch...
       |......
       | 1868 |                 if (data->air_mode =3D=3D HCI_NOTIFY_ENABLE=
_SCO_CVSD) {
       |      |                     ~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (5) ...to here
       |......
       | 1896 |                 if (btusb_switch_alt_setting(hdev, new_alts=
) < 0)
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (6) calling 'btusb_switch_alt_setting' =
from 'btusb_work'
       |
       +--> 'btusb_switch_alt_setting': events 7-8
              |
              | 1790 | static int btusb_switch_alt_setting(struct hci_dev *=
hdev, int new_alts)
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (7) entry to 'btusb_switch_alt_setting'
              |......
              | 1795 |         if (data->isoc_altsetting !=3D new_alts) {
              |      |            ~
              |      |            |
              |      |            (8) following 'true' branch...
              |
            'btusb_switch_alt_setting': event 9
              |
              | 1798 |                 clear_bit(BTUSB_ISOC_RUNNING, &data-=
>flags);
              |      |                                               ^~~~~~=
~~~~~~
              |      |                                               |
              |      |                                               (9) ..=
.to here
   arch/arm/include/asm/bitops.h:181:59: note: in definition of macro 'ATOM=
IC_BITOP'
              |  181 |         (__builtin_constant_p(nr) ? ____atomic_##nam=
e(nr, p) : _##name(nr,p))
              |      |                                                     =
      ^
   drivers/bluetooth/btusb.c:1798:17: note: in expansion of macro 'clear_bi=
t'
              | 1798 |                 clear_bit(BTUSB_ISOC_RUNNING, &data-=
>flags);
              |      |                 ^~~~~~~~~
              |
            'btusb_switch_alt_setting': event 10
              |
              | 1815 |                 err =3D __set_isoc_interface(hdev, n=
ew_alts);
              |      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
              |      |                       |
              |      |                       (10) calling '__set_isoc_inter=
face' from 'btusb_switch_alt_setting'
              |
              +--> '__set_isoc_interface': events 11-15
                     |
                     | 1747 | static inline int __set_isoc_interface(struct=
 hci_dev *hdev, int altsetting)
                     |      |                   ^~~~~~~~~~~~~~~~~~~~
                     |      |                   |
                     |      |                   (11) entry to '__set_isoc_i=
nterface'
                     |......
                     | 1754 |         if (!data->isoc)
                     |      |            ~       =

                     |      |            |
                     |      |            (12) following 'false' branch (whe=
n 'intf' is non-NULL)...
                     |......
                     | 1757 |         err =3D usb_set_interface(data->udev,=
 data->isoc_ifnum, altsetting);
                     |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |               |
                     |      |               (13) ...to here
                     | 1758 |         if (err < 0) {
                     |      |            ~       =

                     |      |            |
                     |      |            (14) following 'false' branch (whe=
n 'err >=3D 0')...
                     |......
                     | 1763 |         data->isoc_altsetting =3D altsetting;
                     |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +1272 drivers/bluetooth/btusb.c

9bfa35fe422c74 Marcel Holtmann 2008-08-18  1254  =

2eda66f4a0b980 Marcel Holtmann 2008-11-30  1255  static int btusb_submit_is=
oc_urb(struct hci_dev *hdev, gfp_t mem_flags)
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1256  {
155961e8001719 David Herrmann  2012-02-09  1257  	struct btusb_data *data =
=3D hci_get_drvdata(hdev);
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1258  	struct urb *urb;
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1259  	unsigned char *buf;
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1260  	unsigned int pipe;
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1261  	int err, size;
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1262  =

9bfa35fe422c74 Marcel Holtmann 2008-08-18  1263  	BT_DBG("%s", hdev->name);
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1264  =

9bfa35fe422c74 Marcel Holtmann 2008-08-18  1265  	if (!data->isoc_rx_ep)
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1266  		return -ENODEV;
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1267  =

2eda66f4a0b980 Marcel Holtmann 2008-11-30  1268  	urb =3D usb_alloc_urb(BTU=
SB_MAX_ISOC_FRAMES, mem_flags);
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1269  	if (!urb)
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1270  		return -ENOMEM;
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1271  =

9bfa35fe422c74 Marcel Holtmann 2008-08-18 @1272  	size =3D le16_to_cpu(data=
->isoc_rx_ep->wMaxPacketSize) *
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1273  						BTUSB_MAX_ISOC_FRAME=
S;
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1274  =

2eda66f4a0b980 Marcel Holtmann 2008-11-30  1275  	buf =3D kmalloc(size, mem=
_flags);
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1276  	if (!buf) {
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1277  		usb_free_urb(urb);
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1278  		return -ENOMEM;
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1279  	}
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1280  =

9bfa35fe422c74 Marcel Holtmann 2008-08-18  1281  	pipe =3D usb_rcvisocpipe(=
data->udev, data->isoc_rx_ep->bEndpointAddress);
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1282  =

fa0fb93f2ac308 Bing Zhao       2011-12-20  1283  	usb_fill_int_urb(urb, dat=
a->udev, pipe, buf, size, btusb_isoc_complete,
fa0fb93f2ac308 Bing Zhao       2011-12-20  1284  			 hdev, data->isoc_rx_ep=
->bInterval);
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1285  =

9bfa35fe422c74 Marcel Holtmann 2008-08-18  1286  	urb->transfer_flags =3D U=
RB_FREE_BUFFER | URB_ISO_ASAP;
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1287  =

9bfa35fe422c74 Marcel Holtmann 2008-08-18  1288  	__fill_isoc_descriptor(ur=
b, size,
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1289  			       le16_to_cpu(data=
->isoc_rx_ep->wMaxPacketSize));
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1290  =

9bfa35fe422c74 Marcel Holtmann 2008-08-18  1291  	usb_anchor_urb(urb, &data=
->isoc_anchor);
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1292  =

2eda66f4a0b980 Marcel Holtmann 2008-11-30  1293  	err =3D usb_submit_urb(ur=
b, mem_flags);
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1294  	if (err < 0) {
d4b8d1c9c1564f Paul Bolle      2011-10-09  1295  		if (err !=3D -EPERM && e=
rr !=3D -ENODEV)
2064ee332e4c1b Marcel Holtmann 2017-10-30  1296  			bt_dev_err(hdev, "urb %=
p submission failed (%d)",
2064ee332e4c1b Marcel Holtmann 2017-10-30  1297  				   urb, -err);
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1298  		usb_unanchor_urb(urb);
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1299  	}
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1300  =

9bfa35fe422c74 Marcel Holtmann 2008-08-18  1301  	usb_free_urb(urb);
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1302  =

9bfa35fe422c74 Marcel Holtmann 2008-08-18  1303  	return err;
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1304  }
9bfa35fe422c74 Marcel Holtmann 2008-08-18  1305  =


:::::: The code@line 1272 was first introduced by commit
:::::: 9bfa35fe422c74882e27cc54450a5f76c96aad68 [Bluetooth] Add SCO support=
 to btusb driver

:::::: TO: Marcel Holtmann <marcel@holtmann.org>
:::::: CC: Marcel Holtmann <marcel@holtmann.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2426076066207277441==--

