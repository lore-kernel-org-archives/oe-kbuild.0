Content-Type: multipart/mixed; boundary="===============8412105828832372950=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10407/12552] drivers/usb/gadget/udc/renesas_usb3.c:1063:14: warning: use of uninitialized value '((unsigned char*)&*(struct usb_request *)usb3_req)[26]' [CWE-457]
Date: Mon, 25 Jul 2022 21:42:30 +0800
Message-ID: <202207252132.CqsKFXCg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8412105828832372950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/usb/gadget/udc/renesas_usb3.c:1063:14: warning: use of uninitializ=
ed value '((unsigned char*)&*(struct usb_request *)usb3_req)[26]' [CWE-457]=
 [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Uros Bizjak <ubizjak@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   18c107a1f120d095404d141dfad8f594bdc44020
commit: 43c249ea0b1e10baac4a1264a25d69723ce5d2c2 [10407/12552] compiler-gcc=
.h: remove ancient workaround for gcc PR 58670
:::::: branch date: 3 days ago
:::::: commit date: 8 days ago
config: arm-randconfig-c002-20220724 (https://download.01.org/0day-ci/archi=
ve/20220725/202207252132.CqsKFXCg-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D43c249ea0b1e10baac4a1264a25d69723ce5d2c2
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 43c249ea0b1e10baac4a1264a25d69723ce5d2c2
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
                            |      |            |
                            |      |            (18) following 'true' branc=
h...
                            | 1898 |                 usb3_irq_epc_pipe0_set=
up(usb3);
                            |      |                 ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
                            |      |                 |
                            |      |                 (19) ...to here
                            |      |                 (20) calling 'usb3_irq=
_epc_pipe0_setup' from 'usb3_irq_epc_pipe0'
                            |
                            +--> 'usb3_irq_epc_pipe0_setup': events 21-24
                                   |
                                   | 1861 | static void usb3_irq_epc_pipe0_=
setup(struct renesas_usb3 *usb3)
                                   |      |             ^~~~~~~~~~~~~~~~~~~=
~~~~~
                                   |      |             |
                                   |      |             (21) entry to 'usb3=
_irq_epc_pipe0_setup'
                                   |......
                                   | 1867 |         if (usb3_ep->started)
                                   |      |            ~ =

                                   |      |            |
                                   |      |            (22) following 'true=
' branch...
                                   | 1868 |                 usb3_request_do=
ne(usb3_ep, usb3_get_request(usb3_ep),
                                   |      |                 ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |                 |
                                   |      |                 (23) ...to here
                                   |      |                 (24) calling 'u=
sb3_get_request' from 'usb3_irq_epc_pipe0_setup'
                                   | 1869 |                                =
   -ECONNRESET);
                                   |      |                                =
   ~~~~~~~~~~~~
                                   |
                                   +--> 'usb3_get_request': event 25
                                          |
                                          |  892 | static struct renesas_us=
b3_request *usb3_get_request(struct renesas_usb3_ep
                                          |      |                         =
            ^~~~~~~~~~~~~~~~
                                          |      |                         =
            |
                                          |      |                         =
            (25) entry to 'usb3_get_request'
                                          |
                                        'usb3_get_request': event 26
                                          |
                                          |include/linux/list.h:555:59:
                                          |  555 |         pos__ !=3D head_=
_ ? list_entry(pos__, type, member) : NULL; \
   drivers/usb/gadget/udc/renesas_usb3.c:888:16: note: in expansion of macr=
o 'list_first_entry_or_null'
                                          |  888 |         return list_firs=
t_entry_or_null(&usb3_ep->queue,
                                          |      |                ^~~~~~~~~=
~~~~~~~~~~~~~~~
                                          |
                                        'usb3_get_request': event 27
                                          |
                                          |include/linux/spinlock.h:280:17:
                                          |  280 |                 _raw_spi=
n_unlock_irqrestore(lock, flags);       \
                                          |      |                 ^~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                          |      |                 |
                                          |      |                 (27) ...=
to here
   include/linux/spinlock.h:404:9: note: in expansion of macro 'raw_spin_un=
lock_irqrestore'
                                          |  404 |         raw_spin_unlock_=
irqrestore(&lock->rlock, flags);
                                          |      |         ^~~~~~~~~~~~~~~~=
~~~~~~~~~~
                                          |
                                   <------+
                                   |
                                 'usb3_irq_epc_pipe0_setup': events 28-29
                                   |
                                   |drivers/usb/gadget/udc/renesas_usb3.c:1=
868:17:
                                   | 1868 |                 usb3_request_do=
ne(usb3_ep, usb3_get_request(usb3_ep),
                                   |      |                 ^~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |                 |
                                   |      |                 (28) returning =
to 'usb3_irq_epc_pipe0_setup' from 'usb3_get_request'
                                   |      |                 (29) calling 'u=
sb3_request_done' from 'usb3_irq_epc_pipe0_setup'
                                   | 1869 |                                =
   -ECONNRESET);
                                   |      |                                =
   ~~~~~~~~~~~~
                                   |
                                   +--> 'usb3_request_done': events 30-31
                                          |
                                          |  923 | static void usb3_request=
_done(struct renesas_usb3_ep *usb3_ep,
                                          |      |             ^~~~~~~~~~~~=
~~~~~
                                          |      |             |
                                          |      |             (30) entry t=
o 'usb3_request_done'
                                          |......
                                          |  930 |         __usb3_request_d=
one(usb3_ep, usb3_req, status);
                                          |      |         ~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                          |      |         |
                                          |      |         (31) calling '__=
usb3_request_done' from 'usb3_request_done'
                                          |
                                          +--> '__usb3_request_done': event=
 32
                                                 |
                                                 |  906 | static void __usb=
3_request_done(struct renesas_usb3_ep *usb3_ep,
                                                 |      |             ^~~~~=
~~~~~~~~~~~~~~
                                                 |      |             |
                                                 |      |             (32) =
entry to '__usb3_request_done'
                                                 |
                                               '__usb3_request_done': event=
 33
                                                 |
                                                 |include/asm-generic/rwonc=
e.h:55:37:
                                                 |   55 |         *(volatil=
e typeof(x) *)&(x) =3D (val);                            \
                                                 |      |         ~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~^~~~~~~
                                                 |      |                  =
                   |
                                                 |      |                  =
                   (33) dereference of NULL 'usb3_req'
   include/asm-generic/rwonce.h:61:9: note: in expansion of macro '__WRITE_=
ONCE'
                                                 |   61 |         __WRITE_O=
NCE(x, val);                                           \
                                                 |      |         ^~~~~~~~~=
~~~
   include/linux/list.h:37:9: note: in expansion of macro 'WRITE_ONCE'
                                                 |   37 |         WRITE_ONC=
E(list->next, list);
                                                 |      |         ^~~~~~~~~~
                                                 |
   drivers/usb/gadget/udc/renesas_usb3.c: In function 'usb3_is_transfer_com=
plete':
>> drivers/usb/gadget/udc/renesas_usb3.c:1063:14: warning: use of uninitial=
ized value '((unsigned char*)&*(struct usb_request *)usb3_req)[26]' [CWE-45=
7] [-Wanalyzer-use-of-uninitialized-value]
    1063 |         if ((!req->zero && req->actual =3D=3D req->length) ||
         |              ^~~~~~~~~~
     'renesas_usb3_ep_dequeue': events 1-2
       |
       | 2227 | static int renesas_usb3_ep_dequeue(struct usb_ep *_ep, stru=
ct usb_request *_req)
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'renesas_usb3_ep_dequeue'
       |......
       | 2237 |         usb3_request_done_pipen(usb3, usb3_ep, usb3_req, -E=
CONNRESET);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'usb3_request_done_pipen' from 'renesas=
_usb3_ep_dequeue'
       |
       +--> 'usb3_request_done_pipen': events 3-4
              |
              | 1903 | static void usb3_request_done_pipen(struct renesas_u=
sb3 *usb3,
              |      |             ^~~~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (3) entry to 'usb3_request_done_pipen'
              |......
              | 1919 |         usb3_req =3D usb3_get_request(usb3_ep);
              |      |                    ~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                    |
              |      |                    (4) calling 'usb3_get_request' fr=
om 'usb3_request_done_pipen'
              |
              +--> 'usb3_get_request': event 5
                     |
                     |  892 | static struct renesas_usb3_request *usb3_get_=
request(struct renesas_usb3_ep
                     |      |                                     ^~~~~~~~~=
~~~~~~~
                     |      |                                     |
                     |      |                                     (5) entry=
 to 'usb3_get_request'
                     |
                   'usb3_get_request': event 6
                     |
                     |include/linux/list.h:555:59:
                     |  555 |         pos__ !=3D head__ ? list_entry(pos__,=
 type, member) : NULL; \
   drivers/usb/gadget/udc/renesas_usb3.c:888:16: note: in expansion of macr=
o 'list_first_entry_or_null'
                     |  888 |         return list_first_entry_or_null(&usb3=
_ep->queue,
                     |      |                ^~~~~~~~~~~~~~~~~~~~~~~~
                     |
                   'usb3_get_request': event 7
                     |
                     |include/linux/container_of.h:22:10:
                     |   22 |         ((type *)(__mptr - offsetof(type, mem=
ber))); })
                     |      |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
                     |      |          |
                     |      |          (7) ...to here
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
                     |  520 |         container_of(ptr, type, member)
                     |      |         ^~~~~~~~~~~~
   include/linux/list.h:555:27: note: in expansion of macro 'list_entry'
                     |  555 |         pos__ !=3D head__ ? list_entry(pos__,=
 type, member) : NULL; \
                     |      |                           ^~~~~~~~~~
   drivers/usb/gadget/udc/renesas_usb3.c:888:16: note: in expansion of macr=
o 'list_first_entry_or_null'
                     |  888 |         return list_first_entry_or_null(&usb3=
_ep->queue,
                     |      |                ^~~~~~~~~~~~~~~~~~~~~~~~
                     |
              <------+
              |
            'usb3_request_done_pipen': events 8-11
              |
              | 1919 |         usb3_req =3D usb3_get_request(usb3_ep);
              |      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                    |
              |      |                    (8) returning to 'usb3_request_do=
ne_pipen' from 'usb3_get_request'
              | 1920 |         if (usb3_req)
              |      |            ~        =

              |      |            |
              |      |            (9) following 'true' branch (when 'usb3_r=
eq' is non-NULL)...
              | 1921 |                 usb3_start_pipen(usb3_ep, usb3_req);
              |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                 |
              |      |                 (10) ...to here
              |      |                 (11) calling 'usb3_start_pipen' from=
 'usb3_request_done_pipen'
              |
              +--> 'usb3_start_pipen': events 12-13
                     |
                     | 1487 | static void usb3_start_pipen(struct renesas_u=
sb3_ep *usb3_ep,
                     |      |             ^~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (12) entry to 'usb3_start_pipen'
                     |......
                     | 1497 |         if (usb3_ep->halt || usb3_ep->started)
                     |      |            ~ =

                     |      |            |
                     |      |            (13) following 'false' branch...
                     |
                   'usb3_start_pipen': event 14
                     |
                     |include/linux/list.h:553:27:
                     |  553 |         struct list_head *head__ =3D (ptr); \
                     |      |                           ^~~~~~
                     |      |                           |
                     |      |                           (14) ...to here
   drivers/usb/gadget/udc/renesas_usb3.c:888:16: note: in expansion of macr=
o 'list_first_entry_or_null'
                     |  888 |         return list_first_entry_or_null(&usb3=
_ep->queue,
                     |      |                ^~~~~~~~~~~~~~~~~~~~~~~~
                     |
                   'usb3_start_pipen': events 15-19

vim +1063 drivers/usb/gadget/udc/renesas_usb3.c

746bfe63bba37a Yoshihiro Shimoda 2015-12-21  1057  =

746bfe63bba37a Yoshihiro Shimoda 2015-12-21  1058  static bool usb3_is_tran=
sfer_complete(struct renesas_usb3_ep *usb3_ep,
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  1059  				      struct renesas=
_usb3_request *usb3_req)
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  1060  {
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  1061  	struct usb_request *req=
 =3D &usb3_req->req;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  1062  =

746bfe63bba37a Yoshihiro Shimoda 2015-12-21 @1063  	if ((!req->zero && req-=
>actual =3D=3D req->length) ||
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  1064  	    (req->actual % usb3=
_ep->ep.maxpacket) || (req->length =3D=3D 0))
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  1065  		return true;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  1066  	else
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  1067  		return false;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  1068  }
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  1069  =


:::::: The code at line 1063 was first introduced by commit
:::::: 746bfe63bba37ad55956b7377c9af494e7e28929 usb: gadget: renesas_usb3: =
add support for Renesas USB3.0 peripheral controller

:::::: TO: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
:::::: CC: Felipe Balbi <balbi@ti.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8412105828832372950==--

