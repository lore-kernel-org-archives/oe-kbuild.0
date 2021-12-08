Content-Type: multipart/mixed; boundary="===============7186141843724627845=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/i915_gem.c:386:3: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Wed, 08 Dec 2021 12:06:33 +0800
Message-ID: <202112081242.bjpmf53f-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7186141843724627845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: f1ac8a0292605e094533c02106d1d2f6a97028a3 drm/i915: Fix pread/pwrite=
 to work with new locking rules.
date:   9 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-c007-20211203 (https://download.01.org/0day-ci/ar=
chive/20211208/202112081242.bjpmf53f-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 1e328b=
06c15273edf4a40a27ca24931b5efb3a87)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df1ac8a0292605e094533c02106d1d2f6a97028a3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f1ac8a0292605e094533c02106d1d2f6a97028a3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~
   drivers/gpu/drm/i915/i915_gem.c:752:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/i915/i915_gem.c:762:6: note: Assuming the condition is f=
alse
           if (!i915_gem_object_has_struct_page(obj) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:762:6: note: Left side of '||' is false
   drivers/gpu/drm/i915/i915_gem.c:762:2: note: Taking true branch
           if (!i915_gem_object_has_struct_page(obj) ||
           ^
   drivers/gpu/drm/i915/i915_gem.c:768:9: note: Calling 'i915_gem_gtt_pwrit=
e_fast'
                   ret =3D i915_gem_gtt_pwrite_fast(obj, args);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:530:2: note: Taking true branch
           if (i915_gem_object_has_struct_page(obj)) {
           ^
   drivers/gpu/drm/i915/i915_gem.c:539:7: note: Assuming 'wakeref' is not e=
qual to 0
                   if (!wakeref)
                       ^~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:539:3: note: Taking false branch
                   if (!wakeref)
                   ^
   drivers/gpu/drm/i915/i915_gem.c:546:8: note: Calling 'i915_gem_gtt_prepa=
re'
           vma =3D i915_gem_gtt_prepare(obj, &node, true);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:291:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/i915/i915_gem.c:291:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/i915/i915_gem.c:295:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/i915/i915_gem.c:295:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/i915/i915_gem.c:298:2: note: Taking true branch
           if (!i915_gem_object_is_tiled(obj))
           ^
   drivers/gpu/drm/i915/i915_gem.c:303:2: note: Taking false branch
           if (vma =3D=3D ERR_PTR(-EDEADLK)) {
           ^
   drivers/gpu/drm/i915/i915_gem.c:306:9: note: Taking true branch
           } else if (!IS_ERR(vma)) {
                  ^
   drivers/gpu/drm/i915/i915_gem.c:318:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/gpu/drm/i915/i915_gem.c:318:2: note: Taking false branch
           if (ret) {
           ^
   drivers/gpu/drm/i915/i915_gem.c:328:2: note: Taking false branch
           if (ret =3D=3D -EDEADLK) {
           ^
   drivers/gpu/drm/i915/i915_gem.c:335:9: note: 'ret' is 0
           return ret ? ERR_PTR(ret) : vma;
                  ^~~
   drivers/gpu/drm/i915/i915_gem.c:335:9: note: '?' condition is false
   drivers/gpu/drm/i915/i915_gem.c:335:2: note: Returning without writing t=
o 'node->size'
           return ret ? ERR_PTR(ret) : vma;
           ^
   drivers/gpu/drm/i915/i915_gem.c:546:8: note: Returning from 'i915_gem_gt=
t_prepare'
           vma =3D i915_gem_gtt_prepare(obj, &node, true);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:547:2: note: Taking false branch
           if (IS_ERR(vma)) {
           ^
   drivers/gpu/drm/i915/i915_gem.c:557:2: note: Loop condition is true.  En=
tering loop body
           while (remain) {
           ^
   drivers/gpu/drm/i915/i915_gem.c:567:17: note: Assuming 'remain' is >=3D =
'page_length'
                   page_length =3D remain < page_length ? remain : page_len=
gth;
                                 ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:567:17: note: '?' condition is false
   drivers/gpu/drm/i915/i915_gem.c:568:7: note: Assuming the condition is t=
rue
                   if (drm_mm_node_allocated(&node)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:568:3: note: Taking true branch
                   if (drm_mm_node_allocated(&node)) {
                   ^
   drivers/gpu/drm/i915/i915_gem.c:584:3: note: Taking false branch
                   if (ggtt_write(&ggtt->iomap, page_base, page_offset,
                   ^
   drivers/gpu/drm/i915/i915_gem.c:557:2: note: Loop condition is false. Ex=
ecution continues on line 595
           while (remain) {
           ^
   drivers/gpu/drm/i915/i915_gem.c:598:2: note: Calling 'i915_gem_gtt_clean=
up'
           i915_gem_gtt_cleanup(obj, &node, vma);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:346:6: note: Assuming the condition is t=
rue
           if (drm_mm_node_allocated(node)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:346:2: note: Taking true branch
           if (drm_mm_node_allocated(node)) {
           ^
   drivers/gpu/drm/i915/i915_gem.c:347:3: note: 3rd function call argument =
is an uninitialized value
                   ggtt->vm.clear_range(&ggtt->vm, node->start, node->size);
                   ^                                            ~~~~~~~~~~
>> drivers/gpu/drm/i915/i915_gem.c:386:3: warning: Assigned value is garbag=
e or undefined [clang-analyzer-core.uninitialized.Assign]
                   u32 page_base =3D node.start;
                   ^
   drivers/gpu/drm/i915/i915_gem.c:435:6: note: Assuming field 'gen' is < 12
           if (INTEL_GEN(i915) >=3D 12 && !IS_TIGERLAKE(i915))
               ^
   drivers/gpu/drm/i915/i915_drv.h:1242:29: note: expanded from macro 'INTE=
L_GEN'
   #define INTEL_GEN(dev_priv)     (INTEL_INFO(dev_priv)->gen)
                                   ^
   drivers/gpu/drm/i915/i915_gem.c:435:28: note: Left side of '&&' is false
           if (INTEL_GEN(i915) >=3D 12 && !IS_TIGERLAKE(i915))
                                     ^
   drivers/gpu/drm/i915/i915_gem.c:438:6: note: Assuming field 'size' is no=
t equal to 0
           if (args->size =3D=3D 0)
               ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:438:2: note: Taking false branch
           if (args->size =3D=3D 0)
           ^
   drivers/gpu/drm/i915/i915_gem.c:441:7: note: Assuming the condition is f=
alse
           if (!access_ok(u64_to_user_ptr(args->data_ptr),
                ^
   arch/x86/include/asm/uaccess.h:71:2: note: expanded from macro 'access_o=
k'
           WARN_ON_IN_IRQ();                                               \
           ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:47:15: note: expanded from macro 'WARN_ON=
_IN_IRQ'
           WARN_ON_ONCE(!in_task() && !pagefault_disabled())
           ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_utils.h:52:36: note: expanded from macro 'WARN=
_ON_ONCE'
   #define WARN_ON_ONCE(x) WARN_ONCE((x), "%s", "WARN_ON_ONCE(" __stringify=
(x) ")")
                           ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/asm-generic/bug.h:157:27: note: expanded from macro 'WARN_ONCE'
           int __ret_warn_once =3D !!(condition);                    \
                                    ^~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:441:7: note: Left side of '&&' is false
           if (!access_ok(u64_to_user_ptr(args->data_ptr),
                ^
   arch/x86/include/asm/uaccess.h:71:2: note: expanded from macro 'access_o=
k'
           WARN_ON_IN_IRQ();                                               \
           ^
   arch/x86/include/asm/uaccess.h:47:26: note: expanded from macro 'WARN_ON=
_IN_IRQ'
           WARN_ON_ONCE(!in_task() && !pagefault_disabled())
                                   ^
   drivers/gpu/drm/i915/i915_gem.c:441:7: note: '__ret_warn_once' is 0
           if (!access_ok(u64_to_user_ptr(args->data_ptr),
                ^
   arch/x86/include/asm/uaccess.h:71:2: note: expanded from macro 'access_o=
k'
           WARN_ON_IN_IRQ();                                               \
           ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:47:2: note: expanded from macro 'WARN_ON_=
IN_IRQ'
           WARN_ON_ONCE(!in_task() && !pagefault_disabled())
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_utils.h:52:25: note: expanded from macro 'WARN=
_ON_ONCE'
   #define WARN_ON_ONCE(x) WARN_ONCE((x), "%s", "WARN_ON_ONCE(" __stringify=
(x) ")")
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/asm-generic/bug.h:159:15: note: expanded from macro 'WARN_ONCE'
           if (unlikely(__ret_warn_once && !__warned)) {           \
                        ^~~~~~~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   drivers/gpu/drm/i915/i915_gem.c:441:7: note: Left side of '&&' is false
           if (!access_ok(u64_to_user_ptr(args->data_ptr),
                ^
   arch/x86/include/asm/uaccess.h:71:2: note: expanded from macro 'access_o=
k'
           WARN_ON_IN_IRQ();                                               \
           ^
   arch/x86/include/asm/uaccess.h:47:2: note: expanded from macro 'WARN_ON_=
IN_IRQ'
           WARN_ON_ONCE(!in_task() && !pagefault_disabled())
           ^
   drivers/gpu/drm/i915/i915_utils.h:52:25: note: expanded from macro 'WARN=
_ON_ONCE'
   #define WARN_ON_ONCE(x) WARN_ONCE((x), "%s", "WARN_ON_ONCE(" __stringify=
(x) ")")
                           ^
   include/asm-generic/bug.h:159:31: note: expanded from macro 'WARN_ONCE'
           if (unlikely(__ret_warn_once && !__warned)) {           \
                                        ^
   drivers/gpu/drm/i915/i915_gem.c:441:7: note: '__ret_warn_once' is 0
           if (!access_ok(u64_to_user_ptr(args->data_ptr),
                ^
   arch/x86/include/asm/uaccess.h:71:2: note: expanded from macro 'access_o=
k'
           WARN_ON_IN_IRQ();                                               \
           ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:47:2: note: expanded from macro 'WARN_ON_=
IN_IRQ'
           WARN_ON_ONCE(!in_task() && !pagefault_disabled())
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_utils.h:52:25: note: expanded from macro 'WARN=
_ON_ONCE'
   #define WARN_ON_ONCE(x) WARN_ONCE((x), "%s", "WARN_ON_ONCE(" __stringify=
(x) ")")
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/asm-generic/bug.h:159:15: note: expanded from macro 'WARN_ONCE'
           if (unlikely(__ret_warn_once && !__warned)) {           \
                        ^~~~~~~~~~~~~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:441:7: note: Left side of '&&' is false
           if (!access_ok(u64_to_user_ptr(args->data_ptr),

vim +386 drivers/gpu/drm/i915/i915_gem.c

f1ac8a0292605e Maarten Lankhorst      2021-01-28  353  =

f1ac8a0292605e Maarten Lankhorst      2021-01-28  354  static int
f1ac8a0292605e Maarten Lankhorst      2021-01-28  355  i915_gem_gtt_pread(s=
truct drm_i915_gem_object *obj,
f1ac8a0292605e Maarten Lankhorst      2021-01-28  356  		   const struct dr=
m_i915_gem_pread *args)
f1ac8a0292605e Maarten Lankhorst      2021-01-28  357  {
f1ac8a0292605e Maarten Lankhorst      2021-01-28  358  	struct drm_i915_pri=
vate *i915 =3D to_i915(obj->base.dev);
f1ac8a0292605e Maarten Lankhorst      2021-01-28  359  	struct i915_ggtt *g=
gtt =3D &i915->ggtt;
f1ac8a0292605e Maarten Lankhorst      2021-01-28  360  	intel_wakeref_t wak=
eref;
f1ac8a0292605e Maarten Lankhorst      2021-01-28  361  	struct drm_mm_node =
node;
f1ac8a0292605e Maarten Lankhorst      2021-01-28  362  	void __user *user_d=
ata;
f1ac8a0292605e Maarten Lankhorst      2021-01-28  363  	struct i915_vma *vm=
a;
f1ac8a0292605e Maarten Lankhorst      2021-01-28  364  	u64 remain, offset;
f1ac8a0292605e Maarten Lankhorst      2021-01-28  365  	int ret =3D 0;
f1ac8a0292605e Maarten Lankhorst      2021-01-28  366  =

f1ac8a0292605e Maarten Lankhorst      2021-01-28  367  	wakeref =3D intel_r=
untime_pm_get(&i915->runtime_pm);
f1ac8a0292605e Maarten Lankhorst      2021-01-28  368  =

f1ac8a0292605e Maarten Lankhorst      2021-01-28  369  	vma =3D i915_gem_gt=
t_prepare(obj, &node, false);
f1ac8a0292605e Maarten Lankhorst      2021-01-28  370  	if (IS_ERR(vma)) {
f1ac8a0292605e Maarten Lankhorst      2021-01-28  371  		ret =3D PTR_ERR(vm=
a);
f1ac8a0292605e Maarten Lankhorst      2021-01-28  372  		goto out_rpm;
6951e5893b4821 Chris Wilson           2019-05-28  373  	}
b50a53715f0988 Ankitprasad Sharma     2016-06-10  374  =

bb6dc8d96b683a Chris Wilson           2016-10-28  375  	user_data =3D u64_t=
o_user_ptr(args->data_ptr);
bb6dc8d96b683a Chris Wilson           2016-10-28  376  	remain =3D args->si=
ze;
bb6dc8d96b683a Chris Wilson           2016-10-28  377  	offset =3D args->of=
fset;
b50a53715f0988 Ankitprasad Sharma     2016-06-10  378  =

b50a53715f0988 Ankitprasad Sharma     2016-06-10  379  	while (remain > 0) {
b50a53715f0988 Ankitprasad Sharma     2016-06-10  380  		/* Operation in th=
is page
b50a53715f0988 Ankitprasad Sharma     2016-06-10  381  		 *
b50a53715f0988 Ankitprasad Sharma     2016-06-10  382  		 * page_base =3D p=
age offset within aperture
b50a53715f0988 Ankitprasad Sharma     2016-06-10  383  		 * page_offset =3D=
 offset within page
b50a53715f0988 Ankitprasad Sharma     2016-06-10  384  		 * page_length =3D=
 bytes to copy for this page
b50a53715f0988 Ankitprasad Sharma     2016-06-10  385  		 */
b50a53715f0988 Ankitprasad Sharma     2016-06-10 @386  		u32 page_base =3D =
node.start;
b50a53715f0988 Ankitprasad Sharma     2016-06-10  387  		unsigned page_offs=
et =3D offset_in_page(offset);
b50a53715f0988 Ankitprasad Sharma     2016-06-10  388  		unsigned page_leng=
th =3D PAGE_SIZE - page_offset;
b50a53715f0988 Ankitprasad Sharma     2016-06-10  389  		page_length =3D re=
main < page_length ? remain : page_length;
b290a78b5c3d78 Chris Wilson           2019-10-03  390  		if (drm_mm_node_al=
located(&node)) {
82ad6443a55ea2 Chris Wilson           2018-06-05  391  			ggtt->vm.insert_p=
age(&ggtt->vm,
b50a53715f0988 Ankitprasad Sharma     2016-06-10  392  					     i915_gem_o=
bject_get_dma_address(obj, offset >> PAGE_SHIFT),
bb6dc8d96b683a Chris Wilson           2016-10-28  393  					     node.start=
, I915_CACHE_NONE, 0);
b50a53715f0988 Ankitprasad Sharma     2016-06-10  394  		} else {
b50a53715f0988 Ankitprasad Sharma     2016-06-10  395  			page_base +=3D of=
fset & PAGE_MASK;
b50a53715f0988 Ankitprasad Sharma     2016-06-10  396  		}
bb6dc8d96b683a Chris Wilson           2016-10-28  397  =

73ebd503034c1a Matthew Auld           2017-12-11  398  		if (gtt_user_read(=
&ggtt->iomap, page_base, page_offset,
bb6dc8d96b683a Chris Wilson           2016-10-28  399  				  user_data, pag=
e_length)) {
b50a53715f0988 Ankitprasad Sharma     2016-06-10  400  			ret =3D -EFAULT;
b50a53715f0988 Ankitprasad Sharma     2016-06-10  401  			break;
b50a53715f0988 Ankitprasad Sharma     2016-06-10  402  		}
b50a53715f0988 Ankitprasad Sharma     2016-06-10  403  =

b50a53715f0988 Ankitprasad Sharma     2016-06-10  404  		remain -=3D page_l=
ength;
b50a53715f0988 Ankitprasad Sharma     2016-06-10  405  		user_data +=3D pag=
e_length;
b50a53715f0988 Ankitprasad Sharma     2016-06-10  406  		offset +=3D page_l=
ength;
b50a53715f0988 Ankitprasad Sharma     2016-06-10  407  	}
b50a53715f0988 Ankitprasad Sharma     2016-06-10  408  =

f1ac8a0292605e Maarten Lankhorst      2021-01-28  409  	i915_gem_gtt_cleanu=
p(obj, &node, vma);
2850748ef8763a Chris Wilson           2019-10-04  410  out_rpm:
d858d5695f3897 Daniele Ceraolo Spurio 2019-06-13  411  	intel_runtime_pm_pu=
t(&i915->runtime_pm, wakeref);
eb01459fbbccb4 Eric Anholt            2009-03-10  412  	return ret;
eb01459fbbccb4 Eric Anholt            2009-03-10  413  }
eb01459fbbccb4 Eric Anholt            2009-03-10  414  =


:::::: The code at line 386 was first introduced by commit
:::::: b50a53715f09888a5dfd8592cecfa527db7a204f drm/i915: Support for pread=
/pwrite from/to non shmem backed objects

:::::: TO: Ankitprasad Sharma <ankitprasad.r.sharma@intel.com>
:::::: CC: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7186141843724627845==--

