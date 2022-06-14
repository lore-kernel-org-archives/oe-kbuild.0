Content-Type: multipart/mixed; boundary="===============6935036605685384403=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/asm-generic/bitops/non-atomic.h:118:27: warning: dereference of NULL 'other' [CWE-476]
Date: Tue, 14 Jun 2022 10:48:04 +0800
Message-ID: <202206141041.l4fkRJxA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6935036605685384403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: include/a=
sm-generic/bitops/non-atomic.h:118:27: warning: dereference of NULL 'other'=
 [CWE-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: 9248e52fec9536590852844b0634b5d20483c1ab locking/atomic: simplify n=
on-atomic wrappers
date:   10 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220611 (https://download.01.org/0day-ci/archi=
ve/20220614/202206141041.l4fkRJxA-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9248e52fec9536590852844b0634b5d20483c1ab
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9248e52fec9536590852844b0634b5d20483c1ab
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from arch/arm/include/asm/bitops.h:123,
                    from include/linux/bitops.h:32,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from net/unix/af_unix.c:80:
   net/unix/af_unix.c: In function 'unix_dgram_disconnected':
>> include/asm-generic/bitops/non-atomic.h:118:27: warning: dereference of =
NULL 'other' [CWE-476] [-Wanalyzer-null-dereference]
     118 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG=
-1)));
         |                       ~~~~^~~~~~~~~~~~~~
     'unix_seqpacket_sendmsg.part.0': events 1-2
       |
       |net/unix/af_unix.c:2039:12:
       | 2039 | static int unix_seqpacket_sendmsg(struct socket *sock, stru=
ct msghdr *msg,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'unix_seqpacket_sendmsg.part.0'
       |......
       | 2055 |         return unix_dgram_sendmsg(sock, msg, len);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (2) calling 'unix_dgram_sendmsg' from 'unix_=
seqpacket_sendmsg.part.0'
       |
       +--> 'unix_dgram_sendmsg': events 3-4
              |
              | 1615 | static int unix_dgram_sendmsg(struct socket *sock, s=
truct msghdr *msg,
              |      |            ^~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'unix_dgram_sendmsg'
              |......
              | 1633 |         err =3D scm_send(sock, msg, &scm, false);
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (4) calling 'scm_send' from 'unix_dgra=
m_sendmsg'
              |
              +--> 'scm_send': events 5-7
                     |
                     |include/net/scm.h:78:23:
                     |   78 | static __inline__ int scm_send(struct socket =
*sock, struct msghdr *msg,
                     |      |                       ^~~~~~~~
                     |      |                       |
                     |      |                       (5) entry to 'scm_send'
                     |......
                     |   84 |         if (forcecreds)
                     |      |            ~           =

                     |      |            |
                     |      |            (6) following 'false' branch (when=
 'forcecreds =3D=3D 0')...
                     |......
                     |   87 |         if (msg->msg_controllen <=3D 0)
                     |      |             ~~~~~~~~~~~~~~~~~~~
                     |      |                |
                     |      |                (7) ...to here
                     |
              <------+
              |
            'unix_dgram_sendmsg': events 8-9
              |
              |net/unix/af_unix.c:1633:15:
              | 1633 |         err =3D scm_send(sock, msg, &scm, false);
              |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (8) returning to 'unix_dgram_sendmsg' =
from 'scm_send'
              | 1634 |         if (err < 0)
              |      |            ~   =

              |      |            |
              |      |            (9) following 'false' branch...
              |
            'unix_dgram_sendmsg': events 10-13
              |
              | 1637 |         err =3D -EOPNOTSUPP;
              | 1638 |         if (msg->msg_flags&MSG_OOB)
              |      |            ~ =

              |      |            |
              |      |            (11) following 'false' branch...
              |......
              | 1641 |         if (msg->msg_namelen) {
              |      |            ~~~~~~~~~~~~~~~~~
              |      |            |   |
              |      |            |   (12) ...to here
              |      |            (13) following 'false' branch...
              |
            'unix_dgram_sendmsg': events 14-15
              |
              | 1648 |                 err =3D -ENOTCONN;
              | 1649 |                 other =3D unix_peer_get(sk);
              | 1650 |                 if (!other)
              |      |                    ~ =

              |      |                    |
              |      |                    (15) following 'false' branch (wh=
en 'other' is non-NULL)...
              |
            'unix_dgram_sendmsg': event 16
              |
              |include/asm-generic/bitops/non-atomic.h:118:27:
              |  118 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (B=
ITS_PER_LONG-1)));
              |      |                       ~~~~^~~~~~~~~~~~~~
              |      |                           |
              |      |                           (16) ...to here
              |
            'unix_dgram_sendmsg': events 17-24
              |
              |net/unix/af_unix.c:1659:12:
              | 1659 |         if (len > sk->sk_sndbuf - 32)
              |      |            ^
              |      |            |
              |      |            (17) following 'false' branch...
              |......
              | 1662 |         if (len > SKB_MAX_ALLOC) {
              |      |            ~

vim +/other +118 include/asm-generic/bitops/non-atomic.h

4117b02132d1cf Akinobu Mita 2006-03-26  109  =

4117b02132d1cf Akinobu Mita 2006-03-26  110  /**
cf3ee3c8c29dc3 Mark Rutland 2021-07-13  111   * arch_test_bit - Determine w=
hether a bit is set
4117b02132d1cf Akinobu Mita 2006-03-26  112   * @nr: bit number to test
4117b02132d1cf Akinobu Mita 2006-03-26  113   * @addr: Address to start cou=
nting from
4117b02132d1cf Akinobu Mita 2006-03-26  114   */
cf3ee3c8c29dc3 Mark Rutland 2021-07-13  115  static __always_inline int
cf3ee3c8c29dc3 Mark Rutland 2021-07-13  116  arch_test_bit(int nr, const vo=
latile unsigned long *addr)
4117b02132d1cf Akinobu Mita 2006-03-26  117  {
d05be13bcc6ec6 Jiri Slaby   2007-10-18 @118  	return 1UL & (addr[BIT_WORD(n=
r)] >> (nr & (BITS_PER_LONG-1)));
4117b02132d1cf Akinobu Mita 2006-03-26  119  }
9248e52fec9536 Mark Rutland 2021-07-21  120  #define test_bit arch_test_bit
4117b02132d1cf Akinobu Mita 2006-03-26  121  =


:::::: The code at line 118 was first introduced by commit
:::::: d05be13bcc6ec615fb2e9556a9b85d52800669b6 define first set of BIT* ma=
cros

:::::: TO: Jiri Slaby <jirislaby@gmail.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6935036605685384403==--

