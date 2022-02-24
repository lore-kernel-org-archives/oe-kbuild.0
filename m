Content-Type: multipart/mixed; boundary="===============8754186275779731578=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6789/7915] lib/maple_tree.c:476:3: warning: Value stored to 'shift' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 25 Feb 2022 04:11:11 +0800
Message-ID: <202202250438.A8Mw5VEr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8754186275779731578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
CC: "Matthew Wilcox (Oracle)" <willy@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d4a0ae62a277377de396850ed4b709b6bd9b7326
commit: 6f75f86c44c32afdb5c41aad52d386e0c9db9d7a [6789/7915] Maple Tree: Ad=
d new data structure
:::::: branch date: 18 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20225/202202250438.A8Mw5VEr-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D6f75f86c44c32afdb5c41aad52d386e0c9db9d7a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6f75f86c44c32afdb5c41aad52d386e0c9db9d7a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/char/mem.c:694:21: warning: Excessive padding in 'struct memdev'=
 (10 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   name, =

   fops, =

   fmode, =

   mode, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   static const struct memdev {
                ~~~~~~~^~~~~~~~
   drivers/char/mem.c:694:21: note: Excessive padding in 'struct memdev' (1=
0 padding bytes, where 2 is optimal). Optimal fields order: name, fops, fmo=
de, mode, consider reordering the fields or adding explicit padding members
   static const struct memdev {
                ~~~~~~~^~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/char/pcmcia/cm4000_cs.c:1570:4: warning: Value stored to 'rc' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           rc =3D 0;
                           ^    ~
   drivers/char/pcmcia/cm4000_cs.c:1570:4: note: Value stored to 'rc' is ne=
ver read
                           rc =3D 0;
                           ^    ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   arch/x86/crypto/sm4_aesni_avx_glue.c:357:4: warning: Value stored to 'ds=
t' is never read [clang-analyzer-deadcode.DeadStores]
                           dst +=3D nbytes;
                           ^      ~~~~~~
   arch/x86/crypto/sm4_aesni_avx_glue.c:357:4: note: Value stored to 'dst' =
is never read
                           dst +=3D nbytes;
                           ^      ~~~~~~
   arch/x86/crypto/sm4_aesni_avx_glue.c:358:4: warning: Value stored to 'sr=
c' is never read [clang-analyzer-deadcode.DeadStores]
                           src +=3D nbytes;
                           ^      ~~~~~~
   arch/x86/crypto/sm4_aesni_avx_glue.c:358:4: note: Value stored to 'src' =
is never read
                           src +=3D nbytes;
                           ^      ~~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   lib/maple_tree.c:325:2: warning: Value stored to 'node' is never read [c=
lang-analyzer-deadcode.DeadStores]
           node =3D (void *)((unsigned long)node & ~MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:325:2: note: Value stored to 'node' is never read
           node =3D (void *)((unsigned long)node & ~MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:330:2: warning: Value stored to 'node' is never read [c=
lang-analyzer-deadcode.DeadStores]
           node =3D (void *)((unsigned long)node | MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:330:2: note: Value stored to 'node' is never read
           node =3D (void *)((unsigned long)node | MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/maple_tree.c:476:3: warning: Value stored to 'shift' is never read [=
clang-analyzer-deadcode.DeadStores]
                   shift =3D type =3D 0;
                   ^       ~~~~~~~~
   lib/maple_tree.c:476:3: note: Value stored to 'shift' is never read
                   shift =3D type =3D 0;
                   ^       ~~~~~~~~
>> lib/maple_tree.c:476:11: warning: Although the value stored to 'type' is=
 used in the enclosing expression, the value is never actually read from 't=
ype' [clang-analyzer-deadcode.DeadStores]
                   shift =3D type =3D 0;
                           ^      ~
   lib/maple_tree.c:476:11: note: Although the value stored to 'type' is us=
ed in the enclosing expression, the value is never actually read from 'type'
                   shift =3D type =3D 0;
                           ^      ~
   lib/maple_tree.c:1214:23: warning: Value stored to 'nodep' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct maple_alloc **nodep =3D &mas->alloc;
                                ^~~~~   ~~~~~~~~~~~
   lib/maple_tree.c:1214:23: note: Value stored to 'nodep' during its initi=
alization is never read
           struct maple_alloc **nodep =3D &mas->alloc;
                                ^~~~~   ~~~~~~~~~~~
   lib/maple_tree.c:1224:20: warning: Access to field 'node_count' results =
in a dereference of a null pointer (loaded from field 'alloc') [clang-analy=
zer-core.NullDereference]
           if (!allocated || mas->alloc->node_count =3D=3D MAPLE_ALLOC_SLOT=
S - 1) {
                             ^
   lib/maple_tree.c:6271:2: note: Calling 'trace_ma_op'
           trace_ma_op(__func__, &mas);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/maple_tree.h:13:1: note: Taking false branch
   TRACE_EVENT(ma_op,
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
   include/trace/events/maple_tree.h:13:1: note: Left side of '&&' is true
   TRACE_EVENT(ma_op,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRA=
CE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:251:7: note: expanded from macro '__DECLARE_T=
RACE'
                   if (IS_ENABLED(CONFIG_LOCKDEP) && (cond)) {             \
                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/kconfig.h:24:22: note: expanded from macro '__or'
   #define __or(x, y)                      ___or(x, y)
                                           ^
   include/linux/kconfig.h:25:23: note: expanded from macro '___or'
   #define ___or(x, y)                     ____or(__ARG_PLACEHOLDER_##x, y)
                                           ^
   include/linux/kconfig.h:26:65: note: expanded from macro '____or'
   #define ____or(arg1_or_junk, y)         __take_second_arg(arg1_or_junk 1=
, y)
                                                                          ^
   include/trace/events/maple_tree.h:13:1: note: Loop condition is false.  =
Exiting loop
   TRACE_EVENT(ma_op,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/x86/include/asm/smp.h:166:33: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  this_cpu_read(cpu_number)
                                   ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_=
read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu=
_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:319:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/trace/events/maple_tree.h:13:1: note: Control jumps to 'case 4:'=
  at line 13
   TRACE_EVENT(ma_op,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/x86/include/asm/smp.h:166:33: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  this_cpu_read(cpu_number)
                                   ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_=
read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu=
_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:320:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           switch(sizeof(variable)) {                                      \
           ^
   include/trace/events/maple_tree.h:13:1: note:  Execution continues on li=
ne 13
   TRACE_EVENT(ma_op,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/x86/include/asm/smp.h:166:33: note: expanded from macro 'raw_smp_pr=
ocessor_id'

vim +/shift +476 lib/maple_tree.c

6f75f86c44c32a Liam R. Howlett 2020-07-24  322  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  323  static inline void mte_set_=
full(const struct maple_enode *node)
6f75f86c44c32a Liam R. Howlett 2020-07-24  324  {
6f75f86c44c32a Liam R. Howlett 2020-07-24 @325  	node =3D (void *)((unsigne=
d long)node & ~MAPLE_ENODE_NULL);
6f75f86c44c32a Liam R. Howlett 2020-07-24  326  }
6f75f86c44c32a Liam R. Howlett 2020-07-24  327  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  328  static inline void mte_clea=
r_full(const struct maple_enode *node)
6f75f86c44c32a Liam R. Howlett 2020-07-24  329  {
6f75f86c44c32a Liam R. Howlett 2020-07-24 @330  	node =3D (void *)((unsigne=
d long)node | MAPLE_ENODE_NULL);
6f75f86c44c32a Liam R. Howlett 2020-07-24  331  }
6f75f86c44c32a Liam R. Howlett 2020-07-24  332  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  333  static inline bool ma_is_ro=
ot(struct maple_node *node)
6f75f86c44c32a Liam R. Howlett 2020-07-24  334  {
6f75f86c44c32a Liam R. Howlett 2020-07-24  335  	return ((unsigned long)nod=
e->parent & MA_ROOT_PARENT);
6f75f86c44c32a Liam R. Howlett 2020-07-24  336  }
6f75f86c44c32a Liam R. Howlett 2020-07-24  337  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  338  static inline bool mte_is_r=
oot(const struct maple_enode *node)
6f75f86c44c32a Liam R. Howlett 2020-07-24  339  {
6f75f86c44c32a Liam R. Howlett 2020-07-24  340  	return ma_is_root(mte_to_n=
ode(node));
6f75f86c44c32a Liam R. Howlett 2020-07-24  341  }
6f75f86c44c32a Liam R. Howlett 2020-07-24  342  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  343  static inline bool mas_is_r=
oot_limits(const struct ma_state *mas)
6f75f86c44c32a Liam R. Howlett 2020-07-24  344  {
6f75f86c44c32a Liam R. Howlett 2020-07-24  345  	return !mas->min && mas->m=
ax =3D=3D ULONG_MAX;
6f75f86c44c32a Liam R. Howlett 2020-07-24  346  }
6f75f86c44c32a Liam R. Howlett 2020-07-24  347  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  348  static inline bool mt_is_al=
loc(struct maple_tree *mt)
6f75f86c44c32a Liam R. Howlett 2020-07-24  349  {
6f75f86c44c32a Liam R. Howlett 2020-07-24  350  	return (mt->ma_flags & MT_=
FLAGS_ALLOC_RANGE);
6f75f86c44c32a Liam R. Howlett 2020-07-24  351  }
6f75f86c44c32a Liam R. Howlett 2020-07-24  352  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  353  /*
6f75f86c44c32a Liam R. Howlett 2020-07-24  354   * The Parent Pointer
6f75f86c44c32a Liam R. Howlett 2020-07-24  355   * Excluding root, the pare=
nt pointer is 256B aligned like all other tree nodes.
6f75f86c44c32a Liam R. Howlett 2020-07-24  356   * When storing a 32 or 64 =
bit values, the offset can fit into 4 bits.  The 16
6f75f86c44c32a Liam R. Howlett 2020-07-24  357   * bit values need an extra=
 bit to store the offset.  This extra bit comes from
6f75f86c44c32a Liam R. Howlett 2020-07-24  358   * a reuse of the last bit =
in the node type.  This is possible by using bit 1 to
6f75f86c44c32a Liam R. Howlett 2020-07-24  359   * indicate if bit 2 is par=
t of the type or the slot.
6f75f86c44c32a Liam R. Howlett 2020-07-24  360   *
6f75f86c44c32a Liam R. Howlett 2020-07-24  361   * Note types:
6f75f86c44c32a Liam R. Howlett 2020-07-24  362   *  0x??1 =3D Root
6f75f86c44c32a Liam R. Howlett 2020-07-24  363   *  0x?00 =3D 16 bit nodes
6f75f86c44c32a Liam R. Howlett 2020-07-24  364   *  0x010 =3D 32 bit nodes
6f75f86c44c32a Liam R. Howlett 2020-07-24  365   *  0x110 =3D 64 bit nodes
6f75f86c44c32a Liam R. Howlett 2020-07-24  366   *
6f75f86c44c32a Liam R. Howlett 2020-07-24  367   * Slot size and alignment
6f75f86c44c32a Liam R. Howlett 2020-07-24  368   *  0x??1 : Root
6f75f86c44c32a Liam R. Howlett 2020-07-24  369   *  0x?00 : 16 bit values, =
type in 0-1, slot in 2-6
6f75f86c44c32a Liam R. Howlett 2020-07-24  370   *  0x010 : 32 bit values, =
type in 0-2, slot in 3-6
6f75f86c44c32a Liam R. Howlett 2020-07-24  371   *  0x110 : 64 bit values, =
type in 0-2, slot in 3-6
6f75f86c44c32a Liam R. Howlett 2020-07-24  372   */
6f75f86c44c32a Liam R. Howlett 2020-07-24  373  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  374  #define MAPLE_PARENT_ROOT		=
0x01
6f75f86c44c32a Liam R. Howlett 2020-07-24  375  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  376  #define MAPLE_PARENT_SLOT_S=
HIFT		0x03
6f75f86c44c32a Liam R. Howlett 2020-07-24  377  #define MAPLE_PARENT_SLOT_M=
ASK		0x78
6f75f86c44c32a Liam R. Howlett 2020-07-24  378  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  379  #define MAPLE_PARENT_16B_SL=
OT_SHIFT	0x02
6f75f86c44c32a Liam R. Howlett 2020-07-24  380  #define MAPLE_PARENT_16B_SL=
OT_MASK	0x7C
6f75f86c44c32a Liam R. Howlett 2020-07-24  381  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  382  #define MAPLE_PARENT_RANGE6=
4		0x06
6f75f86c44c32a Liam R. Howlett 2020-07-24  383  #define MAPLE_PARENT_RANGE3=
2		0x04
6f75f86c44c32a Liam R. Howlett 2020-07-24  384  #define MAPLE_PARENT_NOT_RA=
NGE16	0x02
6f75f86c44c32a Liam R. Howlett 2020-07-24  385  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  386  /*
6f75f86c44c32a Liam R. Howlett 2020-07-24  387   * mte_parent_shift() - Get=
 the parent shift for the slot storage.
6f75f86c44c32a Liam R. Howlett 2020-07-24  388   * @parent: The parent poin=
ter cast as an unsigned long
6f75f86c44c32a Liam R. Howlett 2020-07-24  389   * Return: The shift into t=
hat pointer to the star to of the slot
6f75f86c44c32a Liam R. Howlett 2020-07-24  390   */
6f75f86c44c32a Liam R. Howlett 2020-07-24  391  static inline unsigned long=
 mte_parent_shift(unsigned long parent)
6f75f86c44c32a Liam R. Howlett 2020-07-24  392  {
6f75f86c44c32a Liam R. Howlett 2020-07-24  393  	/* Note bit 1 =3D=3D 0 mea=
ns 16B */
6f75f86c44c32a Liam R. Howlett 2020-07-24  394  	if (likely(parent & MAPLE_=
PARENT_NOT_RANGE16))
6f75f86c44c32a Liam R. Howlett 2020-07-24  395  		return MAPLE_PARENT_SLOT_=
SHIFT;
6f75f86c44c32a Liam R. Howlett 2020-07-24  396  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  397  	return MAPLE_PARENT_16B_SL=
OT_SHIFT;
6f75f86c44c32a Liam R. Howlett 2020-07-24  398  }
6f75f86c44c32a Liam R. Howlett 2020-07-24  399  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  400  /*
6f75f86c44c32a Liam R. Howlett 2020-07-24  401   * mte_parent_slot_mask() -=
 Get the slot mask for the parent.
6f75f86c44c32a Liam R. Howlett 2020-07-24  402   * @parent: The parent poin=
ter cast as an unsigned long.
6f75f86c44c32a Liam R. Howlett 2020-07-24  403   * Return: The slot mask fo=
r that parent.
6f75f86c44c32a Liam R. Howlett 2020-07-24  404   */
6f75f86c44c32a Liam R. Howlett 2020-07-24  405  static inline unsigned long=
 mte_parent_slot_mask(unsigned long parent)
6f75f86c44c32a Liam R. Howlett 2020-07-24  406  {
6f75f86c44c32a Liam R. Howlett 2020-07-24  407  	/* Note bit 1 =3D=3D 0 mea=
ns 16B */
6f75f86c44c32a Liam R. Howlett 2020-07-24  408  	if (likely(parent & MAPLE_=
PARENT_NOT_RANGE16))
6f75f86c44c32a Liam R. Howlett 2020-07-24  409  		return MAPLE_PARENT_SLOT_=
MASK;
6f75f86c44c32a Liam R. Howlett 2020-07-24  410  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  411  	return MAPLE_PARENT_16B_SL=
OT_MASK;
6f75f86c44c32a Liam R. Howlett 2020-07-24  412  }
6f75f86c44c32a Liam R. Howlett 2020-07-24  413  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  414  /*
6f75f86c44c32a Liam R. Howlett 2020-07-24  415   * mas_parent_enum() - Retu=
rn the maple_type of the parent from the stored
6f75f86c44c32a Liam R. Howlett 2020-07-24  416   * parent type.
6f75f86c44c32a Liam R. Howlett 2020-07-24  417   * @mas: The maple state
6f75f86c44c32a Liam R. Howlett 2020-07-24  418   * @node: The maple_enode t=
o extract the parent's enum
6f75f86c44c32a Liam R. Howlett 2020-07-24  419   * Return: The node->parent=
 maple_type
6f75f86c44c32a Liam R. Howlett 2020-07-24  420   */
6f75f86c44c32a Liam R. Howlett 2020-07-24  421  static inline
6f75f86c44c32a Liam R. Howlett 2020-07-24  422  enum maple_type mte_parent_=
enum(struct maple_enode *p_enode,
6f75f86c44c32a Liam R. Howlett 2020-07-24  423  				struct maple_tree *mt)
6f75f86c44c32a Liam R. Howlett 2020-07-24  424  {
6f75f86c44c32a Liam R. Howlett 2020-07-24  425  	unsigned long p_type;
6f75f86c44c32a Liam R. Howlett 2020-07-24  426  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  427  	p_type =3D (unsigned long)=
p_enode;
6f75f86c44c32a Liam R. Howlett 2020-07-24  428  	if (p_type & MAPLE_PARENT_=
ROOT)
6f75f86c44c32a Liam R. Howlett 2020-07-24  429  		return 0; /* Validated in=
 the caller. */
6f75f86c44c32a Liam R. Howlett 2020-07-24  430  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  431  	p_type &=3D MAPLE_NODE_MAS=
K;
6f75f86c44c32a Liam R. Howlett 2020-07-24  432  	p_type =3D p_type & ~(MAPL=
E_PARENT_ROOT | mte_parent_slot_mask(p_type));
6f75f86c44c32a Liam R. Howlett 2020-07-24  433  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  434  	switch (p_type) {
6f75f86c44c32a Liam R. Howlett 2020-07-24  435  	case MAPLE_PARENT_RANGE64:=
 /* or MAPLE_PARENT_ARANGE64 */
6f75f86c44c32a Liam R. Howlett 2020-07-24  436  		if (mt_is_alloc(mt))
6f75f86c44c32a Liam R. Howlett 2020-07-24  437  			return maple_arange_64;
6f75f86c44c32a Liam R. Howlett 2020-07-24  438  		return maple_range_64;
6f75f86c44c32a Liam R. Howlett 2020-07-24  439  	}
6f75f86c44c32a Liam R. Howlett 2020-07-24  440  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  441  	return 0;
6f75f86c44c32a Liam R. Howlett 2020-07-24  442  }
6f75f86c44c32a Liam R. Howlett 2020-07-24  443  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  444  static inline
6f75f86c44c32a Liam R. Howlett 2020-07-24  445  enum maple_type mas_parent_=
enum(struct ma_state *mas, struct maple_enode *enode)
6f75f86c44c32a Liam R. Howlett 2020-07-24  446  {
6f75f86c44c32a Liam R. Howlett 2020-07-24  447  	return mte_parent_enum(ma_=
enode_ptr(mte_to_node(enode)->parent), mas->tree);
6f75f86c44c32a Liam R. Howlett 2020-07-24  448  }
6f75f86c44c32a Liam R. Howlett 2020-07-24  449  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  450  /*
6f75f86c44c32a Liam R. Howlett 2020-07-24  451   * mte_set_parent() - Set t=
he parent node and encode the slot
6f75f86c44c32a Liam R. Howlett 2020-07-24  452   * @enode: The encoded mapl=
e node.
6f75f86c44c32a Liam R. Howlett 2020-07-24  453   * @parent: The encoded map=
le node that is the parent of @enode.
6f75f86c44c32a Liam R. Howlett 2020-07-24  454   * @slot: The slot that @en=
ode resides in @parent.
6f75f86c44c32a Liam R. Howlett 2020-07-24  455   *
6f75f86c44c32a Liam R. Howlett 2020-07-24  456   * Slot number is encoded i=
n the enode->parent bit 3-6 or 2-6, depending on the
6f75f86c44c32a Liam R. Howlett 2020-07-24  457   * parent type.
6f75f86c44c32a Liam R. Howlett 2020-07-24  458   */
6f75f86c44c32a Liam R. Howlett 2020-07-24  459  static inline
6f75f86c44c32a Liam R. Howlett 2020-07-24  460  void mte_set_parent(struct =
maple_enode *enode, const struct maple_enode *parent,
6f75f86c44c32a Liam R. Howlett 2020-07-24  461  		    unsigned char slot)
6f75f86c44c32a Liam R. Howlett 2020-07-24  462  {
6f75f86c44c32a Liam R. Howlett 2020-07-24  463  	unsigned long val =3D (uns=
igned long) parent;
6f75f86c44c32a Liam R. Howlett 2020-07-24  464  	unsigned long shift;
6f75f86c44c32a Liam R. Howlett 2020-07-24  465  	unsigned long type;
6f75f86c44c32a Liam R. Howlett 2020-07-24  466  	enum maple_type p_type =3D=
 mte_node_type(parent);
6f75f86c44c32a Liam R. Howlett 2020-07-24  467  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  468  	switch(p_type) {
6f75f86c44c32a Liam R. Howlett 2020-07-24  469  	case maple_range_64:
6f75f86c44c32a Liam R. Howlett 2020-07-24  470  	case maple_arange_64:
6f75f86c44c32a Liam R. Howlett 2020-07-24  471  		shift =3D MAPLE_PARENT_SL=
OT_SHIFT;
6f75f86c44c32a Liam R. Howlett 2020-07-24  472  		type =3D MAPLE_PARENT_RAN=
GE64;
6f75f86c44c32a Liam R. Howlett 2020-07-24  473  		break;
6f75f86c44c32a Liam R. Howlett 2020-07-24  474  	case maple_dense:
6f75f86c44c32a Liam R. Howlett 2020-07-24  475  	case maple_leaf_64:
6f75f86c44c32a Liam R. Howlett 2020-07-24 @476  		shift =3D type =3D 0;
6f75f86c44c32a Liam R. Howlett 2020-07-24  477  		BUG_ON(1);
6f75f86c44c32a Liam R. Howlett 2020-07-24  478  		break;
6f75f86c44c32a Liam R. Howlett 2020-07-24  479  	}
6f75f86c44c32a Liam R. Howlett 2020-07-24  480  =

6f75f86c44c32a Liam R. Howlett 2020-07-24  481  	val &=3D ~MAPLE_NODE_MASK;=
 /* Clear all node metadata in parent */
6f75f86c44c32a Liam R. Howlett 2020-07-24  482  	val |=3D (slot << shift) |=
 type;
6f75f86c44c32a Liam R. Howlett 2020-07-24  483  	mte_to_node(enode)->parent=
 =3D ma_parent_ptr(val);
6f75f86c44c32a Liam R. Howlett 2020-07-24  484  }
6f75f86c44c32a Liam R. Howlett 2020-07-24  485  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8754186275779731578==--

