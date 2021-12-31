Content-Type: multipart/mixed; boundary="===============2006705648638479760=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xiang-erofs:dev-test 5/10] fs/erofs/data.c:143:15: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sat, 01 Jan 2022 03:51:15 +0800
Message-ID: <202201010313.1fIwX6wo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2006705648638479760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Xiang Gao <xiang@kernel.org>
CC: linux-erofs(a)lists.ozlabs.org
TO: Gao Xiang <hsiangkao@linux.alibaba.com>
CC: Yue Hu <huyue2@yulong.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev=
-test
head:   ab92184ff8f12979f3d3dd5ed601ed85770d81ba
commit: 469407a3b5ed9390cfacb0363d1cc926a51f6a14 [5/10] erofs: clean up ero=
fs_map_blocks tracepoints
:::::: branch date: 27 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-c007-20211231 (https://download.01.org/0day-ci/ar=
chive/20220101/202201010313.1fIwX6wo-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7cd109=
b92c72855937273a6c8ab19016fbe27d33)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git/c=
ommit/?id=3D469407a3b5ed9390cfacb0363d1cc926a51f6a14
        git remote add xiang-erofs https://git.kernel.org/pub/scm/linux/ker=
nel/git/xiang/erofs.git
        git fetch --no-tags xiang-erofs dev-test
        git checkout 469407a3b5ed9390cfacb0363d1cc926a51f6a14
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           nilfs_dispose_segment_list(&segments);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/recovery.c:406:2: note: Loop condition is true.  Entering loop=
 body
           while (!list_empty(head)) {
           ^
   fs/nilfs2/recovery.c:411:3: note: Memory is released
                   kfree(ent);
                   ^~~~~~~~~~
   fs/nilfs2/recovery.c:406:2: note: Loop condition is true.  Entering loop=
 body
           while (!list_empty(head)) {
           ^
   fs/nilfs2/recovery.c:410:3: note: Calling 'list_del'
                   list_del(&ent->list);
                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   6 warnings generated.
   arch/x86/kernel/cpu/intel.c:925:4: warning: 1st function call argument i=
s an uninitialized value [clang-analyzer-core.CallAndMessage]
                           intel_tlb_lookup(desc[j]);
                           ^                ~~~~~~~
   arch/x86/kernel/cpu/intel.c:909:6: note: Assuming field 'cpuid_level' is=
 >=3D 2
           if (c->cpuid_level < 2)
               ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/intel.c:909:2: note: Taking false branch
           if (c->cpuid_level < 2)
           ^
   arch/x86/kernel/cpu/intel.c:915:15: note: Assuming 'i' is < 'n'
           for (i =3D 0 ; i < n ; i++) {
                        ^~~~~
   arch/x86/kernel/cpu/intel.c:915:2: note: Loop condition is true.  Enteri=
ng loop body
           for (i =3D 0 ; i < n ; i++) {
           ^
   arch/x86/kernel/cpu/intel.c:916:3: note: Calling 'cpuid'
                   cpuid(2, &regs[0], &regs[1], &regs[2], &regs[3]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/processor.h:604:2: note: Calling 'native_cpuid'
           __cpuid(eax, ebx, ecx, edx);
           ^
   arch/x86/include/asm/processor.h:579:19: note: expanded from macro '__cp=
uid'
   #define __cpuid                 native_cpuid
                                   ^
   arch/x86/include/asm/processor.h:604:2: note: Returning from 'native_cpu=
id'
           __cpuid(eax, ebx, ecx, edx);
           ^
   arch/x86/include/asm/processor.h:579:19: note: expanded from macro '__cp=
uid'
   #define __cpuid                 native_cpuid
                                   ^
   arch/x86/kernel/cpu/intel.c:916:3: note: Returning from 'cpuid'
                   cpuid(2, &regs[0], &regs[1], &regs[2], &regs[3]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/intel.c:919:3: note: Loop condition is true.  Enteri=
ng loop body
                   for (j =3D 0 ; j < 3 ; j++)
                   ^
   arch/x86/kernel/cpu/intel.c:920:8: note: Assuming the condition is false
                           if (regs[j] & (1 << 31))
                               ^~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/intel.c:920:4: note: Taking false branch
                           if (regs[j] & (1 << 31))
                           ^
   arch/x86/kernel/cpu/intel.c:919:3: note: Loop condition is true.  Enteri=
ng loop body
                   for (j =3D 0 ; j < 3 ; j++)
                   ^
   arch/x86/kernel/cpu/intel.c:920:8: note: Assuming the condition is false
                           if (regs[j] & (1 << 31))
                               ^~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/intel.c:920:4: note: Taking false branch
                           if (regs[j] & (1 << 31))
                           ^
   arch/x86/kernel/cpu/intel.c:919:3: note: Loop condition is true.  Enteri=
ng loop body
                   for (j =3D 0 ; j < 3 ; j++)
                   ^
   arch/x86/kernel/cpu/intel.c:920:8: note: Assuming the condition is false
                           if (regs[j] & (1 << 31))
                               ^~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/intel.c:920:4: note: Taking false branch
                           if (regs[j] & (1 << 31))
                           ^
   arch/x86/kernel/cpu/intel.c:919:3: note: Loop condition is false. Execut=
ion continues on line 924
                   for (j =3D 0 ; j < 3 ; j++)
                   ^
   arch/x86/kernel/cpu/intel.c:924:8: note: The value 1 is assigned to 'j'
                   for (j =3D 1 ; j < 16 ; j++)
                        ^~~~~
   arch/x86/kernel/cpu/intel.c:924:3: note: Loop condition is true.  Enteri=
ng loop body
                   for (j =3D 1 ; j < 16 ; j++)
                   ^
   arch/x86/kernel/cpu/intel.c:925:4: note: 1st function call argument is a=
n uninitialized value
                           intel_tlb_lookup(desc[j]);
                           ^                ~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> fs/erofs/data.c:143:15: warning: Assigned value is garbage or undefined =
[clang-analyzer-core.uninitialized.Assign]
                   map->m_llen =3D map->m_plen;
                               ^
   fs/erofs/data.c:201:8: note: Calling 'erofs_map_blocks'
           ret =3D erofs_map_blocks(inode, &map, EROFS_GET_BLOCKS_RAW);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:81:2: note: Calling 'trace_erofs_map_blocks_enter'
           trace_erofs_map_blocks_enter(inode, map, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/erofs.h:172:1: note: Taking false branch
   DEFINE_EVENT(erofs__map_blocks_enter, erofs_map_blocks_enter,
   ^
   include/linux/tracepoint.h:542:2: note: expanded from macro 'DEFINE_EVEN=
T'
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
   include/trace/events/erofs.h:172:1: note: Left side of '&&' is true
   DEFINE_EVENT(erofs__map_blocks_enter, erofs_map_blocks_enter,
   ^
   include/linux/tracepoint.h:542:2: note: expanded from macro 'DEFINE_EVEN=
T'
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
   include/trace/events/erofs.h:172:1: note: Loop condition is false.  Exit=
ing loop
   DEFINE_EVENT(erofs__map_blocks_enter, erofs_map_blocks_enter,
   ^
   include/linux/tracepoint.h:542:2: note: expanded from macro 'DEFINE_EVEN=
T'
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
   include/trace/events/erofs.h:172:1: note: Control jumps to 'case 4:'  at=
 line 172
   DEFINE_EVENT(erofs__map_blocks_enter, erofs_map_blocks_enter,
   ^
   include/linux/tracepoint.h:542:2: note: expanded from macro 'DEFINE_EVEN=
T'
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
   include/trace/events/erofs.h:172:1: note:  Execution continues on line 1=
72
   DEFINE_EVENT(erofs__map_blocks_enter, erofs_map_blocks_enter,
   ^
   include/linux/tracepoint.h:542:2: note: expanded from macro 'DEFINE_EVEN=
T'
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
   include/linux/percpu-defs.h:323:42: note: expanded from macro '__pcpu_si=
ze_call_return'
           case 4: pscr_ret__ =3D stem##4(variable); break;                =
  \
                                                   ^
   include/trace/events/erofs.h:172:1: note: Assuming the condition is false

vim +143 fs/erofs/data.c

81781b02f9845b drivers/staging/erofs/data.c Gao Xiang 2018-07-26   68  =

c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   69  stat=
ic int erofs_map_blocks(struct inode *inode,
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   70  			 =
   struct erofs_map_blocks *map, int flags)
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   71  {
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   72  	str=
uct super_block *sb =3D inode->i_sb;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   73  	str=
uct erofs_inode *vi =3D EROFS_I(inode);
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   74  	str=
uct erofs_inode_chunk_index *idx;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   75  	str=
uct page *page;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   76  	u64=
 chunknr;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   77  	uns=
igned int unit;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   78  	ero=
fs_off_t pos;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   79  	int=
 err =3D 0;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   80  =

469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09   81  	tra=
ce_erofs_map_blocks_enter(inode, map, flags);
dfeab2e95a75a4 fs/erofs/data.c              Gao Xiang 2021-10-14   82  	map=
->m_deviceid =3D 0;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   83  	if =
(map->m_la >=3D inode->i_size) {
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   84  		/*=
 leave out-of-bound access unmapped */
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   85  		ma=
p->m_flags =3D 0;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   86  		ma=
p->m_plen =3D 0;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   87  		go=
to out;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   88  	}
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   89  =

469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09   90  	if =
(vi->datalayout !=3D EROFS_INODE_CHUNK_BASED) {
469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09   91  		er=
r =3D erofs_map_blocks_flatmode(inode, map, flags);
469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09   92  		go=
to out;
469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09   93  	}
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   94  =

c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   95  	if =
(vi->chunkformat & EROFS_CHUNK_FORMAT_INDEXES)
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   96  		un=
it =3D sizeof(*idx);			/* chunk index */
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   97  	else
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   98  		un=
it =3D EROFS_BLOCK_MAP_ENTRY_SIZE;	/* block map */
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   99  =

c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  100  	chu=
nknr =3D map->m_la >> vi->chunkbits;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  101  	pos=
 =3D ALIGN(iloc(EROFS_SB(sb), vi->nid) + vi->inode_isize +
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  102  		  =
  vi->xattr_isize, unit) + unit * chunknr;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  103  =

c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  104  	pag=
e =3D erofs_get_meta_page(inode->i_sb, erofs_blknr(pos));
469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09  105  	if =
(IS_ERR(page)) {
469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09  106  		er=
r =3D PTR_ERR(page);
469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09  107  		go=
to out;
469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09  108  	}
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  109  	map=
->m_la =3D chunknr << vi->chunkbits;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  110  	map=
->m_plen =3D min_t(erofs_off_t, 1UL << vi->chunkbits,
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  111  			 =
   roundup(inode->i_size - map->m_la, EROFS_BLKSIZ));
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  112  =

c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  113  	/* =
handle block map */
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  114  	if =
(!(vi->chunkformat & EROFS_CHUNK_FORMAT_INDEXES)) {
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  115  		__=
le32 *blkaddr =3D page_address(page) + erofs_blkoff(pos);
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  116  =

c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  117  		if=
 (le32_to_cpu(*blkaddr) =3D=3D EROFS_NULL_ADDR) {
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  118  			m=
ap->m_flags =3D 0;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  119  		} =
else {
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  120  			m=
ap->m_pa =3D blknr_to_addr(le32_to_cpu(*blkaddr));
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  121  			m=
ap->m_flags =3D EROFS_MAP_MAPPED;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  122  		}
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  123  		go=
to out_unlock;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  124  	}
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  125  	/* =
parse chunk indexes */
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  126  	idx=
 =3D page_address(page) + erofs_blkoff(pos);
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  127  	swi=
tch (le32_to_cpu(idx->blkaddr)) {
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  128  	cas=
e EROFS_NULL_ADDR:
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  129  		ma=
p->m_flags =3D 0;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  130  		br=
eak;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  131  	def=
ault:
dfeab2e95a75a4 fs/erofs/data.c              Gao Xiang 2021-10-14  132  		ma=
p->m_deviceid =3D le16_to_cpu(idx->device_id) &
dfeab2e95a75a4 fs/erofs/data.c              Gao Xiang 2021-10-14  133  			E=
ROFS_SB(sb)->device_id_mask;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  134  		ma=
p->m_pa =3D blknr_to_addr(le32_to_cpu(idx->blkaddr));
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  135  		ma=
p->m_flags =3D EROFS_MAP_MAPPED;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  136  		br=
eak;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  137  	}
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  138  out_=
unlock:
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  139  	unl=
ock_page(page);
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  140  	put=
_page(page);
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  141  out:
469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09  142  	if =
(!err)
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20 @143  		ma=
p->m_llen =3D map->m_plen;
469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09  144  	tra=
ce_erofs_map_blocks_exit(inode, map, flags, 0);
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  145  	ret=
urn err;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  146  }
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  147  =


:::::: The code at line 143 was first introduced by commit
:::::: c5aa903a59db274554718cddfda9039913409ec9 erofs: support reading chun=
k-based uncompressed files

:::::: TO: Gao Xiang <hsiangkao@linux.alibaba.com>
:::::: CC: Gao Xiang <hsiangkao@linux.alibaba.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2006705648638479760==--

