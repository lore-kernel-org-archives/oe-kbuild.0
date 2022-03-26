Content-Type: multipart/mixed; boundary="===============9139465829778160093=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/irq/chip.c:1581:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 27 Mar 2022 00:30:57 +0800
Message-ID: <202203270001.ZZ7rmWmr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9139465829778160093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Marc Zyngier <maz@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   52d543b5497cf31d6baeb0bcfe5a5474c3238578
commit: 1f8863bfb5ca500ea1c7669b16b1931ba27fce20 genirq: Allow the PM devic=
e to originate from irq domain
date:   6 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 6 weeks ago
config: riscv-randconfig-c006-20220323 (https://download.01.org/0day-ci/arc=
hive/20220327/202203270001.ZZ7rmWmr-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 902f47=
08fe1d03b0de7e5315ef875006a6adc319)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D1f8863bfb5ca500ea1c7669b16b1931ba27fce20
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1f8863bfb5ca500ea1c7669b16b1931ba27fce20
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/indirect.c:155:47: note: The right operand of '+' is a garbage v=
alue
           add_chain(chain, NULL, EXT4_I(inode)->i_data + *offsets);
                                                        ^ ~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (7 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (6 in non-user code, 10 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   kernel/kprobes.c:1052:2: warning: Argument to kfree() is a constant addr=
ess (290), which is not memory allocated by malloc() [clang-analyzer-unix.M=
alloc]
           kfree(p);
           ^
   kernel/kprobes.c:2172:2: note: Calling 'unregister_kretprobes'
           unregister_kretprobes(&rp, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kprobes.c:2180:6: note: 'num' is > 0
           if (num <=3D 0)
               ^~~
   kernel/kprobes.c:2180:2: note: Taking false branch
           if (num <=3D 0)
           ^
   kernel/kprobes.c:2183:2: note: Loop condition is true.  Entering loop bo=
dy
           for (i =3D 0; i < num; i++) {
           ^
   kernel/kprobes.c:2184:3: note: Taking false branch
                   if (__unregister_kprobe_top(&rps[i]->kp) < 0)
                   ^
   kernel/kprobes.c:2183:2: note: Loop condition is false. Execution contin=
ues on line 2188
           for (i =3D 0; i < num; i++) {
           ^
   kernel/kprobes.c:2191:2: note: Loop condition is true.  Entering loop bo=
dy
           for (i =3D 0; i < num; i++) {
           ^
   kernel/kprobes.c:2192:7: note: Assuming field 'addr' is non-null
                   if (rps[i]->kp.addr) {
                       ^~~~~~~~~~~~~~~
   kernel/kprobes.c:2192:3: note: Taking true branch
                   if (rps[i]->kp.addr) {
                   ^
   kernel/kprobes.c:2193:4: note: Calling '__unregister_kprobe_bottom'
                           __unregister_kprobe_bottom(&rps[i]->kp);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kprobes.c:1818:6: note: Assuming the condition is false
           if (list_empty(&p->list))
               ^~~~~~~~~~~~~~~~~~~~
   kernel/kprobes.c:1818:2: note: Taking false branch
           if (list_empty(&p->list))
           ^
   kernel/kprobes.c:1821:7: note: Taking true branch
           else if (list_is_singular(&p->list)) {
                ^
   kernel/kprobes.c:1825:3: note: Calling 'free_aggr_kprobe'
                   free_aggr_kprobe(ap);
                   ^~~~~~~~~~~~~~~~~~~~
   kernel/kprobes.c:1052:2: note: Argument to kfree() is a constant address=
 (290), which is not memory allocated by malloc()
           kfree(p);
           ^     ~
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   kernel/relay.c:443:8: warning: Although the value stored to 'buf' is use=
d in the enclosing expression, the value is never actually read from 'buf' =
[clang-analyzer-deadcode.DeadStores]
                   if ((buf =3D *per_cpu_ptr(chan->buf, cpu)))
                        ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/relay.c:443:8: note: Although the value stored to 'buf' is used i=
n the enclosing expression, the value is never actually read from 'buf'
                   if ((buf =3D *per_cpu_ptr(chan->buf, cpu)))
                        ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> kernel/irq/chip.c:1581:17: warning: Value stored to 'dev' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D irq_get_parent_device(data);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/chip.c:1581:17: note: Value stored to 'dev' during its initia=
lization is never read
           struct device *dev =3D irq_get_parent_device(data);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/chip.c:1605:17: warning: Value stored to 'dev' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D irq_get_parent_device(data);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/chip.c:1605:17: note: Value stored to 'dev' during its initia=
lization is never read
           struct device *dev =3D irq_get_parent_device(data);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   kernel/irq/affinity.c:237:22: warning: Division by zero [clang-analyzer-=
core.DivideZero]
                                    numvecs * ncpus / remaining_ncpus);
                                                    ^
   kernel/irq/affinity.c:427:6: note: Assuming the condition is true
           if (nvecs > affd->pre_vectors + affd->post_vectors)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/affinity.c:427:2: note: Taking true branch
           if (nvecs > affd->pre_vectors + affd->post_vectors)
           ^
   kernel/irq/affinity.c:436:6: note: Assuming field 'calc_sets' is non-null
           if (!affd->calc_sets)
               ^~~~~~~~~~~~~~~~
   kernel/irq/affinity.c:436:2: note: Taking false branch
           if (!affd->calc_sets)
           ^
   kernel/irq/affinity.c:442:19: note: Assuming field 'nr_sets' is <=3D 4
           if (WARN_ON_ONCE(affd->nr_sets > IRQ_AFFINITY_MAX_SETS))
                            ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   kernel/irq/affinity.c:442:6: note: Taking false branch
           if (WARN_ON_ONCE(affd->nr_sets > IRQ_AFFINITY_MAX_SETS))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   kernel/irq/affinity.c:442:2: note: Taking false branch
           if (WARN_ON_ONCE(affd->nr_sets > IRQ_AFFINITY_MAX_SETS))
           ^
   kernel/irq/affinity.c:446:6: note: Assuming 'affvecs' is not equal to 0
           if (!affvecs)
               ^~~~~~~~
   kernel/irq/affinity.c:446:2: note: Taking false branch
           if (!affvecs)
           ^
   kernel/irq/affinity.c:450:6: note: Assuming 'masks' is non-null
           if (!masks)
               ^~~~~~
   kernel/irq/affinity.c:450:2: note: Taking false branch
           if (!masks)
           ^
   kernel/irq/affinity.c:454:19: note: Assuming 'curvec' is >=3D field 'pre=
_vectors'
           for (curvec =3D 0; curvec < affd->pre_vectors; curvec++)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/affinity.c:454:2: note: Loop condition is false. Execution co=
ntinues on line 461
           for (curvec =3D 0; curvec < affd->pre_vectors; curvec++)
           ^
   kernel/irq/affinity.c:461:28: note: Assuming 'i' is < field 'nr_sets'
           for (i =3D 0, usedvecs =3D 0; i < affd->nr_sets; i++) {
                                     ^~~~~~~~~~~~~~~~~
   kernel/irq/affinity.c:461:2: note: Loop condition is true.  Entering loo=
p body
           for (i =3D 0, usedvecs =3D 0; i < affd->nr_sets; i++) {
           ^
   kernel/irq/affinity.c:465:9: note: Calling 'irq_build_affinity_masks'
                   ret =3D irq_build_affinity_masks(curvec, this_vecs,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/affinity.c:347:2: note: Taking false branch
           if (!zalloc_cpumask_var(&nmsk, GFP_KERNEL))
           ^
   kernel/irq/affinity.c:350:2: note: Taking false branch
           if (!zalloc_cpumask_var(&npresmsk, GFP_KERNEL))
           ^
   kernel/irq/affinity.c:354:7: note: 'node_to_cpumask' is non-null
           if (!node_to_cpumask)
                ^~~~~~~~~~~~~~~
   kernel/irq/affinity.c:354:2: note: Taking false branch
           if (!node_to_cpumask)

vim +/dev +1581 kernel/irq/chip.c

1f8863bfb5ca50 Marc Zyngier 2022-02-01  1571  =

be45beb2df6909 Jon Hunter   2016-06-07  1572  /**
be45beb2df6909 Jon Hunter   2016-06-07  1573   * irq_chip_pm_get - Enable p=
ower for an IRQ chip
be45beb2df6909 Jon Hunter   2016-06-07  1574   * @data:	Pointer to interrup=
t specific data
be45beb2df6909 Jon Hunter   2016-06-07  1575   *
be45beb2df6909 Jon Hunter   2016-06-07  1576   * Enable the power to the IR=
Q chip referenced by the interrupt data
be45beb2df6909 Jon Hunter   2016-06-07  1577   * structure.
be45beb2df6909 Jon Hunter   2016-06-07  1578   */
be45beb2df6909 Jon Hunter   2016-06-07  1579  int irq_chip_pm_get(struct ir=
q_data *data)
be45beb2df6909 Jon Hunter   2016-06-07  1580  {
1f8863bfb5ca50 Marc Zyngier 2022-02-01 @1581  	struct device *dev =3D irq_g=
et_parent_device(data);
be45beb2df6909 Jon Hunter   2016-06-07  1582  	int retval;
be45beb2df6909 Jon Hunter   2016-06-07  1583  =

1f8863bfb5ca50 Marc Zyngier 2022-02-01  1584  	if (IS_ENABLED(CONFIG_PM) &&=
 dev) {
1f8863bfb5ca50 Marc Zyngier 2022-02-01  1585  		retval =3D pm_runtime_get_s=
ync(dev);
be45beb2df6909 Jon Hunter   2016-06-07  1586  		if (retval < 0) {
1f8863bfb5ca50 Marc Zyngier 2022-02-01  1587  			pm_runtime_put_noidle(dev);
be45beb2df6909 Jon Hunter   2016-06-07  1588  			return retval;
be45beb2df6909 Jon Hunter   2016-06-07  1589  		}
be45beb2df6909 Jon Hunter   2016-06-07  1590  	}
be45beb2df6909 Jon Hunter   2016-06-07  1591  =

be45beb2df6909 Jon Hunter   2016-06-07  1592  	return 0;
be45beb2df6909 Jon Hunter   2016-06-07  1593  }
be45beb2df6909 Jon Hunter   2016-06-07  1594  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9139465829778160093==--

