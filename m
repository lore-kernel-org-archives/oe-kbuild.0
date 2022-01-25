Content-Type: multipart/mixed; boundary="===============3933893625918765433=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1565/1734] kernel/bpf/btf.c:6509:2: warning: Argument to kfree() is the address of the local variable 'local_cand', which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]
Date: Wed, 26 Jan 2022 05:50:40 +0800
Message-ID: <202201260557.1dssc8L1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3933893625918765433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d25ee88530253138d0b20d43511ca5acbda4e9f7
commit: 6303361147fc8984dd259b54c189592cd0551ab6 [1565/1734] fortify: Work =
around Clang inlining bugs
:::::: branch date: 17 hours ago
:::::: commit date: 26 hours ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220126/202201260557.1dssc8L1-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e12=
8e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D6303361147fc8984dd259b54c189592cd0551ab6
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6303361147fc8984dd259b54c189592cd0551ab6
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^      ~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:3197:3: warning: Value stored to 'ret' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   ret =3D try_to_release_page(page, 0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:3197:3: note: Value stored to 'ret' is never read
                   ret =3D try_to_release_page(page, 0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/reiserfs.h:1280:17: warning: The left operand of '&' is a ga=
rbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           v2->v =3D (v2->v & cpu_to_le64(15ULL << 60)) | cpu_to_le64(offse=
t);
                          ^
   fs/reiserfs/inode.c:1938:9: note: Assuming field 't_trans_id' is not equ=
al to 0
           BUG_ON(!th->t_trans_id);
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/reiserfs/inode.c:1938:2: note: Taking false branch
           BUG_ON(!th->t_trans_id);
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/reiserfs/inode.c:1938:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!th->t_trans_id);
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/reiserfs/inode.c:1943:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/reiserfs/inode.c:1943:2: note: Taking false branch
           if (err)
           ^
   fs/reiserfs/inode.c:1945:6: note: Assuming field 'i_nlink' is not equal =
to 0
           if (!dir->i_nlink) {
               ^~~~~~~~~~~~~
   fs/reiserfs/inode.c:1945:2: note: Taking false branch
           if (!dir->i_nlink) {
           ^
   fs/reiserfs/inode.c:1953:6: note: Assuming field 'k_objectid' is not equ=
al to 0
           if (!ih.ih_key.k_objectid) {
               ^~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:1953:2: note: Taking false branch
           if (!ih.ih_key.k_objectid) {
           ^
   fs/reiserfs/inode.c:1958:6: note: Assuming the condition is false
           if (old_format_only(sb))
               ^
   fs/reiserfs/reiserfs.h:728:29: note: expanded from macro 'old_format_onl=
y'
   #define old_format_only(s) (REISERFS_SB(s)->s_properties & (1 << REISERF=
S_3_5))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   fs/reiserfs/inode.c:1958:2: note: Taking false branch
           if (old_format_only(sb))
           ^
   fs/reiserfs/inode.c:1962:3: note: Calling 'make_le_item_head'
                   make_le_item_head(&ih, NULL, KEY_FORMAT_3_6, SD_OFFSET,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:142:6: note: 'key' is null
           if (key) {
               ^~~
   fs/reiserfs/inode.c:142:2: note: Taking false branch
           if (key) {
           ^
   fs/reiserfs/inode.c:147:2: note: Loop condition is false.  Exiting loop
           put_ih_version(ih, version);
           ^
   fs/reiserfs/reiserfs.h:1403:38: note: expanded from macro 'put_ih_versio=
n'
   #define put_ih_version(ih, val)      do { (ih)->ih_version =3D cpu_to_le=
16(val); } while (0)
                                        ^
   fs/reiserfs/inode.c:148:2: note: Calling 'set_le_ih_k_offset'
           set_le_ih_k_offset(ih, offset);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/reiserfs.h:1522:2: note: Calling 'set_le_key_k_offset'
           set_le_key_k_offset(ih_version(ih), &(ih->ih_key), offset);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/reiserfs.h:1502:6: note: 'version' is not equal to KEY_FORMA=
T_3_5
           if (version =3D=3D KEY_FORMAT_3_5)
               ^~~~~~~
   fs/reiserfs/reiserfs.h:1502:2: note: Taking false branch
           if (version =3D=3D KEY_FORMAT_3_5)
           ^
   fs/reiserfs/reiserfs.h:1505:3: note: Calling 'set_offset_v2_k_offset'
                   set_offset_v2_k_offset(&key->u.k_offset_v2, offset);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/reiserfs.h:1280:17: note: The left operand of '&' is a garba=
ge value
           v2->v =3D (v2->v & cpu_to_le64(15ULL << 60)) | cpu_to_le64(offse=
t);
                    ~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> kernel/bpf/btf.c:6509:2: warning: Argument to kfree() is the address of =
the local variable 'local_cand', which is not memory allocated by malloc() =
[clang-analyzer-unix.Malloc]
           kfree(cands);
           ^
   kernel/bpf/btf.c:6789:20: note: Assuming field 'kind' is not equal to BP=
F_CORE_TYPE_ID_LOCAL
           bool need_cands =3D relo->kind !=3D BPF_CORE_TYPE_ID_LOCAL;
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:6798:6: note: Assuming 'specs' is non-null
           if (!specs)
               ^~~~~~
   kernel/bpf/btf.c:6798:2: note: Taking false branch
           if (!specs)
           ^
   kernel/bpf/btf.c:6801:6: note: 'need_cands' is true
           if (need_cands) {
               ^~~~~~~~~~
   kernel/bpf/btf.c:6801:2: note: Taking true branch
           if (need_cands) {
           ^
   kernel/bpf/btf.c:6806:8: note: Calling 'bpf_core_find_cands'
                   cc =3D bpf_core_find_cands(ctx, relo->type_id);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:6711:2: note: Taking false branch
           if (IS_ERR(main_btf))
           ^
   kernel/bpf/btf.c:6715:6: note: Assuming 'local_type' is non-null
           if (!local_type)
               ^~~~~~~~~~~
   kernel/bpf/btf.c:6715:2: note: Taking false branch
           if (!local_type)
           ^
   kernel/bpf/btf.c:6719:6: note: Assuming the condition is false
           if (str_is_empty(name))
               ^~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:6719:2: note: Taking false branch
           if (str_is_empty(name))
           ^
   kernel/bpf/btf.c:6730:6: note: 'cc' is null
           if (cc) {
               ^~
   kernel/bpf/btf.c:6730:2: note: Taking false branch
           if (cc) {
           ^
   kernel/bpf/btf.c:6737:10: note: Calling 'bpf_core_add_cands'
           cands =3D bpf_core_add_cands(cands, main_btf, 1);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:6660:26: note: Assuming 'i' is < 'n'
           for (i =3D targ_start_id; i < n; i++) {
                                   ^~~~~
   kernel/bpf/btf.c:6660:2: note: Loop condition is true.  Entering loop bo=
dy
           for (i =3D targ_start_id; i < n; i++) {
           ^
   kernel/bpf/btf.c:6662:7: note: Assuming the condition is false
                   if (btf_kind(t) !=3D cands->kind)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:6662:3: note: Taking false branch
                   if (btf_kind(t) !=3D cands->kind)
                   ^
   kernel/bpf/btf.c:6666:7: note: Assuming 'targ_name' is non-null
                   if (!targ_name)
                       ^~~~~~~~~~
   kernel/bpf/btf.c:6666:3: note: Taking false branch
                   if (!targ_name)
                   ^
   kernel/bpf/btf.c:6674:3: note: Taking false branch
                   if (strncmp(cands->name, targ_name, cands->name_len) !=
=3D 0)
                   ^
   kernel/bpf/btf.c:6678:7: note: Assuming 'targ_essent_len' is equal to fi=
eld 'name_len'
                   if (targ_essent_len !=3D cands->name_len)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:6678:3: note: Taking false branch
                   if (targ_essent_len !=3D cands->name_len)
                   ^
   kernel/bpf/btf.c:6683:7: note: Assuming 'new_cands' is non-null
                   if (!new_cands) {
                       ^~~~~~~~~~
   kernel/bpf/btf.c:6683:3: note: Taking false branch
                   if (!new_cands) {
                   ^
   kernel/bpf/btf.c:6689:3: note: Calling 'bpf_free_cands'
                   bpf_free_cands(cands);
                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:6506:6: note: Assuming field 'cnt' is not equal to 0
           if (!cands->cnt)
               ^~~~~~~~~~~
   kernel/bpf/btf.c:6506:2: note: Taking false branch
           if (!cands->cnt)
           ^
   kernel/bpf/btf.c:6509:2: note: Argument to kfree() is the address of the=
 local variable 'local_cand', which is not memory allocated by malloc()
           kfree(cands);
           ^     ~~~~~
   kernel/bpf/btf.c:6739:3: warning: Address of stack memory associated wit=
h local variable 'local_cand' returned to caller [clang-analyzer-core.Stack=
AddressEscape]
                   return ERR_CAST(cands);
                   ^
   kernel/bpf/btf.c:6789:20: note: Assuming field 'kind' is not equal to BP=
F_CORE_TYPE_ID_LOCAL
           bool need_cands =3D relo->kind !=3D BPF_CORE_TYPE_ID_LOCAL;
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:6798:6: note: Assuming 'specs' is non-null
           if (!specs)
               ^~~~~~
   kernel/bpf/btf.c:6798:2: note: Taking false branch
           if (!specs)

vim +/local_cand +6509 kernel/bpf/btf.c

1e89106da25390 Alexei Starovoitov 2021-12-01  6503  =

1e89106da25390 Alexei Starovoitov 2021-12-01  6504  static void bpf_free_ca=
nds(struct bpf_cand_cache *cands)
1e89106da25390 Alexei Starovoitov 2021-12-01  6505  {
1e89106da25390 Alexei Starovoitov 2021-12-01  6506  	if (!cands->cnt)
1e89106da25390 Alexei Starovoitov 2021-12-01  6507  		/* empty candidate ar=
ray was allocated on stack */
1e89106da25390 Alexei Starovoitov 2021-12-01  6508  		return;
1e89106da25390 Alexei Starovoitov 2021-12-01 @6509  	kfree(cands);
1e89106da25390 Alexei Starovoitov 2021-12-01  6510  }
1e89106da25390 Alexei Starovoitov 2021-12-01  6511  =


:::::: The code at line 6509 was first introduced by commit
:::::: 1e89106da25390826608ad6ac0edfb7c9952eff3 bpf: Add bpf_core_add_cands=
() and wire it into bpf_core_apply_relo_insn().

:::::: TO: Alexei Starovoitov <ast@kernel.org>
:::::: CC: Andrii Nakryiko <andrii@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3933893625918765433==--

