Content-Type: multipart/mixed; boundary="===============6300001427687536667=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [klassert-ipsec-next:testing 1/2] include/asm-generic/rwonce.h:44:26: warning: dereference of NULL 'dev' [CWE-476]
Date: Wed, 15 Jun 2022 23:02:52 +0800
Message-ID: <202206152238.ZmDUgBKT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6300001427687536667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/asm-generic/rwonce.h:44:26: warning: dereference of NULL 'dev' [CW=
E-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: netdev(a)vger.kernel.org
TO: Eyal Birger <eyal.birger@gmail.com>
CC: Steffen Klassert <steffen.klassert@secunet.com>
CC: Nicolas Dichtel <nicolas.dichtel@6wind.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next=
.git testing
head:   924b290655c0f17ac84e752addfc9bc3ec361069
commit: b5c8b3fe8946c1927155599dfb79045477901009 [1/2] xfrm: no need to set=
 DST_NOPOLICY in IPv4
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-c001-20220613 (https://download.01.org/0day-ci/ar=
chive/20220615/202206152238.ZmDUgBKT-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-ne=
xt.git/commit/?id=3Db5c8b3fe8946c1927155599dfb79045477901009
        git remote add klassert-ipsec-next https://git.kernel.org/pub/scm/l=
inux/kernel/git/klassert/ipsec-next.git
        git fetch --no-tags klassert-ipsec-next testing
        git checkout b5c8b3fe8946c1927155599dfb79045477901009
        # save the config file
         ARCH=3Dx86_64 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   net/ipv4/route.c: In function 'ip_rt_send_redirect':
   net/ipv4/route.c:880:13: warning: variable 'log_martians' set but not us=
ed [-Wunused-but-set-variable]
     880 |         int log_martians;
         |             ^~~~~~~~~~~~
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:248,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from net/ipv4/route.c:63:
   In function '__in_dev_get_rcu':
>> include/asm-generic/rwonce.h:44:26: warning: dereference of NULL 'dev' [=
CWE-476] [-Wanalyzer-null-dereference]
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof=
(x) *)&(x))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
      50 |         __READ_ONCE(x);                                         =
        \
         |         ^~~~~~~~~~~
   include/linux/rcupdate.h:392:50: note: in expansion of macro 'READ_ONCE'
     392 |         typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p);=
 \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:532:9: note: in expansion of macro '__rcu_deref=
erence_check'
     532 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:604:28: note: in expansion of macro 'rcu_derefe=
rence_check'
     604 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   include/linux/inetdevice.h:233:16: note: in expansion of macro 'rcu_dere=
ference'
     233 |         return rcu_dereference(dev->ip_ptr);
         |                ^~~~~~~~~~~~~~~
     'ip_route_output_flow': event 1
       |
       |net/ipv4/route.c:2870:16:
       | 2870 | struct rtable *ip_route_output_flow(struct net *net, struct=
 flowi4 *flp4,
       |      |                ^~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (1) entry to 'ip_route_output_flow'
       |
     'ip_route_output_flow': event 2
       |
       |include/net/route.h:140:16:
       |  140 |         return ip_route_output_key_hash(net, flp, NULL);
       |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (2) calling 'ip_route_output_key_hash' from =
'ip_route_output_flow'
       |
       +--> 'ip_route_output_key_hash': events 3-4
              |
              |net/ipv4/route.c:2628:16:
              | 2628 | struct rtable *ip_route_output_key_hash(struct net *=
net, struct flowi4 *fl4,
              |      |                ^~~~~~~~~~~~~~~~~~~~~~~~
              |      |                |
              |      |                (3) entry to 'ip_route_output_key_has=
h'
              |......
              | 2643 |         rth =3D ip_route_output_key_hash_rcu(net, fl=
4, &res, skb);
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
              |      |               |
              |      |               (4) calling 'ip_route_output_key_hash_=
rcu' from 'ip_route_output_key_hash'
              |
              +--> 'ip_route_output_key_hash_rcu': events 5-10
                     |
                     | 2650 | struct rtable *ip_route_output_key_hash_rcu(s=
truct net *net, struct flowi4 *fl4,
                     |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                |
                     |      |                (5) entry to 'ip_route_output_=
key_hash_rcu'
                     |......
                     | 2713 |         if (fl4->flowi4_oif) {
                     |      |            ~    =

                     |      |            |
                     |      |            (6) following 'false' branch...
                     |......
                     | 2742 |         if (!fl4->daddr) {
                     |      |            ~ ~~~~~~~~~~
                     |      |            |    |
                     |      |            |    (7) ...to here
                     |      |            (8) following 'false' branch...
                     |......
                     | 2753 |         err =3D fib_lookup(net, fl4, res, 0);
                     |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |               |
                     |      |               (9) ...to here
                     |      |               (10) calling 'fib_lookup' from =
'ip_route_output_key_hash_rcu'
                     |
                     +--> 'fib_lookup': events 11-12
                            |
                            |include/net/ip_fib.h:309:19:
                            |  309 | static inline int fib_lookup(struct ne=
t *net, const struct flowi4 *flp,
                            |      |                   ^~~~~~~~~~
                            |      |                   |
                            |      |                   (11) entry to 'fib_l=
ookup'
                            |......
                            |  317 |         tb =3D fib_get_table(net, RT_T=
ABLE_MAIN);
                            |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
                            |      |              |
                            |      |              (12) calling 'fib_get_tab=
le' from 'fib_lookup'
                            |
                            +--> 'fib_get_table': events 13-15
                                   |
                                   |  290 | static inline struct fib_table =
*fib_get_table(struct net *net, u32 id)
                                   |      |                                =
 ^~~~~~~~~~~~~
                                   |      |                                =
 |
                                   |      |                                =
 (13) entry to 'fib_get_table'
                                   |......
                                   |  295 |         ptr =3D id =3D=3D RT_TA=
BLE_LOCAL ?
                                   |      |               ~~~~~~~~~~~~~~~~~=
~~~~~
                                   |  296 |                 &net->ipv4.fib_=
table_hash[TABLE_LOCAL_INDEX] :
                                   |      |                 ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |                                =
                              |
                                   |      |                                =
                              (14) following 'false' branch (when 'id !=3D =
255')...
                                   |      |                                =
                              (15) ...to here
                                   |  297 |                 &net->ipv4.fib_=
table_hash[TABLE_MAIN_INDEX];
                                   |      |                 ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |

vim +/dev +44 include/asm-generic/rwonce.h

e506ea451254ab Will Deacon 2019-10-15  28  =

e506ea451254ab Will Deacon 2019-10-15  29  /*
e506ea451254ab Will Deacon 2019-10-15  30   * Yes, this permits 64-bit acce=
sses on 32-bit architectures. These will
e506ea451254ab Will Deacon 2019-10-15  31   * actually be atomic in some ca=
ses (namely Armv7 + LPAE), but for others we
e506ea451254ab Will Deacon 2019-10-15  32   * rely on the access being spli=
t into 2x32-bit accesses for a 32-bit quantity
e506ea451254ab Will Deacon 2019-10-15  33   * (e.g. a virtual address) and =
a strong prevailing wind.
e506ea451254ab Will Deacon 2019-10-15  34   */
e506ea451254ab Will Deacon 2019-10-15  35  #define compiletime_assert_rwonc=
e_type(t)					\
e506ea451254ab Will Deacon 2019-10-15  36  	compiletime_assert(__native_wor=
d(t) || sizeof(t) =3D=3D sizeof(long long),	\
e506ea451254ab Will Deacon 2019-10-15  37  		"Unsupported access size for {=
READ,WRITE}_ONCE().")
e506ea451254ab Will Deacon 2019-10-15  38  =

e506ea451254ab Will Deacon 2019-10-15  39  /*
e506ea451254ab Will Deacon 2019-10-15  40   * Use __READ_ONCE() instead of =
READ_ONCE() if you do not require any
3c9184109e78ea Will Deacon 2019-10-30  41   * atomicity. Note that this may=
 result in tears!
e506ea451254ab Will Deacon 2019-10-15  42   */
b78b331a3f5c07 Will Deacon 2019-10-15  43  #ifndef __READ_ONCE
e506ea451254ab Will Deacon 2019-10-15 @44  #define __READ_ONCE(x)	(*(const =
volatile __unqual_scalar_typeof(x) *)&(x))
b78b331a3f5c07 Will Deacon 2019-10-15  45  #endif
e506ea451254ab Will Deacon 2019-10-15  46  =


:::::: The code at line 44 was first introduced by commit
:::::: e506ea451254ab17e0bf918ca36232fec2a9b10c compiler.h: Split {READ,WRI=
TE}_ONCE definitions out into rwonce.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6300001427687536667==--

