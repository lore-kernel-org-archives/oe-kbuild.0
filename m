Content-Type: multipart/mixed; boundary="===============2279137680195008703=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4066/8462] kernel/bpf/btf.c:6693:3: warning: Address of stack memory associated with local variable 'local_cand' returned to caller [clang-analyzer-core.StackAddressEscape]
Date: Sat, 18 Dec 2021 03:22:09 +0800
Message-ID: <202112180325.fCHT1YiB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2279137680195008703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alexei Starovoitov <ast@kernel.org>
CC: Andrii Nakryiko <andrii@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   c122052c3cb861b3e61a01d2c2ab9069e470663e
commit: 1e89106da25390826608ad6ac0edfb7c9952eff3 [4066/8462] bpf: Add bpf_c=
ore_add_cands() and wire it into bpf_core_apply_relo_insn().
:::::: branch date: 6 hours ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-c002-20211216 (https://download.01.org/0day-ci/archi=
ve/20211218/202112180325.fCHT1YiB-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245b=
ab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D1e89106da25390826608ad6ac0edfb7c9952eff3
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 1e89106da25390826608ad6ac0edfb7c9952eff3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/rcupdate.h:529:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:390:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   kernel/bpf/lpm_trie.c:695:11: note: Left side of '||' is false
                           node =3D rcu_dereference(node->child[0]);
                                  ^
   include/linux/rcupdate.h:597:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:529:31: note: expanded from macro 'rcu_derefere=
nce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
                                        ^
   kernel/bpf/lpm_trie.c:695:11: note: Assuming the condition is false
                           node =3D rcu_dereference(node->child[0]);
                                  ^
   include/linux/rcupdate.h:597:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:529:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:391:19: note: expanded from macro '__rcu_derefe=
rence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/rcupdate.h:319:8: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                        ^
   kernel/bpf/lpm_trie.c:695:11: note: Left side of '&&' is false
                           node =3D rcu_dereference(node->child[0]);
                                  ^
   include/linux/rcupdate.h:597:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:529:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:391:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:319:11: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   kernel/bpf/lpm_trie.c:695:11: note: Loop condition is false.  Exiting lo=
op
                           node =3D rcu_dereference(node->child[0]);
                                  ^
   include/linux/rcupdate.h:597:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:529:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:391:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:317:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
           do {                                                            \
           ^
   kernel/bpf/lpm_trie.c:693:2: note: Loop condition is false. Execution co=
ntinues on line 704
           for (node =3D search_root; node;) {
           ^
   kernel/bpf/lpm_trie.c:704:24: note: Access to field 'prefixlen' results =
in a dereference of a null pointer (loaded from variable 'next_node')
           next_key->prefixlen =3D next_node->prefixlen;
                                 ^~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   kernel/bpf/btf.c:840:25: warning: Value stored to 't' during its initial=
ization is never read [clang-analyzer-deadcode.DeadStores]
           const struct btf_type *t =3D show->state.type;
                                  ^   ~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:840:25: note: Value stored to 't' during its initializa=
tion is never read
           const struct btf_type *t =3D show->state.type;
                                  ^   ~~~~~~~~~~~~~~~~
>> kernel/bpf/btf.c:6693:3: warning: Address of stack memory associated wit=
h local variable 'local_cand' returned to caller [clang-analyzer-core.Stack=
AddressEscape]
                   return cands;
                   ^
   kernel/bpf/btf.c:6743:20: note: Assuming field 'kind' is not equal to BP=
F_CORE_TYPE_ID_LOCAL
           bool need_cands =3D relo->kind !=3D BPF_CORE_TYPE_ID_LOCAL;
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:6747:6: note: 'need_cands' is true
           if (need_cands) {
               ^~~~~~~~~~
   kernel/bpf/btf.c:6747:2: note: Taking true branch
           if (need_cands) {
           ^
   kernel/bpf/btf.c:6752:8: note: Calling 'bpf_core_find_cands'
                   cc =3D bpf_core_find_cands(ctx, relo->type_id);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:6665:2: note: Taking false branch
           if (IS_ERR(main_btf))
           ^
   kernel/bpf/btf.c:6669:6: note: Assuming 'local_type' is non-null
           if (!local_type)
               ^~~~~~~~~~~
   kernel/bpf/btf.c:6669:2: note: Taking false branch
           if (!local_type)
           ^
   kernel/bpf/btf.c:6673:6: note: Assuming the condition is false
           if (str_is_empty(name))
               ^~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:6673:2: note: Taking false branch
           if (str_is_empty(name))
           ^
   kernel/bpf/btf.c:6684:6: note: 'cc' is null
           if (cc) {
               ^~
   kernel/bpf/btf.c:6684:2: note: Taking false branch
           if (cc) {
           ^
   kernel/bpf/btf.c:6692:6: note: Assuming the condition is true
           if (IS_ERR(cands))
               ^~~~~~~~~~~~~
   kernel/bpf/btf.c:6692:2: note: Taking true branch
           if (IS_ERR(cands))
           ^
   kernel/bpf/btf.c:6693:3: note: Address of stack memory associated with l=
ocal variable 'local_cand' returned to caller
                   return cands;
                   ^      ~~~~~
>> kernel/bpf/btf.c:6708:7: warning: Use of memory after it is freed [clang=
-analyzer-unix.Malloc]
           cc =3D check_cand_cache(cands, module_cand_cache, MODULE_CAND_CA=
CHE_SIZE);
                ^
   kernel/bpf/btf.c:6743:20: note: Assuming field 'kind' is not equal to BP=
F_CORE_TYPE_ID_LOCAL
           bool need_cands =3D relo->kind !=3D BPF_CORE_TYPE_ID_LOCAL;
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:6747:6: note: 'need_cands' is true
           if (need_cands) {
               ^~~~~~~~~~
   kernel/bpf/btf.c:6747:2: note: Taking true branch
           if (need_cands) {
           ^
   kernel/bpf/btf.c:6752:8: note: Calling 'bpf_core_find_cands'
                   cc =3D bpf_core_find_cands(ctx, relo->type_id);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:6665:2: note: Taking false branch
           if (IS_ERR(main_btf))
           ^
   kernel/bpf/btf.c:6669:6: note: Assuming 'local_type' is non-null
           if (!local_type)
               ^~~~~~~~~~~
   kernel/bpf/btf.c:6669:2: note: Taking false branch
           if (!local_type)
           ^
   kernel/bpf/btf.c:6673:6: note: Assuming the condition is false
           if (str_is_empty(name))
               ^~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:6673:2: note: Taking false branch
           if (str_is_empty(name))
           ^
   kernel/bpf/btf.c:6684:6: note: 'cc' is null
           if (cc) {
               ^~
   kernel/bpf/btf.c:6684:2: note: Taking false branch
           if (cc) {
           ^
   kernel/bpf/btf.c:6691:10: note: Calling 'bpf_core_add_cands'
           cands =3D bpf_core_add_cands(cands, main_btf, 1);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:6614:26: note: Assuming 'i' is < 'n'
           for (i =3D targ_start_id; i < n; i++) {
                                   ^~~~~
   kernel/bpf/btf.c:6614:2: note: Loop condition is true.  Entering loop bo=
dy
           for (i =3D targ_start_id; i < n; i++) {
           ^
   kernel/bpf/btf.c:6616:7: note: Assuming the condition is false
                   if (btf_kind(t) !=3D cands->kind)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:6616:3: note: Taking false branch
                   if (btf_kind(t) !=3D cands->kind)
                   ^
   kernel/bpf/btf.c:6620:7: note: Assuming 'targ_name' is non-null
                   if (!targ_name)
                       ^~~~~~~~~~
   kernel/bpf/btf.c:6620:3: note: Taking false branch
                   if (!targ_name)
                   ^
   kernel/bpf/btf.c:6628:3: note: Taking false branch
                   if (strncmp(cands->name, targ_name, cands->name_len) !=
=3D 0)
                   ^
   kernel/bpf/btf.c:6632:7: note: Assuming 'targ_essent_len' is equal to fi=
eld 'name_len'
                   if (targ_essent_len !=3D cands->name_len)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:6632:3: note: Taking false branch
                   if (targ_essent_len !=3D cands->name_len)
                   ^
   kernel/bpf/btf.c:6637:7: note: Assuming 'new_cands' is non-null
                   if (!new_cands) {
                       ^~~~~~~~~~
   kernel/bpf/btf.c:6637:3: note: Taking false branch
                   if (!new_cands) {
                   ^
   kernel/bpf/btf.c:6614:26: note: Assuming 'i' is >=3D 'n'
           for (i =3D targ_start_id; i < n; i++) {
                                   ^~~~~
   kernel/bpf/btf.c:6614:2: note: Loop condition is false. Execution contin=
ues on line 6649
           for (i =3D targ_start_id; i < n; i++) {
           ^
   kernel/bpf/btf.c:6691:10: note: Returning from 'bpf_core_add_cands'
           cands =3D bpf_core_add_cands(cands, main_btf, 1);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:6692:2: note: Taking false branch
           if (IS_ERR(cands))
           ^
   kernel/bpf/btf.c:6698:7: note: Calling 'populate_cand_cache'
           cc =3D populate_cand_cache(cands, vmlinux_cand_cache, VMLINUX_CA=
ND_CACHE_SIZE);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   kernel/bpf/btf.c:6541:6: note: Assuming the condition is false
           if (*cc) {
               ^~~
   kernel/bpf/btf.c:6541:2: note: Taking false branch
           if (*cc) {
           ^
   kernel/bpf/btf.c:6546:6: note: Assuming 'new_cands' is non-null
           if (!new_cands) {
               ^~~~~~~~~~
   kernel/bpf/btf.c:6546:2: note: Taking false branch
           if (!new_cands) {
           ^
   kernel/bpf/btf.c:6555:2: note: Calling 'bpf_free_cands'
           bpf_free_cands(cands);

vim +/local_cand +6693 kernel/bpf/btf.c

1e89106da25390 Alexei Starovoitov 2021-12-01  6651  =

1e89106da25390 Alexei Starovoitov 2021-12-01  6652  static struct bpf_cand_=
cache *
1e89106da25390 Alexei Starovoitov 2021-12-01  6653  bpf_core_find_cands(str=
uct bpf_core_ctx *ctx, u32 local_type_id)
1e89106da25390 Alexei Starovoitov 2021-12-01  6654  {
1e89106da25390 Alexei Starovoitov 2021-12-01  6655  	struct bpf_cand_cache =
*cands, *cc, local_cand =3D {};
1e89106da25390 Alexei Starovoitov 2021-12-01  6656  	const struct btf *loca=
l_btf =3D ctx->btf;
1e89106da25390 Alexei Starovoitov 2021-12-01  6657  	const struct btf_type =
*local_type;
1e89106da25390 Alexei Starovoitov 2021-12-01  6658  	const struct btf *main=
_btf;
1e89106da25390 Alexei Starovoitov 2021-12-01  6659  	size_t local_essent_le=
n;
1e89106da25390 Alexei Starovoitov 2021-12-01  6660  	struct btf *mod_btf;
1e89106da25390 Alexei Starovoitov 2021-12-01  6661  	const char *name;
1e89106da25390 Alexei Starovoitov 2021-12-01  6662  	int id;
1e89106da25390 Alexei Starovoitov 2021-12-01  6663  =

1e89106da25390 Alexei Starovoitov 2021-12-01  6664  	main_btf =3D bpf_get_b=
tf_vmlinux();
1e89106da25390 Alexei Starovoitov 2021-12-01  6665  	if (IS_ERR(main_btf))
1e89106da25390 Alexei Starovoitov 2021-12-01  6666  		return (void *)main_b=
tf;
1e89106da25390 Alexei Starovoitov 2021-12-01  6667  =

1e89106da25390 Alexei Starovoitov 2021-12-01  6668  	local_type =3D btf_typ=
e_by_id(local_btf, local_type_id);
1e89106da25390 Alexei Starovoitov 2021-12-01  6669  	if (!local_type)
1e89106da25390 Alexei Starovoitov 2021-12-01  6670  		return ERR_PTR(-EINVA=
L);
1e89106da25390 Alexei Starovoitov 2021-12-01  6671  =

1e89106da25390 Alexei Starovoitov 2021-12-01  6672  	name =3D btf_name_by_o=
ffset(local_btf, local_type->name_off);
1e89106da25390 Alexei Starovoitov 2021-12-01  6673  	if (str_is_empty(name))
1e89106da25390 Alexei Starovoitov 2021-12-01  6674  		return ERR_PTR(-EINVA=
L);
1e89106da25390 Alexei Starovoitov 2021-12-01  6675  	local_essent_len =3D b=
pf_core_essential_name_len(name);
1e89106da25390 Alexei Starovoitov 2021-12-01  6676  =

1e89106da25390 Alexei Starovoitov 2021-12-01  6677  	cands =3D &local_cand;
1e89106da25390 Alexei Starovoitov 2021-12-01  6678  	cands->name =3D name;
1e89106da25390 Alexei Starovoitov 2021-12-01  6679  	cands->kind =3D btf_ki=
nd(local_type);
1e89106da25390 Alexei Starovoitov 2021-12-01  6680  	cands->name_len =3D lo=
cal_essent_len;
1e89106da25390 Alexei Starovoitov 2021-12-01  6681  =

1e89106da25390 Alexei Starovoitov 2021-12-01  6682  	cc =3D check_cand_cach=
e(cands, vmlinux_cand_cache, VMLINUX_CAND_CACHE_SIZE);
1e89106da25390 Alexei Starovoitov 2021-12-01  6683  	/* cands is a pointer =
to stack here */
1e89106da25390 Alexei Starovoitov 2021-12-01  6684  	if (cc) {
1e89106da25390 Alexei Starovoitov 2021-12-01  6685  		if (cc->cnt)
1e89106da25390 Alexei Starovoitov 2021-12-01  6686  			return cc;
1e89106da25390 Alexei Starovoitov 2021-12-01  6687  		goto check_modules;
1e89106da25390 Alexei Starovoitov 2021-12-01  6688  	}
1e89106da25390 Alexei Starovoitov 2021-12-01  6689  =

1e89106da25390 Alexei Starovoitov 2021-12-01  6690  	/* Attempt to find tar=
get candidates in vmlinux BTF first */
1e89106da25390 Alexei Starovoitov 2021-12-01  6691  	cands =3D bpf_core_add=
_cands(cands, main_btf, 1);
1e89106da25390 Alexei Starovoitov 2021-12-01  6692  	if (IS_ERR(cands))
1e89106da25390 Alexei Starovoitov 2021-12-01 @6693  		return cands;
1e89106da25390 Alexei Starovoitov 2021-12-01  6694  =

1e89106da25390 Alexei Starovoitov 2021-12-01  6695  	/* cands is a pointer =
to kmalloced memory here if cands->cnt > 0 */
1e89106da25390 Alexei Starovoitov 2021-12-01  6696  =

1e89106da25390 Alexei Starovoitov 2021-12-01  6697  	/* populate cache even=
 when cands->cnt =3D=3D 0 */
1e89106da25390 Alexei Starovoitov 2021-12-01  6698  	cc =3D populate_cand_c=
ache(cands, vmlinux_cand_cache, VMLINUX_CAND_CACHE_SIZE);
1e89106da25390 Alexei Starovoitov 2021-12-01  6699  	if (IS_ERR(cc))
1e89106da25390 Alexei Starovoitov 2021-12-01  6700  		return cc;
1e89106da25390 Alexei Starovoitov 2021-12-01  6701  =

1e89106da25390 Alexei Starovoitov 2021-12-01  6702  	/* if vmlinux BTF has =
any candidate, don't go for module BTFs */
1e89106da25390 Alexei Starovoitov 2021-12-01  6703  	if (cc->cnt)
1e89106da25390 Alexei Starovoitov 2021-12-01  6704  		return cc;
1e89106da25390 Alexei Starovoitov 2021-12-01  6705  =

1e89106da25390 Alexei Starovoitov 2021-12-01  6706  check_modules:
1e89106da25390 Alexei Starovoitov 2021-12-01  6707  	/* cands is a pointer =
to stack here and cands->cnt =3D=3D 0 */
1e89106da25390 Alexei Starovoitov 2021-12-01 @6708  	cc =3D check_cand_cach=
e(cands, module_cand_cache, MODULE_CAND_CACHE_SIZE);
1e89106da25390 Alexei Starovoitov 2021-12-01  6709  	if (cc)
1e89106da25390 Alexei Starovoitov 2021-12-01  6710  		/* if cache has it re=
turn it even if cc->cnt =3D=3D 0 */
1e89106da25390 Alexei Starovoitov 2021-12-01  6711  		return cc;
1e89106da25390 Alexei Starovoitov 2021-12-01  6712  =

1e89106da25390 Alexei Starovoitov 2021-12-01  6713  	/* If candidate is not=
 found in vmlinux's BTF then search in module's BTFs */
1e89106da25390 Alexei Starovoitov 2021-12-01  6714  	spin_lock_bh(&btf_idr_=
lock);
1e89106da25390 Alexei Starovoitov 2021-12-01  6715  	idr_for_each_entry(&bt=
f_idr, mod_btf, id) {
1e89106da25390 Alexei Starovoitov 2021-12-01  6716  		if (!btf_is_module(mo=
d_btf))
1e89106da25390 Alexei Starovoitov 2021-12-01  6717  			continue;
1e89106da25390 Alexei Starovoitov 2021-12-01  6718  		/* linear search coul=
d be slow hence unlock/lock
1e89106da25390 Alexei Starovoitov 2021-12-01  6719  		 * the IDR to avoidin=
g holding it for too long
1e89106da25390 Alexei Starovoitov 2021-12-01  6720  		 */
1e89106da25390 Alexei Starovoitov 2021-12-01  6721  		btf_get(mod_btf);
1e89106da25390 Alexei Starovoitov 2021-12-01  6722  		spin_unlock_bh(&btf_i=
dr_lock);
1e89106da25390 Alexei Starovoitov 2021-12-01  6723  		cands =3D bpf_core_ad=
d_cands(cands, mod_btf, btf_nr_types(main_btf));
1e89106da25390 Alexei Starovoitov 2021-12-01  6724  		if (IS_ERR(cands)) {
1e89106da25390 Alexei Starovoitov 2021-12-01  6725  			btf_put(mod_btf);
1e89106da25390 Alexei Starovoitov 2021-12-01  6726  			return cands;
1e89106da25390 Alexei Starovoitov 2021-12-01  6727  		}
1e89106da25390 Alexei Starovoitov 2021-12-01  6728  		spin_lock_bh(&btf_idr=
_lock);
1e89106da25390 Alexei Starovoitov 2021-12-01  6729  		btf_put(mod_btf);
1e89106da25390 Alexei Starovoitov 2021-12-01  6730  	}
1e89106da25390 Alexei Starovoitov 2021-12-01  6731  	spin_unlock_bh(&btf_id=
r_lock);
1e89106da25390 Alexei Starovoitov 2021-12-01  6732  	/* cands is a pointer =
to kmalloced memory here if cands->cnt > 0
1e89106da25390 Alexei Starovoitov 2021-12-01  6733  	 * or pointer to stack=
 if cands->cnd =3D=3D 0.
1e89106da25390 Alexei Starovoitov 2021-12-01  6734  	 * Copy it into the ca=
che even when cands->cnt =3D=3D 0 and
1e89106da25390 Alexei Starovoitov 2021-12-01  6735  	 * return the result.
1e89106da25390 Alexei Starovoitov 2021-12-01  6736  	 */
1e89106da25390 Alexei Starovoitov 2021-12-01  6737  	return populate_cand_c=
ache(cands, module_cand_cache, MODULE_CAND_CACHE_SIZE);
1e89106da25390 Alexei Starovoitov 2021-12-01  6738  }
1e89106da25390 Alexei Starovoitov 2021-12-01  6739  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2279137680195008703==--

