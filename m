Content-Type: multipart/mixed; boundary="===============3716890577115937536=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/4] of: dynamic: add of_node_alloc()
Date: Fri, 03 Jun 2022 03:29:45 +0800
Message-ID: <202206030309.JE6IWFhp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3716890577115937536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/o=
f/dynamic.c:457:3: warning: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220601081801.348571-4-clement.leger@bootlin.com>
References: <20220601081801.348571-4-clement.leger@bootlin.com>
TO: "Cl=C3=A9ment L=C3=A9ger" <clement.leger@bootlin.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
TO: Paul Mackerras <paulus@samba.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Frank Rowand <frowand.list@gmail.com>
TO: Nathan Lynch <nathanl@linux.ibm.com>
TO: Laurent Dufour <ldufour@linux.ibm.com>
TO: Daniel Henrique Barboza <danielhb413@gmail.com>
TO: David Gibson <david@gibson.dropbear.id.au>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: David Hildenbrand <david@redhat.com>
TO: Ohhoon Kwon <ohoono.kwon@samsung.com>
TO: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
TO: YueHaibing <yuehaibing@huawei.com>
CC: devicetree(a)vger.kernel.org
CC: "Cl=C3=A9ment L=C3=A9ger" <clement.leger@bootlin.com>
CC: Steen Hegelund <steen.hegelund@microchip.com>
CC: linux-kernel(a)vger.kernel.org
CC: Lizhi Hou <lizhi.hou@xilinx.com>
CC: Allan Nielsen <allan.nielsen@microchip.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: linuxppc-dev(a)lists.ozlabs.org
CC: Horatiu Vultur <horatiu.vultur@microchip.com>

Hi "Cl=C3=A9ment,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on powerpc/next v5.18 next-20220602]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-L-ger/of-add=
-of_property_alloc-free-and-of_node_alloc/20220601-162238
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm-randconfig-c002-20220531 (https://download.01.org/0day-ci/archi=
ve/20220603/202206030309.JE6IWFhp-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825ab=
d6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/5e1a38b0a68ad3b47e2=
c0b34cbcde600327e1b89
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cl-ment-L-ger/of-add-of_property_a=
lloc-free-and-of_node_alloc/20220601-162238
        git checkout 5e1a38b0a68ad3b47e2c0b34cbcde600327e1b89
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   cpu, =

   channel, =

   clk, =

   name, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ingenic_tcu_timer {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/clocksource/ingenic-timer.c:32:8: note: Excessive padding in 'st=
ruct ingenic_tcu_timer' (44 padding bytes, where 12 is optimal). Optimal fi=
elds order: cevt, cpu, channel, clk, name, consider reordering the fields o=
r adding explicit padding members
   struct ingenic_tcu_timer {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/clocksource/ingenic-timer.c:176:2: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(timer->name, sizeof(timer->name), "TCU%u", timer->chann=
el);
           ^~~~~~~~
   drivers/clocksource/ingenic-timer.c:176:2: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(timer->name, sizeof(timer->name), "TCU%u", timer->chann=
el);
           ^~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/of/property.c:585:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(endpoint, 0, sizeof(*endpoint));
           ^~~~~~
   drivers/of/property.c:585:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(endpoint, 0, sizeof(*endpoint));
           ^~~~~~
   drivers/of/property.c:923:19: warning: Access to field 'full_name' resul=
ts in a dereference of a null pointer [clang-analyzer-core.NullDereference]
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:923:19: note: '?' condition is false
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:923:19: note: Access to field 'full_name' results =
in a dereference of a null pointer
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:929:7: warning: Access to field 'parent' results i=
n a dereference of a null pointer [clang-analyzer-core.NullDereference]
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:929:7: note: '?' condition is false
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:929:7: note: Access to field 'parent' results in a=
 dereference of a null pointer
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/of/dynamic.c:240:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rd, 0, sizeof(rd));
           ^~~~~~
   drivers/of/dynamic.c:240:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(&rd, 0, sizeof(rd));
           ^~~~~~
   drivers/of/dynamic.c:293:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rd, 0, sizeof(rd));
           ^~~~~~
   drivers/of/dynamic.c:293:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(&rd, 0, sizeof(rd));
           ^~~~~~
   drivers/of/dynamic.c:417:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(prop->value, value, len);
                   ^~~~~~
   drivers/of/dynamic.c:417:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(prop->value, value, len);
                   ^~~~~~
>> drivers/of/dynamic.c:457:3: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy((char *)node->full_name, name);
                   ^~~~~~
   drivers/of/dynamic.c:457:3: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
                   strcpy((char *)node->full_name, name);
                   ^~~~~~
   drivers/of/dynamic.c:552:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(rce, ce, sizeof(*rce));
           ^~~~~~
   drivers/of/dynamic.c:552:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(rce, ce, sizeof(*rce));
           ^~~~~~
   drivers/of/dynamic.c:594:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&rd, 0, sizeof(rd));
                   ^~~~~~
   drivers/of/dynamic.c:594:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(&rd, 0, sizeof(rd));
                   ^~~~~~
   drivers/of/dynamic.c:723:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ocs, 0, sizeof(*ocs));
           ^~~~~~
   drivers/of/dynamic.c:723:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(ocs, 0, sizeof(*ocs));
           ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:48:2: warning: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cros_ec_cec->rx_msg.msg, cec_message, len);
           ^~~~~~
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:48:2: note: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cros_ec_cec->rx_msg.msg, cec_message, len);
           ^~~~~~
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:130:2: warning: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(msg.data.msg, cec_msg->msg, cec_msg->len);
           ^~~~~~
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:130:2: note: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(msg.data.msg, cec_msg->msg, cec_msg->len);
           ^~~~~~
   Suppressed 49 warnings (42 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/media/cec/platform/meson/ao-cec.c:432:10: warning: The left oper=
and of '!=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperat=
orResult]
           if (reg !=3D RX_DONE)
                   ^
   drivers/media/cec/platform/meson/ao-cec.c:476:6: note: Assuming the cond=
ition is false
           if (stat & CEC_INTR_TX)
               ^~~~~~~~~~~~~~~~~~
   drivers/media/cec/platform/meson/ao-cec.c:476:2: note: Taking false bran=
ch
           if (stat & CEC_INTR_TX)
           ^
   drivers/media/cec/platform/meson/ao-cec.c:479:2: note: Calling 'meson_ao=
_cec_irq_rx'
           meson_ao_cec_irq_rx(ao_cec);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/platform/meson/ao-cec.c:429:2: note: 'reg' declared wi=
thout an initial value
           u8 reg;
           ^~~~~~
   drivers/media/cec/platform/meson/ao-cec.c:431:2: note: Calling 'meson_ao=
_cec_read'
           meson_ao_cec_read(ao_cec, CEC_RX_MSG_STATUS, &reg, &ret);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/platform/meson/ao-cec.c:248:12: note: Taking false bra=
nch
           u32 reg =3D FIELD_PREP(CEC_RW_ADDR, address);
                     ^
   include/linux/bitfield.h:114:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                   ^
   include/linux/bitfield.h:65:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:332:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/media/cec/platform/meson/ao-cec.c:248:12: note: Loop condition i=
s false.  Exiting loop
           u32 reg =3D FIELD_PREP(CEC_RW_ADDR, address);
                     ^
   include/linux/bitfield.h:114:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                   ^
   include/linux/bitfield.h:65:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)

vim +457 drivers/of/dynamic.c

d8c50088417ebf Pantelis Antoniou  2014-07-04  283  =

d8c50088417ebf Pantelis Antoniou  2014-07-04  284  /**
d8c50088417ebf Pantelis Antoniou  2014-07-04  285   * of_detach_node() - "U=
nplug" a node from the device tree.
3cb025d935d2a1 Lee Jones          2021-03-18  286   * @np:		Pointer to the =
caller's Device Node
d8c50088417ebf Pantelis Antoniou  2014-07-04  287   */
d8c50088417ebf Pantelis Antoniou  2014-07-04  288  int of_detach_node(struc=
t device_node *np)
d8c50088417ebf Pantelis Antoniou  2014-07-04  289  {
f5242e5a883bf1 Grant Likely       2014-11-24  290  	struct of_reconfig_data=
 rd;
d8c50088417ebf Pantelis Antoniou  2014-07-04  291  	unsigned long flags;
d8c50088417ebf Pantelis Antoniou  2014-07-04  292  =

f5242e5a883bf1 Grant Likely       2014-11-24 @293  	memset(&rd, 0, sizeof(r=
d));
f5242e5a883bf1 Grant Likely       2014-11-24  294  	rd.dn =3D np;
f5242e5a883bf1 Grant Likely       2014-11-24  295  =

8a2b22a2595bf8 Grant Likely       2014-07-23  296  	mutex_lock(&of_mutex);
d8c50088417ebf Pantelis Antoniou  2014-07-04  297  	raw_spin_lock_irqsave(&=
devtree_lock, flags);
d8c50088417ebf Pantelis Antoniou  2014-07-04  298  	__of_detach_node(np);
6afc0dc3815735 Grant Likely       2014-06-26  299  	raw_spin_unlock_irqrest=
ore(&devtree_lock, flags);
6afc0dc3815735 Grant Likely       2014-06-26  300  =

8a2b22a2595bf8 Grant Likely       2014-07-23  301  	__of_detach_node_sysfs(=
np);
8a2b22a2595bf8 Grant Likely       2014-07-23  302  	mutex_unlock(&of_mutex);
259092a35c7e11 Grant Likely       2014-07-16  303  =

f5242e5a883bf1 Grant Likely       2014-11-24  304  	of_reconfig_notify(OF_R=
ECONFIG_DETACH_NODE, &rd);
259092a35c7e11 Grant Likely       2014-07-16  305  =

58fb82ccbccca2 Ding Xiang         2020-03-30  306  	return 0;
6afc0dc3815735 Grant Likely       2014-06-26  307  }
bb91f923d17657 Gavin Shan         2016-05-03  308  EXPORT_SYMBOL_GPL(of_det=
ach_node);
6afc0dc3815735 Grant Likely       2014-06-26  309  =

070ea018fa092f Lixin Wang         2017-10-23  310  static void property_lis=
t_free(struct property *prop_list)
070ea018fa092f Lixin Wang         2017-10-23  311  {
070ea018fa092f Lixin Wang         2017-10-23  312  	struct property *prop, =
*next;
070ea018fa092f Lixin Wang         2017-10-23  313  =

070ea018fa092f Lixin Wang         2017-10-23  314  	for (prop =3D prop_list=
; prop !=3D NULL; prop =3D next) {
070ea018fa092f Lixin Wang         2017-10-23  315  		next =3D prop->next;
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  316  		of_property_=
free(prop);
070ea018fa092f Lixin Wang         2017-10-23  317  	}
070ea018fa092f Lixin Wang         2017-10-23  318  }
070ea018fa092f Lixin Wang         2017-10-23  319  =

6afc0dc3815735 Grant Likely       2014-06-26  320  /**
6afc0dc3815735 Grant Likely       2014-06-26  321   * of_node_release() - r=
elease a dynamically allocated node
3cb025d935d2a1 Lee Jones          2021-03-18  322   * @kobj: kernel object =
of the node to be released
6afc0dc3815735 Grant Likely       2014-06-26  323   *
6afc0dc3815735 Grant Likely       2014-06-26  324   * In of_node_put() this=
 function is passed to kref_put() as the destructor.
6afc0dc3815735 Grant Likely       2014-06-26  325   */
6afc0dc3815735 Grant Likely       2014-06-26  326  void of_node_release(str=
uct kobject *kobj)
6afc0dc3815735 Grant Likely       2014-06-26  327  {
6afc0dc3815735 Grant Likely       2014-06-26  328  	struct device_node *nod=
e =3D kobj_to_device_node(kobj);
6afc0dc3815735 Grant Likely       2014-06-26  329  =

6afc0dc3815735 Grant Likely       2014-06-26  330  	/* We should never be r=
eleasing nodes that haven't been detached. */
6afc0dc3815735 Grant Likely       2014-06-26  331  	if (!of_node_check_flag=
(node, OF_DETACHED)) {
0d638a07d3a1e9 Rob Herring        2017-06-01  332  		pr_err("ERROR: Bad of_=
node_put() on %pOF\n", node);
6afc0dc3815735 Grant Likely       2014-06-26  333  		dump_stack();
6afc0dc3815735 Grant Likely       2014-06-26  334  		return;
6afc0dc3815735 Grant Likely       2014-06-26  335  	}
6afc0dc3815735 Grant Likely       2014-06-26  336  	if (!of_node_check_flag=
(node, OF_DYNAMIC))
6afc0dc3815735 Grant Likely       2014-06-26  337  		return;
6afc0dc3815735 Grant Likely       2014-06-26  338  =

144552c7869253 Frank Rowand       2018-10-04  339  	if (of_node_check_flag(=
node, OF_OVERLAY)) {
144552c7869253 Frank Rowand       2018-10-04  340  =

144552c7869253 Frank Rowand       2018-10-04  341  		if (!of_node_check_fla=
g(node, OF_OVERLAY_FREE_CSET)) {
144552c7869253 Frank Rowand       2018-10-04  342  			/* premature refcount=
 of zero, do not free memory */
144552c7869253 Frank Rowand       2018-10-04  343  			pr_err("ERROR: memory=
 leak before free overlay changeset,  %pOF\n",
144552c7869253 Frank Rowand       2018-10-04  344  			       node);
144552c7869253 Frank Rowand       2018-10-04  345  			return;
144552c7869253 Frank Rowand       2018-10-04  346  		}
144552c7869253 Frank Rowand       2018-10-04  347  =

144552c7869253 Frank Rowand       2018-10-04  348  		/*
144552c7869253 Frank Rowand       2018-10-04  349  		 * If node->properties=
 non-empty then properties were added
144552c7869253 Frank Rowand       2018-10-04  350  		 * to this node either=
 by different overlay that has not
144552c7869253 Frank Rowand       2018-10-04  351  		 * yet been removed, o=
r by a non-overlay mechanism.
144552c7869253 Frank Rowand       2018-10-04  352  		 */
144552c7869253 Frank Rowand       2018-10-04  353  		if (node->properties)
144552c7869253 Frank Rowand       2018-10-04  354  			pr_err("ERROR: %s(), =
unexpected properties in %pOF\n",
144552c7869253 Frank Rowand       2018-10-04  355  			       __func__, node=
);
144552c7869253 Frank Rowand       2018-10-04  356  	}
144552c7869253 Frank Rowand       2018-10-04  357  =

070ea018fa092f Lixin Wang         2017-10-23  358  	property_list_free(node=
->properties);
070ea018fa092f Lixin Wang         2017-10-23  359  	property_list_free(node=
->deadprops);
7b337cb3ebde38 Saravana Kannan    2020-11-20  360  	fwnode_links_purge(of_f=
wnode_handle(node));
6afc0dc3815735 Grant Likely       2014-06-26  361  =

5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  362  	if (node->ful=
l_name !=3D (const char *) (node + 1))
6afc0dc3815735 Grant Likely       2014-06-26  363  		kfree(node->full_name);
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  364  =

6afc0dc3815735 Grant Likely       2014-06-26  365  	kfree(node->data);
6afc0dc3815735 Grant Likely       2014-06-26  366  	kfree(node);
6afc0dc3815735 Grant Likely       2014-06-26  367  }
698433963b98d6 Pantelis Antoniou  2014-07-04  368  =

698433963b98d6 Pantelis Antoniou  2014-07-04  369  /**
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  370   * of_property=
_free - Free a property allocated dynamically.
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  371   * @prop:	Prop=
erty to be freed
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  372   */
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  373  void of_proper=
ty_free(const struct property *prop)
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  374  {
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  375  	if (!of_prope=
rty_check_flag(prop, OF_DYNAMIC))
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  376  		return;
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  377  =

277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  378  	if (prop->val=
ue !=3D prop + 1)
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  379  		kfree(prop->=
value);
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  380  =

277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  381  	kfree(prop->n=
ame);
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  382  	kfree(prop);
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  383  }
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  384  EXPORT_SYMBOL(=
of_property_free);
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  385  =

277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  386  /**
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  387   * of_property=
_alloc - Allocate a property dynamically.
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  388   * @name:	Name=
 of the new property
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  389   * @value:	Val=
ue that will be copied into the new property value or NULL
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  390   *		if only @l=
en allocation is needed.
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  391   * @len:	Lengt=
h of new property value and if @value is provided, the
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  392   * 		length of=
 the value to be copied
698433963b98d6 Pantelis Antoniou  2014-07-04  393   * @allocflags:	Allocati=
on flags (typically pass GFP_KERNEL)
698433963b98d6 Pantelis Antoniou  2014-07-04  394   *
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  395   * Create a pr=
operty by dynamically allocating the memory of both the
27b3383a143212 Geert Uytterhoeven 2014-10-22  396   * property structure an=
d the property name & contents. The property's
698433963b98d6 Pantelis Antoniou  2014-07-04  397   * flags have the OF_DYN=
AMIC bit set so that we can differentiate between
698433963b98d6 Pantelis Antoniou  2014-07-04  398   * dynamically allocated=
 properties and not.
8c8239c2c1fb82 Rob Herring        2021-03-25  399   *
8c8239c2c1fb82 Rob Herring        2021-03-25  400   * Return: The newly all=
ocated property or NULL on out of memory error.
698433963b98d6 Pantelis Antoniou  2014-07-04  401   */
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  402  struct propert=
y *of_property_alloc(const char *name, const void *value,
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  403  				   size_t =
len, gfp_t allocflags)
698433963b98d6 Pantelis Antoniou  2014-07-04  404  {
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  405  	struct proper=
ty *prop;
698433963b98d6 Pantelis Antoniou  2014-07-04  406  =

277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  407  	prop =3D kzal=
loc(sizeof(*prop) + len, allocflags);
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  408  	if (!prop)
698433963b98d6 Pantelis Antoniou  2014-07-04  409  		return NULL;
698433963b98d6 Pantelis Antoniou  2014-07-04  410  =

277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  411  	prop->name =
=3D kstrdup(name, allocflags);
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  412  	if (!prop->na=
me)
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  413  		goto out_err;
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  414  =

277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  415  	prop->value =
=3D prop + 1;
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  416  	if (value)
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  417  		memcpy(prop-=
>value, value, len);
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  418  =

277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  419  	prop->length =
=3D len;
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  420  	of_property_s=
et_flag(prop, OF_DYNAMIC);
698433963b98d6 Pantelis Antoniou  2014-07-04  421  =

277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  422  	return prop;
698433963b98d6 Pantelis Antoniou  2014-07-04  423  =

277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  424  out_err:
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  425  	of_property_f=
ree(prop);
698433963b98d6 Pantelis Antoniou  2014-07-04  426  =

698433963b98d6 Pantelis Antoniou  2014-07-04  427  	return NULL;
698433963b98d6 Pantelis Antoniou  2014-07-04  428  }
277b84148f45b3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  429  EXPORT_SYMBOL(=
of_property_alloc);
698433963b98d6 Pantelis Antoniou  2014-07-04  430  =

5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  431  /**
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  432   * of_node_all=
oc - Allocate a node dynamically.
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  433   * @name:	Node=
 name
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  434   * @allocflags=
:	Allocation flags (typically pass GFP_KERNEL)
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  435   *
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  436   * Create a no=
de by dynamically allocating the memory of both the
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  437   * node struct=
ure and the node name & contents. The node's
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  438   * flags have =
the OF_DYNAMIC & OF_DETACHED bit set so that we can
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  439   * differentia=
te between dynamically allocated nodes and not.
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  440   *
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  441   * Return: The=
 newly allocated node or NULL on out of memory error.
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  442   */
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  443  struct device_=
node *of_node_alloc(const char *name, gfp_t allocflags)
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  444  {
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  445  	struct device=
_node *node;
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  446  	int name_len =
=3D 0;
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  447  =

5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  448  	if (name)
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  449  		name_len =3D=
 strlen(name) + 1;
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  450  =

5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  451  	node =3D kzal=
loc(sizeof(*node) + name_len, allocflags);
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  452  	if (!node)
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  453  		return NULL;
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  454  =

5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  455  	if (name) {
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  456  		node->full_n=
ame =3D (const char *) (node + 1);
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01 @457  		strcpy((char=
 *)node->full_name, name);
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  458  	}
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  459  =

5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  460  	of_node_set_f=
lag(node, OF_DYNAMIC);
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  461  	of_node_set_f=
lag(node, OF_DETACHED);
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  462  	of_node_init(=
node);
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  463  =

5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  464  	return node;
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  465  }
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  466  EXPORT_SYMBOL(=
of_node_alloc);
5e1a38b0a68ad3 Cl=C3=A9ment L=C3=A9ger      2022-06-01  467  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3716890577115937536==--

