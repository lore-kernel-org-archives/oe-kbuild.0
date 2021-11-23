Content-Type: multipart/mixed; boundary="===============7296484169463467311=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] usb: hub: Fix locking issues with address0_mutex
Date: Wed, 24 Nov 2021 03:56:44 +0800
Message-ID: <202111240336.DQZAobmU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7296484169463467311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211123101656.1113518-1-mathias.nyman@linux.intel.com>
References: <20211123101656.1113518-1-mathias.nyman@linux.intel.com>
TO: Mathias Nyman <mathias.nyman@linux.intel.com>

Hi Mathias,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20211123]
[cannot apply to usb/usb-testing v5.16-rc2 v5.16-rc1 v5.15 v5.16-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mathias-Nyman/usb-hub-Fix-=
locking-issues-with-address0_mutex/20211123-181633
base:    aacdecce8147c20b01f865b4e214bb8dbe8c4af1
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-c002-20211123 (https://download.01.org/0day-ci/ar=
chive/20211124/202111240336.DQZAobmU-lkp(a)intel.com/config.gz)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/usb/core/hub.c:5250:2-12: second lock on line 5250

vim +5250 drivers/usb/core/hub.c

a4f55d8b8c146f David Heinzelmann         2019-10-09  5179  =

af376a461cf075 Dan Williams              2014-05-20  5180  static void hub_=
port_connect(struct usb_hub *hub, int port1, u16 portstatus,
af376a461cf075 Dan Williams              2014-05-20  5181  		u16 portchange)
^1da177e4c3f41 Linus Torvalds            2005-04-16  5182  {
94c43b9897abf4 Alan Stern                2017-08-01  5183  	int status =3D =
-ENODEV;
94c43b9897abf4 Alan Stern                2017-08-01  5184  	int i;
430ee58e03f1ed Sebastian Andrzej Siewior 2012-12-18  5185  	unsigned unit_l=
oad;
^1da177e4c3f41 Linus Torvalds            2005-04-16  5186  	struct usb_devi=
ce *hdev =3D hub->hdev;
90da096ee46b68 Balaji Rao                2007-11-22  5187  	struct usb_hcd =
*hcd =3D bus_to_hcd(hdev->bus);
d99f6b41308779 Dan Williams              2014-05-20  5188  	struct usb_port=
 *port_dev =3D hub->ports[port1 - 1];
af376a461cf075 Dan Williams              2014-05-20  5189  	struct usb_devi=
ce *udev =3D port_dev->child;
5ee0f803cc3a07 Oliver Neukum             2014-07-14  5190  	static int unre=
liable_port =3D -1;
0e162125abbf80 Mathias Nyman             2021-11-23  5191  	bool retry_lock=
ed;
8808f00c7adfc8 Alan Stern                2008-04-28  5192  =

24618b0cd42f93 Alan Stern                2008-04-28  5193  	/* Disconnect a=
ny existing devices under this port */
b76baa8154335a Peter Chen                2012-11-09  5194  	if (udev) {
b2108f1e519e98 Peter Chen                2014-11-04  5195  		if (hcd->usb_p=
hy && !hdev->parent)
3d46e73dfdb840 Antoine Tenart            2014-09-24  5196  			usb_phy_notif=
y_disconnect(hcd->usb_phy, udev->speed);
d99f6b41308779 Dan Williams              2014-05-20  5197  		usb_disconnect=
(&port_dev->child);
b76baa8154335a Peter Chen                2012-11-09  5198  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  5199  =

253e05724f9230 Alan Stern                2009-10-27  5200  	/* We can forge=
t about a "removed" device when there's a physical
253e05724f9230 Alan Stern                2009-10-27  5201  	 * disconnect o=
r the connect status changes.
253e05724f9230 Alan Stern                2009-10-27  5202  	 */
253e05724f9230 Alan Stern                2009-10-27  5203  	if (!(portstatu=
s & USB_PORT_STAT_CONNECTION) ||
253e05724f9230 Alan Stern                2009-10-27  5204  			(portchange &=
 USB_PORT_STAT_C_CONNECTION))
253e05724f9230 Alan Stern                2009-10-27  5205  		clear_bit(port=
1, hub->removed_bits);
253e05724f9230 Alan Stern                2009-10-27  5206  =

5257d97a219e17 Alan Stern                2008-09-22  5207  	if (portchange =
& (USB_PORT_STAT_C_CONNECTION |
5257d97a219e17 Alan Stern                2008-09-22  5208  				USB_PORT_STA=
T_C_ENABLE)) {
ad493e5e580546 Lan Tianyu                2013-01-23  5209  		status =3D hub=
_port_debounce_be_stable(hub, port1);
5257d97a219e17 Alan Stern                2008-09-22  5210  		if (status < 0=
) {
5ee0f803cc3a07 Oliver Neukum             2014-07-14  5211  			if (status !=
=3D -ENODEV &&
5ee0f803cc3a07 Oliver Neukum             2014-07-14  5212  				port1 !=3D u=
nreliable_port &&
5ee0f803cc3a07 Oliver Neukum             2014-07-14  5213  				printk_ratel=
imit())
dd5f5006d10355 Takashi Iwai              2014-08-19  5214  				dev_err(&por=
t_dev->dev, "connect-debounce failed\n");
5257d97a219e17 Alan Stern                2008-09-22  5215  			portstatus &=
=3D ~USB_PORT_STAT_CONNECTION;
5ee0f803cc3a07 Oliver Neukum             2014-07-14  5216  			unreliable_po=
rt =3D port1;
5257d97a219e17 Alan Stern                2008-09-22  5217  		} else {
5257d97a219e17 Alan Stern                2008-09-22  5218  			portstatus =
=3D status;
5257d97a219e17 Alan Stern                2008-09-22  5219  		}
5257d97a219e17 Alan Stern                2008-09-22  5220  	}
5257d97a219e17 Alan Stern                2008-09-22  5221  =

253e05724f9230 Alan Stern                2009-10-27  5222  	/* Return now i=
f debouncing failed or nothing is connected or
253e05724f9230 Alan Stern                2009-10-27  5223  	 * the device w=
as "removed".
253e05724f9230 Alan Stern                2009-10-27  5224  	 */
253e05724f9230 Alan Stern                2009-10-27  5225  	if (!(portstatu=
s & USB_PORT_STAT_CONNECTION) ||
253e05724f9230 Alan Stern                2009-10-27  5226  			test_bit(port=
1, hub->removed_bits)) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  5227  =

fbaecff06a7db4 Deepak Das                2015-01-21  5228  		/*
fbaecff06a7db4 Deepak Das                2015-01-21  5229  		 * maybe switc=
h power back on (e.g. root hub was reset)
fbaecff06a7db4 Deepak Das                2015-01-21  5230  		 * but only if=
 the port isn't owned by someone else.
fbaecff06a7db4 Deepak Das                2015-01-21  5231  		 */
9262c19d14c433 Dan Williams              2014-05-20  5232  		if (hub_is_por=
t_power_switchable(hub)
fbaecff06a7db4 Deepak Das                2015-01-21  5233  				&& !port_is_=
power_on(hub, portstatus)
fbaecff06a7db4 Deepak Das                2015-01-21  5234  				&& !port_dev=
->port_owner)
^1da177e4c3f41 Linus Torvalds            2005-04-16  5235  			set_port_feat=
ure(hdev, port1, USB_PORT_FEAT_POWER);
^1da177e4c3f41 Linus Torvalds            2005-04-16  5236  =

^1da177e4c3f41 Linus Torvalds            2005-04-16  5237  		if (portstatus=
 & USB_PORT_STAT_ENABLE)
^1da177e4c3f41 Linus Torvalds            2005-04-16  5238  			goto done;
^1da177e4c3f41 Linus Torvalds            2005-04-16  5239  		return;
^1da177e4c3f41 Linus Torvalds            2005-04-16  5240  	}
430ee58e03f1ed Sebastian Andrzej Siewior 2012-12-18  5241  	if (hub_is_supe=
rspeed(hub->hdev))
430ee58e03f1ed Sebastian Andrzej Siewior 2012-12-18  5242  		unit_load =3D =
150;
430ee58e03f1ed Sebastian Andrzej Siewior 2012-12-18  5243  	else
430ee58e03f1ed Sebastian Andrzej Siewior 2012-12-18  5244  		unit_load =3D =
100;
^1da177e4c3f41 Linus Torvalds            2005-04-16  5245  =

e9e88fb7bca9f5 Alan Stern                2013-03-27  5246  	status =3D 0;
6ae6dc22d2d1ce Mathias Nyman             2021-11-16  5247  =

19502e6911e4ef Alan Stern                2020-09-28  5248  	for (i =3D 0; i=
 < PORT_INIT_TRIES; i++) {
0e162125abbf80 Mathias Nyman             2021-11-23  5249  		usb_lock_port(=
port_dev);
0e162125abbf80 Mathias Nyman             2021-11-23 @5250  		mutex_lock(hcd=
->address0_mutex);
0e162125abbf80 Mathias Nyman             2021-11-23  5251  		retry_locked =
=3D true;
^1da177e4c3f41 Linus Torvalds            2005-04-16  5252  		/* reallocate =
for each attempt, since references
^1da177e4c3f41 Linus Torvalds            2005-04-16  5253  		 * to the prev=
ious one can escape in various ways
^1da177e4c3f41 Linus Torvalds            2005-04-16  5254  		 */
^1da177e4c3f41 Linus Torvalds            2005-04-16  5255  		udev =3D usb_a=
lloc_dev(hdev, hdev->bus, port1);
^1da177e4c3f41 Linus Torvalds            2005-04-16  5256  		if (!udev) {
d99f6b41308779 Dan Williams              2014-05-20  5257  			dev_err(&port=
_dev->dev,
d99f6b41308779 Dan Williams              2014-05-20  5258  					"couldn't a=
llocate usb_device\n");
0e162125abbf80 Mathias Nyman             2021-11-23  5259  			mutex_unlock(=
hcd->address0_mutex);
0e162125abbf80 Mathias Nyman             2021-11-23  5260  			usb_unlock_po=
rt(port_dev);
^1da177e4c3f41 Linus Torvalds            2005-04-16  5261  			goto done;
^1da177e4c3f41 Linus Torvalds            2005-04-16  5262  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  5263  =

^1da177e4c3f41 Linus Torvalds            2005-04-16  5264  		usb_set_device=
_state(udev, USB_STATE_POWERED);
55c527187c9d78 Alan Stern                2005-11-23  5265  		udev->bus_mA =
=3D hub->mA_per_port;
b6956ffa595db9 Alan Stern                2006-08-30  5266  		udev->level =
=3D hdev->level + 1;
8af548dc8e36f8 Inaky Perez-Gonzalez      2008-04-08  5267  		udev->wusb =3D=
 hub_is_wusb(hub);
^1da177e4c3f41 Linus Torvalds            2005-04-16  5268  =

8a1b2725a60d32 Mathias Nyman             2015-12-10  5269  		/* Devices con=
nected to SuperSpeed hubs are USB 3.0 or later */
131dec344d5e41 Sarah Sharp               2010-12-06  5270  		if (hub_is_sup=
erspeed(hub->hdev))
e7b7717247f61e Sarah Sharp               2009-04-27  5271  			udev->speed =
=3D USB_SPEED_SUPER;
e7b7717247f61e Sarah Sharp               2009-04-27  5272  		else
e7b7717247f61e Sarah Sharp               2009-04-27  5273  			udev->speed =
=3D USB_SPEED_UNKNOWN;
e7b7717247f61e Sarah Sharp               2009-04-27  5274  =

3b29b68b162778 Alan Stern                2011-02-22  5275  		choose_devnum(=
udev);
c6515272b85874 Sarah Sharp               2009-04-27  5276  		if (udev->devn=
um <=3D 0) {
c6515272b85874 Sarah Sharp               2009-04-27  5277  			status =3D -E=
NOTCONN;	/* Don't retry */
c6515272b85874 Sarah Sharp               2009-04-27  5278  			goto loop;
c6515272b85874 Sarah Sharp               2009-04-27  5279  		}
c6515272b85874 Sarah Sharp               2009-04-27  5280  =

e7b7717247f61e Sarah Sharp               2009-04-27  5281  		/* reset (non-=
USB 3.0 devices) and get descriptor */
^1da177e4c3f41 Linus Torvalds            2005-04-16  5282  		status =3D hub=
_port_init(hub, udev, port1, i);
^1da177e4c3f41 Linus Torvalds            2005-04-16  5283  		if (status < 0)
^1da177e4c3f41 Linus Torvalds            2005-04-16  5284  			goto loop;
^1da177e4c3f41 Linus Torvalds            2005-04-16  5285  =

6ae6dc22d2d1ce Mathias Nyman             2021-11-16  5286  		mutex_unlock(h=
cd->address0_mutex);
0e162125abbf80 Mathias Nyman             2021-11-23  5287  		usb_unlock_por=
t(port_dev);
0e162125abbf80 Mathias Nyman             2021-11-23  5288  		retry_locked =
=3D false;
6ae6dc22d2d1ce Mathias Nyman             2021-11-16  5289  =

93362a875fc698 Phil Dibowitz             2010-07-22  5290  		if (udev->quir=
ks & USB_QUIRK_DELAY_INIT)
b2a542bbb3081d Dmitry Fleytman           2017-09-05  5291  			msleep(2000);
93362a875fc698 Phil Dibowitz             2010-07-22  5292  =

^1da177e4c3f41 Linus Torvalds            2005-04-16  5293  		/* consecutive=
 bus-powered hubs aren't reliable; they can
^1da177e4c3f41 Linus Torvalds            2005-04-16  5294  		 * violate the=
 voltage drop budget.  if the new child has
^1da177e4c3f41 Linus Torvalds            2005-04-16  5295  		 * a "powered"=
 LED, users should notice we didn't enable it
^1da177e4c3f41 Linus Torvalds            2005-04-16  5296  		 * (without re=
ading syslog), even without per-port LEDs
^1da177e4c3f41 Linus Torvalds            2005-04-16  5297  		 * on the pare=
nt.
^1da177e4c3f41 Linus Torvalds            2005-04-16  5298  		 */
^1da177e4c3f41 Linus Torvalds            2005-04-16  5299  		if (udev->desc=
riptor.bDeviceClass =3D=3D USB_CLASS_HUB
430ee58e03f1ed Sebastian Andrzej Siewior 2012-12-18  5300  				&& udev->bus=
_mA <=3D unit_load) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  5301  			u16	devstat;
^1da177e4c3f41 Linus Torvalds            2005-04-16  5302  =

d9e1e1484ade39 Felipe Balbi              2017-11-02  5303  			status =3D us=
b_get_std_status(udev, USB_RECIP_DEVICE, 0,
^1da177e4c3f41 Linus Torvalds            2005-04-16  5304  					&devstat);
15b7336e02d998 Alan Stern                2013-07-30  5305  			if (status) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  5306  				dev_dbg(&ude=
v->dev, "get status %d ?\n", status);
^1da177e4c3f41 Linus Torvalds            2005-04-16  5307  				goto loop_di=
sable;
^1da177e4c3f41 Linus Torvalds            2005-04-16  5308  			}
^1da177e4c3f41 Linus Torvalds            2005-04-16  5309  			if ((devstat =
& (1 << USB_DEVICE_SELF_POWERED)) =3D=3D 0) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  5310  				dev_err(&ude=
v->dev,
^1da177e4c3f41 Linus Torvalds            2005-04-16  5311  					"can't conn=
ect bus-powered hub "
^1da177e4c3f41 Linus Torvalds            2005-04-16  5312  					"to this po=
rt\n");
^1da177e4c3f41 Linus Torvalds            2005-04-16  5313  				if (hub->has=
_indicators) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  5314  					hub->indica=
tor[port1-1] =3D
^1da177e4c3f41 Linus Torvalds            2005-04-16  5315  						INDICATOR_=
AMBER_BLINK;
22f6a0f0e3549b Shaibal Dutta             2014-02-01  5316  					queue_delay=
ed_work(
22f6a0f0e3549b Shaibal Dutta             2014-02-01  5317  						system_pow=
er_efficient_wq,
22f6a0f0e3549b Shaibal Dutta             2014-02-01  5318  						&hub->leds=
, 0);
^1da177e4c3f41 Linus Torvalds            2005-04-16  5319  				}
^1da177e4c3f41 Linus Torvalds            2005-04-16  5320  				status =3D -=
ENOTCONN;	/* Don't retry */
^1da177e4c3f41 Linus Torvalds            2005-04-16  5321  				goto loop_di=
sable;
^1da177e4c3f41 Linus Torvalds            2005-04-16  5322  			}
^1da177e4c3f41 Linus Torvalds            2005-04-16  5323  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  5324  =

^1da177e4c3f41 Linus Torvalds            2005-04-16  5325  		/* check for d=
evices running slower than they could */
^1da177e4c3f41 Linus Torvalds            2005-04-16  5326  		if (le16_to_cp=
u(udev->descriptor.bcdUSB) >=3D 0x0200
^1da177e4c3f41 Linus Torvalds            2005-04-16  5327  				&& udev->spe=
ed =3D=3D USB_SPEED_FULL
^1da177e4c3f41 Linus Torvalds            2005-04-16  5328  				&& highspeed=
_hubs !=3D 0)
^1da177e4c3f41 Linus Torvalds            2005-04-16  5329  			check_highspe=
ed(hub, udev, port1);
^1da177e4c3f41 Linus Torvalds            2005-04-16  5330  =

fa286188ce0fce Greg Kroah-Hartman        2012-05-14  5331  		/* Store the p=
arent's children[] pointer.  At this point
^1da177e4c3f41 Linus Torvalds            2005-04-16  5332  		 * udev become=
s globally accessible, although presumably
^1da177e4c3f41 Linus Torvalds            2005-04-16  5333  		 * no one will=
 look at it until hdev is unlocked.
^1da177e4c3f41 Linus Torvalds            2005-04-16  5334  		 */
^1da177e4c3f41 Linus Torvalds            2005-04-16  5335  		status =3D 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  5336  =

d8521afe35862f Dan Williams              2014-05-20  5337  		mutex_lock(&us=
b_port_peer_mutex);
d8521afe35862f Dan Williams              2014-05-20  5338  =

^1da177e4c3f41 Linus Torvalds            2005-04-16  5339  		/* We mustn't =
add new devices if the parent hub has
^1da177e4c3f41 Linus Torvalds            2005-04-16  5340  		 * been discon=
nected; we would race with the
^1da177e4c3f41 Linus Torvalds            2005-04-16  5341  		 * recursively=
_mark_NOTATTACHED() routine.
^1da177e4c3f41 Linus Torvalds            2005-04-16  5342  		 */
^1da177e4c3f41 Linus Torvalds            2005-04-16  5343  		spin_lock_irq(=
&device_state_lock);
^1da177e4c3f41 Linus Torvalds            2005-04-16  5344  		if (hdev->stat=
e =3D=3D USB_STATE_NOTATTACHED)
^1da177e4c3f41 Linus Torvalds            2005-04-16  5345  			status =3D -E=
NOTCONN;
^1da177e4c3f41 Linus Torvalds            2005-04-16  5346  		else
d99f6b41308779 Dan Williams              2014-05-20  5347  			port_dev->chi=
ld =3D udev;
^1da177e4c3f41 Linus Torvalds            2005-04-16  5348  		spin_unlock_ir=
q(&device_state_lock);
d8521afe35862f Dan Williams              2014-05-20  5349  		mutex_unlock(&=
usb_port_peer_mutex);
^1da177e4c3f41 Linus Torvalds            2005-04-16  5350  =

^1da177e4c3f41 Linus Torvalds            2005-04-16  5351  		/* Run it thro=
ugh the hoops (find a driver, etc) */
^1da177e4c3f41 Linus Torvalds            2005-04-16  5352  		if (!status) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  5353  			status =3D us=
b_new_device(udev);
^1da177e4c3f41 Linus Torvalds            2005-04-16  5354  			if (status) {
d8521afe35862f Dan Williams              2014-05-20  5355  				mutex_lock(&=
usb_port_peer_mutex);
^1da177e4c3f41 Linus Torvalds            2005-04-16  5356  				spin_lock_ir=
q(&device_state_lock);
d99f6b41308779 Dan Williams              2014-05-20  5357  				port_dev->ch=
ild =3D NULL;
^1da177e4c3f41 Linus Torvalds            2005-04-16  5358  				spin_unlock_=
irq(&device_state_lock);
d8521afe35862f Dan Williams              2014-05-20  5359  				mutex_unlock=
(&usb_port_peer_mutex);
01ed67dc70834d Tony Zheng                2014-10-17  5360  			} else {
01ed67dc70834d Tony Zheng                2014-10-17  5361  				if (hcd->usb=
_phy && !hdev->parent)
01ed67dc70834d Tony Zheng                2014-10-17  5362  					usb_phy_not=
ify_connect(hcd->usb_phy,
01ed67dc70834d Tony Zheng                2014-10-17  5363  							udev->spe=
ed);
^1da177e4c3f41 Linus Torvalds            2005-04-16  5364  			}
^1da177e4c3f41 Linus Torvalds            2005-04-16  5365  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  5366  =

^1da177e4c3f41 Linus Torvalds            2005-04-16  5367  		if (status)
^1da177e4c3f41 Linus Torvalds            2005-04-16  5368  			goto loop_dis=
able;
^1da177e4c3f41 Linus Torvalds            2005-04-16  5369  =

^1da177e4c3f41 Linus Torvalds            2005-04-16  5370  		status =3D hub=
_power_remaining(hub);
^1da177e4c3f41 Linus Torvalds            2005-04-16  5371  		if (status)
d99f6b41308779 Dan Williams              2014-05-20  5372  			dev_dbg(hub->=
intfdev, "%dmA power budget left\n", status);
^1da177e4c3f41 Linus Torvalds            2005-04-16  5373  =

^1da177e4c3f41 Linus Torvalds            2005-04-16  5374  		return;
^1da177e4c3f41 Linus Torvalds            2005-04-16  5375  =

^1da177e4c3f41 Linus Torvalds            2005-04-16  5376  loop_disable:
^1da177e4c3f41 Linus Torvalds            2005-04-16  5377  		hub_port_disab=
le(hub, port1, 1);
^1da177e4c3f41 Linus Torvalds            2005-04-16  5378  loop:
fc721f5194dc98 Inaky Perez-Gonzalez      2008-04-08  5379  		usb_ep0_reinit=
(udev);
3b29b68b162778 Alan Stern                2011-02-22  5380  		release_devnum=
(udev);
f7410ced7f931b Herbert Xu                2010-01-10  5381  		hub_free_dev(u=
dev);
0e162125abbf80 Mathias Nyman             2021-11-23  5382  		if (retry_lock=
ed) {
0e162125abbf80 Mathias Nyman             2021-11-23  5383  			mutex_unlock(=
hcd->address0_mutex);
0e162125abbf80 Mathias Nyman             2021-11-23  5384  			usb_unlock_po=
rt(port_dev);
0e162125abbf80 Mathias Nyman             2021-11-23  5385  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  5386  		usb_put_dev(ud=
ev);
ffcdc18d64d73e Vikram Pandita            2007-05-25  5387  		if ((status =
=3D=3D -ENOTCONN) || (status =3D=3D -ENOTSUPP))
^1da177e4c3f41 Linus Torvalds            2005-04-16  5388  			break;
973593a960ddac Mike Looijmans            2017-11-09  5389  =

973593a960ddac Mike Looijmans            2017-11-09  5390  		/* When halfwa=
y through our retry count, power-cycle the port */
19502e6911e4ef Alan Stern                2020-09-28  5391  		if (i =3D=3D (=
PORT_INIT_TRIES - 1) / 2) {
973593a960ddac Mike Looijmans            2017-11-09  5392  			dev_info(&por=
t_dev->dev, "attempt power cycle\n");
973593a960ddac Mike Looijmans            2017-11-09  5393  			usb_hub_set_p=
ort_power(hdev, hub, port1, false);
973593a960ddac Mike Looijmans            2017-11-09  5394  			msleep(2 * hu=
b_power_on_good_delay(hub));
973593a960ddac Mike Looijmans            2017-11-09  5395  			usb_hub_set_p=
ort_power(hdev, hub, port1, true);
973593a960ddac Mike Looijmans            2017-11-09  5396  			msleep(hub_po=
wer_on_good_delay(hub));
973593a960ddac Mike Looijmans            2017-11-09  5397  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  5398  	}
3a31155cfff093 Alan Stern                2008-05-20  5399  	if (hub->hdev->=
parent ||
3a31155cfff093 Alan Stern                2008-05-20  5400  			!hcd->driver-=
>port_handed_over ||
e9e88fb7bca9f5 Alan Stern                2013-03-27  5401  			!(hcd->driver=
->port_handed_over)(hcd, port1)) {
e9e88fb7bca9f5 Alan Stern                2013-03-27  5402  		if (status !=
=3D -ENOTCONN && status !=3D -ENODEV)
d99f6b41308779 Dan Williams              2014-05-20  5403  			dev_err(&port=
_dev->dev,
d99f6b41308779 Dan Williams              2014-05-20  5404  					"unable to =
enumerate USB device\n");
e9e88fb7bca9f5 Alan Stern                2013-03-27  5405  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  5406  =

^1da177e4c3f41 Linus Torvalds            2005-04-16  5407  done:
^1da177e4c3f41 Linus Torvalds            2005-04-16  5408  	hub_port_disabl=
e(hub, port1, 1);
94c43b9897abf4 Alan Stern                2017-08-01  5409  	if (hcd->driver=
->relinquish_port && !hub->hdev->parent) {
94c43b9897abf4 Alan Stern                2017-08-01  5410  		if (status !=
=3D -ENOTCONN && status !=3D -ENODEV)
90da096ee46b68 Balaji Rao                2007-11-22  5411  			hcd->driver->=
relinquish_port(hcd, port1);
94c43b9897abf4 Alan Stern                2017-08-01  5412  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  5413  }
^1da177e4c3f41 Linus Torvalds            2005-04-16  5414  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7296484169463467311==--

