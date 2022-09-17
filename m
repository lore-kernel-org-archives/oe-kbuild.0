Content-Type: multipart/mixed; boundary="===============2187642926658163582=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/uio.h:246:17: warning: use of uninitialized value 'msg_sys.msg_iter.count' [CWE-457]
Date: Sun, 18 Sep 2022 01:25:24 +0800
Message-ID: <202209180116.OgwNtwbK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2187642926658163582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/uio.h:246:17: warning: use of uninitialized value 'msg_sys.m=
sg_iter.count' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a335366bad1364a07f49df9da1fdfa6d411a5f39
commit: a1a5482a2c6e38a3ebed32e571625c56a8cc41a6 x86/extable: Fix ex_handle=
r_msr() print condition
date:   8 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-c002-20220917 (https://download.01.org/0day-ci/archi=
ve/20220918/202209180116.OgwNtwbK-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da1a5482a2c6e38a3ebed32e571625c56a8cc41a6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a1a5482a2c6e38a3ebed32e571625c56a8cc41a6
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/socket.h:8,
                    from include/net/flow.h:11,
                    from include/net/net_namespace.h:15,
                    from include/linux/netdevice.h:38,
                    from include/net/sock.h:46,
                    from include/linux/bpf-cgroup.h:11,
                    from net/socket.c:55:
   In function 'iov_iter_count',
       inlined from 'msg_data_left' at include/linux/socket.h:164:9,
       inlined from '__sys_sendmmsg' at net/socket.c:2640:7:
>> include/linux/uio.h:246:17: warning: use of uninitialized value 'msg_sys=
.msg_iter.count' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     246 |         return i->count;
         |                ~^~~~~~~
     '__se_sys_sendmmsg': event 1
       |
       |include/linux/syscalls.h:247:25:
       |  247 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__=
VA_ARGS__))  \
       |      |                         ^~~~~~~~
       |      |                         |
       |      |                         (1) entry to '__se_sys_sendmmsg'
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_D=
EFINEx'
       |  228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
       |      |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DE=
FINEx'
       |  220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##na=
me, __VA_ARGS__)
       |      |                                    ^~~~~~~~~~~~~~~
   net/socket.c:2654:1: note: in expansion of macro 'SYSCALL_DEFINE4'
       | 2654 | SYSCALL_DEFINE4(sendmmsg, int, fd, struct mmsghdr __user *,=
 mmsg,
       |      | ^~~~~~~~~~~~~~~
       |
     '__se_sys_sendmmsg': event 2
       |
       | 2657 |         return __sys_sendmmsg(fd, mmsg, vlen, flags, true);
       |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (2) calling '__sys_sendmmsg' from '__se_sys_=
sendmmsg'
       |
       +--> '__sys_sendmmsg': events 3-5
              |
              | 2587 | int __sys_sendmmsg(int fd, struct mmsghdr __user *mm=
sg, unsigned int vlen,
              |      |     ^~~~~~~~~~~~~~
              |      |     |
              |      |     (3) entry to '__sys_sendmmsg'
              |......
              | 2594 |         struct msghdr msg_sys;
              |      |                       ~~~~~~~
              |      |                       |
              |      |                       (4) region created on stack he=
re
              |......
              | 2606 |         sock =3D sockfd_lookup_light(fd, &err, &fput=
_needed);
              |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
              |      |                |
              |      |                (5) calling 'sockfd_lookup_light' fro=
m '__sys_sendmmsg'
              |
              +--> 'sockfd_lookup_light': events 6-11
                     |
                     |  506 |         if (file->f_op =3D=3D &socket_file_op=
s)
                     |      |            ~~~~~~~~~~~ =

                     |      |            |    |
                     |      |            |    (8) ...to here
                     |      |            (9) following 'true' branch...
                     |  507 |                 return file->private_data;   =
   /* set in sock_alloc_file */
                     |      |                        ~~~~~~~~~~~~~~~~~~
                     |      |                            |
                     |      |                            (10) ...to here
                     |......
                     |  546 | static struct socket *sockfd_lookup_light(int=
 fd, int *err, int *fput_needed)
                     |      |                       ^~~~~~~~~~~~~~~~~~~
                     |      |                       |
                     |      |                       (6) entry to 'sockfd_lo=
okup_light'
                     |......
                     |  552 |         if (f.file) {
                     |      |            ~           =

                     |      |            |
                     |      |            (7) following 'true' branch...
                     |  553 |                 sock =3D sock_from_file(f.fil=
e);
                     |  554 |                 if (likely(sock)) {
                     |      |                    ~   =

                     |      |                    |
                     |      |                    (11) following 'true' bran=
ch...
                     |
                   'sockfd_lookup_light': event 12
                     |
                     |  555 |                         *fput_needed =3D f.fl=
ags & FDPUT_FPUT;
                     |
              <------+
              |
            '__sys_sendmmsg': events 13-14
              |
              | 2606 |         sock =3D sockfd_lookup_light(fd, &err, &fput=
_needed);
              |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
              |      |                |
              |      |                (13) returning to '__sys_sendmmsg' fr=
om 'sockfd_lookup_light'
              | 2607 |         if (!sock)
              |      |            ~    =

              |      |            |
              |      |            (14) following 'false' branch (when 'sock=
' is non-NULL)...
              |
            '__sys_sendmmsg': events 15-20
              |
              | 2610 |         used_address.name_len =3D UINT_MAX;
              |......
              | 2616 |         while (datagrams < vlen) {
              |      |                ~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (16) following 'true' branc=
h...
              | 2617 |                 if (datagrams =3D=3D vlen - 1)
              |      |                    ~             ~~~~~~~~
              |      |                    |                  |
              |      |                    |                  (17) ...to here
              |      |                    (18) following 'false' branch...

vim +246 include/linux/uio.h

4b8164b91d9fdf Al Viro         2015-01-31  243  =

b57332b4105abf Al Viro         2016-10-10  244  static inline size_t iov_it=
er_count(const struct iov_iter *i)
9223687863ffa6 Kent Overstreet 2013-11-27  245  {
9223687863ffa6 Kent Overstreet 2013-11-27 @246  	return i->count;
9223687863ffa6 Kent Overstreet 2013-11-27  247  }
9223687863ffa6 Kent Overstreet 2013-11-27  248  =


:::::: The code at line 246 was first introduced by commit
:::::: 9223687863ffa63fa655f52ef64148ee08dee4d1 iov_iter: Move iov_iter to =
uio.h

:::::: TO: Kent Overstreet <kmo@daterainc.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2187642926658163582==--

