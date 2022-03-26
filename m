Content-Type: multipart/mixed; boundary="===============7694123437503675184=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/serial/usb-serial.c:719:5: warning: Value stored to 'addr' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 26 Mar 2022 15:40:22 +0800
Message-ID: <202203261526.PTM6zB63-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7694123437503675184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Johan Hovold <johan@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   52d543b5497cf31d6baeb0bcfe5a5474c3238578
commit: b3431093ad05c5242d87fcf94bddc7a84a2134f5 USB: serial: refactor endp=
oint classification
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20220324 (https://download.01.org/0day-ci/archi=
ve/20220326/202203261526.PTM6zB63-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 902f47=
08fe1d03b0de7e5315ef875006a6adc319)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db3431093ad05c5242d87fcf94bddc7a84a2134f5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b3431093ad05c5242d87fcf94bddc7a84a2134f5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           dev_dbg(fe->dvb->device, "%s:\n", __func__);
           ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/media/dvb-core/dvb_frontend.c:247:7: note: Assuming the conditio=
n is true
           if ((status & FE_HAS_LOCK) && has_get_frontend(fe))
                ^~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-core/dvb_frontend.c:247:6: note: Left side of '&&' is =
true
           if ((status & FE_HAS_LOCK) && has_get_frontend(fe))
               ^
   drivers/media/dvb-core/dvb_frontend.c:247:32: note: Assuming the conditi=
on is true
           if ((status & FE_HAS_LOCK) && has_get_frontend(fe))
                                         ^~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-core/dvb_frontend.c:247:2: note: Taking true branch
           if ((status & FE_HAS_LOCK) && has_get_frontend(fe))
           ^
   drivers/media/dvb-core/dvb_frontend.c:252:8: note: Access to field 'even=
tw' results in a dereference of a null pointer (loaded from variable 'event=
s')
           wp =3D (events->eventw + 1) % MAX_EVENT;
                 ^~~~~~
   drivers/media/dvb-core/dvb_frontend.c:354:23: warning: Value stored to '=
fe' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct dvb_frontend *fe =3D fepriv->dvbdev->priv;
                                ^~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-core/dvb_frontend.c:354:23: note: Value stored to 'fe'=
 during its initialization is never read
           struct dvb_frontend *fe =3D fepriv->dvbdev->priv;
                                ^~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/usb/serial/ir-usb.c:96:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &serial->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~
   drivers/usb/serial/ir-usb.c:96:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D &serial->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~
   drivers/usb/serial/ir-usb.c:209:2: warning: Value stored to 'rates' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           rates =3D le16_to_cpu(irda_desc->wBaudRate);
           ^
   drivers/usb/serial/ir-usb.c:209:2: note: Value stored to 'rates' is neve=
r read
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/usb/serial/keyspan.c:771:2: warning: Value stored to 'endpoint' =
is never read [clang-analyzer-deadcode.DeadStores]
           endpoint =3D usb_pipeendpoint(urb->pipe);
           ^
   drivers/usb/serial/keyspan.c:771:2: note: Value stored to 'endpoint' is =
never read
   drivers/usb/serial/keyspan.c:829:2: warning: Value stored to 'p_priv' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p_priv =3D usb_get_serial_port_data(port);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/keyspan.c:829:2: note: Value stored to 'p_priv' is ne=
ver read
           p_priv =3D usb_get_serial_port_data(port);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/keyspan.c:920:2: warning: Value stored to 'data' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           data =3D urb->transfer_buffer;
           ^      ~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/keyspan.c:920:2: note: Value stored to 'data' is neve=
r read
           data =3D urb->transfer_buffer;
           ^      ~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/keyspan.c:1122:2: warning: Value stored to 'endpoint'=
 is never read [clang-analyzer-deadcode.DeadStores]
           endpoint =3D usb_pipeendpoint(urb->pipe);
           ^
   drivers/usb/serial/keyspan.c:1122:2: note: Value stored to 'endpoint' is=
 never read
   drivers/usb/serial/keyspan.c:1184:2: warning: Value stored to 'len' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           len =3D 0;
           ^     ~
   drivers/usb/serial/keyspan.c:1184:2: note: Value stored to 'len' is neve=
r read
           len =3D 0;
           ^     ~
   drivers/usb/serial/keyspan.c:1251:2: warning: Value stored to 'endpoint'=
 is never read [clang-analyzer-deadcode.DeadStores]
           endpoint =3D usb_pipeendpoint(urb->pipe);
           ^
   drivers/usb/serial/keyspan.c:1251:2: note: Value stored to 'endpoint' is=
 never read
   drivers/usb/serial/keyspan.c:1732:3: warning: Value stored to 'ep_type_n=
ame' is never read [clang-analyzer-deadcode.DeadStores]
                   ep_type_name =3D "INT";
                   ^              ~~~~~
   drivers/usb/serial/keyspan.c:1732:3: note: Value stored to 'ep_type_name=
' is never read
                   ep_type_name =3D "INT";
                   ^              ~~~~~
   drivers/usb/serial/keyspan.c:1738:3: warning: Value stored to 'ep_type_n=
ame' is never read [clang-analyzer-deadcode.DeadStores]
                   ep_type_name =3D "BULK";
                   ^              ~~~~~~
   drivers/usb/serial/keyspan.c:1738:3: note: Value stored to 'ep_type_name=
' is never read
                   ep_type_name =3D "BULK";
                   ^              ~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/usb/class/usblp.c:369:7: warning: Although the value stored to '=
error' is used in the enclosing expression, the value is never actually rea=
d from 'error' [clang-analyzer-deadcode.DeadStores]
           if ((error =3D usblp_read_status(usblp, usblp->statusbuf)) < 0) {
                ^
   drivers/usb/class/usblp.c:369:7: note: Although the value stored to 'err=
or' is used in the enclosing expression, the value is never actually read f=
rom 'error'
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/usb/serial/usb-serial.c:718:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &serial->interface->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/usb-serial.c:718:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D &serial->interface->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/serial/usb-serial.c:719:5: warning: Value stored to 'addr' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           u8 addr =3D epd->bEndpointAddress;
              ^~~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/usb-serial.c:719:5: note: Value stored to 'addr' duri=
ng its initialization is never read
           u8 addr =3D epd->bEndpointAddress;
              ^~~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/usb-serial.c:1419:2: warning: Value stored to 'rc' is=
 never read [clang-analyzer-deadcode.DeadStores]
           rc =3D driver_attach(&udriver->drvwrap.driver);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/usb-serial.c:1419:2: note: Value stored to 'rc' is ne=
ver read
           rc =3D driver_attach(&udriver->drvwrap.driver);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   include/linux/list.h:135:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   sound/core/rawmidi.c:1756:9: note: Calling 'snd_rawmidi_free'
           return snd_rawmidi_free(rmidi);
                  ^~~~~~~~~~~~~~~~~~~~~~~
   sound/core/rawmidi.c:1734:6: note: Assuming 'rmidi' is non-null
           if (!rmidi)
               ^~~~~~
   sound/core/rawmidi.c:1734:2: note: Taking false branch
           if (!rmidi)
           ^
   sound/core/rawmidi.c:1740:6: note: Assuming field 'ops' is null
           if (rmidi->ops && rmidi->ops->dev_unregister)
               ^~~~~~~~~~
   sound/core/rawmidi.c:1740:17: note: Left side of '&&' is false
           if (rmidi->ops && rmidi->ops->dev_unregister)
                          ^
   sound/core/rawmidi.c:1744:2: note: Calling 'snd_rawmidi_free_substreams'
           snd_rawmidi_free_substreams(&rmidi->streams[SNDRV_RAWMIDI_STREAM=
_INPUT]);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   sound/core/rawmidi.c:1725:2: note: Loop condition is true.  Entering loo=
p body
           while (!list_empty(&stream->substreams)) {
           ^
   sound/core/rawmidi.c:1726:15: note: Left side of '&&' is false
                   substream =3D list_entry(stream->substreams.next, struct=
 snd_rawmidi_substream, list);
                               ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   sound/core/rawmidi.c:1726:15: note: Taking false branch
                   substream =3D list_entry(stream->substreams.next, struct=
 snd_rawmidi_substream, list);
                               ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   sound/core/rawmidi.c:1726:15: note: Loop condition is false.  Exiting lo=
op
                   substream =3D list_entry(stream->substreams.next, struct=
 snd_rawmidi_substream, list);
                               ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   sound/core/rawmidi.c:1728:3: note: Memory is released
                   kfree(substream);
                   ^~~~~~~~~~~~~~~~
   sound/core/rawmidi.c:1725:2: note: Loop condition is true.  Entering loo=
p body
           while (!list_empty(&stream->substreams)) {
           ^
   sound/core/rawmidi.c:1726:15: note: Left side of '&&' is false
                   substream =3D list_entry(stream->substreams.next, struct=
 snd_rawmidi_substream, list);
                               ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)

vim +/addr +719 drivers/usb/serial/usb-serial.c

335f8514f200e63 Alan Cox     2009-06-11  713  =

b3431093ad05c52 Johan Hovold 2021-03-30  714  static void store_endpoint(st=
ruct usb_serial *serial,
b3431093ad05c52 Johan Hovold 2021-03-30  715  					struct usb_serial_endpoi=
nts *epds,
b3431093ad05c52 Johan Hovold 2021-03-30  716  					struct usb_endpoint_desc=
riptor *epd)
1546e6aecb2490c Johan Hovold 2014-08-21  717  {
1546e6aecb2490c Johan Hovold 2014-08-21 @718  	struct device *dev =3D &seri=
al->interface->dev;
b3431093ad05c52 Johan Hovold 2021-03-30 @719  	u8 addr =3D epd->bEndpointAd=
dress;
1546e6aecb2490c Johan Hovold 2014-08-21  720  =

1546e6aecb2490c Johan Hovold 2014-08-21  721  	if (usb_endpoint_is_bulk_in(=
epd)) {
b3431093ad05c52 Johan Hovold 2021-03-30  722  		if (epds->num_bulk_in =3D=
=3D ARRAY_SIZE(epds->bulk_in))
b3431093ad05c52 Johan Hovold 2021-03-30  723  			return;
b3431093ad05c52 Johan Hovold 2021-03-30  724  		dev_dbg(dev, "found bulk in=
 endpoint %02x\n", addr);
1546e6aecb2490c Johan Hovold 2014-08-21  725  		epds->bulk_in[epds->num_bul=
k_in++] =3D epd;
1546e6aecb2490c Johan Hovold 2014-08-21  726  	} else if (usb_endpoint_is_b=
ulk_out(epd)) {
b3431093ad05c52 Johan Hovold 2021-03-30  727  		if (epds->num_bulk_out =3D=
=3D ARRAY_SIZE(epds->bulk_out))
b3431093ad05c52 Johan Hovold 2021-03-30  728  			return;
b3431093ad05c52 Johan Hovold 2021-03-30  729  		dev_dbg(dev, "found bulk ou=
t endpoint %02x\n", addr);
1546e6aecb2490c Johan Hovold 2014-08-21  730  		epds->bulk_out[epds->num_bu=
lk_out++] =3D epd;
1546e6aecb2490c Johan Hovold 2014-08-21  731  	} else if (usb_endpoint_is_i=
nt_in(epd)) {
b3431093ad05c52 Johan Hovold 2021-03-30  732  		if (epds->num_interrupt_in =
=3D=3D ARRAY_SIZE(epds->interrupt_in))
b3431093ad05c52 Johan Hovold 2021-03-30  733  			return;
b3431093ad05c52 Johan Hovold 2021-03-30  734  		dev_dbg(dev, "found interru=
pt in endpoint %02x\n", addr);
1546e6aecb2490c Johan Hovold 2014-08-21  735  		epds->interrupt_in[epds->nu=
m_interrupt_in++] =3D epd;
1546e6aecb2490c Johan Hovold 2014-08-21  736  	} else if (usb_endpoint_is_i=
nt_out(epd)) {
b3431093ad05c52 Johan Hovold 2021-03-30  737  		if (epds->num_interrupt_out=
 =3D=3D ARRAY_SIZE(epds->interrupt_out))
b3431093ad05c52 Johan Hovold 2021-03-30  738  			return;
b3431093ad05c52 Johan Hovold 2021-03-30  739  		dev_dbg(dev, "found interru=
pt out endpoint %02x\n", addr);
1546e6aecb2490c Johan Hovold 2014-08-21  740  		epds->interrupt_out[epds->n=
um_interrupt_out++] =3D epd;
1546e6aecb2490c Johan Hovold 2014-08-21  741  	}
1546e6aecb2490c Johan Hovold 2014-08-21  742  }
b3431093ad05c52 Johan Hovold 2021-03-30  743  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7694123437503675184==--

