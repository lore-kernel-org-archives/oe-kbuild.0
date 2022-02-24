Content-Type: multipart/mixed; boundary="===============0399833125661575192=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6850/7915] mm/nommu.c:573:2: warning: Value stored to 'prev' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 24 Feb 2022 18:02:54 +0800
Message-ID: <202202241715.3eVmPnXO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0399833125661575192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Liam R. Howlett" <Liam.Howlett@Oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d4a0ae62a277377de396850ed4b709b6bd9b7326
commit: b3d7ba3cdf23cae36715a695c7569f617e57d39d [6850/7915] mm: Remove the=
 vma linked list
:::::: branch date: 8 hours ago
:::::: commit date: 4 days ago
config: arm-randconfig-c002-20220223 (https://download.01.org/0day-ci/archi=
ve/20220224/202202241715.3eVmPnXO-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Db3d7ba3cdf23cae36715a695c7569f617e57d39d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b3d7ba3cdf23cae36715a695c7569f617e57d39d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/xfs/libxfs/xfs_defer.c:513:3: note: Taking false branch
                   if (error)
                   ^
   fs/xfs/libxfs/xfs_defer.c:518:7: note: 'error' is 0
                   if (error)
                       ^~~~~
   fs/xfs/libxfs/xfs_defer.c:518:3: note: Taking false branch
                   if (error)
                   ^
   fs/xfs/libxfs/xfs_defer.c:523:11: note: Calling 'xfs_defer_finish_one'
                   error =3D xfs_defer_finish_one(*tp, dfp);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_defer.c:442:2: note: 'error' declared without an initi=
al value
           int                             error;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_defer.c:447:2: note: Loop condition is false. Executio=
n continues on line 470
           list_for_each_safe(li, n, &dfp->dfp_work) {
           ^
   include/linux/list.h:607:2: note: expanded from macro 'list_for_each_saf=
e'
           for (pos =3D (head)->next, n =3D pos->next; \
           ^
   fs/xfs/libxfs/xfs_defer.c:473:6: note: Assuming field 'finish_cleanup' i=
s non-null
           if (ops->finish_cleanup)
               ^~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_defer.c:473:2: note: Taking true branch
           if (ops->finish_cleanup)
           ^
   fs/xfs/libxfs/xfs_defer.c:474:3: note: 3rd function call argument is an =
uninitialized value
                   ops->finish_cleanup(tp, state, error);
                   ^                              ~~~~~
   fs/xfs/libxfs/xfs_defer.c:475:2: warning: Undefined or garbage value ret=
urned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return error;
           ^
   fs/xfs/libxfs/xfs_defer.c:550:10: note: Calling 'xfs_defer_finish_noroll'
           error =3D xfs_defer_finish_noroll(tp);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_defer.c:494:2: note: Assuming the condition is false
           ASSERT((*tp)->t_flags & XFS_TRANS_PERM_LOG_RES);
           ^
   fs/xfs/xfs_linux.h:208:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
            ^~~~~~~~~~~~
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   fs/xfs/libxfs/xfs_defer.c:494:2: note: '?' condition is true
           ASSERT((*tp)->t_flags & XFS_TRANS_PERM_LOG_RES);
           ^
   fs/xfs/xfs_linux.h:208:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_defer.c:499:9: note: Left side of '||' is false
           while (!list_empty(&dop_pending) || !list_empty(&(*tp)->t_dfops)=
) {
                  ^
   fs/xfs/libxfs/xfs_defer.c:499:2: note: Loop condition is true.  Entering=
 loop body
           while (!list_empty(&dop_pending) || !list_empty(&(*tp)->t_dfops)=
) {
           ^
   fs/xfs/libxfs/xfs_defer.c:513:7: note: 'error' is 0
                   if (error)
                       ^~~~~
   fs/xfs/libxfs/xfs_defer.c:513:3: note: Taking false branch
                   if (error)
                   ^
   fs/xfs/libxfs/xfs_defer.c:518:7: note: 'error' is 0
                   if (error)
                       ^~~~~
   fs/xfs/libxfs/xfs_defer.c:518:3: note: Taking false branch
                   if (error)
                   ^
   fs/xfs/libxfs/xfs_defer.c:523:11: note: Calling 'xfs_defer_finish_one'
                   error =3D xfs_defer_finish_one(*tp, dfp);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_defer.c:442:2: note: 'error' declared without an initi=
al value
           int                             error;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_defer.c:447:2: note: Loop condition is false. Executio=
n continues on line 470
           list_for_each_safe(li, n, &dfp->dfp_work) {
           ^
   include/linux/list.h:607:2: note: expanded from macro 'list_for_each_saf=
e'
           for (pos =3D (head)->next, n =3D pos->next; \
           ^
   fs/xfs/libxfs/xfs_defer.c:473:6: note: Assuming field 'finish_cleanup' i=
s null
           if (ops->finish_cleanup)
               ^~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_defer.c:473:2: note: Taking false branch
           if (ops->finish_cleanup)
           ^
   fs/xfs/libxfs/xfs_defer.c:475:2: note: Undefined or garbage value return=
ed to caller
           return error;
           ^      ~~~~~
   5 warnings generated.
   mm/nommu.c:411:2: warning: Value stored to 'ret' is never read [clang-an=
alyzer-deadcode.DeadStores]
           ret =3D percpu_counter_init(&vm_committed_as, 0, GFP_KERNEL);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/nommu.c:411:2: note: Value stored to 'ret' is never read
           ret =3D percpu_counter_init(&vm_committed_as, 0, GFP_KERNEL);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/nommu.c:573:2: warning: Value stored to 'prev' is never read [clang-a=
nalyzer-deadcode.DeadStores]
           prev =3D mas_prev(&mas, 0);
           ^      ~~~~~~~~~~~~~~~~~
   mm/nommu.c:573:2: note: Value stored to 'prev' is never read
           prev =3D mas_prev(&mas, 0);
           ^      ~~~~~~~~~~~~~~~~~
   mm/nommu.c:796:6: warning: Value stored to 'prot' is never read [clang-a=
nalyzer-deadcode.DeadStores]
                                           prot |=3D PROT_EXEC;
                                           ^
   mm/nommu.c:796:6: note: Value stored to 'prot' is never read
   mm/nommu.c:814:4: warning: Value stored to 'prot' is never read [clang-a=
nalyzer-deadcode.DeadStores]
                           prot |=3D PROT_EXEC;
                           ^
   mm/nommu.c:814:4: note: Value stored to 'prot' is never read
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   include/asm-generic/bitops/non-atomic.h:22:6: warning: The left expressi=
on of the compound assignment is an uninitialized value. The computed value=
 will also be garbage [clang-analyzer-core.uninitialized.Assign]
           *p  |=3D mask;
               ^
   drivers/tty/serial/serial_mctrl_gpio.c:52:6: note: Assuming 'gpios' is n=
ot equal to NULL
           if (gpios =3D=3D NULL)
               ^~~~~~~~~~~~~
   drivers/tty/serial/serial_mctrl_gpio.c:52:2: note: Taking false branch
           if (gpios =3D=3D NULL)
           ^
   drivers/tty/serial/serial_mctrl_gpio.c:55:2: note: Loop condition is tru=
e.  Entering loop body
           for (i =3D 0; i < UART_GPIO_MAX; i++)
           ^
   drivers/tty/serial/serial_mctrl_gpio.c:56:7: note: Assuming the conditio=
n is true
                   if (gpios->gpio[i] && mctrl_gpio_flags_is_dir_out(i)) {
                       ^~~~~~~~~~~~~~
   drivers/tty/serial/serial_mctrl_gpio.c:56:7: note: Left side of '&&' is =
true
   drivers/tty/serial/serial_mctrl_gpio.c:56:25: note: Assuming the conditi=
on is true
                   if (gpios->gpio[i] && mctrl_gpio_flags_is_dir_out(i)) {
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_mctrl_gpio.c:56:3: note: Taking true branch
                   if (gpios->gpio[i] && mctrl_gpio_flags_is_dir_out(i)) {
                   ^
   drivers/tty/serial/serial_mctrl_gpio.c:58:4: note: Calling '__assign_bit'
                           __assign_bit(count, values,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:217:6: note: Assuming 'value' is true
           if (value)
               ^~~~~
   include/linux/bitops.h:217:2: note: Taking true branch
           if (value)
           ^
   include/linux/bitops.h:218:3: note: Calling 'arch___set_bit'
                   __set_bit(nr, addr);
                   ^
   include/asm-generic/bitops/non-atomic.h:24:19: note: expanded from macro=
 '__set_bit'
   #define __set_bit arch___set_bit
                     ^
   include/asm-generic/bitops/non-atomic.h:22:6: note: The left expression =
of the compound assignment is an uninitialized value. The computed value wi=
ll also be garbage
           *p  |=3D mask;
           ~~  ^
   include/asm-generic/bitops/non-atomic.h:32:5: warning: The left expressi=
on of the compound assignment is an uninitialized value. The computed value=
 will also be garbage [clang-analyzer-core.uninitialized.Assign]
           *p &=3D ~mask;
              ^
   drivers/tty/serial/serial_mctrl_gpio.c:52:6: note: Assuming 'gpios' is n=
ot equal to NULL
           if (gpios =3D=3D NULL)
               ^~~~~~~~~~~~~
   drivers/tty/serial/serial_mctrl_gpio.c:52:2: note: Taking false branch
           if (gpios =3D=3D NULL)
           ^
   drivers/tty/serial/serial_mctrl_gpio.c:55:2: note: Loop condition is tru=
e.  Entering loop body
           for (i =3D 0; i < UART_GPIO_MAX; i++)
           ^
   drivers/tty/serial/serial_mctrl_gpio.c:56:7: note: Assuming the conditio=
n is true
                   if (gpios->gpio[i] && mctrl_gpio_flags_is_dir_out(i)) {
                       ^~~~~~~~~~~~~~
   drivers/tty/serial/serial_mctrl_gpio.c:56:7: note: Left side of '&&' is =
true
   drivers/tty/serial/serial_mctrl_gpio.c:56:25: note: Assuming the conditi=
on is true
                   if (gpios->gpio[i] && mctrl_gpio_flags_is_dir_out(i)) {
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_mctrl_gpio.c:56:3: note: Taking true branch
                   if (gpios->gpio[i] && mctrl_gpio_flags_is_dir_out(i)) {
                   ^
   drivers/tty/serial/serial_mctrl_gpio.c:58:4: note: Calling '__assign_bit'
                           __assign_bit(count, values,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:217:6: note: Assuming 'value' is false
           if (value)
               ^~~~~
   include/linux/bitops.h:217:2: note: Taking false branch
           if (value)
           ^
   include/linux/bitops.h:220:3: note: Calling 'arch___clear_bit'
                   __clear_bit(nr, addr);
                   ^
   include/asm-generic/bitops/non-atomic.h:34:21: note: expanded from macro=
 '__clear_bit'
   #define __clear_bit arch___clear_bit
                       ^
   include/asm-generic/bitops/non-atomic.h:32:5: note: The left expression =
of the compound assignment is an uninitialized value. The computed value wi=
ll also be garbage
           *p &=3D ~mask;
           ~~ ^
   2 warnings generated.
   fs/jfs/jfs_types.h:67:33: warning: The left operand of '&' is a garbage =
value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           pxd->len_addr =3D (pxd->len_addr & cpu_to_le32(0xffffff)) |

vim +/prev +573 mm/nommu.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  544  =

3034097a5017dd David Howells     2006-09-27  545  /*
8feae13110d60c David Howells     2009-01-08  546   * add a VMA into a proce=
ss's mm_struct in the appropriate place in the list
8feae13110d60c David Howells     2009-01-08  547   * and tree and add to th=
e address space's page tree also if not an anonymous
8feae13110d60c David Howells     2009-01-08  548   * page
c1e8d7c6a7a682 Michel Lespinasse 2020-06-08  549   * - should be called wit=
h mm->mmap_lock held writelocked
3034097a5017dd David Howells     2006-09-27  550   */
8feae13110d60c David Howells     2009-01-08  551  static void add_vma_to_mm=
(struct mm_struct *mm, struct vm_area_struct *vma)
^1da177e4c3f41 Linus Torvalds    2005-04-16  552  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  553  	struct address_space *ma=
pping;
4b662c6ba9aa9e Liam R. Howlett   2020-07-24  554  	struct vm_area_struct *p=
rev;
4b662c6ba9aa9e Liam R. Howlett   2020-07-24  555  	MA_STATE(mas, &mm->mm_mt=
, vma->vm_start, vma->vm_end);
8feae13110d60c David Howells     2009-01-08  556  =

8feae13110d60c David Howells     2009-01-08  557  	BUG_ON(!vma->vm_region);
8feae13110d60c David Howells     2009-01-08  558  =

8feae13110d60c David Howells     2009-01-08  559  	mm->map_count++;
8feae13110d60c David Howells     2009-01-08  560  	vma->vm_mm =3D mm;
^1da177e4c3f41 Linus Torvalds    2005-04-16  561  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  562  	/* add the VMA to the ma=
pping */
^1da177e4c3f41 Linus Torvalds    2005-04-16  563  	if (vma->vm_file) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  564  		mapping =3D vma->vm_fil=
e->f_mapping;
^1da177e4c3f41 Linus Torvalds    2005-04-16  565  =

83cde9e8ba95d1 Davidlohr Bueso   2014-12-12  566  		i_mmap_lock_write(mappi=
ng);
^1da177e4c3f41 Linus Torvalds    2005-04-16  567  		flush_dcache_mmap_lock(=
mapping);
6b2dbba8b6ac4d Michel Lespinasse 2012-10-08  568  		vma_interval_tree_inser=
t(vma, &mapping->i_mmap);
^1da177e4c3f41 Linus Torvalds    2005-04-16  569  		flush_dcache_mmap_unloc=
k(mapping);
83cde9e8ba95d1 Davidlohr Bueso   2014-12-12  570  		i_mmap_unlock_write(map=
ping);
^1da177e4c3f41 Linus Torvalds    2005-04-16  571  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  572  =

4b662c6ba9aa9e Liam R. Howlett   2020-07-24 @573  	prev =3D mas_prev(&mas, =
0);
4b662c6ba9aa9e Liam R. Howlett   2020-07-24  574  	mas_reset(&mas);
8feae13110d60c David Howells     2009-01-08  575  	/* add the VMA to the tr=
ee */
4b662c6ba9aa9e Liam R. Howlett   2020-07-24  576  	vma_mas_store(vma, &mas);
^1da177e4c3f41 Linus Torvalds    2005-04-16  577  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  578  =


:::::: The code at line 573 was first introduced by commit
:::::: 4b662c6ba9aa9ed30b302eade5a79e857fc881b4 mm: Remove rb tree.

:::::: TO: Liam R. Howlett <Liam.Howlett@Oracle.com>
:::::: CC: Liam R. Howlett <Liam.Howlett@oracle.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0399833125661575192==--

