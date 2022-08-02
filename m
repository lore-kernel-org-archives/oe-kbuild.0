Content-Type: multipart/mixed; boundary="===============7986992236333139210=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 12915/13542] net/tls/tls_sw.c:160:23: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Tue, 02 Aug 2022 18:48:21 +0800
Message-ID: <202208021840.hXtTmTps-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7986992236333139210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: net/tls/t=
ls_sw.c:160:23: warning: Branch condition evaluates to a garbage value [cla=
ng-analyzer-core.uninitialized.Branch]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   7c5e07b73ff3011c9b82d4a3286a3362b951ad2b
commit: dd47ed3620e693636b4d912db4810fe0c092eb2c [12915/13542] tls: rx: fac=
tor SW handling out of tls_rx_one_record()
:::::: branch date: 5 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-c002-20220731 (https://download.01.org/0day-ci/archi=
ve/20220802/202208021840.hXtTmTps-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00=
cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Ddd47ed3620e693636b4d912db4810fe0c092eb2c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout dd47ed3620e693636b4d912db4810fe0c092eb2c
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
   net/decnet/dn_route.c:1118:16: note: Left side of '&&' is false
                   BUG_ON(neigh && neigh->dev !=3D dev_out);
                                ^
   net/decnet/dn_route.c:1118:3: note: Taking false branch
                   BUG_ON(neigh && neigh->dev !=3D dev_out);
                   ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   net/decnet/dn_route.c:1118:3: note: Loop condition is false.  Exiting lo=
op
                   BUG_ON(neigh && neigh->dev !=3D dev_out);
                   ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   net/decnet/dn_route.c:1122:7: note: 'neigh' is null
                   if (neigh)
                       ^~~~~
   net/decnet/dn_route.c:1122:3: note: Taking false branch
                   if (neigh)
                   ^
   net/decnet/dn_route.c:1124:7: note: 'gateway' is equal to 0
                   if (gateway =3D=3D 0)
                       ^~~~~~~
   net/decnet/dn_route.c:1124:3: note: Taking true branch
                   if (gateway =3D=3D 0)
                   ^
   net/decnet/dn_route.c:1126:7: note: Assuming field 'saddr' is not equal =
to 0
                   if (fld.saddr =3D=3D 0) {
                       ^~~~~~~~~~~~~~
   net/decnet/dn_route.c:1126:3: note: Taking false branch
                   if (fld.saddr =3D=3D 0) {
                   ^
   net/decnet/dn_route.c:1135:3: note: Control jumps to line 1175
                   goto make_route;
                   ^
   net/decnet/dn_route.c:1175:6: note: Assuming the condition is false
           if (dev_out->flags & IFF_LOOPBACK)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/decnet/dn_route.c:1175:2: note: Taking false branch
           if (dev_out->flags & IFF_LOOPBACK)
           ^
   net/decnet/dn_route.c:1179:6: note: Assuming 'rt' is not equal to NULL
           if (rt =3D=3D NULL)
               ^~~~~~~~~~
   net/decnet/dn_route.c:1179:2: note: Taking false branch
           if (rt =3D=3D NULL)
           ^
   net/decnet/dn_route.c:1192:22: note: Assuming 'gateway' is not equal to 0
           rt->rt_gateway    =3D gateway ? gateway : fld.daddr;
                               ^~~~~~~
   net/decnet/dn_route.c:1192:22: note: '?' condition is true
   net/decnet/dn_route.c:1205:2: note: Taking false branch
           if (flags & RTCF_LOCAL)
           ^
   net/decnet/dn_route.c:1208:8: note: Calling 'dn_rt_set_next_hop'
           err =3D dn_rt_set_next_hop(rt, &res);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/decnet/dn_route.c:875:6: note: 'fi' is null
           if (fi) {
               ^~
   net/decnet/dn_route.c:875:2: note: Taking false branch
           if (fi) {
           ^
   net/decnet/dn_route.c:883:6: note: Assuming 'dev' is equal to NULL
           if (dev !=3D NULL && rt->n =3D=3D NULL) {
               ^~~~~~~~~~~
   net/decnet/dn_route.c:883:18: note: Left side of '&&' is false
           if (dev !=3D NULL && rt->n =3D=3D NULL) {
                           ^
   net/decnet/dn_route.c:890:39: note: Access to field 'mtu' results in a d=
ereference of a null pointer (loaded from field 'dev')
           if (dst_metric(&rt->dst, RTAX_MTU) > rt->dst.dev->mtu)
                                                ^       ~~~
   net/decnet/dn_route.c:1183:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rt->fld, 0, sizeof(rt->fld));
           ^~~~~~
   net/decnet/dn_route.c:1183:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(&rt->fld, 0, sizeof(rt->fld));
           ^~~~~~
   net/decnet/dn_route.c:1449:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rt->fld, 0, sizeof(rt->fld));
           ^~~~~~
   net/decnet/dn_route.c:1449:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(&rt->fld, 0, sizeof(rt->fld));
           ^~~~~~
   net/decnet/dn_route.c:1654:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fld, 0, sizeof(fld));
           ^~~~~~
   net/decnet/dn_route.c:1654:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(&fld, 0, sizeof(fld));
           ^~~~~~
   net/decnet/dn_route.c:1686:3: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(cb, 0, sizeof(struct dn_skb_cb));
                   ^~~~~~
   net/decnet/dn_route.c:1686:3: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                   memset(cb, 0, sizeof(struct dn_skb_cb));
                   ^~~~~~
   Suppressed 67 warnings (67 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   120 warnings generated.
>> net/tls/tls_sw.c:160:23: warning: Branch condition evaluates to a garbag=
e value [clang-analyzer-core.uninitialized.Branch]
                   char content_type =3D darg->zc ? darg->tail : 0;
                                       ^
   net/tls/tls_sw.c:2114:6: note: 'timeo' is >=3D 0
           if (timeo < 0)
               ^~~~~
   net/tls/tls_sw.c:2114:2: note: Taking false branch
           if (timeo < 0)
           ^
   net/tls/tls_sw.c:2117:6: note: Assuming the condition is false
           if (!skb_queue_empty(&ctx->rx_list)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tls/tls_sw.c:2117:2: note: Taking false branch
           if (!skb_queue_empty(&ctx->rx_list)) {
           ^
   net/tls/tls_sw.c:2124:7: note: 'err' is > 0
                   if (err <=3D 0)
                       ^~~
   net/tls/tls_sw.c:2124:3: note: Taking false branch
                   if (err <=3D 0)
                   ^
   net/tls/tls_sw.c:2129:9: note: Calling 'tls_rx_one_record'
                   err =3D tls_rx_one_record(sk, NULL, &darg);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tls/tls_sw.c:1671:8: note: Calling 'tls_decrypt_device'
           err =3D tls_decrypt_device(sk, tls_ctx, darg);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tls/tls_sw.c:1642:6: note: Assuming field 'rx_conf' is equal to TLS_=
HW
           if (tls_ctx->rx_conf !=3D TLS_HW)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tls/tls_sw.c:1642:2: note: Taking false branch
           if (tls_ctx->rx_conf !=3D TLS_HW)
           ^
   net/tls/tls_sw.c:1646:6: note: Assuming 'err' is > 0
           if (err <=3D 0)
               ^~~~~~~~
   net/tls/tls_sw.c:1646:2: note: Taking false branch
           if (err <=3D 0)
           ^
   net/tls/tls_sw.c:1649:8: note: Calling 'tls_padding_length'
           pad =3D tls_padding_length(prot, tls_strp_msg(ctx), darg);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tls/tls_sw.c:158:6: note: Assuming the condition is true
           if (prot->version =3D=3D TLS_1_3_VERSION) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tls/tls_sw.c:158:2: note: Taking true branch
           if (prot->version =3D=3D TLS_1_3_VERSION) {
           ^
   net/tls/tls_sw.c:160:23: note: Branch condition evaluates to a garbage v=
alue
                   char content_type =3D darg->zc ? darg->tail : 0;
                                       ^~~~~~~~
   net/tls/tls_sw.c:391:2: warning: Use of memory after it is freed [clang-=
analyzer-unix.Malloc]
           list_for_each_entry_safe(rec, tmp, &ctx->tx_list, list) {
           ^
   include/linux/list.h:762:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   net/tls/tls_sw.c:2391:15: note: Assuming 'tls_ctx' is non-null
           if (unlikely(!tls_ctx))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/tls/tls_sw.c:2391:2: note: Taking false branch
           if (unlikely(!tls_ctx))
           ^
   net/tls/tls_sw.c:2395:6: note: Assuming the condition is false
           if (test_bit(BIT_TX_CLOSING, &ctx->tx_bitmask))
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   net/tls/tls_sw.c:2395:2: note: Taking false branch
           if (test_bit(BIT_TX_CLOSING, &ctx->tx_bitmask))
           ^
   net/tls/tls_sw.c:2398:7: note: '?' condition is true
           if (!test_and_clear_bit(BIT_TX_SCHEDULED, &ctx->tx_bitmask))
                ^
   arch/arm/include/asm/bitops.h:193:34: note: expanded from macro 'test_an=
d_clear_bit'
   #define test_and_clear_bit(nr,p)        ATOMIC_BITOP(test_and_clear_bit,=
nr,p)
                                           ^
   arch/arm/include/asm/bitops.h:181:3: note: expanded from macro 'ATOMIC_B=
ITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
            ^
   net/tls/tls_sw.c:2398:2: note: Taking false branch
           if (!test_and_clear_bit(BIT_TX_SCHEDULED, &ctx->tx_bitmask))
           ^
   net/tls/tls_sw.c:2402:2: note: Calling 'tls_tx_records'
           tls_tx_records(sk, -1);
           ^~~~~~~~~~~~~~~~~~~~~~
   net/tls/tls_sw.c:369:2: note: Taking true branch
           if (tls_is_partially_sent_record(tls_ctx)) {

vim +160 net/tls/tls_sw.c

0927f71dbcfb59 Doron Roberts-Kedes 2018-08-28  149  =

ce61327ce989b6 Jakub Kicinski      2022-07-05  150  static int tls_padding_=
length(struct tls_prot_info *prot, struct sk_buff *skb,
ce61327ce989b6 Jakub Kicinski      2022-07-05  151  			      struct tls_dec=
rypt_arg *darg)
130b392c6cd6b2 Dave Watson         2019-01-30  152  {
130b392c6cd6b2 Dave Watson         2019-01-30  153  	struct strp_msg *rxm =
=3D strp_msg(skb);
c3f6bb74137c68 Jakub Kicinski      2022-04-07  154  	struct tls_msg *tlm =
=3D tls_msg(skb);
130b392c6cd6b2 Dave Watson         2019-01-30  155  	int sub =3D 0;
130b392c6cd6b2 Dave Watson         2019-01-30  156  =

130b392c6cd6b2 Dave Watson         2019-01-30  157  	/* Determine zero-padd=
ing length */
b53f4976fb1f73 Jakub Kicinski      2019-05-09  158  	if (prot->version =3D=
=3D TLS_1_3_VERSION) {
5deee41b19b325 Jakub Kicinski      2022-04-07  159  		int offset =3D rxm->f=
ull_len - TLS_TAG_SIZE - 1;
ce61327ce989b6 Jakub Kicinski      2022-07-05 @160  		char content_type =3D=
 darg->zc ? darg->tail : 0;
130b392c6cd6b2 Dave Watson         2019-01-30  161  		int err;
130b392c6cd6b2 Dave Watson         2019-01-30  162  =

130b392c6cd6b2 Dave Watson         2019-01-30  163  		while (content_type =
=3D=3D 0) {
5deee41b19b325 Jakub Kicinski      2022-04-07  164  			if (offset < prot->p=
repend_size)
130b392c6cd6b2 Dave Watson         2019-01-30  165  				return -EBADMSG;
5deee41b19b325 Jakub Kicinski      2022-04-07  166  			err =3D skb_copy_bit=
s(skb, rxm->offset + offset,
130b392c6cd6b2 Dave Watson         2019-01-30  167  					    &content_type,=
 1);
b53f4976fb1f73 Jakub Kicinski      2019-05-09  168  			if (err)
b53f4976fb1f73 Jakub Kicinski      2019-05-09  169  				return err;
130b392c6cd6b2 Dave Watson         2019-01-30  170  			if (content_type)
130b392c6cd6b2 Dave Watson         2019-01-30  171  				break;
130b392c6cd6b2 Dave Watson         2019-01-30  172  			sub++;
5deee41b19b325 Jakub Kicinski      2022-04-07  173  			offset--;
130b392c6cd6b2 Dave Watson         2019-01-30  174  		}
c3f6bb74137c68 Jakub Kicinski      2022-04-07  175  		tlm->control =3D cont=
ent_type;
130b392c6cd6b2 Dave Watson         2019-01-30  176  	}
130b392c6cd6b2 Dave Watson         2019-01-30  177  	return sub;
130b392c6cd6b2 Dave Watson         2019-01-30  178  }
130b392c6cd6b2 Dave Watson         2019-01-30  179  =


:::::: The code at line 160 was first introduced by commit
:::::: ce61327ce989b63c0bd1cc7afee00e218ee696ac tls: rx: support optimistic=
 decrypt to user buffer with TLS 1.3

:::::: TO: Jakub Kicinski <kuba@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7986992236333139210==--

