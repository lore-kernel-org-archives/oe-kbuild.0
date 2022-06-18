Content-Type: multipart/mixed; boundary="===============3943569943438951130=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alobakin:bitops 6/7] include/linux/bitops.h:52:11: warning: dereference of NULL 'page' [CWE-476]
Date: Sat, 18 Jun 2022 16:16:55 +0800
Message-ID: <202206181646.CiDIiBIc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3943569943438951130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: include/l=
inux/bitops.h:52:11: warning: dereference of NULL 'page' [CWE-476] [-Wanaly=
zer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>

tree:   https://github.com/alobakin/linux bitops
head:   9bd39b17ce49d350eed93a031e0da6389067013e
commit: a8846f7b2f123f210694db27803e17fae1c15cbe [6/7] bitops: let optimize=
 out non-atomic bitops on compile-time constants
:::::: branch date: 18 hours ago
:::::: commit date: 20 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
618/202206181646.CiDIiBIc-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/alobakin/linux/commit/a8846f7b2f123f210694db27=
803e17fae1c15cbe
        git remote add alobakin https://github.com/alobakin/linux
        git fetch --no-tags alobakin bitops
        git checkout a8846f7b2f123f210694db27803e17fae1c15cbe
        # save the config file
         ARCH=3Di386 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   net/unix/af_unix.c: In function 'unix_dgram_disconnected':
>> net/unix/af_unix.c:208:35: warning: dereference of NULL 'other' [CWE-476=
] [-Wanalyzer-null-dereference]
     208 | #define unix_peer(sk) (unix_sk(sk)->peer)
         |                       ~~~~~~~~~~~~^~~~~~~
   net/unix/af_unix.c:537:53: note: in expansion of macro 'unix_peer'
     537 |                 if (!sock_flag(other, SOCK_DEAD) && unix_peer(ot=
her) =3D=3D sk) {
         |                                                     ^~~~~~~~~
     'unix_seqpacket_sendmsg.part.0': events 1-2
       |
       | 2329 | static int unix_seqpacket_sendmsg(struct socket *sock, stru=
ct msghdr *msg,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'unix_seqpacket_sendmsg.part.0'
       |......
       | 2345 |         return unix_dgram_sendmsg(sock, msg, len);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (2) calling 'unix_dgram_sendmsg' from 'unix_=
seqpacket_sendmsg.part.0'
       |
       +--> 'unix_dgram_sendmsg': events 3-4
              |
              | 1840 | static int unix_dgram_sendmsg(struct socket *sock, s=
truct msghdr *msg,
              |      |            ^~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'unix_dgram_sendmsg'
              |......
              | 1856 |         err =3D scm_send(sock, msg, &scm, false);
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (4) calling 'scm_send' from 'unix_dgra=
m_sendmsg'
              |
              +--> 'scm_send': event 5
                     |
                     |include/net/scm.h:78:23:
                     |   78 | static __inline__ int scm_send(struct socket =
*sock, struct msghdr *msg,
                     |      |                       ^~~~~~~~
                     |      |                       |
                     |      |                       (5) entry to 'scm_send'
                     |
                   'scm_send': event 6
                     |
                     |include/linux/fortify-string.h:274:12:
                     |  274 |         if (p_size !=3D (size_t)(-1) && p_siz=
e < size)
                     |      |            ^
                     |      |            |
                     |      |            (6) following 'false' branch...
                     |
                   'scm_send': event 7
                     |
                     |   47 | #define __underlying_memset     __builtin_mem=
set
                     |      |                                 ^
                     |      |                                 |
                     |      |                                 (7) ...to here
   include/linux/fortify-string.h:281:9: note: in expansion of macro '__und=
erlying_memset'
                     |  281 |         __underlying_memset(p, c, __fortify_s=
ize);                      \
                     |      |         ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:288:25: note: in expansion of macro '__fo=
rtify_memset_chk'
                     |  288 | #define memset(p, c, s) __fortify_memset_chk(=
p, c, s,                   \
                     |      |                         ^~~~~~~~~~~~~~~~~~~~
   include/net/scm.h:81:9: note: in expansion of macro 'memset'
                     |   81 |         memset(scm, 0, sizeof(*scm));
                     |      |         ^~~~~~
                     |
                   'scm_send': events 8-9
                     |
                     |   84 |         if (forcecreds)
                     |      |            ^
                     |      |            |
                     |      |            (8) following 'false' branch (when=
 'forcecreds =3D=3D 0')...
                     |   85 |                 scm_set_cred(scm, task_tgid(c=
urrent), current_uid(), current_gid());
                     |   86 |         unix_get_peersec_dgram(sock, scm);
                     |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |         |
                     |      |         (9) ...to here
                     |
              <------+
              |
            'unix_dgram_sendmsg': events 10-11
              |
              |net/unix/af_unix.c:1856:15:
              | 1856 |         err =3D scm_send(sock, msg, &scm, false);
              |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (10) returning to 'unix_dgram_sendmsg'=
 from 'scm_send'
              | 1857 |         if (err < 0)
              |      |            ~   =

              |      |            |
              |      |            (11) following 'false' branch...
              |
            'unix_dgram_sendmsg': events 12-15
              |
              | 1860 |         err =3D -EOPNOTSUPP;
              | 1861 |         if (msg->msg_flags&MSG_OOB)
              |      |            ~ =

              |      |            |
              |      |            (13) following 'false' branch...
              |......
              | 1864 |         if (msg->msg_namelen) {
              |      |            ~~~~~~~~~~~~~~~~~
              |      |            |   |
              |      |            |   (14) ...to here
              |      |            (15) following 'false' branch...
--
              |      |                       |
              |      |                       (12) returning to 'isolate_sin=
gle_pageblock' from 'set_migratetype_isolate'
              |  335 |                                 isolate_pageblock, i=
solate_pageblock + pageblock_nr_pages);
              |      |                                 ~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |  336 | =

              |  337 |                 if (ret)
              |      |                    ~   =

              |      |                    |
              |      |                    (13) following 'false' branch (wh=
en 'ret =3D=3D 0')...
              |......
              |  353 |         if (isolate_before) {
              |      |            ~           =

              |      |            |
              |      |            (14) ...to here
              |      |            (15) following 'false' branch (when 'isol=
ate_before =3D=3D 0')...
              |
            'isolate_single_pageblock': event 16
              |
              |  357 |                 if (!pfn_to_online_page(boundary_pfn=
 - 1))
   arch/x86/include/asm/page_32.h:19:35: note: in definition of macro 'pfn_=
valid'
              |   19 | #define pfn_valid(pfn)          ((pfn) < max_mapnr)
              |      |                                   ^~~
   mm/page_isolation.c:357:22: note: in expansion of macro 'pfn_to_online_p=
age'
              |  357 |                 if (!pfn_to_online_page(boundary_pfn=
 - 1))
              |      |                      ^~~~~~~~~~~~~~~~~~
              |
            'isolate_single_pageblock': event 17
              |
              |include/linux/memory_hotplug.h:223:12:
              |  223 |         if (pfn_valid(pfn))                     \
              |      |            ^
              |      |            |
              |      |            (17) following 'true' branch...
   mm/page_isolation.c:357:22: note: in expansion of macro 'pfn_to_online_p=
age'
              |  357 |                 if (!pfn_to_online_page(boundary_pfn=
 - 1))
              |      |                      ^~~~~~~~~~~~~~~~~~
              |
            'isolate_single_pageblock': event 18
              |
              |include/asm-generic/memory_model.h:18:42:
              |   18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - =
ARCH_PFN_OFFSET))
              |      |                                 ~~~~~~~~~^~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
              |      |                                          |
              |      |                                          (18) ...to =
here
   include/asm-generic/memory_model.h:53:21: note: in expansion of macro '_=
_pfn_to_page'
              |   53 | #define pfn_to_page __pfn_to_page
              |      |                     ^~~~~~~~~~~~~
   include/linux/memory_hotplug.h:224:27: note: in expansion of macro 'pfn_=
to_page'
              |  224 |                 ___page =3D pfn_to_page(pfn);     \
              |      |                           ^~~~~~~~~~~
   mm/page_isolation.c:357:22: note: in expansion of macro 'pfn_to_online_p=
age'
              |  357 |                 if (!pfn_to_online_page(boundary_pfn=
 - 1))
              |      |                      ^~~~~~~~~~~~~~~~~~
              |
            'isolate_single_pageblock': event 19
              |
              |  357 |                 if (!pfn_to_online_page(boundary_pfn=
 - 1))
              |      |                    ^
              |      |                    |
              |      |                    (19) following 'false' branch (wh=
en '___page' is non-NULL)...
              |
            'isolate_single_pageblock': event 20
              |
              |cc1:
              | (20): ...to here
              |
            'isolate_single_pageblock': events 21-22
              |
              |  361 |         for (pfn =3D start_pfn; pfn < boundary_pfn;)=
 {
              |      |                               ~~~~^~~~~~~~~~~~~~
              |      |                                   |
              |      |                                   (21) following 'tr=
ue' branch (when 'pfn < boundary_pfn')...
              |  362 |                 struct page *page =3D __first_valid_=
page(pfn, boundary_pfn - pfn);
              |      |                                     ~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                                     |
              |      |                                     (22) ...to here
              |
            'isolate_single_pageblock': event 23
              |
              |include/linux/page-flags.h:316:48:
              |  316 |         return test_bit(PG_head, &page->flags) ||
              |
            'isolate_single_pageblock': events 24-25
              |
              |arch/x86/include/asm/bitops.h:207:22:
              |  207 |                 (addr[nr >> _BITOPS_LONG_SHIFT])) !=
=3D 0;
              |      |                 ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                      |
              |      |                      (24) ...to here
              |      |                      (25) dereference of NULL 'page'
              |
   In file included from include/linux/kernel.h:22,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:55,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:7,
                    from mm/page_isolation.c:6:
>> include/linux/bitops.h:52:11: warning: dereference of NULL 'page' [CWE-4=
76] [-Wanalyzer-null-dereference]
      52 |           __builtin_constant_p(*(const unsigned long *)(addr))) =
?       \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, add=
r)
         |                                         ^~~~~
   include/linux/page-flags.h:316:16: note: in expansion of macro 'test_bit'
     316 |         return test_bit(PG_head, &page->flags) ||
         |                ^~~~~~~~
     'start_isolate_page_range': events 1-2
       |
       |mm/page_isolation.c:526:5:
       |  526 | int start_isolate_page_range(unsigned long start_pfn, unsig=
ned long end_pfn,
       |      |     ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'start_isolate_page_range'
       |......
       |  538 |         ret =3D isolate_single_pageblock(isolate_start, fla=
gs, gfp_flags, false, skip_isolation);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (2) calling 'isolate_single_pageblock' from '=
start_isolate_page_range'
       |
       +--> 'isolate_single_pageblock': events 3-8
              |
              |  302 | static int isolate_single_pageblock(unsigned long bo=
undary_pfn, int flags,
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'isolate_single_pageblock'
              |......
              |  314 |         if (isolate_before)
              |      |            ~
              |      |            |
              |      |            (4) following 'false' branch (when 'isola=
te_before =3D=3D 0')...
              |......
              |  325 |         zone  =3D page_zone(pfn_to_page(isolate_page=
block));
              |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
              |      |                 |
              |      |                 (5) ...to here
              |......
              |  331 |         if (skip_isolation)
              |      |            ~
              |      |            |
              |      |            (6) following 'false' branch (when 'skip_=
isolation =3D=3D 0')...
              |......
              |  334 |                 ret =3D set_migratetype_isolate(pfn_=
to_page(isolate_pageblock), saved_mt, flags,
              |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                       |
              |      |                       (7) ...to here
              |      |                       (8) calling 'set_migratetype_i=
solate' from 'isolate_single_pageblock'
              |  335 |                                 isolate_pageblock, i=
solate_pageblock + pageblock_nr_pages);
              |      |                                 ~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |
              +--> 'set_migratetype_isolate': events 9-10
                     |
                     |  147 | static int set_migratetype_isolate(struct pag=
e *page, int migratetype, int isol_flags,
                     |      |            ^~~~~~~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (9) entry to 'set_migratetype_isol=
ate'
                     |......
                     |  180 |         if (!unmovable) {
                     |      |            ~
                     |      |            |
                     |      |            (10) following 'true' branch (when=
 'unmovable' is NULL)...
                     |
                   'set_migratetype_isolate': event 11
                     |
                     |include/asm-generic/memory_model.h:19:57:
                     |   19 | #define __page_to_pfn(page)     ((unsigned lo=
ng)((page) - mem_map) + \
                     |      |                                              =
           ^
                     |      |                                              =
           |
                     |      |                                              =
           (11) ...to here
   include/asm-generic/memory_model.h:52:21: note: in expansion of macro '_=
_page_to_pfn'
                     |   52 | #define page_to_pfn __page_to_pfn
                     |      |                     ^~~~~~~~~~~~~
   include/linux/mmzone.h:103:39: note: in expansion of macro 'page_to_pfn'
                     |  103 |         get_pfnblock_flags_mask(page, page_to=
_pfn(page), MIGRATETYPE_MASK)
                     |      |                                       ^~~~~~~=
~~~~
   mm/page_isolation.c:182:26: note: in expansion of macro 'get_pageblock_m=
igratetype'
                     |  182 |                 int mt =3D get_pageblock_migr=
atetype(page);
                     |      |                          ^~~~~~~~~~~~~~~~~~~~=
~~~~~
                     |
              <------+
              |
            'isolate_single_pageblock': events 12-15
              |
              |  334 |                 ret =3D set_migratetype_isolate(pfn_=
to_page(isolate_pageblock), saved_mt, flags,
              |      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                       |
              |      |                       (12) returning to 'isolate_sin=
gle_pageblock' from 'set_migratetype_isolate'
              |  335 |                                 isolate_pageblock, i=
solate_pageblock + pageblock_nr_pages);
              |      |                                 ~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |  336 | =

              |  337 |                 if (ret)
              |      |                    ~   =

              |      |                    |
              |      |                    (13) following 'false' branch (wh=
en 'ret =3D=3D 0')...
              |......
              |  353 |         if (isolate_before) {
              |      |            ~           =

              |      |            |
              |      |            (14) ...to here
--
                            |
                          'get_parents': events 32-41
                            |
                            | 1216 |                 if ((ret =3D get_far_p=
arent(tb, h + 1, &curf,
                            |      |                    ~       ^~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
                            |      |                    |       |
                            |      |                    |       (32) return=
ing to 'get_parents' from 'get_far_parent'
                            |      |                    (33) following 'fal=
se' branch (when 'ret =3D=3D 0')...
                            | 1217 |                                       =
            &curcf,
                            |      |                                       =
            ~~~~~~~
                            | 1218 |                                       =
            LEFT_PARENTS)) !=3D CARRY_ON)
                            |      |                                       =
            ~~~~~~~~~~~~~
                            |......
                            | 1222 |         brelse(tb->FL[h]);
                            |      |                ~~~~~~~~~    =

                            |      |                      |
                            |      |                      (34) ...to here
                            | 1223 |         tb->FL[h] =3D curf;       /* N=
ew initialization of FL[h]. */
                            |      |         ~~~~~~~~~~~~~~~~    =

                            |      |                   |
                            |      |                   (35) 'curf' is NULL
                            |      |                   (36) 'curf' is NULL
                            | 1224 |         brelse(tb->CFL[h]);
                            | 1225 |         tb->CFL[h] =3D curcf;     /* N=
ew initialization of CFL[h]. */
                            |      |         ~~~~~~~~~~~~~~~~~~  =

                            |      |                    |
                            |      |                    (37) 'curf' is NULL
                            |      |                    (38) 'curf' is NULL
                            |......
                            | 1234 |         if (position =3D=3D B_NR_ITEMS=
(PATH_H_PBUFFER(path, h + 1))) {
                            |      |            ~                =

                            |      |            |
                            |      |            (39) following 'true' branc=
h...
                            |......
                            | 1242 |                      get_far_parent(tb=
, h + 1, &curf, &curcf,
                            |      |                      ~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                      |
                            |      |                      (40) ...to here
                            |      |                      (41) calling 'get=
_far_parent' from 'get_parents'
                            | 1243 |                                     RI=
GHT_PARENTS)) !=3D CARRY_ON)
                            |      |                                     ~~=
~~~~~~~~~~~~
                            |
                            +--> 'get_far_parent': events 42-45
                                   |
                                   | 1023 | static int get_far_parent(struc=
t tree_balance *tb,
                                   |      |            ^~~~~~~~~~~~~~
                                   |      |            |
                                   |      |            (42) entry to 'get_f=
ar_parent'
                                   |......
                                   | 1086 |         if (counter =3D=3D FIRS=
T_PATH_ELEMENT_OFFSET) {
                                   |      |            ~
                                   |      |            |
                                   |      |            (43) following 'fals=
e' branch (when 'counter !=3D 2')...
                                   |......
                                   | 1107 |         if (buffer_locked(*pcom=
_father)) {
                                   |      |             ~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
                                   |      |             |
                                   |      |             (44) ...to here
                                   |      |             (45) 'curf' is NULL
                                   |
                                 'get_far_parent': event 46
                                   |
                                   |include/linux/bitops.h:53:30:
                                   |   49 |         ((__builtin_constant_p(=
nr) &&                                   \
                                   |      |         ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |   50 |           __builtin_constant_p(=
(uintptr_t)(addr) !=3D (uintptr_t)NULL) && \
                                   |      |           ~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |   51 |           (uintptr_t)(addr) !=
=3D (uintptr_t)NULL &&                       \
                                   |      |           ~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |   52 |           __builtin_constant_p(=
*(const unsigned long *)(addr))) ?       \
                                   |      |           ~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |   53 |          const##op(nr, addr) : =
op(nr, addr))
                                   |      |          ~~~~~~~~~~~~~~~~~~~~^~=
~~~~~~~~~~~~~
                                   |      |                              |
                                   |      |                              (4=
6) following 'false' branch...
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
                                   |   61 | #define test_bit(nr, addr)     =
         bitop(_test_bit, nr, addr)
                                   |      |                                =
         ^~~~~
   include/linux/buffer_head.h:99:16: note: in expansion of macro 'test_bit'
                                   |   99 |         return test_bit(BH_##bi=
t, &(bh)->b_state);                      \
                                   |      |                ^~~~~~~~
   include/linux/buffer_head.h:123:1: note: in expansion of macro 'BUFFER_F=
NS'
                                   |  123 | BUFFER_FNS(Lock, locked)
                                   |      | ^~~~~~~~~~
                                   |
                                 'get_far_parent': events 47-48
                                   |
                                   |arch/x86/include/asm/bitops.h:207:22:
                                   |  207 |                 (addr[nr >> _BI=
TOPS_LONG_SHIFT])) !=3D 0;
                                   |      |                 ~~~~~^~~~~~~~~~=
~~~~~~~~~~~~~~~~~
                                   |      |                      |
                                   |      |                      (47) ...to=
 here
                                   |      |                      (48) deref=
erence of NULL '*pcom_father'
                                   |
   In file included from include/linux/log2.h:12,
                    from arch/x86/include/asm/div64.h:8,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from fs/reiserfs/fix_node.c:5:
>> include/linux/bitops.h:52:32: warning: dereference of NULL 'curf' [CWE-4=
76] [-Wanalyzer-null-dereference]
      52 |           __builtin_constant_p(*(const unsigned long *)(addr))) =
?       \
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, add=
r)
         |                                         ^~~~~
   include/linux/buffer_head.h:99:16: note: in expansion of macro 'test_bit'
      99 |         return test_bit(BH_##bit, &(bh)->b_state);              =
        \
         |                ^~~~~~~~
   include/linux/buffer_head.h:123:1: note: in expansion of macro 'BUFFER_F=
NS'
     123 | BUFFER_FNS(Lock, locked)
         | ^~~~~~~~~~
     'fix_nodes': events 1-2
       |
       |fs/reiserfs/fix_node.c:2545:5:
       | 2545 | int fix_nodes(int op_mode, struct tree_balance *tb,
       |      |     ^~~~~~~~~
       |      |     |
       |      |     (1) entry to 'fix_nodes'
       |......
       | 2574 |         if (FILESYSTEM_CHANGED_TB(tb))
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |
     'fix_nodes': event 3
       |
       |include/linux/buffer_head.h:99:35:
       |   99 |         return test_bit(BH_##bit, &(bh)->b_state);         =
             \
   include/linux/bitops.h:50:44: note: in definition of macro 'bitop'
       |   50 |           __builtin_constant_p((uintptr_t)(addr) !=3D (uint=
ptr_t)NULL) && \
       |      |                                            ^~~~
   include/linux/buffer_head.h:99:16: note: in expansion of macro 'test_bit'
       |   99 |         return test_bit(BH_##bit, &(bh)->b_state);         =
             \
       |      |                ^~~~~~~~
   include/linux/buffer_head.h:123:1: note: in expansion of macro 'BUFFER_F=
NS'
       |  123 | BUFFER_FNS(Lock, locked)
       |      | ^~~~~~~~~~
       |
     'fix_nodes': event 4
       |
       |fs/reiserfs/fix_node.c:2625:12:
       | 2625 |         if (get_mem_for_virtual_node(tb) =3D=3D REPEAT_SEAR=
CH)
       |      |            ^
       |      |            |
       |      |            (4) following 'false' branch...
       |
     'fix_nodes': event 5
       |
       |cc1:
       | (5): ...to here
       |
     'fix_nodes': events 6-10
       |
       | 2630 |         for (h =3D 0; h < MAX_HEIGHT && tb->insert_size[h];=
 h++) {
       |      |                     ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
       |      |                                    |
       |      |                                    (6) following 'true' bra=
nch...
       | 2631 |                 ret =3D get_direct_parent(tb, h);
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (7) ...to here
       | 2632 |                 if (ret !=3D CARRY_ON)
       |      |                    ~                =

       |      |                    |
       |      |                    (8) following 'false' branch (when 'ret =
=3D=3D 0')...
       |......
       | 2635 |                 ret =3D check_balance(op_mode, tb, h, item_=
num,
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
       |      |                       |
       |      |                       (9) ...to here
       |      |                       (10) calling 'check_balance' from 'fi=
x_nodes'
       | 2636 |                                     pos_in_item, ins_ih, da=
ta);
       |      |                                     ~~~~~~~~~~~~~~~~~~~~~~~=
~~~
       |
       +--> 'check_balance': events 11-14
              |
              | 2061 | static int check_balance(int mode,
              |      |            ^~~~~~~~~~~~~
              |      |            |
              |      |            (11) entry to 'check_balance'
              |......
              | 2082 |         if (tb->insert_size[h] > 0)
              |      |            ~
              |      |            |
              |      |            (12) following 'true' branch...
              | 2083 |                 return ip_check_balance(tb, h);
              |      |                        ~~~~~~~~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (13) ...to here
              |      |                        (14) calling 'ip_check_balanc=
e' from 'check_balance'
              |
              +--> 'ip_check_balance': events 15-18
                     |
                     | 1324 | static int ip_check_balance(struct tree_balan=
ce *tb, int h)
                     |      |            ^~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (15) entry to 'ip_check_balance'
                     |......
                     | 1377 |         if (!Sh) {
                     |      |            ~

vim +/page +52 include/linux/bitops.h

521611f961a7dd Alexander Lobakin 2022-05-09  35  =

a8846f7b2f123f Alexander Lobakin 2022-05-12  36  /*
a8846f7b2f123f Alexander Lobakin 2022-05-12  37   * Many architecture-speci=
fic non-atomic bitops contain inline asm code and due
a8846f7b2f123f Alexander Lobakin 2022-05-12  38   * to that the compiler ca=
n't optimize them to compile-time expressions or
a8846f7b2f123f Alexander Lobakin 2022-05-12  39   * constants. In contrary,=
 gen_*() helpers are defined in pure C and compilers
a8846f7b2f123f Alexander Lobakin 2022-05-12  40   * optimize them just well.
a8846f7b2f123f Alexander Lobakin 2022-05-12  41   * Therefore, to make `uns=
igned long foo =3D 0; __set_bit(BAR, &foo)` effectively
a8846f7b2f123f Alexander Lobakin 2022-05-12  42   * equal to `unsigned long=
 foo =3D BIT(BAR)`, pick the generic C alternative when
a8846f7b2f123f Alexander Lobakin 2022-05-12  43   * the arguments can be re=
solved at compile time. That expression itself is a
a8846f7b2f123f Alexander Lobakin 2022-05-12  44   * constant and doesn't br=
ing any functional changes to the rest of cases.
a8846f7b2f123f Alexander Lobakin 2022-05-12  45   * The casts to `uintptr_t=
` are needed to mitigate `-Waddress` warnings when
a8846f7b2f123f Alexander Lobakin 2022-05-12  46   * passing a bitmap from .=
bss or .data (-> `!!addr` is always true).
a8846f7b2f123f Alexander Lobakin 2022-05-12  47   */
54dcb250626d4e Alexander Lobakin 2022-06-16  48  #define bitop(op, nr, addr=
)						\
a8846f7b2f123f Alexander Lobakin 2022-05-12  49  	((__builtin_constant_p(nr=
) &&					\
a8846f7b2f123f Alexander Lobakin 2022-05-12  50  	  __builtin_constant_p((u=
intptr_t)(addr) !=3D (uintptr_t)NULL) &&	\
a8846f7b2f123f Alexander Lobakin 2022-05-12  51  	  (uintptr_t)(addr) !=3D =
(uintptr_t)NULL &&			\
a8846f7b2f123f Alexander Lobakin 2022-05-12 @52  	  __builtin_constant_p(*(=
const unsigned long *)(addr))) ?	\
a8846f7b2f123f Alexander Lobakin 2022-05-12  53  	 const##op(nr, addr) : op=
(nr, addr))
54dcb250626d4e Alexander Lobakin 2022-06-16  54  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3943569943438951130==--

