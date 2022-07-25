Content-Type: multipart/mixed; boundary="===============8888086319373986793=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 52/59] drivers/cxl/core/hdm.c:462:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Mon, 25 Jul 2022 16:58:24 +0000
Message-ID: <202207250044.0xoT4fGe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8888086319373986793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/c=
xl/core/hdm.c:462:6: warning: Branch condition evaluates to a garbage value=
 [clang-analyzer-core.uninitialized.Branch]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
TO: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   b282b26d11c50d48b336fedb5f74b2eca3f7b94c
commit: 89fff505a31a3c7076d4dac14a75837880b308fb [52/59] cxl/region: Enable=
 the assignment of endpoint decoders to regions
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: s390-randconfig-c005-20220721 (https://download.01.org/0day-ci/arch=
ive/20220725/202207250044.0xoT4fGe-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 12fbd2=
d377e396ad61bce56d71c98a1eb1bebfa9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commi=
t/?id=3D89fff505a31a3c7076d4dac14a75837880b308fb
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/=
cxl/cxl.git
        git fetch --no-tags cxl preview
        git checkout 89fff505a31a3c7076d4dac14a75837880b308fb
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
                  ^
   include/linux/smp.h:267:42: note: expanded from macro 'get_cpu'
   #define get_cpu()               ({ preempt_disable(); __smp_processor_id=
(); })
                                                         ^~~~~~~~~~~~~~~~~~=
~~
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_i=
d'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^~~~~~~~~~~~~~~~~~~~~
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   drivers/gpu/drm/msm/msm_gpu_trace.h:87:1: warning: Dereference of null p=
ointer [clang-analyzer-core.NullDereference]
   TRACE_EVENT(msm_gpu_freq_change,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   drivers/gpu/drm/msm/msm_gpu_devfreq.c:30:2: note: Taking false branch
           if (IS_ERR(opp))
           ^
   drivers/gpu/drm/msm/msm_gpu_devfreq.c:33:2: note: Calling 'trace_msm_gpu=
_freq_change'
           trace_msm_gpu_freq_change(dev_pm_opp_get_freq(opp));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_gpu_trace.h:87:1: note: Taking true branch
   TRACE_EVENT(msm_gpu_freq_change,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRA=
CE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:247:3: note: expanded from macro '__DECLARE_T=
RACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                   ^
   drivers/gpu/drm/msm/msm_gpu_trace.h:87:1: note: Dereference of null poin=
ter
   TRACE_EVENT(msm_gpu_freq_change,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/linux/tracepoint.h:250:18: note: expanded from macro '__DECLARE_=
TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:149:31: note: expanded from macro 'TP_CONDITI=
ON'
   #define TP_CONDITION(args...)   args
                                   ^
   include/linux/tracepoint.h:188:9: note: expanded from macro '__DO_TRACE'
                   if (!(cond))                                            \
                         ^~~~
   Suppressed 23 warnings (11 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/w1/slaves/w1_ds2438.c:69:3: warning: Value stored to 'crc' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   crc =3D 0;
                   ^     ~
   drivers/w1/slaves/w1_ds2438.c:69:3: note: Value stored to 'crc' is never=
 read
                   crc =3D 0;
                   ^     ~
   drivers/w1/slaves/w1_ds2438.c:328:9: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D snprintf(buf, count, "%i\n", voltage);
                         ^~~~~~~~
   drivers/w1/slaves/w1_ds2438.c:328:9: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                   ret =3D snprintf(buf, count, "%i\n", voltage);
                         ^~~~~~~~
   drivers/w1/slaves/w1_ds2438.c:428:9: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D snprintf(buf, count, "%i\n", temp);
                         ^~~~~~~~
   drivers/w1/slaves/w1_ds2438.c:428:9: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                   ret =3D snprintf(buf, count, "%i\n", temp);
                         ^~~~~~~~
   drivers/w1/slaves/w1_ds2438.c:449:9: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D snprintf(buf, count, "%u\n", voltage);
                         ^~~~~~~~
   drivers/w1/slaves/w1_ds2438.c:449:9: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                   ret =3D snprintf(buf, count, "%u\n", voltage);
                         ^~~~~~~~
   drivers/w1/slaves/w1_ds2438.c:470:9: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D snprintf(buf, count, "%u\n", voltage);
                         ^~~~~~~~
   drivers/w1/slaves/w1_ds2438.c:470:9: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                   ret =3D snprintf(buf, count, "%u\n", voltage);
                         ^~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
>> drivers/cxl/core/hdm.c:462:6: warning: Branch condition evaluates to a g=
arbage value [clang-analyzer-core.uninitialized.Branch]
           if (rc)
               ^~
   drivers/cxl/core/hdm.c:403:2: note: 'rc' declared without an initial val=
ue
           int rc;
           ^~~~~~
   drivers/cxl/core/hdm.c:406:6: note: Assuming field 'region' is non-null
           if (cxled->cxld.region) {
               ^~~~~~~~~~~~~~~~~~
   drivers/cxl/core/hdm.c:406:2: note: Taking true branch
           if (cxled->cxld.region) {
           ^
   drivers/cxl/core/hdm.c:407:3: note: Taking false branch
                   dev_dbg(dev, "decoder attached to %s\n",
                   ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   drivers/cxl/core/hdm.c:407:3: note: Loop condition is false.  Exiting lo=
op
                   dev_dbg(dev, "decoder attached to %s\n",
                   ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   drivers/cxl/core/hdm.c:409:3: note: Control jumps to line 460
                   goto out;
                   ^
   drivers/cxl/core/hdm.c:462:6: note: Branch condition evaluates to a garb=
age value
           if (rc)
               ^~
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   drivers/cxl/core/region.c:290:16: warning: 1st function call argument is=
 an uninitialized value [clang-analyzer-core.CallAndMessage]
           if (p->res && resource_size(res) =3D=3D size)
                         ^
   drivers/cxl/core/region.c:361:6: note: Assuming 'rc' is 0
           if (rc)
               ^~
   drivers/cxl/core/region.c:361:2: note: Taking false branch
           if (rc)
           ^
   drivers/cxl/core/region.c:365:6: note: Assuming 'rc' is 0
           if (rc)
               ^~
   drivers/cxl/core/region.c:365:2: note: Taking false branch
           if (rc)
           ^
   drivers/cxl/core/region.c:368:6: note: Assuming 'val' is not equal to 0
           if (val)
               ^~~
   drivers/cxl/core/region.c:368:2: note: Taking true branch
           if (val)
           ^
   drivers/cxl/core/region.c:369:8: note: Calling 'alloc_hpa'
                   rc =3D alloc_hpa(cxlr, val);
                        ^~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/region.c:284:2: note: 'res' declared without an initial=
 value
           struct resource *res;
           ^~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/region.c:287:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held_write(&cxl_region_rwsem);
           ^
   include/linux/lockdep.h:321:2: note: expanded from macro 'lockdep_assert=
_held_write'
           lockdep_assert(lockdep_is_held_type(l, 0))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:309:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   arch/s390/include/asm/bug.h:54:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(x);                      \
                                  ^
   drivers/cxl/core/region.c:287:2: note: Left side of '&&' is false
           lockdep_assert_held_write(&cxl_region_rwsem);
           ^
   include/linux/lockdep.h:321:2: note: expanded from macro 'lockdep_assert=
_held_write'
           lockdep_assert(lockdep_is_held_type(l, 0))
           ^
   include/linux/lockdep.h:309:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   drivers/cxl/core/region.c:287:2: note: Taking false branch
           lockdep_assert_held_write(&cxl_region_rwsem);

vim +462 drivers/cxl/core/hdm.c

cf880423b6a059 Dan Williams 2022-05-23  393  =

cf880423b6a059 Dan Williams 2022-05-23  394  int cxl_dpa_alloc(struct cxl_e=
ndpoint_decoder *cxled, unsigned long long size)
cf880423b6a059 Dan Williams 2022-05-23  395  {
cf880423b6a059 Dan Williams 2022-05-23  396  	struct cxl_memdev *cxlmd =3D =
cxled_to_memdev(cxled);
cf880423b6a059 Dan Williams 2022-05-23  397  	resource_size_t free_ram_star=
t, free_pmem_start;
cf880423b6a059 Dan Williams 2022-05-23  398  	struct cxl_port *port =3D cxl=
ed_to_port(cxled);
cf880423b6a059 Dan Williams 2022-05-23  399  	struct cxl_dev_state *cxlds =
=3D cxlmd->cxlds;
cf880423b6a059 Dan Williams 2022-05-23  400  	struct device *dev =3D &cxled=
->cxld.dev;
cf880423b6a059 Dan Williams 2022-05-23  401  	resource_size_t start, avail,=
 skip;
cf880423b6a059 Dan Williams 2022-05-23  402  	struct resource *p, *last;
cf880423b6a059 Dan Williams 2022-05-23  403  	int rc;
cf880423b6a059 Dan Williams 2022-05-23  404  =

cf880423b6a059 Dan Williams 2022-05-23  405  	down_write(&cxl_dpa_rwsem);
89fff505a31a3c Dan Williams 2022-06-04  406  	if (cxled->cxld.region) {
89fff505a31a3c Dan Williams 2022-06-04  407  		dev_dbg(dev, "decoder attach=
ed to %s\n",
89fff505a31a3c Dan Williams 2022-06-04  408  			dev_name(&cxled->cxld.regio=
n->dev));
89fff505a31a3c Dan Williams 2022-06-04  409  		goto out;
89fff505a31a3c Dan Williams 2022-06-04  410  	}
89fff505a31a3c Dan Williams 2022-06-04  411  =

cf880423b6a059 Dan Williams 2022-05-23  412  	if (cxled->cxld.flags & CXL_D=
ECODER_F_ENABLE) {
cf880423b6a059 Dan Williams 2022-05-23  413  		dev_dbg(dev, "decoder enable=
d\n");
cf880423b6a059 Dan Williams 2022-05-23  414  		rc =3D -EBUSY;
cf880423b6a059 Dan Williams 2022-05-23  415  		goto out;
cf880423b6a059 Dan Williams 2022-05-23  416  	}
cf880423b6a059 Dan Williams 2022-05-23  417  =

cf880423b6a059 Dan Williams 2022-05-23  418  	for (p =3D cxlds->ram_res.chi=
ld, last =3D NULL; p; p =3D p->sibling)
cf880423b6a059 Dan Williams 2022-05-23  419  		last =3D p;
cf880423b6a059 Dan Williams 2022-05-23  420  	if (last)
cf880423b6a059 Dan Williams 2022-05-23  421  		free_ram_start =3D last->end=
 + 1;
cf880423b6a059 Dan Williams 2022-05-23  422  	else
cf880423b6a059 Dan Williams 2022-05-23  423  		free_ram_start =3D cxlds->ra=
m_res.start;
cf880423b6a059 Dan Williams 2022-05-23  424  =

cf880423b6a059 Dan Williams 2022-05-23  425  	for (p =3D cxlds->pmem_res.ch=
ild, last =3D NULL; p; p =3D p->sibling)
cf880423b6a059 Dan Williams 2022-05-23  426  		last =3D p;
cf880423b6a059 Dan Williams 2022-05-23  427  	if (last)
cf880423b6a059 Dan Williams 2022-05-23  428  		free_pmem_start =3D last->en=
d + 1;
cf880423b6a059 Dan Williams 2022-05-23  429  	else
cf880423b6a059 Dan Williams 2022-05-23  430  		free_pmem_start =3D cxlds->p=
mem_res.start;
cf880423b6a059 Dan Williams 2022-05-23  431  =

cf880423b6a059 Dan Williams 2022-05-23  432  	if (cxled->mode =3D=3D CXL_DE=
CODER_RAM) {
cf880423b6a059 Dan Williams 2022-05-23  433  		start =3D free_ram_start;
cf880423b6a059 Dan Williams 2022-05-23  434  		avail =3D cxlds->ram_res.end=
 - start + 1;
cf880423b6a059 Dan Williams 2022-05-23  435  		skip =3D 0;
cf880423b6a059 Dan Williams 2022-05-23  436  	} else if (cxled->mode =3D=3D=
 CXL_DECODER_PMEM) {
cf880423b6a059 Dan Williams 2022-05-23  437  		resource_size_t skip_start, =
skip_end;
cf880423b6a059 Dan Williams 2022-05-23  438  =

cf880423b6a059 Dan Williams 2022-05-23  439  		start =3D free_pmem_start;
cf880423b6a059 Dan Williams 2022-05-23  440  		avail =3D cxlds->pmem_res.en=
d - start + 1;
cf880423b6a059 Dan Williams 2022-05-23  441  		skip_start =3D free_ram_star=
t;
cf880423b6a059 Dan Williams 2022-05-23  442  		skip_end =3D start - 1;
cf880423b6a059 Dan Williams 2022-05-23  443  		skip =3D skip_end - skip_sta=
rt + 1;
cf880423b6a059 Dan Williams 2022-05-23  444  	} else {
cf880423b6a059 Dan Williams 2022-05-23  445  		dev_dbg(dev, "mode not set\n=
");
cf880423b6a059 Dan Williams 2022-05-23  446  		rc =3D -EINVAL;
cf880423b6a059 Dan Williams 2022-05-23  447  		goto out;
cf880423b6a059 Dan Williams 2022-05-23  448  	}
cf880423b6a059 Dan Williams 2022-05-23  449  =

cf880423b6a059 Dan Williams 2022-05-23  450  	if (size > avail) {
cf880423b6a059 Dan Williams 2022-05-23  451  		dev_dbg(dev, "%pa exceeds av=
ailable %s capacity: %pa\n", &size,
cf880423b6a059 Dan Williams 2022-05-23  452  			cxled->mode =3D=3D CXL_DECO=
DER_RAM ? "ram" : "pmem",
cf880423b6a059 Dan Williams 2022-05-23  453  			&avail);
cf880423b6a059 Dan Williams 2022-05-23  454  		rc =3D -ENOSPC;
cf880423b6a059 Dan Williams 2022-05-23  455  		goto out;
cf880423b6a059 Dan Williams 2022-05-23  456  	}
cf880423b6a059 Dan Williams 2022-05-23  457  =

cf880423b6a059 Dan Williams 2022-05-23  458  	rc =3D __cxl_dpa_reserve(cxle=
d, start, size, skip);
cf880423b6a059 Dan Williams 2022-05-23  459  out:
cf880423b6a059 Dan Williams 2022-05-23  460  	up_write(&cxl_dpa_rwsem);
cf880423b6a059 Dan Williams 2022-05-23  461  =

cf880423b6a059 Dan Williams 2022-05-23 @462  	if (rc)
cf880423b6a059 Dan Williams 2022-05-23  463  		return rc;
cf880423b6a059 Dan Williams 2022-05-23  464  =

cf880423b6a059 Dan Williams 2022-05-23  465  	return devm_add_action_or_res=
et(&port->dev, cxl_dpa_release, cxled);
cf880423b6a059 Dan Williams 2022-05-23  466  }
cf880423b6a059 Dan Williams 2022-05-23  467  =


:::::: The code at line 462 was first introduced by commit
:::::: cf880423b6a0599499c1f83542cab0b75daa29ba cxl/hdm: Add support for al=
locating DPA to an endpoint decoder

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8888086319373986793==--

