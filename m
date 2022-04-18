Content-Type: multipart/mixed; boundary="===============3285535400435876868=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/bpf/btf.c:6509:2: warning: Argument to kfree() is the address of the local variable 'local_cand', which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]
Date: Tue, 19 Apr 2022 05:16:48 +0800
Message-ID: <202204190547.cOZxrNXw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3285535400435876868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Nick Desaulniers <ndesaulniers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b2d229d4ddb17db541098b83524d901257e93845
commit: 281d0c962752fb40866dd8d4cade68656f34bd1f fortify: Add Clang support
date:   9 weeks ago
:::::: branch date: 24 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-c007-20220418 (https://download.01.org/0day-ci/ar=
chive/20220419/202204190547.cOZxrNXw-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ef9460=
9d6ebe981767788e6877b0b3b731d425af)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D281d0c962752fb40866dd8d4cade68656f34bd1f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 281d0c962752fb40866dd8d4cade68656f34bd1f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/early/ehci-dbgp.c:856:2: note: Taking false branch
           if (bar !=3D PCI_BASE_ADDRESS_0) {
           ^
   drivers/usb/early/ehci-dbgp.c:864:6: note: Assuming the condition is fal=
se
           if (bar_val & ~PCI_BASE_ADDRESS_MEM_MASK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/early/ehci-dbgp.c:864:2: note: Taking false branch
           if (bar_val & ~PCI_BASE_ADDRESS_MEM_MASK) {
           ^
   drivers/usb/early/ehci-dbgp.c:872:6: note: Assuming the condition is fal=
se
           if (!(byte & 0x2)) {
               ^~~~~~~~~~~~~
   drivers/usb/early/ehci-dbgp.c:872:2: note: Taking false branch
           if (!(byte & 0x2)) {
           ^
   drivers/usb/early/ehci-dbgp.c:896:8: note: Calling 'ehci_setup'
           ret =3D ehci_setup();
                 ^~~~~~~~~~~~
   drivers/usb/early/ehci-dbgp.c:769:2: note: Value assigned to 'n_ports'
           n_ports    =3D HCS_N_PORTS(hcs_params);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/early/ehci-dbgp.c:775:14: note: Assuming 'i' is > 'n_ports'
           for (i =3D 1; i <=3D n_ports; i++) {
                       ^~~~~~~~~~~~
   drivers/usb/early/ehci-dbgp.c:775:2: note: Loop condition is false. Exec=
ution continues on line 780
           for (i =3D 1; i <=3D n_ports; i++) {
           ^
   drivers/usb/early/ehci-dbgp.c:780:6: note: 'port_map_tried' is 0
           if (port_map_tried && (new_debug_port !=3D debug_port)) {
               ^~~~~~~~~~~~~~
   drivers/usb/early/ehci-dbgp.c:780:21: note: Left side of '&&' is false
           if (port_map_tried && (new_debug_port !=3D debug_port)) {
                              ^
   drivers/usb/early/ehci-dbgp.c:790:6: note: Assuming the condition is fal=
se
           if (!(readl(&ehci_regs->configured_flag) & FLAG_CF)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/early/ehci-dbgp.c:790:2: note: Taking false branch
           if (!(readl(&ehci_regs->configured_flag) & FLAG_CF)) {
           ^
   drivers/usb/early/ehci-dbgp.c:798:6: note: Assuming the condition is true
           if (ret =3D=3D -EIO)
               ^~~~~~~~~~~
   drivers/usb/early/ehci-dbgp.c:798:2: note: Taking true branch
           if (ret =3D=3D -EIO)
           ^
   drivers/usb/early/ehci-dbgp.c:799:3: note: Control jumps to line 811
                   goto next_debug_port;
                   ^
   drivers/usb/early/ehci-dbgp.c:812:36: note: Division by zero
           new_debug_port =3D ((debug_port-1+1)%n_ports) + 1;
                             ~~~~~~~~~~~~~~~~^~~~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   arch/x86/mm/init.c:916:16: warning: Value stored to 'len_pages' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long len_pages =3D (end_ul - begin_ul) >> PAGE_SHIFT;
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/init.c:916:16: note: Value stored to 'len_pages' during its =
initialization is never read
           unsigned long len_pages =3D (end_ul - begin_ul) >> PAGE_SHIFT;
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   arch/x86/mm/init_64.c:680:2: warning: Value stored to 'paddr_last' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           paddr_last =3D paddr_end;
           ^            ~~~~~~~~~
   arch/x86/mm/init_64.c:680:2: note: Value stored to 'paddr_last' is never=
 read
           paddr_last =3D paddr_end;
           ^            ~~~~~~~~~
   arch/x86/mm/init_64.c:681:2: warning: Value stored to 'vaddr' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           vaddr =3D (unsigned long)__va(paddr);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/init_64.c:681:2: note: Value stored to 'vaddr' is never read
           vaddr =3D (unsigned long)__va(paddr);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/init_64.c:682:2: warning: Value stored to 'vaddr_end' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           vaddr_end =3D (unsigned long)__va(paddr_end);
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/init_64.c:682:2: note: Value stored to 'vaddr_end' is never =
read
           vaddr_end =3D (unsigned long)__va(paddr_end);
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   10 warnings generated.
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

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3285535400435876868==--

