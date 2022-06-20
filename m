Content-Type: multipart/mixed; boundary="===============0992246509934719210=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] blk-iocost: fix vtime loss calculation when iocg deactivate
Date: Mon, 20 Jun 2022 16:52:37 +0800
Message-ID: <202206201627.6aAph01q-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0992246509934719210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: block/blk=
-iocost.c:2169:8: warning: Value stored to 'vtime' during its initializatio=
n is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220609073450.98975-2-zhouchengming@bytedance.com>
References: <20220609073450.98975-2-zhouchengming@bytedance.com>
TO: Chengming Zhou <zhouchengming@bytedance.com>
TO: tj(a)kernel.org
TO: axboe(a)kernel.dk
CC: linux-block(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: Chengming Zhou <zhouchengming@bytedance.com>

Hi Chengming,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on v5.19-rc2 next-20220617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Chengming-Zhou/blk-i=
ocost-remove-the-second-superfluous-current_hweight/20220609-153721
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-next
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm-randconfig-c002-20220619 (https://download.01.org/0day-ci/archi=
ve/20220620/202206201627.6aAph01q-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 916887=
16ba49942051dccdf7b9c4f81a7ec8feaf)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/20e4e9e3955309578e3=
3866f307ceac772118e1c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chengming-Zhou/blk-iocost-remove-t=
he-second-superfluous-current_hweight/20220609-153721
        git checkout 20e4e9e3955309578e33866f307ceac772118e1c
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/i2c/muxes/i2c-mux-pca954x.c:282:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", READ_ONCE(data->idle_state));
                  ^~~~~~~
   drivers/i2c/muxes/i2c-mux-pca954x.c:282:9: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", READ_ONCE(data->idle_state));
                  ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   block/blk-iolatency.c:855:7: warning: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (sscanf(tok, "%15[^=3D]=3D%20s", key, val) !=3D 2)
                       ^~~~~~
   block/blk-iolatency.c:855:7: note: Call to function 'sscanf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sscanf_s' in case of C11
                   if (sscanf(tok, "%15[^=3D]=3D%20s", key, val) !=3D 2)
                       ^~~~~~
   block/blk-iolatency.c:863:13: warning: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           else if (sscanf(val, "%llu", &v) =3D=3D 1)
                                    ^~~~~~
   block/blk-iolatency.c:863:13: note: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11
                           else if (sscanf(val, "%llu", &v) =3D=3D 1)
                                    ^~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   block/blk-iocost.c:921:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ioc->params.qos, p->qos, sizeof(p->qos));
                   ^~~~~~
   block/blk-iocost.c:921:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(ioc->params.qos, p->qos, sizeof(p->qos));
                   ^~~~~~
   block/blk-iocost.c:923:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ioc->params.i_lcoefs, p->i_lcoefs, sizeof(p->i_lc=
oefs));
                   ^~~~~~
   block/blk-iocost.c:923:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(ioc->params.i_lcoefs, p->i_lcoefs, sizeof(p->i_lc=
oefs));
                   ^~~~~~
   block/blk-iocost.c:1269:2: warning: Value stored to 'last_period' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           last_period =3D atomic64_read(&iocg->active_period);
           ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:1269:2: note: Value stored to 'last_period' is never =
read
           last_period =3D atomic64_read(&iocg->active_period);
           ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:1291:2: warning: Value stored to 'vtime' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           vtime =3D vtarget;
           ^       ~~~~~~~
   block/blk-iocost.c:1291:2: note: Value stored to 'vtime' is never read
           vtime =3D vtarget;
           ^       ~~~~~~~
   block/blk-iocost.c:1873:32: warning: The left operand of '>' is a garbag=
e value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           WARN_ON_ONCE(root_iocg->level > 0);
                                         ^
   include/asm-generic/bug.h:147:18: note: expanded from macro 'WARN_ON_ONC=
E'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
   block/blk-iocost.c:1832:2: note: Loop condition is false. Execution cont=
inues on line 1844
           list_for_each_entry(iocg, surpluses, surplus_list) {
           ^
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   block/blk-iocost.c:1844:6: note: 'after_sum' is < WEIGHT_ONE
           if (after_sum >=3D WEIGHT_ONE) {
               ^~~~~~~~~
   block/blk-iocost.c:1844:2: note: Taking false branch
           if (after_sum >=3D WEIGHT_ONE) {
           ^
   block/blk-iocost.c:1856:2: note: Loop condition is false. Execution cont=
inues on line 1868
           list_for_each_entry_safe(iocg, tiocg, &over_hwa, walk_list) {
           ^
   include/linux/list.h:761:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   block/blk-iocost.c:1868:2: note: Loop condition is false. Execution cont=
inues on line 1872
           list_for_each_entry(iocg, surpluses, surplus_list) {
           ^
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   block/blk-iocost.c:1873:32: note: The left operand of '>' is a garbage v=
alue
           WARN_ON_ONCE(root_iocg->level > 0);
                                         ^
   include/asm-generic/bug.h:147:18: note: expanded from macro 'WARN_ON_ONC=
E'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
>> block/blk-iocost.c:2169:8: warning: Value stored to 'vtime' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
                           u64 vtime =3D atomic64_read(&iocg->vtime);
                               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:2169:8: note: Value stored to 'vtime' during its init=
ialization is never read
                           u64 vtime =3D atomic64_read(&iocg->vtime);
                               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:3048:8: warning: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (!sscanf(buf, "default %u", &v) && !sscanf(buf, "%u",=
 &v))
                        ^~~~~~
   block/blk-iocost.c:3048:8: note: Call to function 'sscanf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sscanf_s' in case of C11
                   if (!sscanf(buf, "default %u", &v) && !sscanf(buf, "%u",=
 &v))
                        ^~~~~~
   block/blk-iocost.c:3048:42: warning: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (!sscanf(buf, "default %u", &v) && !sscanf(buf, "%u",=
 &v))
                                                          ^~~~~~
   block/blk-iocost.c:3048:42: note: Call to function 'sscanf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sscanf_s' in case of C11
                   if (!sscanf(buf, "default %u", &v) && !sscanf(buf, "%u",=
 &v))
                                                          ^~~~~~
   block/blk-iocost.c:3080:8: warning: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (!sscanf(ctx.body, "%u", &v))
                        ^~~~~~
   block/blk-iocost.c:3080:8: note: Call to function 'sscanf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sscanf_s' in case of C11
                   if (!sscanf(ctx.body, "%u", &v))
                        ^~~~~~
   block/blk-iocost.c:3172:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(qos, ioc->params.qos, sizeof(qos));
           ^~~~~~
   block/blk-iocost.c:3172:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(qos, ioc->params.qos, sizeof(qos));
           ^~~~~~
   block/blk-iocost.c:3254:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ioc->params.qos, qos, sizeof(qos));
                   ^~~~~~
   block/blk-iocost.c:3254:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(ioc->params.qos, qos, sizeof(qos));
                   ^~~~~~
   block/blk-iocost.c:3339:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(u, ioc->params.i_lcoefs, sizeof(u));
           ^~~~~~
   block/blk-iocost.c:3339:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(u, ioc->params.i_lcoefs, sizeof(u));
           ^~~~~~
   block/blk-iocost.c:3339:2: warning: Null pointer passed as 2nd argument =
to memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(u, ioc->params.i_lcoefs, sizeof(u));
           ^         ~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:3327:2: note: Taking false branch
           if (IS_ERR(bdev))
           ^
   block/blk-iocost.c:3330:8: note: Calling 'q_to_ioc'
           ioc =3D q_to_ioc(bdev_get_queue(bdev));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:664:9: note: Calling 'rqos_to_ioc'
           return rqos_to_ioc(rq_qos_id(q, RQ_QOS_COST));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:659:2: note: Returning null pointer, which participat=
es in a condition later
           return container_of(rqos, struct ioc, rqos);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:664:9: note: Returning from 'rqos_to_ioc'
           return rqos_to_ioc(rq_qos_id(q, RQ_QOS_COST));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:664:2: note: Returning null pointer, which participat=
es in a condition later
           return rqos_to_ioc(rq_qos_id(q, RQ_QOS_COST));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:3330:8: note: Returning from 'q_to_ioc'
           ioc =3D q_to_ioc(bdev_get_queue(bdev));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:3331:7: note: 'ioc' is null
           if (!ioc) {
                ^~~
   block/blk-iocost.c:3331:2: note: Taking true branch
           if (!ioc) {
           ^
   block/blk-iocost.c:3332:9: note: Calling 'blk_iocost_init'
                   ret =3D blk_iocost_init(bdev_get_queue(bdev));
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:2827:8: note: Calling 'kzalloc'
           ioc =3D kzalloc(sizeof(*ioc), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:588:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:605:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:2827:8: note: Returning from 'kzalloc'
           ioc =3D kzalloc(sizeof(*ioc), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:2828:6: note: Assuming 'ioc' is non-null, which parti=
cipates in a condition later
           if (!ioc)
               ^~~~
   block/blk-iocost.c:2828:2: note: Taking false branch
           if (!ioc)

vim +/vtime +2169 block/blk-iocost.c

ab8df828b5f6ea Tejun Heo      2020-09-17  2122  =

2474787a75b4f3 Baolin Wang    2020-11-26  2123  /*
2474787a75b4f3 Baolin Wang    2020-11-26  2124   * Check the active iocgs' =
state to avoid oversleeping and deactive
2474787a75b4f3 Baolin Wang    2020-11-26  2125   * idle iocgs.
2474787a75b4f3 Baolin Wang    2020-11-26  2126   *
2474787a75b4f3 Baolin Wang    2020-11-26  2127   * Since waiters determine =
the sleep durations based on the vrate
2474787a75b4f3 Baolin Wang    2020-11-26  2128   * they saw at the time of =
sleep, if vrate has increased, some
2474787a75b4f3 Baolin Wang    2020-11-26  2129   * waiters could be sleepin=
g for too long. Wake up tardy waiters
2474787a75b4f3 Baolin Wang    2020-11-26  2130   * which should have woken =
up in the last period and expire idle
2474787a75b4f3 Baolin Wang    2020-11-26  2131   * iocgs.
2474787a75b4f3 Baolin Wang    2020-11-26  2132   */
2474787a75b4f3 Baolin Wang    2020-11-26  2133  static int ioc_check_iocgs(=
struct ioc *ioc, struct ioc_now *now)
7caa47151ab2e6 Tejun Heo      2019-08-28  2134  {
2474787a75b4f3 Baolin Wang    2020-11-26  2135  	int nr_debtors =3D 0;
7caa47151ab2e6 Tejun Heo      2019-08-28  2136  	struct ioc_gq *iocg, *tioc=
g;
7caa47151ab2e6 Tejun Heo      2019-08-28  2137  =

7caa47151ab2e6 Tejun Heo      2019-08-28  2138  	list_for_each_entry_safe(i=
ocg, tiocg, &ioc->active_iocgs, active_list) {
d9012a59db5444 Chengming Zhou 2020-07-30  2139  		if (!waitqueue_active(&io=
cg->waitq) && !iocg->abs_vdebt &&
5160a5a53c0c4a Tejun Heo      2020-09-01  2140  		    !iocg->delay && !iocg=
_is_idle(iocg))
7caa47151ab2e6 Tejun Heo      2019-08-28  2141  			continue;
7caa47151ab2e6 Tejun Heo      2019-08-28  2142  =

7caa47151ab2e6 Tejun Heo      2019-08-28  2143  		spin_lock(&iocg->waitq.lo=
ck);
7caa47151ab2e6 Tejun Heo      2019-08-28  2144  =

f0bf84a5dffa08 Tejun Heo      2020-09-01  2145  		/* flush wait and indebt =
stat deltas */
f0bf84a5dffa08 Tejun Heo      2020-09-01  2146  		if (iocg->wait_since) {
2a371f7d5fa575 Chengming Zhou 2022-05-10  2147  			iocg->stat.wait_us +=3D =
now->now - iocg->wait_since;
2474787a75b4f3 Baolin Wang    2020-11-26  2148  			iocg->wait_since =3D now=
->now;
f0bf84a5dffa08 Tejun Heo      2020-09-01  2149  		}
f0bf84a5dffa08 Tejun Heo      2020-09-01  2150  		if (iocg->indebt_since) {
2a371f7d5fa575 Chengming Zhou 2022-05-10  2151  			iocg->stat.indebt_us +=
=3D
2474787a75b4f3 Baolin Wang    2020-11-26  2152  				now->now - iocg->indebt=
_since;
2474787a75b4f3 Baolin Wang    2020-11-26  2153  			iocg->indebt_since =3D n=
ow->now;
f0bf84a5dffa08 Tejun Heo      2020-09-01  2154  		}
f0bf84a5dffa08 Tejun Heo      2020-09-01  2155  		if (iocg->indelay_since) {
2a371f7d5fa575 Chengming Zhou 2022-05-10  2156  			iocg->stat.indelay_us +=
=3D
2474787a75b4f3 Baolin Wang    2020-11-26  2157  				now->now - iocg->indela=
y_since;
2474787a75b4f3 Baolin Wang    2020-11-26  2158  			iocg->indelay_since =3D =
now->now;
f0bf84a5dffa08 Tejun Heo      2020-09-01  2159  		}
f0bf84a5dffa08 Tejun Heo      2020-09-01  2160  =

5160a5a53c0c4a Tejun Heo      2020-09-01  2161  		if (waitqueue_active(&ioc=
g->waitq) || iocg->abs_vdebt ||
5160a5a53c0c4a Tejun Heo      2020-09-01  2162  		    iocg->delay) {
7caa47151ab2e6 Tejun Heo      2019-08-28  2163  			/* might be oversleeping=
 vtime / hweight changes, kick */
2474787a75b4f3 Baolin Wang    2020-11-26  2164  			iocg_kick_waitq(iocg, tr=
ue, now);
bec02dbbafad53 Tejun Heo      2020-09-18  2165  			if (iocg->abs_vdebt || i=
ocg->delay)
dda1315f18536c Tejun Heo      2020-09-01  2166  				nr_debtors++;
7caa47151ab2e6 Tejun Heo      2019-08-28  2167  		} else if (iocg_is_idle(i=
ocg)) {
7caa47151ab2e6 Tejun Heo      2019-08-28  2168  			/* no waiter and idle, d=
eactivate */
ac33e91e2daca4 Tejun Heo      2020-09-01 @2169  			u64 vtime =3D atomic64_r=
ead(&iocg->vtime);
ac33e91e2daca4 Tejun Heo      2020-09-01  2170  =

76efc1c770968d Baolin Wang    2020-12-10  2171  			TRACE_IOCG_PATH(iocg_idl=
e, iocg, now,
76efc1c770968d Baolin Wang    2020-12-10  2172  					atomic64_read(&iocg->a=
ctive_period),
76efc1c770968d Baolin Wang    2020-12-10  2173  					atomic64_read(&ioc->cu=
r_period), vtime);
2474787a75b4f3 Baolin Wang    2020-11-26  2174  			__propagate_weights(iocg=
, 0, 0, false, now);
7caa47151ab2e6 Tejun Heo      2019-08-28  2175  			list_del_init(&iocg->act=
ive_list);
7caa47151ab2e6 Tejun Heo      2019-08-28  2176  		}
7caa47151ab2e6 Tejun Heo      2019-08-28  2177  =

7caa47151ab2e6 Tejun Heo      2019-08-28  2178  		spin_unlock(&iocg->waitq.=
lock);
7caa47151ab2e6 Tejun Heo      2019-08-28  2179  	}
2474787a75b4f3 Baolin Wang    2020-11-26  2180  =

00410f1b09fe7c Tejun Heo      2020-09-01  2181  	commit_weights(ioc);
2474787a75b4f3 Baolin Wang    2020-11-26  2182  	return nr_debtors;
2474787a75b4f3 Baolin Wang    2020-11-26  2183  }
2474787a75b4f3 Baolin Wang    2020-11-26  2184  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0992246509934719210==--

