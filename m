Content-Type: multipart/mixed; boundary="===============5115912610206293531=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5161/13576] drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:718:4: warning: Value stored to 'res' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 21 Mar 2022 06:58:05 +0800
Message-ID: <202203210625.lLTmCbdv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5115912610206293531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Luben Tuikov <luben.tuikov@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6d72dda014a4753974eb08950089ddf71fec4f60
commit: a6c40b178092f41b9d6cc8615697c14b1e5a1c3a [5161/13576] drm/amdgpu: S=
how IP discovery in sysfs
:::::: branch date: 3 days ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20220310 (https://download.01.org/0day-ci/arc=
hive/20220321/202203210625.lLTmCbdv-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Da6c40b178092f41b9d6cc8615697c14b1e5a1c3a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout a6c40b178092f41b9d6cc8615697c14b1e5a1c3a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   kernel/rcu/rcuscale.c:486:11: note: Assuming the condition is true
           } while (!torture_must_stop());
                    ^~~~~~~~~~~~~~~~~~~~
   kernel/rcu/rcuscale.c:426:2: note: Loop condition is true. Execution con=
tinues on line 427
           do {
           ^
   kernel/rcu/rcuscale.c:427:7: note: Assuming 'writer_holdoff' is 0
                   if (writer_holdoff)
                       ^~~~~~~~~~~~~~
   kernel/rcu/rcuscale.c:427:3: note: Taking false branch
                   if (writer_holdoff)
                   ^
   kernel/rcu/rcuscale.c:431:7: note: Assuming 'gp_async' is true
                   if (gp_async) {
                       ^~~~~~~~
   kernel/rcu/rcuscale.c:431:3: note: Taking true branch
                   if (gp_async) {
                   ^
   kernel/rcu/rcuscale.c:433:9: note: 'rhp' is non-null
                           if (!rhp)
                                ^~~
   kernel/rcu/rcuscale.c:433:4: note: Taking false branch
                           if (!rhp)
                           ^
   kernel/rcu/rcuscale.c:435:8: note: 'rhp' is non-null
                           if (rhp && atomic_read(this_cpu_ptr(&n_async_inf=
light)) < gp_async_max) {
                               ^~~
   kernel/rcu/rcuscale.c:435:8: note: Left side of '&&' is true
   kernel/rcu/rcuscale.c:435:27: note: Loop condition is false.  Exiting lo=
op
                           if (rhp && atomic_read(this_cpu_ptr(&n_async_inf=
light)) < gp_async_max) {
                                                  ^
   include/linux/percpu-defs.h:265:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
                                   ^
   include/linux/percpu-defs.h:264:26: note: expanded from macro 'raw_cpu_p=
tr'
   #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
                                   ^
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_p=
tr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); =
})
                                                   ^
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PER=
CPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/rcu/rcuscale.c:435:15: note: Assuming the condition is false
                           if (rhp && atomic_read(this_cpu_ptr(&n_async_inf=
light)) < gp_async_max) {
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/rcuscale.c:435:4: note: Taking false branch
                           if (rhp && atomic_read(this_cpu_ptr(&n_async_inf=
light)) < gp_async_max) {
                           ^
   kernel/rcu/rcuscale.c:439:15: note: Assuming the condition is false
                           } else if (!kthread_should_stop()) {
                                      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/rcuscale.c:439:11: note: Taking false branch
                           } else if (!kthread_should_stop()) {
                                  ^
   kernel/rcu/rcuscale.c:443:5: note: Attempt to free released memory
                                   kfree(rhp); /* Because we are stopping. =
*/
                                   ^~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/base/dd.c:689:2: warning: Value stored to 'calltime' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           calltime =3D ktime_get();
           ^          ~~~~~~~~~~~
   drivers/base/dd.c:689:2: note: Value stored to 'calltime' is never read
           calltime =3D ktime_get();
           ^          ~~~~~~~~~~~
   drivers/base/dd.c:691:2: warning: Value stored to 'rettime' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           rettime =3D ktime_get();
           ^         ~~~~~~~~~~~
   drivers/base/dd.c:691:2: note: Value stored to 'rettime' is never read
           rettime =3D ktime_get();
           ^         ~~~~~~~~~~~
   drivers/base/dd.c:1085:2: warning: Value stored to 'ret' is never read [=
clang-analyzer-deadcode.DeadStores]
           ret =3D driver_probe_device(drv, dev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/dd.c:1085:2: note: Value stored to 'ret' is never read
           ret =3D driver_probe_device(drv, dev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:718:4: warning: Value stor=
ed to 'res' is never read [clang-analyzer-deadcode.DeadStores]
                           res =3D kobject_add(&ip_hw_instance->kobj, NULL,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:718:4: note: Value stored =
to 'res' is never read
                           res =3D kobject_add(&ip_hw_instance->kobj, NULL,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   net/sched/sch_teql.c:249:4: warning: Value stored to 'err' is never read=
 [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   net/sched/sch_teql.c:249:4: note: Value stored to 'err' is never read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '64', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   net/sched/sch_choke.c:431:9: note: Calling 'choke_change'
           return choke_change(sch, opt, extack);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_choke.c:350:6: note: Assuming 'opt' is not equal to NULL
           if (opt =3D=3D NULL)
               ^~~~~~~~~~~
   net/sched/sch_choke.c:350:2: note: Taking false branch
           if (opt =3D=3D NULL)
           ^
   net/sched/sch_choke.c:355:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/sch_choke.c:355:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/sch_choke.c:358:6: note: Assuming the condition is false
           if (tb[TCA_CHOKE_PARMS] =3D=3D NULL ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_choke.c:358:6: note: Left side of '||' is false
   net/sched/sch_choke.c:359:6: note: Assuming the condition is false
               tb[TCA_CHOKE_STAB] =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_choke.c:358:2: note: Taking false branch
           if (tb[TCA_CHOKE_PARMS] =3D=3D NULL ||
           ^
   net/sched/sch_choke.c:362:10: note: Assuming the condition is false
           max_P =3D tb[TCA_CHOKE_MAX_P] ? nla_get_u32(tb[TCA_CHOKE_MAX_P])=
 : 0;
                   ^~~~~~~~~~~~~~~~~~~
   net/sched/sch_choke.c:362:10: note: '?' condition is false
   net/sched/sch_choke.c:366:6: note: Assuming the condition is false
           if (!red_check_params(ctl->qth_min, ctl->qth_max, ctl->Wlog, ctl=
->Scell_log, stab))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
   net/sched/sch_choke.c:366:2: note: Taking false branch
           if (!red_check_params(ctl->qth_min, ctl->qth_max, ctl->Wlog, ctl=
->Scell_log, stab))
           ^
   net/sched/sch_choke.c:369:6: note: Assuming the condition is false
           if (ctl->limit > CHOKE_MAX_QUEUE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_choke.c:369:2: note: Taking false branch
           if (ctl->limit > CHOKE_MAX_QUEUE)
           ^
   net/sched/sch_choke.c:372:9: note: '?' condition is false
           mask =3D roundup_pow_of_two(ctl->limit + 1) - 1;
                  ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   net/sched/sch_choke.c:372:9: note: Calling '__roundup_pow_of_two'
           mask =3D roundup_pow_of_two(ctl->limit + 1) - 1;
                  ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __roundup_pow_of_two(n)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:154:2: note: Taking false branch
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/bitops.h:156:9: note: Calling 'fls64'
           return fls64(l);
                  ^~~~~~~~

vim +/res +718 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c

a6c40b178092f4 Luben Tuikov 2022-02-03  639  =

a6c40b178092f4 Luben Tuikov 2022-02-03  640  static int amdgpu_discovery_sy=
sfs_ips(struct amdgpu_device *adev,
a6c40b178092f4 Luben Tuikov 2022-02-03  641  				      struct ip_die_entry =
*ip_die_entry,
a6c40b178092f4 Luben Tuikov 2022-02-03  642  				      const size_t _ip_off=
set, const int num_ips)
a6c40b178092f4 Luben Tuikov 2022-02-03  643  {
a6c40b178092f4 Luben Tuikov 2022-02-03  644  	int ii, jj, kk, res;
a6c40b178092f4 Luben Tuikov 2022-02-03  645  =

a6c40b178092f4 Luben Tuikov 2022-02-03  646  	DRM_DEBUG("num_ips:%d", num_i=
ps);
a6c40b178092f4 Luben Tuikov 2022-02-03  647  =

a6c40b178092f4 Luben Tuikov 2022-02-03  648  	/* Find all IPs of a given HW=
 ID, and add their instance to
a6c40b178092f4 Luben Tuikov 2022-02-03  649  	 * #die/#hw_id/#instance/<att=
ributes>
a6c40b178092f4 Luben Tuikov 2022-02-03  650  	 */
a6c40b178092f4 Luben Tuikov 2022-02-03  651  	for (ii =3D 0; ii < HW_ID_MAX=
; ii++) {
a6c40b178092f4 Luben Tuikov 2022-02-03  652  		struct ip_hw_id *ip_hw_id =
=3D NULL;
a6c40b178092f4 Luben Tuikov 2022-02-03  653  		size_t ip_offset =3D _ip_off=
set;
a6c40b178092f4 Luben Tuikov 2022-02-03  654  =

a6c40b178092f4 Luben Tuikov 2022-02-03  655  		for (jj =3D 0; jj < num_ips;=
 jj++) {
a6c40b178092f4 Luben Tuikov 2022-02-03  656  			struct ip *ip;
a6c40b178092f4 Luben Tuikov 2022-02-03  657  			struct ip_hw_instance *ip_h=
w_instance;
a6c40b178092f4 Luben Tuikov 2022-02-03  658  =

a6c40b178092f4 Luben Tuikov 2022-02-03  659  			ip =3D (struct ip *)(adev->=
mman.discovery_bin + ip_offset);
a6c40b178092f4 Luben Tuikov 2022-02-03  660  			if (amdgpu_discovery_valida=
te_ip(ip) ||
a6c40b178092f4 Luben Tuikov 2022-02-03  661  			    le16_to_cpu(ip->hw_id) =
!=3D ii)
a6c40b178092f4 Luben Tuikov 2022-02-03  662  				goto next_ip;
a6c40b178092f4 Luben Tuikov 2022-02-03  663  =

a6c40b178092f4 Luben Tuikov 2022-02-03  664  			DRM_DEBUG("match:%d @ ip_of=
fset:%ld", ii, ip_offset);
a6c40b178092f4 Luben Tuikov 2022-02-03  665  =

a6c40b178092f4 Luben Tuikov 2022-02-03  666  			/* We have a hw_id match; r=
egister the hw
a6c40b178092f4 Luben Tuikov 2022-02-03  667  			 * block if not yet registe=
red.
a6c40b178092f4 Luben Tuikov 2022-02-03  668  			 */
a6c40b178092f4 Luben Tuikov 2022-02-03  669  			if (!ip_hw_id) {
a6c40b178092f4 Luben Tuikov 2022-02-03  670  				ip_hw_id =3D kzalloc(sizeo=
f(*ip_hw_id), GFP_KERNEL);
a6c40b178092f4 Luben Tuikov 2022-02-03  671  				if (!ip_hw_id)
a6c40b178092f4 Luben Tuikov 2022-02-03  672  					return -ENOMEM;
a6c40b178092f4 Luben Tuikov 2022-02-03  673  				ip_hw_id->hw_id =3D ii;
a6c40b178092f4 Luben Tuikov 2022-02-03  674  =

a6c40b178092f4 Luben Tuikov 2022-02-03  675  				kobject_set_name(&ip_hw_id=
->hw_id_kset.kobj, "%d", ii);
a6c40b178092f4 Luben Tuikov 2022-02-03  676  				ip_hw_id->hw_id_kset.kobj.=
kset =3D &ip_die_entry->ip_kset;
a6c40b178092f4 Luben Tuikov 2022-02-03  677  				ip_hw_id->hw_id_kset.kobj.=
ktype =3D &ip_hw_id_ktype;
a6c40b178092f4 Luben Tuikov 2022-02-03  678  				res =3D kset_register(&ip_=
hw_id->hw_id_kset);
a6c40b178092f4 Luben Tuikov 2022-02-03  679  				if (res) {
a6c40b178092f4 Luben Tuikov 2022-02-03  680  					DRM_ERROR("Couldn't regis=
ter ip_hw_id kset");
a6c40b178092f4 Luben Tuikov 2022-02-03  681  					kfree(ip_hw_id);
a6c40b178092f4 Luben Tuikov 2022-02-03  682  					return res;
a6c40b178092f4 Luben Tuikov 2022-02-03  683  				}
a6c40b178092f4 Luben Tuikov 2022-02-03  684  				if (hw_id_names[ii]) {
a6c40b178092f4 Luben Tuikov 2022-02-03  685  					res =3D sysfs_create_link=
(&ip_die_entry->ip_kset.kobj,
a6c40b178092f4 Luben Tuikov 2022-02-03  686  								&ip_hw_id->hw_id_kset.=
kobj,
a6c40b178092f4 Luben Tuikov 2022-02-03  687  								hw_id_names[ii]);
a6c40b178092f4 Luben Tuikov 2022-02-03  688  					if (res) {
a6c40b178092f4 Luben Tuikov 2022-02-03  689  						DRM_ERROR("Couldn't crea=
te IP link %s in IP Die:%s\n",
a6c40b178092f4 Luben Tuikov 2022-02-03  690  							  hw_id_names[ii],
a6c40b178092f4 Luben Tuikov 2022-02-03  691  							  kobject_name(&ip_die_=
entry->ip_kset.kobj));
a6c40b178092f4 Luben Tuikov 2022-02-03  692  					}
a6c40b178092f4 Luben Tuikov 2022-02-03  693  				}
a6c40b178092f4 Luben Tuikov 2022-02-03  694  			}
a6c40b178092f4 Luben Tuikov 2022-02-03  695  =

a6c40b178092f4 Luben Tuikov 2022-02-03  696  			/* Now register its instanc=
e.
a6c40b178092f4 Luben Tuikov 2022-02-03  697  			 */
a6c40b178092f4 Luben Tuikov 2022-02-03  698  			ip_hw_instance =3D kzalloc(=
struct_size(ip_hw_instance,
a6c40b178092f4 Luben Tuikov 2022-02-03  699  							     base_addr,
a6c40b178092f4 Luben Tuikov 2022-02-03  700  							     ip->num_base_addre=
ss),
a6c40b178092f4 Luben Tuikov 2022-02-03  701  						 GFP_KERNEL);
a6c40b178092f4 Luben Tuikov 2022-02-03  702  			if (!ip_hw_instance) {
a6c40b178092f4 Luben Tuikov 2022-02-03  703  				DRM_ERROR("no memory for i=
p_hw_instance");
a6c40b178092f4 Luben Tuikov 2022-02-03  704  				return -ENOMEM;
a6c40b178092f4 Luben Tuikov 2022-02-03  705  			}
a6c40b178092f4 Luben Tuikov 2022-02-03  706  			ip_hw_instance->hw_id =3D l=
e16_to_cpu(ip->hw_id); /* =3D=3D ii */
a6c40b178092f4 Luben Tuikov 2022-02-03  707  			ip_hw_instance->num_instanc=
e =3D ip->number_instance;
a6c40b178092f4 Luben Tuikov 2022-02-03  708  			ip_hw_instance->major =3D i=
p->major;
a6c40b178092f4 Luben Tuikov 2022-02-03  709  			ip_hw_instance->minor =3D i=
p->minor;
a6c40b178092f4 Luben Tuikov 2022-02-03  710  			ip_hw_instance->revision =
=3D ip->revision;
a6c40b178092f4 Luben Tuikov 2022-02-03  711  			ip_hw_instance->num_base_ad=
dresses =3D ip->num_base_address;
a6c40b178092f4 Luben Tuikov 2022-02-03  712  =

a6c40b178092f4 Luben Tuikov 2022-02-03  713  			for (kk =3D 0; kk < ip_hw_i=
nstance->num_base_addresses; kk++)
a6c40b178092f4 Luben Tuikov 2022-02-03  714  				ip_hw_instance->base_addr[=
kk] =3D ip->base_address[kk];
a6c40b178092f4 Luben Tuikov 2022-02-03  715  =

a6c40b178092f4 Luben Tuikov 2022-02-03  716  			kobject_init(&ip_hw_instanc=
e->kobj, &ip_hw_instance_ktype);
a6c40b178092f4 Luben Tuikov 2022-02-03  717  			ip_hw_instance->kobj.kset =
=3D &ip_hw_id->hw_id_kset;
a6c40b178092f4 Luben Tuikov 2022-02-03 @718  			res =3D kobject_add(&ip_hw_=
instance->kobj, NULL,
a6c40b178092f4 Luben Tuikov 2022-02-03  719  					  "%d", ip_hw_instance->n=
um_instance);
a6c40b178092f4 Luben Tuikov 2022-02-03  720  next_ip:
a6c40b178092f4 Luben Tuikov 2022-02-03  721  			ip_offset +=3D sizeof(*ip) =
+ 4 * (ip->num_base_address - 1);
a6c40b178092f4 Luben Tuikov 2022-02-03  722  		}
a6c40b178092f4 Luben Tuikov 2022-02-03  723  	}
a6c40b178092f4 Luben Tuikov 2022-02-03  724  =

a6c40b178092f4 Luben Tuikov 2022-02-03  725  	return 0;
a6c40b178092f4 Luben Tuikov 2022-02-03  726  }
a6c40b178092f4 Luben Tuikov 2022-02-03  727  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5115912610206293531==--

