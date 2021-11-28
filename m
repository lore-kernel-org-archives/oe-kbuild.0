Content-Type: multipart/mixed; boundary="===============0504661783274678920=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2016/3897] drivers/net/usb/lan78xx.c:3794:2: warning: Value stored to 'state' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 28 Nov 2021 13:08:25 +0800
Message-ID: <202111281304.IyMicb1U-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0504661783274678920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: John Efstathiades <john.efstathiades@pebblebay.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f30a24ed97b401416118756fa35fbe5d28f999e3
commit: c450a8eb187a4d7ebe92e0afec54ac31ce403e79 [2016/3897] lan78xx: Intro=
duce Rx URB processing improvements
:::::: branch date: 2 days ago
:::::: commit date: 10 days ago
config: riscv-randconfig-c006-20211122 (https://download.01.org/0day-ci/arc=
hive/20211128/202111281304.IyMicb1U-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c133fb=
321f7ca6083ce15b6aa5bf89de6600e649)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dc450a8eb187a4d7ebe92e0afec54ac31ce403e79
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c450a8eb187a4d7ebe92e0afec54ac31ce403e79
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                             ^
   drivers/net/usb/lan78xx.c:2938:3: note: Taking false branch
                   if (time_after(jiffies, timeout)) {
                   ^
   drivers/net/usb/lan78xx.c:2932:2: note: Loop condition is false.  Exitin=
g loop
           do {
           ^
   drivers/net/usb/lan78xx.c:2946:2: note: Calling 'lan78xx_init_mac_addres=
s'
           lan78xx_init_mac_address(dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:1941:15: note: 'addr_hi' declared without an i=
nitial value
           u32 addr_lo, addr_hi;
                        ^~~~~~~
   drivers/net/usb/lan78xx.c:1945:2: note: Calling 'lan78xx_read_reg'
           lan78xx_read_reg(dev, RX_ADDRH, &addr_hi);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:612:2: note: Taking false branch
           if (test_bit(EVENT_DEV_DISCONNECT, &dev->flags))
           ^
   drivers/net/usb/lan78xx.c:616:6: note: Assuming 'buf' is null
           if (!buf)
               ^~~~
   drivers/net/usb/lan78xx.c:616:2: note: Taking true branch
           if (!buf)
           ^
   drivers/net/usb/lan78xx.c:617:3: note: Returning without writing to '*da=
ta'
                   return -ENOMEM;
                   ^
   drivers/net/usb/lan78xx.c:1945:2: note: Returning from 'lan78xx_read_reg'
           lan78xx_read_reg(dev, RX_ADDRH, &addr_hi);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:1951:20: note: The left operand of '&' is a ga=
rbage value
           addr[4] =3D addr_hi & 0xFF;
                     ~~~~~~~ ^
   drivers/net/usb/lan78xx.c:2008:2: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           ret =3D lan78xx_write_reg(dev, MII_ACC, addr);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:2008:2: note: Value stored to 'ret' is never r=
ead
           ret =3D lan78xx_write_reg(dev, MII_ACC, addr);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:2014:2: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           ret =3D lan78xx_read_reg(dev, MII_DATA, &val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:2014:2: note: Value stored to 'ret' is never r=
ead
           ret =3D lan78xx_read_reg(dev, MII_DATA, &val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:2044:2: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           ret =3D lan78xx_write_reg(dev, MII_DATA, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:2044:2: note: Value stored to 'ret' is never r=
ead
           ret =3D lan78xx_write_reg(dev, MII_DATA, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:2048:2: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           ret =3D lan78xx_write_reg(dev, MII_ACC, addr);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:2048:2: note: Value stored to 'ret' is never r=
ead
           ret =3D lan78xx_write_reg(dev, MII_ACC, addr);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:2136:3: warning: Value stored to 'temp' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   temp =3D phy_read(phydev, LAN88XX_INT_STS);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:2136:3: note: Value stored to 'temp' is never =
read
                   temp =3D phy_read(phydev, LAN88XX_INT_STS);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:2326:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D lan78xx_write_reg(dev, MAC_RGMII_ID,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:2326:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D lan78xx_write_reg(dev, MAC_RGMII_ID,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:2328:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D lan78xx_write_reg(dev, RGMII_TX_BYP_DLL, 0x3D00);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:2328:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D lan78xx_write_reg(dev, RGMII_TX_BYP_DLL, 0x3D00);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:2329:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D lan78xx_read_reg(dev, HW_CFG, &buf);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:2329:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D lan78xx_read_reg(dev, HW_CFG, &buf);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:2332:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D lan78xx_write_reg(dev, HW_CFG, buf);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:2332:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D lan78xx_write_reg(dev, HW_CFG, buf);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:2692:2: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           ret =3D lan78xx_read_reg(dev, USB_CFG1, &buf);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:2692:2: note: Value stored to 'ret' is never r=
ead
           ret =3D lan78xx_read_reg(dev, USB_CFG1, &buf);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:3610:3: warning: Value stored to 'rx_cmd_c' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   rx_cmd_c =3D get_unaligned_le16(skb->data);
                   ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:3610:3: note: Value stored to 'rx_cmd_c' is ne=
ver read
                   rx_cmd_c =3D get_unaligned_le16(skb->data);
                   ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/usb/lan78xx.c:3794:2: warning: Value stored to 'state' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           state =3D defer_bh(dev, skb, &dev->rxq, state);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:3794:2: note: Value stored to 'state' is never=
 read
           state =3D defer_bh(dev, skb, &dev->rxq, state);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:4444:2: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           ret =3D device_set_wakeup_enable(&udev->dev, true);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/lan78xx.c:4444:2: note: Value stored to 'ret' is never r=
ead
           ret =3D device_set_wakeup_enable(&udev->dev, true);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/tty/vt/vt.c:586:21: warning: Value stored to 'uniscr' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct uni_screen *uniscr =3D get_vc_uniscr(vc);
                              ^~~~~~
   drivers/tty/vt/vt.c:586:21: note: Value stored to 'uniscr' during its in=
itialization is never read
           struct uni_screen *uniscr =3D get_vc_uniscr(vc);
                              ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/i2c/busses/i2c-rk3x.c:504:9: warning: Access to field 'flags' re=
sults in a dereference of a null pointer (loaded from field 'msg') [clang-a=
nalyzer-core.NullDereference]
                   if (!(i2c->msg->flags & I2C_M_IGNORE_NAK))
                         ^
   drivers/i2c/busses/i2c-rk3x.c:1066:2: note: Loop condition is false.  Ex=
iting loop
           spin_lock_irqsave(&i2c->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:237:36: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                        ^
   include/linux/irqflags.h:169:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   drivers/i2c/busses/i2c-rk3x.c:1066:2: note: Loop condition is false.  Ex=
iting loop
           spin_lock_irqsave(&i2c->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \

vim +/state +3794 drivers/net/usb/lan78xx.c

55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3736  =

55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3737  static void rx=
_complete(struct urb *urb)
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3738  {
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3739  	struct sk_buf=
f	*skb =3D (struct sk_buff *)urb->context;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3740  	struct skb_da=
ta	*entry =3D (struct skb_data *)skb->cb;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3741  	struct lan78x=
x_net *dev =3D entry->dev;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3742  	int urb_statu=
s =3D urb->status;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3743  	enum skb_stat=
e state;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3744  =

c450a8eb187a4d John Efstathiades         2021-11-18  3745  	netif_dbg(dev, =
rx_status, dev->net,
c450a8eb187a4d John Efstathiades         2021-11-18  3746  		  "rx done: st=
atus %d", urb->status);
c450a8eb187a4d John Efstathiades         2021-11-18  3747  =

55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3748  	skb_put(skb, =
urb->actual_length);
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3749  	state =3D rx_=
done;
c450a8eb187a4d John Efstathiades         2021-11-18  3750  =

c450a8eb187a4d John Efstathiades         2021-11-18  3751  	if (urb !=3D en=
try->urb)
c450a8eb187a4d John Efstathiades         2021-11-18  3752  		netif_warn(dev=
, rx_err, dev->net, "URB pointer mismatch");
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3753  =

55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3754  	switch (urb_s=
tatus) {
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3755  	case 0:
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3756  		if (skb->len=
 < dev->net->hard_header_len) {
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3757  			state =3D r=
x_cleanup;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3758  			dev->net->s=
tats.rx_errors++;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3759  			dev->net->s=
tats.rx_length_errors++;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3760  			netif_dbg(d=
ev, rx_err, dev->net,
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3761  				  "rx leng=
th %d\n", skb->len);
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3762  		}
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3763  		usb_mark_las=
t_busy(dev->udev);
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3764  		break;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3765  	case -EPIPE:
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3766  		dev->net->st=
ats.rx_errors++;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3767  		lan78xx_defe=
r_kevent(dev, EVENT_RX_HALT);
df561f6688fef7 Gustavo A. R. Silva       2020-08-23  3768  		fallthrough;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3769  	case -ECONNRE=
SET:				/* async unlink */
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3770  	case -ESHUTDO=
WN:				/* hardware gone */
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3771  		netif_dbg(de=
v, ifdown, dev->net,
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3772  			  "rx shutd=
own, code %d\n", urb_status);
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3773  		state =3D rx=
_cleanup;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3774  		break;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3775  	case -EPROTO:
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3776  	case -ETIME:
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3777  	case -EILSEQ:
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3778  		dev->net->st=
ats.rx_errors++;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3779  		state =3D rx=
_cleanup;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3780  		break;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3781  =

55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3782  	/* data overr=
un ... flush fifo? */
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3783  	case -EOVERFL=
OW:
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3784  		dev->net->st=
ats.rx_over_errors++;
df561f6688fef7 Gustavo A. R. Silva       2020-08-23  3785  		fallthrough;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3786  =

55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3787  	default:
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3788  		state =3D rx=
_cleanup;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3789  		dev->net->st=
ats.rx_errors++;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3790  		netif_dbg(de=
v, rx_err, dev->net, "rx status %d\n", urb_status);
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3791  		break;
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3792  	}
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3793  =

55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30 @3794  	state =3D def=
er_bh(dev, skb, &dev->rxq, state);
c450a8eb187a4d John Efstathiades         2021-11-18  3795  }
55d7de9de6c30a Woojung.Huh(a)microchip.com 2015-07-30  3796  =


:::::: The code at line 3794 was first introduced by commit
:::::: 55d7de9de6c30adce8d675c7ce513e283829c2ff Microchip's LAN7800 family =
USB 2/3 to 10/100/1000 Ethernet device driver

:::::: TO: Woojung.Huh(a)microchip.com <Woojung.Huh@microchip.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0504661783274678920==--

