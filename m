Content-Type: multipart/mixed; boundary="===============4640617147473369271=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/p2pdma.c:536:11: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Thu, 09 Dec 2021 07:13:10 +0800
Message-ID: <202112090734.vometa8g-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4640617147473369271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chris Down <chris@chrisdown.name>
CC: Petr Mladek <pmladek@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: ad7d61f159db73974f1b0352f21afe04b0bbd920 printk: index: Add indexin=
g support to dev_printk
date:   5 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-c007-20211202 (https://download.01.org/0day-ci/ar=
chive/20211209/202112090734.vometa8g-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b5532=
97ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dad7d61f159db73974f1b0352f21afe04b0bbd920
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ad7d61f159db73974f1b0352f21afe04b0bbd920
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/pci/p2pdma.c:536:11: note: Loop condition is false.  Exiting loop
           p2pdma =3D rcu_dereference(provider->p2pdma);
                    ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/pci/p2pdma.c:536:11: note: Left side of '||' is false
           p2pdma =3D rcu_dereference(provider->p2pdma);
                    ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:31: note: expanded from macro 'rcu_derefere=
nce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
                                        ^
   drivers/pci/p2pdma.c:536:11: note: Assuming the condition is false
           p2pdma =3D rcu_dereference(provider->p2pdma);
                    ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:390:19: note: expanded from macro '__rcu_derefe=
rence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/rcupdate.h:318:8: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                        ^
   drivers/pci/p2pdma.c:536:11: note: Left side of '&&' is false
           p2pdma =3D rcu_dereference(provider->p2pdma);
                    ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:390:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:318:11: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   drivers/pci/p2pdma.c:536:11: note: Loop condition is false.  Exiting loop
           p2pdma =3D rcu_dereference(provider->p2pdma);
                    ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:390:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:316:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
           do {                                                            \
           ^
   drivers/pci/p2pdma.c:537:6: note: Assuming 'p2pdma' is non-null
           if (p2pdma)
               ^~~~~~
   drivers/pci/p2pdma.c:537:2: note: Taking true branch
           if (p2pdma)
           ^
   drivers/pci/p2pdma.c:538:46: note: Passing null pointer value via 1st pa=
rameter 'client'
                   xa_store(&p2pdma->map_types, map_types_idx(client),
                                                              ^~~~~~
   drivers/pci/p2pdma.c:538:32: note: Calling 'map_types_idx'
                   xa_store(&p2pdma->map_types, map_types_idx(client),
                                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/p2pdma.c:409:24: note: Access to field 'bus' results in a de=
reference of a null pointer (loaded from variable 'client')
           return (pci_domain_nr(client->bus) << 16) |
                                 ^~~~~~
>> drivers/pci/p2pdma.c:536:11: warning: Dereference of null pointer [clang=
-analyzer-core.NullDereference]
           p2pdma =3D rcu_dereference(provider->p2pdma);
                    ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/pci/p2pdma.c:470:9: note: Assuming pointer value is null
           while (a) {
                  ^
   drivers/pci/p2pdma.c:470:2: note: Loop condition is false. Execution con=
tinues on line 492
           while (a) {
           ^
   drivers/pci/p2pdma.c:493:2: note: Control jumps to line 527
           goto map_through_host_bridge;
           ^
   drivers/pci/p2pdma.c:527:29: note: Left side of '&&' is false
           if (!cpu_supports_p2pdma() &&
                                      ^
   drivers/pci/p2pdma.c:536:11: note: Left side of '||' is false
           p2pdma =3D rcu_dereference(provider->p2pdma);
                    ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/pci/p2pdma.c:536:11: note: Left side of '||' is false
           p2pdma =3D rcu_dereference(provider->p2pdma);
                    ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/pci/p2pdma.c:536:11: note: Left side of '||' is false
           p2pdma =3D rcu_dereference(provider->p2pdma);
                    ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/pci/p2pdma.c:536:11: note: Left side of '||' is true
           p2pdma =3D rcu_dereference(provider->p2pdma);
                    ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)

vim +536 drivers/pci/p2pdma.c

110203bee05f33 Logan Gunthorpe   2019-08-12  412  =

c6bfaeb573a6ca Logan Gunthorpe   2019-08-12  413  /*
6389d43745228d Logan Gunthorpe   2021-06-10  414   * Calculate the P2PDMA m=
apping type and distance between two PCI devices.
c6bfaeb573a6ca Logan Gunthorpe   2019-08-12  415   *
6389d43745228d Logan Gunthorpe   2021-06-10  416   * If the two devices are=
 the same PCI function, return
6389d43745228d Logan Gunthorpe   2021-06-10  417   * PCI_P2PDMA_MAP_BUS_ADD=
R and a distance of 0.
c6bfaeb573a6ca Logan Gunthorpe   2019-08-12  418   *
6389d43745228d Logan Gunthorpe   2021-06-10  419   * If they are two functi=
ons of the same device, return
6389d43745228d Logan Gunthorpe   2021-06-10  420   * PCI_P2PDMA_MAP_BUS_ADD=
R and a distance of 2 (one hop up to the bridge,
6389d43745228d Logan Gunthorpe   2021-06-10  421   * then one hop back down=
 to another function of the same device).
c6bfaeb573a6ca Logan Gunthorpe   2019-08-12  422   *
6389d43745228d Logan Gunthorpe   2021-06-10  423   * In the case where two =
devices are connected to the same PCIe switch,
6389d43745228d Logan Gunthorpe   2021-06-10  424   * return a distance of 4=
. This corresponds to the following PCI tree:
c6bfaeb573a6ca Logan Gunthorpe   2019-08-12  425   *
c6bfaeb573a6ca Logan Gunthorpe   2019-08-12  426   *     -+  Root Port
c6bfaeb573a6ca Logan Gunthorpe   2019-08-12  427   *      \+ Switch Upstrea=
m Port
6389d43745228d Logan Gunthorpe   2021-06-10  428   *       +-+ Switch Downs=
tream Port 0
c6bfaeb573a6ca Logan Gunthorpe   2019-08-12  429   *       + \- Device A
6389d43745228d Logan Gunthorpe   2021-06-10  430   *       \-+ Switch Downs=
tream Port 1
c6bfaeb573a6ca Logan Gunthorpe   2019-08-12  431   *         \- Device B
c6bfaeb573a6ca Logan Gunthorpe   2019-08-12  432   *
6389d43745228d Logan Gunthorpe   2021-06-10  433   * The distance is 4 beca=
use we traverse from Device A to Downstream Port 0
6389d43745228d Logan Gunthorpe   2021-06-10  434   * to the common Switch U=
pstream Port, back down to Downstream Port 1 and
6389d43745228d Logan Gunthorpe   2021-06-10  435   * then to Device B. The =
mapping type returned depends on the ACS
6389d43745228d Logan Gunthorpe   2021-06-10  436   * redirection setting of=
 the ports along the path.
c6bfaeb573a6ca Logan Gunthorpe   2019-08-12  437   *
6389d43745228d Logan Gunthorpe   2021-06-10  438   * If ACS redirect is set=
 on any port in the path, traffic between the
6389d43745228d Logan Gunthorpe   2021-06-10  439   * devices will go throug=
h the host bridge, so return
6389d43745228d Logan Gunthorpe   2021-06-10  440   * PCI_P2PDMA_MAP_THRU_HO=
ST_BRIDGE; otherwise return
6389d43745228d Logan Gunthorpe   2021-06-10  441   * PCI_P2PDMA_MAP_BUS_ADD=
R.
c6bfaeb573a6ca Logan Gunthorpe   2019-08-12  442   *
c6bfaeb573a6ca Logan Gunthorpe   2019-08-12  443   * Any two devices that h=
ave a data path that goes through the host bridge
6389d43745228d Logan Gunthorpe   2021-06-10  444   * will consult a whiteli=
st. If the host bridge is in the whitelist, return
6389d43745228d Logan Gunthorpe   2021-06-10  445   * PCI_P2PDMA_MAP_THRU_HO=
ST_BRIDGE with the distance set to the number of
6389d43745228d Logan Gunthorpe   2021-06-10  446   * ports per above. If th=
e device is not in the whitelist, return
c6bfaeb573a6ca Logan Gunthorpe   2019-08-12  447   * PCI_P2PDMA_MAP_NOT_SUP=
PORTED.
c6bfaeb573a6ca Logan Gunthorpe   2019-08-12  448   */
c6bfaeb573a6ca Logan Gunthorpe   2019-08-12  449  static enum pci_p2pdma_ma=
p_type
6389d43745228d Logan Gunthorpe   2021-06-10  450  calc_map_type_and_dist(st=
ruct pci_dev *provider, struct pci_dev *client,
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  451  		int *dist, bool verbose)
c6bfaeb573a6ca Logan Gunthorpe   2019-08-12  452  {
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  453  	enum pci_p2pdma_map_type=
 map_type =3D PCI_P2PDMA_MAP_THRU_HOST_BRIDGE;
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  454  	struct pci_dev *a =3D pr=
ovider, *b =3D client, *bb;
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  455  	bool acs_redirects =3D f=
alse;
ae21f835a5bda0 Eric Dumazet      2021-07-01  456  	struct pci_p2pdma *p2pdm=
a;
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  457  	struct seq_buf acs_list;
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  458  	int acs_cnt =3D 0;
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  459  	int dist_a =3D 0;
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  460  	int dist_b =3D 0;
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  461  	char buf[128];
e2cbfbf78968db Logan Gunthorpe   2019-08-12  462  =

d1b8dc09dd7124 Christoph Hellwig 2021-06-14  463  	seq_buf_init(&acs_list, =
buf, sizeof(buf));
e2cbfbf78968db Logan Gunthorpe   2019-08-12  464  =

d1b8dc09dd7124 Christoph Hellwig 2021-06-14  465  	/*
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  466  	 * Note, we don't need t=
o take references to devices returned by
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  467  	 * pci_upstream_bridge()=
 seeing we hold a reference to a child
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  468  	 * device which will alr=
eady hold a reference to the upstream bridge.
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  469  	 */
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  470  	while (a) {
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  471  		dist_b =3D 0;
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  472  =

d1b8dc09dd7124 Christoph Hellwig 2021-06-14  473  		if (pci_bridge_has_acs_=
redir(a)) {
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  474  			seq_buf_print_bus_devf=
n(&acs_list, a);
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  475  			acs_cnt++;
e2cbfbf78968db Logan Gunthorpe   2019-08-12  476  		}
e2cbfbf78968db Logan Gunthorpe   2019-08-12  477  =

d1b8dc09dd7124 Christoph Hellwig 2021-06-14  478  		bb =3D b;
110203bee05f33 Logan Gunthorpe   2019-08-12  479  =

d1b8dc09dd7124 Christoph Hellwig 2021-06-14  480  		while (bb) {
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  481  			if (a =3D=3D bb)
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  482  				goto check_b_path_acs;
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  483  =

d1b8dc09dd7124 Christoph Hellwig 2021-06-14  484  			bb =3D pci_upstream_br=
idge(bb);
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  485  			dist_b++;
c6bfaeb573a6ca Logan Gunthorpe   2019-08-12  486  		}
c6bfaeb573a6ca Logan Gunthorpe   2019-08-12  487  =

d1b8dc09dd7124 Christoph Hellwig 2021-06-14  488  		a =3D pci_upstream_brid=
ge(a);
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  489  		dist_a++;
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  490  	}
52916982af48d9 Logan Gunthorpe   2018-10-04  491  =

d1b8dc09dd7124 Christoph Hellwig 2021-06-14  492  	*dist =3D dist_a + dist_=
b;
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  493  	goto map_through_host_br=
idge;
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  494  =

d1b8dc09dd7124 Christoph Hellwig 2021-06-14  495  check_b_path_acs:
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  496  	bb =3D b;
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  497  =

d1b8dc09dd7124 Christoph Hellwig 2021-06-14  498  	while (bb) {
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  499  		if (a =3D=3D bb)
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  500  			break;
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  501  =

d1b8dc09dd7124 Christoph Hellwig 2021-06-14  502  		if (pci_bridge_has_acs_=
redir(bb)) {
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  503  			seq_buf_print_bus_devf=
n(&acs_list, bb);
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  504  			acs_cnt++;
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  505  		}
52916982af48d9 Logan Gunthorpe   2018-10-04  506  =

d1b8dc09dd7124 Christoph Hellwig 2021-06-14  507  		bb =3D pci_upstream_bri=
dge(bb);
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  508  	}
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  509  =

d1b8dc09dd7124 Christoph Hellwig 2021-06-14  510  	*dist =3D dist_a + dist_=
b;
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  511  =

d1b8dc09dd7124 Christoph Hellwig 2021-06-14  512  	if (!acs_cnt) {
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  513  		map_type =3D PCI_P2PDMA=
_MAP_BUS_ADDR;
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  514  		goto done;
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  515  	}
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  516  =

d1b8dc09dd7124 Christoph Hellwig 2021-06-14  517  	if (verbose) {
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  518  		acs_list.buffer[acs_lis=
t.len-1] =3D 0; /* drop final semicolon */
72583084e3fe33 Logan Gunthorpe   2019-08-12  519  		pci_warn(client, "ACS r=
edirect is set between the client and provider (%s)\n",
52916982af48d9 Logan Gunthorpe   2018-10-04  520  			 pci_name(provider));
52916982af48d9 Logan Gunthorpe   2018-10-04  521  		pci_warn(client, "to di=
sable ACS redirect for this path, add the kernel parameter: pci=3Ddisable_a=
cs_redir=3D%s\n",
52916982af48d9 Logan Gunthorpe   2018-10-04  522  			 acs_list.buffer);
72583084e3fe33 Logan Gunthorpe   2019-08-12  523  	}
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  524  	acs_redirects =3D true;
52916982af48d9 Logan Gunthorpe   2018-10-04  525  =

d1b8dc09dd7124 Christoph Hellwig 2021-06-14  526  map_through_host_bridge:
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  527  	if (!cpu_supports_p2pdma=
() &&
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  528  	    !host_bridge_whiteli=
st(provider, client, acs_redirects)) {
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  529  		if (verbose)
72583084e3fe33 Logan Gunthorpe   2019-08-12  530  			pci_warn(client, "cann=
ot be used for peer-to-peer DMA as the client and provider (%s) do not shar=
e an upstream bridge or whitelisted host bridge\n",
52916982af48d9 Logan Gunthorpe   2018-10-04  531  				 pci_name(provider));
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  532  		map_type =3D PCI_P2PDMA=
_MAP_NOT_SUPPORTED;
52916982af48d9 Logan Gunthorpe   2018-10-04  533  	}
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  534  done:
ae21f835a5bda0 Eric Dumazet      2021-07-01  535  	rcu_read_lock();
ae21f835a5bda0 Eric Dumazet      2021-07-01 @536  	p2pdma =3D rcu_dereferen=
ce(provider->p2pdma);
ae21f835a5bda0 Eric Dumazet      2021-07-01  537  	if (p2pdma)
ae21f835a5bda0 Eric Dumazet      2021-07-01 @538  		xa_store(&p2pdma->map_t=
ypes, map_types_idx(client),
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  539  			 xa_mk_value(map_type)=
, GFP_KERNEL);
ae21f835a5bda0 Eric Dumazet      2021-07-01  540  	rcu_read_unlock();
d1b8dc09dd7124 Christoph Hellwig 2021-06-14  541  	return map_type;
52916982af48d9 Logan Gunthorpe   2018-10-04  542  }
52916982af48d9 Logan Gunthorpe   2018-10-04  543  =


:::::: The code at line 536 was first introduced by commit
:::::: ae21f835a5bda0ef1d00940373445693a764d89e PCI/P2PDMA: Finish RCU conv=
ersion of pdev->p2pdma

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4640617147473369271==--

