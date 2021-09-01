Content-Type: multipart/mixed; boundary="===============3576018883786439397=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next RFC v1 1/8] bpf: Introduce BPF support for kernel module function calls
Date: Wed, 01 Sep 2021 09:16:12 +0800
Message-ID: <202109010919.ZLdzRodU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3576018883786439397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210830173424.1385796-2-memxor@gmail.com>
References: <20210830173424.1385796-2-memxor@gmail.com>
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>

Hi Kumar,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Kumar-Kartikeya-Dwivedi/Su=
pport-kernel-module-function-calls-from-eBPF/20210831-013531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-c001-20210830 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b1fde=
8a2b681dad2ce0c082a5d6422caa06b0bc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e868250a992dc2f10616aa6e2=
882072bb42bb1c5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kumar-Kartikeya-Dwivedi/Support-ke=
rnel-module-function-calls-from-eBPF/20210831-013531
        git checkout e868250a992dc2f10616aa6e2882072bb42bb1c5
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/acpi/acpica/dspkginit.c:94:3: note: Taking false branch
                   if (!obj_desc) {
                   ^
   drivers/acpi/acpica/dspkginit.c:101:6: note: Assuming the condition is f=
alse
           if (obj_desc->package.flags & AOPOBJ_DATA_VALID) {      /* Just =
in case */
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:101:2: note: Taking false branch
           if (obj_desc->package.flags & AOPOBJ_DATA_VALID) {      /* Just =
in case */
           ^
   drivers/acpi/acpica/dspkginit.c:111:6: note: Assuming field 'elements' i=
s non-null
           if (!obj_desc->package.elements) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:111:2: note: Taking false branch
           if (!obj_desc->package.elements) {
           ^
   drivers/acpi/acpica/dspkginit.c:138:6: note: 'module_level_code' is 0
           if (module_level_code) {
               ^~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:138:2: note: Taking false branch
           if (module_level_code) {
           ^
   drivers/acpi/acpica/dspkginit.c:153:14: note: Assuming 'arg' is non-null
           for (i =3D 0; arg && (i < element_count); i++) {
                       ^~~
   drivers/acpi/acpica/dspkginit.c:153:14: note: Left side of '&&' is true
   drivers/acpi/acpica/dspkginit.c:153:22: note: Assuming 'i' is < 'element=
_count'
           for (i =3D 0; arg && (i < element_count); i++) {
                               ^~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:153:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; arg && (i < element_count); i++) {
           ^
   drivers/acpi/acpica/dspkginit.c:154:7: note: Assuming field 'aml_opcode'=
 is not equal to AML_INT_RETURN_VALUE_OP
                   if (arg->common.aml_opcode =3D=3D AML_INT_RETURN_VALUE_O=
P) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:154:3: note: Taking false branch
                   if (arg->common.aml_opcode =3D=3D AML_INT_RETURN_VALUE_O=
P) {
                   ^
   drivers/acpi/acpica/dspkginit.c:205:8: note: Assuming the condition is f=
alse
                           if (status =3D=3D AE_NOT_FOUND) {
                               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:205:4: note: Taking false branch
                           if (status =3D=3D AE_NOT_FOUND) {
                           ^
   drivers/acpi/acpica/dspkginit.c:210:9: note: 'module_level_code' is 0
                           if (!module_level_code) {
                                ^~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:210:4: note: Taking true branch
                           if (!module_level_code) {
                           ^
   drivers/acpi/acpica/dspkginit.c:219:26: note: Passing null pointer value=
 via 3rd parameter 'state'
                                                                elements[i]=
, NULL,
                                                                           =
  ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:217:5: note: Calling 'acpi_ds_init_packa=
ge_element'
                                   acpi_ds_init_package_element(0,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:332:6: note: Assuming 'source_object' is=
 non-null
           if (!source_object) {
               ^~~~~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:332:2: note: Taking false branch
           if (!source_object) {
           ^
   drivers/acpi/acpica/dspkginit.c:342:6: note: Assuming 'context' is null
           if (context) {
               ^~~~~~~
   drivers/acpi/acpica/dspkginit.c:342:2: note: Taking false branch
           if (context) {
           ^
   drivers/acpi/acpica/dspkginit.c:350:17: note: Dereference of null pointer
                   element_ptr =3D state->pkg.this_target_obj;
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   kernel/trace/trace_probe.c:195:3: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(p, trace_probe_log.argv[i]);
                   ^~~~~~
   kernel/trace/trace_probe.c:195:3: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                   strcpy(p, trace_probe_log.argv[i]);
                   ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> kernel/bpf/syscall.c:2286:14: warning: 1st function call argument is an =
uninitialized value [clang-analyzer-core.CallAndMessage]
                           mod_btf =3D btf_get_by_fd(fds[i]);
                                     ^             ~~~~~~
   kernel/bpf/syscall.c:2170:6: note: Assuming the condition is false
           if (CHECK_ATTR(BPF_PROG_LOAD))
               ^
   kernel/bpf/syscall.c:716:2: note: expanded from macro 'CHECK_ATTR'
           memchr_inv((void *) &attr->CMD##_LAST_FIELD + \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:2170:2: note: Taking false branch
           if (CHECK_ATTR(BPF_PROG_LOAD))
           ^
   kernel/bpf/syscall.c:2173:6: note: Assuming the condition is false
           if (attr->prog_flags & ~(BPF_F_STRICT_ALIGNMENT |
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:2173:2: note: Taking false branch
           if (attr->prog_flags & ~(BPF_F_STRICT_ALIGNMENT |
           ^
   kernel/bpf/syscall.c:2180:58: note: Left side of '&&' is false
           if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) &&
                                                                   ^
   kernel/bpf/syscall.c:2186:6: note: Assuming the condition is false
           if (strncpy_from_bpfptr(license,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:2186:2: note: Taking false branch
           if (strncpy_from_bpfptr(license,
           ^
   kernel/bpf/syscall.c:2195:6: note: Assuming field 'insn_cnt' is not equa=
l to 0
           if (attr->insn_cnt =3D=3D 0 ||
               ^~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:2195:6: note: Left side of '||' is false
   kernel/bpf/syscall.c:2196:24: note: Assuming the condition is false
               attr->insn_cnt > (bpf_capable() ? BPF_COMPLEXITY_LIMIT_INSNS=
 : BPF_MAXINSNS))
                                 ^~~~~~~~~~~~~
   kernel/bpf/syscall.c:2196:24: note: '?' condition is false
   kernel/bpf/syscall.c:2196:6: note: Assuming the condition is false
               attr->insn_cnt > (bpf_capable() ? BPF_COMPLEXITY_LIMIT_INSNS=
 : BPF_MAXINSNS))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:2195:2: note: Taking false branch
           if (attr->insn_cnt =3D=3D 0 ||
           ^
   kernel/bpf/syscall.c:2198:6: note: Assuming 'type' is equal to BPF_PROG_=
TYPE_SOCKET_FILTER
           if (type !=3D BPF_PROG_TYPE_SOCKET_FILTER &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:2198:42: note: Left side of '&&' is false
           if (type !=3D BPF_PROG_TYPE_SOCKET_FILTER &&
                                                   ^
   kernel/bpf/syscall.c:2203:6: note: Calling 'is_net_admin_prog_type'
           if (is_net_admin_prog_type(type) && !capable(CAP_NET_ADMIN) && !=
capable(CAP_SYS_ADMIN))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:2111:2: note: Control jumps to the 'default' case a=
t line 2135
           switch (prog_type) {
           ^
   kernel/bpf/syscall.c:2136:3: note: Returning zero, which participates in=
 a condition later
                   return false;
                   ^~~~~~~~~~~~
   kernel/bpf/syscall.c:2203:6: note: Returning from 'is_net_admin_prog_typ=
e'
           if (is_net_admin_prog_type(type) && !capable(CAP_NET_ADMIN) && !=
capable(CAP_SYS_ADMIN))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:2203:35: note: Left side of '&&' is false
           if (is_net_admin_prog_type(type) && !capable(CAP_NET_ADMIN) && !=
capable(CAP_SYS_ADMIN))
                                            ^
   kernel/bpf/syscall.c:2205:6: note: Calling 'is_perfmon_prog_type'
           if (is_perfmon_prog_type(type) && !perfmon_capable())
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:2142:2: note: Control jumps to the 'default' case a=
t line 2153
           switch (prog_type) {
           ^
   kernel/bpf/syscall.c:2154:3: note: Returning zero, which participates in=
 a condition later
                   return false;
                   ^~~~~~~~~~~~
   kernel/bpf/syscall.c:2205:6: note: Returning from 'is_perfmon_prog_type'
           if (is_perfmon_prog_type(type) && !perfmon_capable())
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:2205:33: note: Left side of '&&' is false
           if (is_perfmon_prog_type(type) && !perfmon_capable())
                                          ^
   kernel/bpf/syscall.c:2207:6: note: Assuming field 'kfunc_btf_fds_cnt' is=
 <=3D MAX_KFUNC_DESCS
           if (attr->kfunc_btf_fds_cnt > MAX_KFUNC_DESCS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:2207:2: note: Taking false branch
           if (attr->kfunc_btf_fds_cnt > MAX_KFUNC_DESCS)
           ^
   kernel/bpf/syscall.c:2213:6: note: Assuming field 'attach_prog_fd' is 0
           if (attr->attach_prog_fd) {
               ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:2213:2: note: Taking false branch
           if (attr->attach_prog_fd) {
           ^
   kernel/bpf/syscall.c:2228:13: note: Assuming field 'attach_btf_id' is 0
           } else if (attr->attach_btf_id) {
                      ^~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:2228:9: note: Taking false branch
           } else if (attr->attach_btf_id) {
                  ^
   kernel/bpf/syscall.c:2238:2: note: Calling 'bpf_prog_load_fixup_attach_t=
ype'
           bpf_prog_load_fixup_attach_type(attr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:1994:2: note: 'Default' branch taken. Execution con=
tinues on line 1994
           switch (attr->prog_type) {
           ^

vim +2286 kernel/bpf/syscall.c

09756af46893c1 Alexei Starovoitov      2014-09-26  2160  =

af2ac3e13e4575 Alexei Starovoitov      2021-05-13  2161  static int bpf_pro=
g_load(union bpf_attr *attr, bpfptr_t uattr)
09756af46893c1 Alexei Starovoitov      2014-09-26  2162  {
09756af46893c1 Alexei Starovoitov      2014-09-26  2163  	enum bpf_prog_typ=
e type =3D attr->prog_type;
290248a5b7d829 Andrii Nakryiko         2020-12-03  2164  	struct bpf_prog *=
prog, *dst_prog =3D NULL;
290248a5b7d829 Andrii Nakryiko         2020-12-03  2165  	struct btf *attac=
h_btf =3D NULL;
09756af46893c1 Alexei Starovoitov      2014-09-26  2166  	char license[128];
09756af46893c1 Alexei Starovoitov      2014-09-26  2167  	bool is_gpl;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2168  	int err;
09756af46893c1 Alexei Starovoitov      2014-09-26  2169  =

09756af46893c1 Alexei Starovoitov      2014-09-26  2170  	if (CHECK_ATTR(BP=
F_PROG_LOAD))
09756af46893c1 Alexei Starovoitov      2014-09-26  2171  		return -EINVAL;
09756af46893c1 Alexei Starovoitov      2014-09-26  2172  =

c240eff63a1cf1 Jiong Wang              2019-05-24  2173  	if (attr->prog_fl=
ags & ~(BPF_F_STRICT_ALIGNMENT |
c240eff63a1cf1 Jiong Wang              2019-05-24  2174  				 BPF_F_ANY_ALI=
GNMENT |
10d274e880eb20 Alexei Starovoitov      2019-08-22  2175  				 BPF_F_TEST_ST=
ATE_FREQ |
1e6c62a8821557 Alexei Starovoitov      2020-08-27  2176  				 BPF_F_SLEEPAB=
LE |
c240eff63a1cf1 Jiong Wang              2019-05-24  2177  				 BPF_F_TEST_RN=
D_HI32))
e07b98d9bffe41 David S. Miller         2017-05-10  2178  		return -EINVAL;
e07b98d9bffe41 David S. Miller         2017-05-10  2179  =

e9ee9efc0d1765 David Miller            2018-11-30  2180  	if (!IS_ENABLED(C=
ONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) &&
e9ee9efc0d1765 David Miller            2018-11-30  2181  	    (attr->prog_f=
lags & BPF_F_ANY_ALIGNMENT) &&
2c78ee898d8f10 Alexei Starovoitov      2020-05-13  2182  	    !bpf_capable(=
))
e9ee9efc0d1765 David Miller            2018-11-30  2183  		return -EPERM;
e9ee9efc0d1765 David Miller            2018-11-30  2184  =

09756af46893c1 Alexei Starovoitov      2014-09-26  2185  	/* copy eBPF prog=
ram license from user space */
af2ac3e13e4575 Alexei Starovoitov      2021-05-13  2186  	if (strncpy_from_=
bpfptr(license,
af2ac3e13e4575 Alexei Starovoitov      2021-05-13  2187  				make_bpfptr(at=
tr->license, uattr.is_kernel),
09756af46893c1 Alexei Starovoitov      2014-09-26  2188  				sizeof(license=
) - 1) < 0)
09756af46893c1 Alexei Starovoitov      2014-09-26  2189  		return -EFAULT;
09756af46893c1 Alexei Starovoitov      2014-09-26  2190  	license[sizeof(li=
cense) - 1] =3D 0;
09756af46893c1 Alexei Starovoitov      2014-09-26  2191  =

09756af46893c1 Alexei Starovoitov      2014-09-26  2192  	/* eBPF programs =
must be GPL compatible to use GPL-ed functions */
09756af46893c1 Alexei Starovoitov      2014-09-26  2193  	is_gpl =3D licens=
e_is_gpl_compatible(license);
09756af46893c1 Alexei Starovoitov      2014-09-26  2194  =

c04c0d2b968ac4 Alexei Starovoitov      2019-04-01  2195  	if (attr->insn_cn=
t =3D=3D 0 ||
2c78ee898d8f10 Alexei Starovoitov      2020-05-13  2196  	    attr->insn_cn=
t > (bpf_capable() ? BPF_COMPLEXITY_LIMIT_INSNS : BPF_MAXINSNS))
ef0915cacd04c9 Daniel Borkmann         2016-12-07  2197  		return -E2BIG;
80b7d81912d807 Chenbo Feng             2017-05-31  2198  	if (type !=3D BPF=
_PROG_TYPE_SOCKET_FILTER &&
80b7d81912d807 Chenbo Feng             2017-05-31  2199  	    type !=3D BPF=
_PROG_TYPE_CGROUP_SKB &&
2c78ee898d8f10 Alexei Starovoitov      2020-05-13  2200  	    !bpf_capable(=
))
2c78ee898d8f10 Alexei Starovoitov      2020-05-13  2201  		return -EPERM;
2c78ee898d8f10 Alexei Starovoitov      2020-05-13  2202  =

b338cb921e6739 Maciej =C5=BBenczykowski     2020-06-20  2203  	if (is_net_a=
dmin_prog_type(type) && !capable(CAP_NET_ADMIN) && !capable(CAP_SYS_ADMIN))
2c78ee898d8f10 Alexei Starovoitov      2020-05-13  2204  		return -EPERM;
2c78ee898d8f10 Alexei Starovoitov      2020-05-13  2205  	if (is_perfmon_pr=
og_type(type) && !perfmon_capable())
1be7f75d1668d6 Alexei Starovoitov      2015-10-07  2206  		return -EPERM;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2207  	if (attr->kfunc_b=
tf_fds_cnt > MAX_KFUNC_DESCS)
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2208  		return -E2BIG;
1be7f75d1668d6 Alexei Starovoitov      2015-10-07  2209  =

290248a5b7d829 Andrii Nakryiko         2020-12-03  2210  	/* attach_prog_fd=
/attach_btf_obj_fd can specify fd of either bpf_prog
290248a5b7d829 Andrii Nakryiko         2020-12-03  2211  	 * or btf, we nee=
d to check which one it is
290248a5b7d829 Andrii Nakryiko         2020-12-03  2212  	 */
290248a5b7d829 Andrii Nakryiko         2020-12-03  2213  	if (attr->attach_=
prog_fd) {
290248a5b7d829 Andrii Nakryiko         2020-12-03  2214  		dst_prog =3D bpf=
_prog_get(attr->attach_prog_fd);
290248a5b7d829 Andrii Nakryiko         2020-12-03  2215  		if (IS_ERR(dst_p=
rog)) {
290248a5b7d829 Andrii Nakryiko         2020-12-03  2216  			dst_prog =3D NU=
LL;
290248a5b7d829 Andrii Nakryiko         2020-12-03  2217  			attach_btf =3D =
btf_get_by_fd(attr->attach_btf_obj_fd);
290248a5b7d829 Andrii Nakryiko         2020-12-03  2218  			if (IS_ERR(atta=
ch_btf))
290248a5b7d829 Andrii Nakryiko         2020-12-03  2219  				return -EINVAL;
290248a5b7d829 Andrii Nakryiko         2020-12-03  2220  			if (!btf_is_ker=
nel(attach_btf)) {
8bdd8e275ede97 Andrii Nakryiko         2020-12-07  2221  				/* attaching t=
hrough specifying bpf_prog's BTF
8bdd8e275ede97 Andrii Nakryiko         2020-12-07  2222  				 * objects dir=
ectly might be supported eventually
8bdd8e275ede97 Andrii Nakryiko         2020-12-07  2223  				 */
290248a5b7d829 Andrii Nakryiko         2020-12-03  2224  				btf_put(attach=
_btf);
8bdd8e275ede97 Andrii Nakryiko         2020-12-07  2225  				return -ENOTSU=
PP;
290248a5b7d829 Andrii Nakryiko         2020-12-03  2226  			}
290248a5b7d829 Andrii Nakryiko         2020-12-03  2227  		}
290248a5b7d829 Andrii Nakryiko         2020-12-03  2228  	} else if (attr->=
attach_btf_id) {
290248a5b7d829 Andrii Nakryiko         2020-12-03  2229  		/* fall back to =
vmlinux BTF, if BTF type ID is specified */
290248a5b7d829 Andrii Nakryiko         2020-12-03  2230  		attach_btf =3D b=
pf_get_btf_vmlinux();
290248a5b7d829 Andrii Nakryiko         2020-12-03  2231  		if (IS_ERR(attac=
h_btf))
290248a5b7d829 Andrii Nakryiko         2020-12-03  2232  			return PTR_ERR(=
attach_btf);
290248a5b7d829 Andrii Nakryiko         2020-12-03  2233  		if (!attach_btf)
290248a5b7d829 Andrii Nakryiko         2020-12-03  2234  			return -EINVAL;
290248a5b7d829 Andrii Nakryiko         2020-12-03  2235  		btf_get(attach_b=
tf);
290248a5b7d829 Andrii Nakryiko         2020-12-03  2236  	}
290248a5b7d829 Andrii Nakryiko         2020-12-03  2237  =

aac3fc320d9404 Andrey Ignatov          2018-03-30  2238  	bpf_prog_load_fix=
up_attach_type(attr);
ccfe29eb29c2ed Alexei Starovoitov      2019-10-15  2239  	if (bpf_prog_load=
_check_attach(type, attr->expected_attach_type,
290248a5b7d829 Andrii Nakryiko         2020-12-03  2240  				       attach_=
btf, attr->attach_btf_id,
290248a5b7d829 Andrii Nakryiko         2020-12-03  2241  				       dst_pro=
g)) {
290248a5b7d829 Andrii Nakryiko         2020-12-03  2242  		if (dst_prog)
290248a5b7d829 Andrii Nakryiko         2020-12-03  2243  			bpf_prog_put(ds=
t_prog);
290248a5b7d829 Andrii Nakryiko         2020-12-03  2244  		if (attach_btf)
290248a5b7d829 Andrii Nakryiko         2020-12-03  2245  			btf_put(attach_=
btf);
5e43f899b03a34 Andrey Ignatov          2018-03-30  2246  		return -EINVAL;
290248a5b7d829 Andrii Nakryiko         2020-12-03  2247  	}
5e43f899b03a34 Andrey Ignatov          2018-03-30  2248  =

09756af46893c1 Alexei Starovoitov      2014-09-26  2249  	/* plain bpf_prog=
 allocation */
09756af46893c1 Alexei Starovoitov      2014-09-26  2250  	prog =3D bpf_prog=
_alloc(bpf_prog_size(attr->insn_cnt), GFP_USER);
290248a5b7d829 Andrii Nakryiko         2020-12-03  2251  	if (!prog) {
290248a5b7d829 Andrii Nakryiko         2020-12-03  2252  		if (dst_prog)
290248a5b7d829 Andrii Nakryiko         2020-12-03  2253  			bpf_prog_put(ds=
t_prog);
290248a5b7d829 Andrii Nakryiko         2020-12-03  2254  		if (attach_btf)
290248a5b7d829 Andrii Nakryiko         2020-12-03  2255  			btf_put(attach_=
btf);
09756af46893c1 Alexei Starovoitov      2014-09-26  2256  		return -ENOMEM;
290248a5b7d829 Andrii Nakryiko         2020-12-03  2257  	}
09756af46893c1 Alexei Starovoitov      2014-09-26  2258  =

e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2259  	if (attr->kfunc_b=
tf_fds_cnt) {
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2260  		struct bpf_kfunc=
_btf_tab *tab;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2261  		int fds[MAX_KFUN=
C_DESCS], i;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2262  		bpfptr_t kfunc_b=
tf_fds;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2263  		u32 kfunc_btf_si=
ze, n;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2264  =

e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2265  		kfunc_btf_size =
=3D min_t(u32, MAX_KFUNC_DESCS, attr->kfunc_btf_fds_cnt);
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2266  		kfunc_btf_fds =
=3D make_bpfptr(attr->kfunc_btf_fds, uattr.is_kernel);
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2267  =

e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2268  		err =3D -EFAULT;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2269  		if (copy_from_bp=
fptr(fds, kfunc_btf_fds, kfunc_btf_size * sizeof(int)))
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2270  			goto free_prog;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2271  =

e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2272  		err =3D -ENOMEM;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2273  =

e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2274  		n =3D kfunc_btf_=
size;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2275  		kfunc_btf_size *=
=3D sizeof(prog->aux->kfunc_btf_tab->btfs[0]);
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2276  		kfunc_btf_size +=
=3D sizeof(*prog->aux->kfunc_btf_tab);
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2277  		prog->aux->kfunc=
_btf_tab =3D kzalloc(kfunc_btf_size, GFP_KERNEL);
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2278  		if (!prog->aux->=
kfunc_btf_tab)
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2279  			goto free_prog;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2280  =

e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2281  		tab =3D prog->au=
x->kfunc_btf_tab;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2282  		for (i =3D 0; i =
< n; i++) {
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2283  			struct btf_mod_=
pair *p;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2284  			struct btf *mod=
_btf;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2285  =

e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30 @2286  			mod_btf =3D btf=
_get_by_fd(fds[i]);
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2287  			if (IS_ERR(mod_=
btf)) {
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2288  				err =3D PTR_ER=
R(mod_btf);
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2289  				goto free_prog;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2290  			}
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2291  			if (!btf_is_mod=
ule(mod_btf)) {
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2292  				err =3D -EINVA=
L;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2293  				btf_put(mod_bt=
f);
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2294  				goto free_prog;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2295  			}
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2296  =

e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2297  			p =3D &tab->btf=
s[tab->nr_btfs];
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2298  			p->module =3D b=
tf_try_get_module(mod_btf);
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2299  			if (!p->module)=
 {
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2300  				btf_put(mod_bt=
f);
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2301  				goto free_prog;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2302  			}
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2303  			p->btf =3D mod_=
btf;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2304  			tab->nr_btfs++;
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2305  		}
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2306  	}
e868250a992dc2 Kumar Kartikeya Dwivedi 2021-08-30  2307  =

5e43f899b03a34 Andrey Ignatov          2018-03-30  2308  	prog->expected_at=
tach_type =3D attr->expected_attach_type;
290248a5b7d829 Andrii Nakryiko         2020-12-03  2309  	prog->aux->attach=
_btf =3D attach_btf;
ccfe29eb29c2ed Alexei Starovoitov      2019-10-15  2310  	prog->aux->attach=
_btf_id =3D attr->attach_btf_id;
3aac1ead5eb6b7 Toke H=C3=B8iland-J=C3=B8rgensen  2020-09-29  2311  	prog->a=
ux->dst_prog =3D dst_prog;
9a18eedb145d08 Jakub Kicinski          2017-12-27  2312  	prog->aux->offloa=
d_requested =3D !!attr->prog_ifindex;
1e6c62a8821557 Alexei Starovoitov      2020-08-27  2313  	prog->aux->sleepa=
ble =3D attr->prog_flags & BPF_F_SLEEPABLE;
9a18eedb145d08 Jakub Kicinski          2017-12-27  2314  =

afdb09c720b62b Chenbo Feng             2017-10-18  2315  	err =3D security_=
bpf_prog_alloc(prog->aux);
aaac3ba95e4c8b Alexei Starovoitov      2015-10-07  2316  	if (err)
3ac1f01b43b6e2 Roman Gushchin          2020-12-01  2317  		goto free_prog;
afdb09c720b62b Chenbo Feng             2017-10-18  2318  =

3ac1f01b43b6e2 Roman Gushchin          2020-12-01  2319  	prog->aux->user =
=3D get_current_user();
09756af46893c1 Alexei Starovoitov      2014-09-26  2320  	prog->len =3D att=
r->insn_cnt;
09756af46893c1 Alexei Starovoitov      2014-09-26  2321  =

09756af46893c1 Alexei Starovoitov      2014-09-26  2322  	err =3D -EFAULT;
af2ac3e13e4575 Alexei Starovoitov      2021-05-13  2323  	if (copy_from_bpf=
ptr(prog->insns,
af2ac3e13e4575 Alexei Starovoitov      2021-05-13  2324  			     make_bpfpt=
r(attr->insns, uattr.is_kernel),
aafe6ae9cee32d Daniel Borkmann         2016-12-18  2325  			     bpf_prog_i=
nsn_size(prog)) !=3D 0)
3ac1f01b43b6e2 Roman Gushchin          2020-12-01  2326  		goto free_prog_s=
ec;
09756af46893c1 Alexei Starovoitov      2014-09-26  2327  =

09756af46893c1 Alexei Starovoitov      2014-09-26  2328  	prog->orig_prog =
=3D NULL;
a91263d520246b Daniel Borkmann         2015-09-30  2329  	prog->jited =3D 0;
09756af46893c1 Alexei Starovoitov      2014-09-26  2330  =

85192dbf4de087 Andrii Nakryiko         2019-11-17  2331  	atomic64_set(&pro=
g->aux->refcnt, 1);
a91263d520246b Daniel Borkmann         2015-09-30  2332  	prog->gpl_compati=
ble =3D is_gpl ? 1 : 0;
09756af46893c1 Alexei Starovoitov      2014-09-26  2333  =

9a18eedb145d08 Jakub Kicinski          2017-12-27  2334  	if (bpf_prog_is_d=
ev_bound(prog->aux)) {
ab3f0063c48c26 Jakub Kicinski          2017-11-03  2335  		err =3D bpf_prog=
_offload_init(prog, attr);
ab3f0063c48c26 Jakub Kicinski          2017-11-03  2336  		if (err)
3ac1f01b43b6e2 Roman Gushchin          2020-12-01  2337  			goto free_prog_=
sec;
ab3f0063c48c26 Jakub Kicinski          2017-11-03  2338  	}
ab3f0063c48c26 Jakub Kicinski          2017-11-03  2339  =

09756af46893c1 Alexei Starovoitov      2014-09-26  2340  	/* find program t=
ype: socket_filter vs tracing_filter */
09756af46893c1 Alexei Starovoitov      2014-09-26  2341  	err =3D find_prog=
_type(type, prog);
09756af46893c1 Alexei Starovoitov      2014-09-26  2342  	if (err < 0)
3ac1f01b43b6e2 Roman Gushchin          2020-12-01  2343  		goto free_prog_s=
ec;
09756af46893c1 Alexei Starovoitov      2014-09-26  2344  =

9285ec4c8b61d4 Jason A. Donenfeld      2019-06-21  2345  	prog->aux->load_t=
ime =3D ktime_get_boottime_ns();
8e7ae2518f5265 Martin KaFai Lau        2020-03-13  2346  	err =3D bpf_obj_n=
ame_cpy(prog->aux->name, attr->prog_name,
8e7ae2518f5265 Martin KaFai Lau        2020-03-13  2347  			       sizeof(a=
ttr->prog_name));
8e7ae2518f5265 Martin KaFai Lau        2020-03-13  2348  	if (err < 0)
3ac1f01b43b6e2 Roman Gushchin          2020-12-01  2349  		goto free_prog_s=
ec;
cb4d2b3f03d8ee Martin KaFai Lau        2017-09-27  2350  =

09756af46893c1 Alexei Starovoitov      2014-09-26  2351  	/* run eBPF verif=
ier */
838e96904ff3fc Yonghong Song           2018-11-19  2352  	err =3D bpf_check=
(&prog, attr, uattr);
09756af46893c1 Alexei Starovoitov      2014-09-26  2353  	if (err < 0)
09756af46893c1 Alexei Starovoitov      2014-09-26  2354  		goto free_used_m=
aps;
09756af46893c1 Alexei Starovoitov      2014-09-26  2355  =

d1c55ab5e41fcd Daniel Borkmann         2016-05-13  2356  	prog =3D bpf_prog=
_select_runtime(prog, &err);
04fd61ab36ec06 Alexei Starovoitov      2015-05-19  2357  	if (err < 0)
04fd61ab36ec06 Alexei Starovoitov      2015-05-19  2358  		goto free_used_m=
aps;
09756af46893c1 Alexei Starovoitov      2014-09-26  2359  =

dc4bb0e2356149 Martin KaFai Lau        2017-06-05  2360  	err =3D bpf_prog_=
alloc_id(prog);
dc4bb0e2356149 Martin KaFai Lau        2017-06-05  2361  	if (err)
dc4bb0e2356149 Martin KaFai Lau        2017-06-05  2362  		goto free_used_m=
aps;
dc4bb0e2356149 Martin KaFai Lau        2017-06-05  2363  =

c751798aa224fa Daniel Borkmann         2019-08-23  2364  	/* Upon success o=
f bpf_prog_alloc_id(), the BPF prog is
c751798aa224fa Daniel Borkmann         2019-08-23  2365  	 * effectively pu=
blicly exposed. However, retrieving via
c751798aa224fa Daniel Borkmann         2019-08-23  2366  	 * bpf_prog_get_f=
d_by_id() will take another reference,
c751798aa224fa Daniel Borkmann         2019-08-23  2367  	 * therefore it c=
annot be gone underneath us.
c751798aa224fa Daniel Borkmann         2019-08-23  2368  	 *
c751798aa224fa Daniel Borkmann         2019-08-23  2369  	 * Only for the t=
ime /after/ successful bpf_prog_new_fd()
c751798aa224fa Daniel Borkmann         2019-08-23  2370  	 * and before ret=
urning to userspace, we might just hold
c751798aa224fa Daniel Borkmann         2019-08-23  2371  	 * one reference =
and any parallel close on that fd could
c751798aa224fa Daniel Borkmann         2019-08-23  2372  	 * rip everything=
 out. Hence, below notifications must
c751798aa224fa Daniel Borkmann         2019-08-23  2373  	 * happen before =
bpf_prog_new_fd().
c751798aa224fa Daniel Borkmann         2019-08-23  2374  	 *
c751798aa224fa Daniel Borkmann         2019-08-23  2375  	 * Also, any fail=
ure handling from this point onwards must
c751798aa224fa Daniel Borkmann         2019-08-23  2376  	 * be using bpf_p=
rog_put() given the program is exposed.
b16d9aa4c2b90a Martin KaFai Lau        2017-06-05  2377  	 */
74451e66d516c5 Daniel Borkmann         2017-02-16  2378  	bpf_prog_kallsyms=
_add(prog);
6ee52e2a3fe4ea Song Liu                2019-01-17  2379  	perf_event_bpf_ev=
ent(prog, PERF_BPF_EVENT_PROG_LOAD, 0);
bae141f54be83b Daniel Borkmann         2019-12-06  2380  	bpf_audit_prog(pr=
og, BPF_AUDIT_LOAD);
c751798aa224fa Daniel Borkmann         2019-08-23  2381  =

c751798aa224fa Daniel Borkmann         2019-08-23  2382  	err =3D bpf_prog_=
new_fd(prog);
c751798aa224fa Daniel Borkmann         2019-08-23  2383  	if (err < 0)
c751798aa224fa Daniel Borkmann         2019-08-23  2384  		bpf_prog_put(pro=
g);
09756af46893c1 Alexei Starovoitov      2014-09-26  2385  	return err;
09756af46893c1 Alexei Starovoitov      2014-09-26  2386  =

09756af46893c1 Alexei Starovoitov      2014-09-26  2387  free_used_maps:
cd7455f1013ef9 Daniel Borkmann         2019-10-22  2388  	/* In case we hav=
e subprogs, we need to wait for a grace
cd7455f1013ef9 Daniel Borkmann         2019-10-22  2389  	 * period before =
we can tear down JIT memory since symbols
cd7455f1013ef9 Daniel Borkmann         2019-10-22  2390  	 * are already ex=
posed under kallsyms.
cd7455f1013ef9 Daniel Borkmann         2019-10-22  2391  	 */
cd7455f1013ef9 Daniel Borkmann         2019-10-22  2392  	__bpf_prog_put_no=
ref(prog, prog->aux->func_cnt);
cd7455f1013ef9 Daniel Borkmann         2019-10-22  2393  	return err;
afdb09c720b62b Chenbo Feng             2017-10-18  2394  free_prog_sec:
3ac1f01b43b6e2 Roman Gushchin          2020-12-01  2395  	free_uid(prog->au=
x->user);
afdb09c720b62b Chenbo Feng             2017-10-18  2396  	security_bpf_prog=
_free(prog->aux);
3ac1f01b43b6e2 Roman Gushchin          2020-12-01  2397  free_prog:
22dc4a0f5ed11b Andrii Nakryiko         2020-12-03  2398  	if (prog->aux->at=
tach_btf)
22dc4a0f5ed11b Andrii Nakryiko         2020-12-03  2399  		btf_put(prog->au=
x->attach_btf);
09756af46893c1 Alexei Starovoitov      2014-09-26  2400  	bpf_prog_free(pro=
g);
09756af46893c1 Alexei Starovoitov      2014-09-26  2401  	return err;
09756af46893c1 Alexei Starovoitov      2014-09-26  2402  }
09756af46893c1 Alexei Starovoitov      2014-09-26  2403  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3576018883786439397==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICG6wLmEAAy5jb25maWcAjFxLd+O2kt7nV+h0NrmLpOXn9cwcLyAQlBCRBBsgJdkbHrWt7uuJ
Hz2ynaT//VQBfABQUZ0sOiaq8C5UfVUo6Oeffp6w97eXp+3bw9328fH75Ovuebffvu3uJ18eHnf/
M0nUpFDVRCSy+g2Ys4fn978/PpxdXU4ufjs5/2366/7uYrLc7Z93jxP+8vzl4es7VH94ef7p55+4
KlI5bzhvVkIbqYqmEpvq+sPd4/b56+TP3f4V+CbYym/TyS9fH97+++NH+PfpYb9/2X98fPzzqfm2
f/nf3d3b5PzzyZf73dX29PPl1cn99v70bje9m16dbi/uL89PT++22+nl5+nnu3996HqdD91eT72h
SNPwjBXz6+99IX72vCfnU/ivozGDFeZFPbBDUcd7enYxPe3Ks+SwPyiD6lmWDNUzjy/sCwbHWdFk
slh6gxsKG1OxSvKAtoDRMJM3c1WpUUKj6qqsq4FeKZWZxtRlqXTVaJFpsq4soFtxQCpUU2qVykw0
adGwqvJrq8JUuuaV0mYolfpTs1bam9aslllSyVw0FZtBQwYG4o1voQWDpStSBf8Ai8GqIFE/T+ZW
Ph8nr7u392+DjM20WoqiAREzeel1XMiqEcWqYRpWXuayuj47hVb60eYlTqMSppo8vE6eX96w4X6r
FGdZt1cfPlDFDav9hbfTagzLKo9/wVaiWQpdiKyZ30pveD5lBpRTmpTd5oymbG7HaqgxwjlNuDUV
Cmm/NN54/ZWJ6XbUxxhw7Mfom9vjtRWxL8Fc4io4EaJOIlJWZ5WVCG9vuuKFMlXBcnH94Zfnl+cd
qJG+XbNm9BKYG7OSJSdppTJy0+SfalELYjRrVvFFY6n+FLhWxjS5yJW+wYPF+IKoXBuRyZlfj9Wg
nglOu8FMQ1eWAwYMkpt1RwlO5eT1/fPr99e33dNwlOaiEFpye2jhnM88BeCTzEKtfVHSCZSCUlmD
PjGiSMLTn6icySIsMzIPC3IjG6nyvKZ7xHb1ClQgHLtcJSKsnCrNRdKqDunrd1MybQQy+Wvmt5yI
WT1PTbiTu+f7ycuXaJUGm6H40qga+nSbmSivR7vkPouVuu9U5RXLZMIq0WTMVA2/4Rmx3lZRrobt
i8i2PbESRWWOEpsclClLfq9NRfDlyjR1iWOJNISTZV7WdhzaWH3c6XMrSdXDExhzSpjAXi1BKwuQ
Fq9PsCCLW9S+uSr8PYHCEgajEskJaXa1ZJIFZ8aWkmdwIecLFJp22OTuHoy81+RlGi2DgKLmd7uP
dtLwSc0YuYad6gfTViYHirS6KLVc9fpIpekoawkGW7GEnE84qG5MUEPkZQVrVQRr15WvVFYXFdM3
tC5zXMSOdPW5gurduoCgfKy2r39M3mBtJ1sY1+vb9u11sr27e3l/fnt4/hqJB0oW47YNd277nvFs
WtkfyPSqmARVFRegPYGVXmWUWkRQhpqIkcNuw0e/D4k0iE+caWzX+B9M0C6E5vXEUEeiuGmANnQI
H43YgOR7R8QEHLZOVITTsVXbE0yQDorqRFDllWb8OKGxgCyf+esQzq/XxUv3h6edl724KO4XL6BN
OJjXTwOyQggF52ch0+r6dDrImSwqwL8sFRHPyVlwRmtAnw5P8gUYA6v7Ork0d//Z3b8/7vaTL7vt
2/t+92qL28kQ1ECbr1lRNTPU9NBuXeSsbKps1qRZbRaeZp9rVZfGl2Gw5nxEarNlW4EkO5KbyTGG
UibmGF0nIwispadwiG+FPsayqOcCZnuMJRErycUxDjg2o2ezm4rQtNpr6ajdjpBzaWg01o8RzDzJ
gNAPYAIoELr+QvBlqUAI0Z6Ab0NP1AkdegTjuwqmITUwElCdHEwtvbOg4NkNoaZQYmChLZzQPsLC
b5ZDww5VeABXJ5HPAQWRqwEloYcBBb5jYekq+j4PvlvvoRumUmgTQi0AzqMqQZnLW4FYze610jkr
eAiBIzYDf1CuWdIoXS7AM14z7eFKtLyVB5GcVpDJyWXMAxqXi9KCSavlYtDDTbmEUWaswmEO1FhR
R43nYDUkIHTtT8rA8ckRNLXA4IhkEBwtPYXZRtjHIbNDeBOoTc+wOTVa5J6xgxPhtyiyFHZuRL6j
NaEElAHQTmsfpKZ1JTbRJ+gsb0FL5fMbOS9YlnriZOfnF1g06xeYBWhZD35LFaAI1dQ6gg4dZ7KS
MOJ20WO9PWNay1AztsQlct/kHtzuSpoAofeldmHwWFdyFWwhioqFGinltVrTgzGXYTQw2ILbPfK6
4TboMegPIz6ROwitiCQRVFdO6mEwTexJlPxket5Z0TbUV+72X172T9vnu91E/Ll7BvjDwJByBEAA
qAe0E7bYD8SqYkeEFWhWOSyUipR3a5n/YY9D26vcdehg6QHy72Qmq2eHFqHTQiovGdh76+J4VdiM
YMaWQjZFm0qsDzup56LDl+NsaJUzCS6hhlOvqLMWsqEDDjgwOBR1mgIUKhn0Z5eXgeUK4T9G8eiT
YXWiNXnGx3xh+K1j3lxdNmeeRYFv3zi5iCBq2kRwcNy9eKGLTDbWElTXH3aPX85Of8Xwsh9tW4K5
7KKV3vwqxpcOoB7QghiCPUQ5IjZdgPGTzhG+vjpGZ5vrk0uaoZONH7QTsAXN9ZEHw5rEt7sdwenk
oFV205mlJk34YRVQX3KmMY6QIHaIqqMGQS8LFdCGoIEUwDlpyjlIhLeKtkcjKofMnJ8GfoDnxwvA
Ox3J6hZoSmMcY1H7QeyAz8ojyebGI2dCFy7KA/bNyJkfEbEspjalgCUeIVuobheGZR10PWjBCgwG
PDDC5Sm7FAyqYDq74Rhl8q1KOXeuRQbKBUzFqdOH5f7lbvf6+rKfvH3/5rzBwL3ohDUviUOG5yYV
rKq1cBDU21iVJam0voUHCyuwlbKgrTM25jYZ4I2mMQbyiE0Fi4cbQtjxgBMOP4ZZS0OBC2Rg+dBK
6wGEhtek4DPKkdr9JrQBz5TJrNZBC06xNFLLESVuEbfKJagQAMAYq8JBUyZ7cQMCCNYeMOW8Fn4E
rGSaraQmSpx9CPRas1jhYctmoHyaleBOpXZ2GExP1LgLBZY1hq3gQGVVi3YGJbyiYrz9CKLwBzHG
zskdkMv51aXZkOuFJKK3/MIq7IENvqsRXwppeT7S/GXY/ECA8wqwOJfyB+TjdFpUO+o5TV2ODGn5
75HyK7qc69oo+ujlIk1B9lVBU9ey4AtZ8pGBtOQz2hfMQWePtDsXYEznm5Mj1CYb2Sl+o+VmdL1X
kvGzhr7YscSRtUNYOlILwMe4pmnN2IiisEe6wNlwBge+Df1c+CzZyTgtnU7T5uAcg8GcFznCRN99
QwoYdZnXuVWmKctldnN93oMZBuoIVXYTuJlYbZVvDpS5D7UwOokOrcgEp4Kp2B2oRKd1Pb+5LbYb
FqCsjgJa+LBwcTNXBdEKTJjV+pAAQKowuagY2UWdc7L8dsHUxr/XWZTC6Syvi8T3NwsLAgzCWoAB
MzGH2ic0ES+RDkgtcD4gQEEgUbgu5ahE5fzAzEARhhYzMWecir1YmSm4RIlx1Z3999ySp5fnh7eX
fRDh9vyf1p7WRei8HXJoVmbH6BzD2GEgwOOxRlmt44heC+BHxhucJbsEIM8+im+/Qnygygz/ESMY
olJwGmeMWEx5tQwPjxYYNALw5aKnndKQHM6Nu+obNElX6FaD1jY9D6wGZfB6usIUDdQvaRADshJh
9BCabtGVTKDIu3vCOyaALxTecJTzub+GpswAqpwFIZehFCNf5HQ6llM6ejmQf9jCCeXrWUSu0hSg
/vX0bz51/0UTCdeGl8ylo5hKcm/HLNxJARJCDTjAjADv9jZ2nGzVYwcJ8ZrXOwoyQ9nMOpSHl6e1
uA5GWlbRLtrYLbhhymDQRNc25BeyoOghnMq7bgdGVz0Qv0pT8NIO3vnqYeMGHMKwBHBOeXCU7MGu
zMZOefT6j2ItjlhNj69NVBlCQSmFyxe3zcl06vNByenFlL5gvW3OpqMkaGdK9nB9MgjXUmyEn9Gk
mVk0Se3n8JSLGyMBcqO8aRTQk1Y+/XA5BjdQmijp7upbiw/1TwPxbv30VWKC5eF5gp4WysaIilGJ
TG+aLKnoqG6nb4/4h6GLvyhR/DB84DxPFMT+iDhb8/LXbj8B3b39unvaPb/Z1hgv5eTlG6bchR6n
c5LpQC6lsELHGJv1jubBV2cl7KqbJlNqWZfRWc7hPFZtEgpWKf3IhS2BlatAE1hzZfWJMF4wZ8hv
QV7ri81J3861VXLthhN1osWqUSuhtUyEHzMImxecSgPxORg/qDRjFeghCi44cl1VoGyegkJ7l+tm
/M/obUj8+uwq6n0FE1LkBltyOuI3uNUEp3Fs2Bb4avGpAc8/WssBx/YghCa3aRokMSqXJQDEp5F2
2HyuQdKiyKVbqAUAD0ZdlfSBLcdnwzZ1Odcsicd0jNY5/2GvJZcY4aXNrFs+BRgbdMe4pM7iZV2I
AFe4ZmoDLhNogmqh6GPcSndSY+ITBoDXTKNByCiBHI4hK4V3mMPy9nIo7AIJRySprNJRSbJ/p8af
HOw23vHBrkrSdrWi7Qci0ZyVee9XdGkmk3S/+7/33fPd98nr3fbR4e5Bg7dSTKplunbfsLx/3HkJ
zNBSnHbUlTVztWoyliTkdgdc4GzWo01UIyc5YOriR+T2OlIXa/KD9v2MhpA8QoOY7cfmxeU9vb92
BZNf4DRMdm93v/3LX3k8InOFkGvkGhHJee4+j7AkUtOusiOzwotzYxH2GJa4FsKyruPAf4JyXsxO
p7DQn2qpl+SoMGA/qyn70Iby0eUMAqCGcn4MRwjiXWTY74Xu5buvr7KS8mAByGx8tkJUFxdTOgw0
F4o0aOAkFsGtlcWqNyadkedlZNOdQDw8b/ffJ+Lp/XHbwZAQXNnQwdDWAX+oi0Dr4e2IcsDZdpE+
7J/+2u53k2T/8Ke7XxyAbEJ5eKnUuVWHDlMF0QiZBJ/u5n2wQLYIk+5zxheIAQuwwQCXwaC6uK93
W7BueNpe3dOlHZD0I/tqnol+gP4etCSTU9C8JWLwwCZYOKjzFJEx3UgVRh0leW6+r5kP+brOaNFy
7KsyWH+XELr7ut9OvnS7dm93zU+3GmHoyAf7HUjIcuX5WBgDr+FE3LLQsUPrv9pcnJwGRWbBTppC
xmWnF5dxKXiEtemhd3fvud3f/efhbXeHAP7X+903GC9qygF/B45MdEuPvk5U1t3fiaLSnjZb9tdS
/Wr/Dk4RGJqZoLS/exliLybQg06r4A5ClVV8zeUyWjFqbQNadWGdI8xe4gi8IiCPV/T4tAGgaTPD
fHhvpHgpRTUuYZ7ozBBXikuywmhLY8Nvm0F3KaVSeNK6cLfOAP0RkRa/Cx7KiGUL0mGGjHnb4gLc
moiIah4RnpzXqibyrQ1skzXYLhM9Wkl72wreDbqOba7WIYMRXQBkhOjMWhPoNW/k7vWMu3Vv1gtZ
2RSBqC28JTVNclMw1LY2pdvVIPkK5e7xI+LZ6UzaZOUm3mN8PwQucvtMJt46AH9wPIvEXeK3Qtda
z4DPiE9ju4pPekYrLtbNDFbBJe1FtFxuQNAHsrHDiZgwLwcvXGtdwORhv6Qf0o6TZQghQjyON3M2
77CyF4W2BtUI0X+XGqPbJQpjIsNmD2rhONVPPmrZ8rxuwLMCL6p1gzCZhCRjAjDF0gqlO0QuPZfn
5YYv5vFgWu3SyiQGHCOOtp57XDVCS1Q9ctsvS964Vx7dcy1iMYzgiEeOkNpECA+axVUOGId4S0tx
11BjiUVel7itGchgHADtIjBZpeKXiiMMcOL9OxgsbzP9D3pdS+RtZcpemR/o7cOc+/j8KJTPOiGL
87i4U6YFBn7R1mBGRigAwz4iDdtAm6zjCYA66ULIgsOB9IJJQKoxDIWGClMY9cFxMCqtcGqgONS6
XQBCu9rKNoorb8kFDPKEYnu6AWVIqv2wVp8x1DoUof7imcK4I4wP4GHi9YFXFUbO28De2QGBRdat
B9+oo3FLqfn0k22WTijaewA/7YRmoXLYDoxVBSax6p7m6bWXfHSEFFd3u0tWp0jD5PClzNlpFx9u
7VA/L9TOfqYg6Sd5CZgA0ri+KQ8SpAbsFevw9nlMa2QpgR/LYw5PepstCYfG5vHFbPZmB8zhZZ+l
Oedq9evn7evufvKHS5/8tn/58vAYXE0iU7v+xNpbavfON3x2dkgZ8gOPdBysDT7PLrN6Lgsyv/AH
OLtrSoMEYEKxr8Vsqq3BhNLhZqjVD7HCcI8GG3xNdUCqC7LY1eiJ/nVAh3XGrguwutG8fzk8kgfe
cUrKfrREPNoakU/8oiumj77fjRlH3uHGbCOva1s2lM41PsMwYDWGRxWNzK0cB4tpwTvIdLW4/vDx
9fPD88enl3sQls877+0tHPIcFhvUegLK5yanjmin+ys4bQf3ELM2Oar/BJTLDUZNP4V5Wt3TipkJ
AkNecSap5N/hSUYl5lpWN4dN9qSmOpkekm9VkLZrXwW1l08W0uh4POvZyDNC2yBqivgpqz97zJcr
GS16yOAe/Xe6LgrRumuo7f7tAc/hpPr+befnejNwbBw2T1b4sMM3g+D3FgPHdRBjDkgNr3NWUIGz
mFEIozbHWpKcXoiYjyUjtz4hm72UqQQfnVWjpeHSt2RyQ88ZMyN7AhmfA3seVO0IFdOSIuSM013l
JlHmaGdZklMtYnGUAGnmZN+AAnQ0065CPbLpS6ZzRo/Kv6I+Om58gH95RXXrHSCv6y7OHcmvf/Ly
TxgLDk8jlGGQyT4qcQ/n1fBc0BN/4JPKZaQmAAHDqJ9HXN7MfB+jK56ln/xRhp0MganiZAjs1UV7
Wk0JoB6N0gGoHS50XVhV5+uIAzGz/SWCxDZj36aPs+g1xeB+FqSw16wZK0tU/yxJrMmwJoACd907
lmYmUvwfervhu36P196wN2sNjQ93QOLv3d372/bz487+Ws3EZja9eVsyk0WaV4jqh0bhI4zBtUyG
a+mDu7YYHxUOK441W1e836mxUdgh5runl/33ST7cqhzECo+mvHS5NKASaxYkDg+JNI5GBcFdZe84
9nXi35JxsRX8DYK5bz/bQUmjsji+invj8hM6roWqENL53SEyLSuLtG2W3vmwkOCcRA6LzUPSAuU1
8DpBF2oW+zYYgWsiODwDGO/LmsugVuhjBbrHUPkP3ZNv66u5X0pI9PX59L8u6QM1nrUeUujHNZQ7
7MGeQzrMdc1uKDNFcufuaduwFsEbjGXud8czAdYa4xbUFab/QgU+YpPQF/k3IFgYXYpgEb4eMdf/
7opuS6Uy/wLidlbTN923Zyk4ucTobo17OTac0K7ESrjntHSBdnzb0QWn/UWwMVu7dBj5XY68F+xf
09goj9O9QaSg50BYZ4PFzpvuRteW+j3Dpth82vi3CYaLFszPjX6iyEt+Yom982+qRWmfzNJYphtX
WQkXQPHDbEuU+Sj0ZgTXolUfva4bV2eDnPW/BFHs3v562f8Bvt+h0oPDvwzDDK6kSSSjVh5MnYer
8AsUtv/mM3WFSgW3mrYsbnI4Zxm94JtU59YckVSYIbjN9G9lbJKyMfiDK2Q0QRbhlGXp3gtzNrK5
wNBB6Uarmn7ZAkxl4f/olf1ukgUvo86w2CY7jnWGDJppmo7zluWIP+mIc42hz7zeEMN0HE1VFy7g
MBiyG8D84LfJkdf3ruKqonNQkJqq+hht6JbuALelYYtxGrix40RZoi0b2e1hun4hCmRUVPGyKw6b
r5NyXIAth2brH3AgFfbFVFrRYou9w5/zXtooM9Px8HrmI4fObnb06w93758f7j6ErefJBR3R+H/O
nmXJcRzHX8mY0+5hYi35JR/mQFOyzUq9UpRtOS+K6qrc6YyoqezIzN7pz1+C1IOkAKtiDlWRBsCH
+AABEADVzG7cZXrZdGsdDGi4H6wmMnkCwAG5jf10ONbXb+5N7ebu3G6QyXX7kIkSj+rRWG/N2igp
6slXK1i7qbCx1+g8VqJoC3Ew9a1MJqXNSrvTVeA0Zdpl3CN2gibUo0/jZXLctOl1rj1NdlJqKU1S
lekvVCQKls00qOZqcjU+imOlWoBUMUhjBUddxginn56mPN20EV0d01lJJSJSxOZmCDevlHeQikfF
nOingDQwBNeuiOwvNZWaTqkEKDwNiRb2lYiP+HrQzEXi6WUuKcvbaBEGeCqCOOGqNN6TlONBZKxm
KT5LTbjGq2IlHotfngqq+U1aXEvCd1YkSQLftMaDDWE86IQ9MccsiHEOF9BKwVK6sy0M79VEMW1K
QysryiS/yKuoOc7dLogY4uwXyChKHhtZSZyV8IW5xJs8SVpgMj2NE/xjgCJdKqVFAtunqJ6qmm4g
5xIXELrkP0BTVoLwshxpeMqkFBgT1mdtA8ok+GfbNyL7p9STeR8+Xz4+PYdU3YPHWmki9F6qCnVU
FrmoCzx8a1K9h7BlbWtiWFaxmPp2YqkTVmYlaFdNRfGWA+QiwVeUx8A68FVUSWo8jsYeHY6wxxyH
RjOQPeLny8v3j4fPt4ffXtQAgOnlO5hdHtRpowkso1wHAfUK9B/IpdAYnc2OIDk8CtStFiZlZ8nW
5vdoD3Rmb3cvxRRngkhelZSn1rtcGKs9EPlFpTqFUpopiwOOw07Rng9BQgZQay2luSpU90xiHHsv
gzknk5YIC6aOwvCvDpLUJ8gy3HOafnvEL//3+s124xxWKNyfC2nZGrpfozUYbssv6R52cYar55oE
fHnxssZTUAmXhEOjptK3VkjdXfoNO0+g96NLcurG/XKh7Vm42zBgmSwzpxoNGeJcvbo0Tt9DSNUf
fGk4ZGCv+iXiMR0XSdiWhOig3aolJusCRjtU+6NyZ6foCIv6jJ2VgAJjInCMMcOYU1IU+OEBOLVy
aBzDub5usvOvckcDPDfUbppE6/k0xFRqHPhM0eMNFL80MYYwqUL4Dz+bjW0WyCdsFWDf3n5+vr/9
gASI34fN2W3Zj9d//ryCNy4Q8jf1h/zzjz/e3j9tj957ZMYS/vabqvf1B6BfyGruUJkj4Ov3F4hd
1uix05DCdVLXPO1wJYSPwDA6yc/vf7y9/vz0oxySPNYuhOhZ7RQcqvr49+vnt9/x8Xa3wLUTmuoE
T4x1vzbrgGlSImyh5JzZeQRLnnHBRiZufmv/iJYL25irihmjevddf//29f37w2/vr9//6Sa+uUHC
AXzhxpttuMOl7Chc7HAVoGKl8CSZ0UH79Vt3sjwU04DIs3H1OSVpiZrRlNRZZ+XBS1NmYEomO+eY
p5OSKvKYpdO8urqtIQhB54Wf9Hnwcv/xplbq+3gaHq56zO1bwgGkbdQxpEC1jsqmrtgYUfA3y/Yy
ltPOpOTXj3S9r4dt9vV7Okhv4MMETgzOvVgvDGpvEBtLKILgshBX4kKwro4guVSE1cIQgIW8q0bp
U+CNiBmxgIjpq8eO1KQ4H2Ml+oRakOzqXBdEBnRAX84p5Jjai1TUwnYuqpKj45ptfrci5BOYtD3/
BpgdD9kBr8GELstEMW2keppWyPl+UqGEwL5LZske+rIC/C716jq4jieAPCTqEDKO8ShDIvbgEDX2
XQt/zqbMTsLnTU7MUV/E4maFkl+5px/1s5PboQvwq1WLHm46/uUAM0gmjCGkqA445rxvRsTY/RrX
9As0ItKLiTY+y27iOgqgiJ0Yyg5qeoRx9qGYYguHAqvPSIauFmNhDe/HOXdHxZoo2u5w+2dPE4TR
6k7/8kJ/2ti93GEh+h5D724llEvF+ORUeHl/+3z79vbDvlvKSzdgvXO18h2pgDXl5zSFH7gK3BEd
iDB6BiHld0uCdCZlrBaKKJdhgydjeq4YLlf3taRFQZjmOoK42uNdHD5zBi8bPOtVj6d6yOOqyMCq
weMLEaSs9G5QDUEjxA1VWpeenYO5L6ykO7rGGnPJEkvK7HVYBe3jsKYjBUVQtRpKGSM6Iz5Fk5yu
GeqtpJEHtq+chCkG6mQW0CDPZO2gWHW075QtIGgxsj5VZxwL68jJX2PhCEODTTIxo/e2J3uUjaz/
+vHNYve9sJTksqhkmwq5TC+L0HYPjNfhummVNF2jQH142hHyFkqdZLhYcM6yGxyIuIy5zyBIiTAO
K7mGSFdWi0M2SZHc18nlbhnK1cLy0VJnZlpISAoGr5cInjjB8Cd1YqfYGzesjOUuWoQsdeiFTMPd
YrHEGteo0A4s7sa7Vpj1ejH2qUfsT8F2i8B147uF7VOf8c1yHVpBsjLYRKGr057UwKFqe8rqWn15
m/ByOUkMLhVvcSSNa9vEwDWAd5Lqeq95UW83NZDYVh3Z8cHJLxO6p6v5rVaK6gOr2jBYLwbfskSJ
fpmlVvbzqeGKrYUre2JGMH4R0eHJ9GIdPmPNJtqureVj4LslbzYItGlWU7CI6zbancpENhNckgSL
xcpxX3M/1OLt+22wmCz1Lr73r68fD+Lnx+f7n//SuZg/flfqwfeHz/evPz+gnocfrz9fHr4rPvD6
B/xpC3012HdQTvIf1Isxl07UtjSRWgnqoKyVxD2jToiQEWkuBmxLHA0jQd3gFBejB14yjjeR8BNu
nQf3Q9V/DtGDRFlNUkGip3mKs8TtzCe2ZzlrGWbDg2cbXPX2UrJc4EYJh/ObdzfgYsZAprtJO+Nn
hRNKUTER62flqJyv/kVP/4QH0pAjh+Bjg/o6mANPywjDDqq52lomoMCBQRyMEqMtZgBQULdxE4bQ
H22aQAkOZ4n53cPd40Ow3K0e/kvp4y9X9e+/HbNXX1xUCVyr4HV3SCV5yxs6jHebscaNcbXsC0jX
pRVpzL6UJ7XJCuxdIExkryKPqSt1fYqjGPiM45lVuFyYPOmsAHd8uOqEEGrVp12opKuiJFGXhsKA
1YAwwO8VWzjHuHR/JC7kVf+kbxMcv4ub3A248HLGO6jg7UXPjH6Bjih98UR4V4AH3zZbtkwzwq1f
6cHe1Xs/ZRBsnDuirerSRR31ivsteeGICUm6RGvvbJZLvt7id/QjQYRbHy9KJEhwTa2+lacCl+7H
nrKYlSZKxBJXNUinsDsIVHa0Kzgm7v5I6mAZUD51faGU8UqoRpyU4TIVvEDzdztF68QPyUkmDN49
S2s59xEZe7Y9th2Uw+/VzygIAlJBLGG5LHFe2k1mnnFq70Gmm+a4n+ut4hZ5LZxLQ/ZExJ3Y5SqO
fyIs5cKxJbM6pbxaUjx3DyDwnQgYanpm1sm+Kljs7aX9Ct8qe54B6yLCzfIG/x5OLZ1aHIsc37VQ
Gb7lTIpAENOpghgrcT+YMzeF7B4NL7PKQAHvYSLFdDHVxil0EecMXQ78lKTSNbV1oLbG535A4+M1
oPGJG9EXzBJp90xU1VninVaCipsy1JtYpIgO3XB2EW9aeOkKP9vxc8CqMHb5qPGoTQVqG7FKdS4H
Y0NpiFuX5DmP/avVaX1Jdk4TJ9Jwn4SzfU+eIa07OrSH8xdRSycbXMfJDtnlSxDN7GGTeQmt+XRm
Vzu9n4USUbhuGhzV5RwfpzpAk7cCeOHTLQil6IirGgp+Ibx6G6qIz8BHzIpsfWap6hTQkBXC/pwv
2cxKyFh1SdwHHLJLRrlWyUfCb1I+3sKZhlQrLHfDW7O0WbWE95jCremXuxRWXu+iD9f54XKXyKOM
ojXOvAxKVYtr24/yOYpWE3WVmKNuE1lciIfRlw2ed1ghm3ClsDhaDel2tZzZXWZlJBm+i7Jb5eT4
g9/BgpjnQ8LSfKa5nNVdYyObMyBcwpfRMgqxzWnXmdRwtePIdDIkVumlOc6sevVnVeRFhrOc3O27
UOIWxJ/lSozV7yv4EsS0hmi5WyC8kDWU7JEn4SNp7ehKl4SWYff8ImJX5jOvSON6jlWweBRuf08t
xaEgfesMK+oin5L8KHI36duJ6RyEaMW3BO7XD2JGQi2TXEICF3TqntLiKJwT9illy4a4p3pKSdFO
1dkkeUuhn9CIErsjZ7BxZY5U+sTBXkkFEFTZ7PRWsfNp1Waxmtk3VQLqjSM6MEIJj4LljnDXB1Rd
4JutioLNbq4TahUwXCarwKm7QlGSZUqacfzhJJybvl6FlEzsLGs2okiVvqr+OZKwJK6KFBxSZPI5
nUkKxYadCvkuXCyDuVLOzlA/dwSTV6hgNzPRMpMc4Tgy47uAE65HSSl4QLWp6tsFAaHCAHI1x7Nl
wRXHThrc/CFrfSw5Q1BnkPRhfnrP7iPrrCxvWUKkAIEllBB3veAYnxOnkjjPdOKWF6XS5dybHt42
6dHb4dOydXI61w7DNZCZUm4JSGuuZCAI45FEoFDt2RCmdV7c00L9bKsT9SAbYC+QekrU2I2PVe1V
PHuRoQbSXtfUghsIlqigblVubsLsyru7MWCtqSAivToa1giaBXc0aarmY3YSG1F5VoduzwEiLHFb
/yGO8fWmZELi1lc7qO/9xyfGRk83ytfeiLggvO52a+LNbBD1kbeuOy9I2V8/2C6dg7fmBGv1KiXC
asuSeEYa14HPct/FkWiTvD3agFJ6OD6TgHxUiiNhgQN0mRyZ9D21LHxVp1FAPBQy4nHOCngQzSNC
8AC8+kdJg4AW5QlnhFdz2Fi/RjttZs56DFefXCHgdMdhXWHXE3EUrTSzQ4FtlGWVQ7C9JQZBea+F
+ahKHbYO8y/gEhRfapWQ2Rpz1rIrHRVgDJkocZocU1ubQ9AV66w2GG6QyzCkFDjCzu9lw2uC/vkW
22KXjdLm4SR3TVsdA6vYjcgzdWXTWzy4T/vx8vHxoJD2rd316huwO8bhFLBOlwy0I9w62JmXWjqg
XrEwKbAsKMA9rGie0Z4iYyJs7ZJNvlH8/OPPT/LOV+Tl2ZoZ/bNNk9hKwW5ghwOkUtHRYR7G5LF5
dLxsDSZjkIrq0codf/54ef8BTxm8wkPR//vV80DtihWQY86NO3QIvhQ38CD0+pFcDNCrLbl4rMIa
FSoCypR8TG77wvjkj+aSDqYYVrleR7ijnkeEqRgjSf24x1t4qoMFwcMdmu0sTRgQFpqBJu4iUKtN
hLvMDJTp4yPh/DeQHEvCuOFQ6LBNIjh3IKw526wC3KvVJopWwcxUmLU4821ZtAzxXezQLGdoMtZs
l2v8QnMkIvjUSFBWQUjY9HqaPLnWxM3uQAPByWBtnGmuU1lnJq57CblLtT1TY11c2ZXhDgMj1Tmf
XVHiSW6IK6lxFWRhWxdnfqLSwYyU13S1WM7siKae7RVYJlvi7n+cxfpRv7KDG8ZHfneP2UFaDeu8
7SEty1laHDHEMh654wiNBULLi33FEOrjIXRsLyOiQsVdB68WL1blGR4NzGy30gGnBSTGMZQUcXIV
eeweggO6zmJM3Rlr1nZErMkuf6zcI33tkOEyRJBXVlWiwLuTsaO+LrjXJZ2Gr6j22McCag8Jc6fN
SkjFZgf2jmNwFbH6gdT3fEry0xmb4Hi/Qz/gyLKEo3ajsblztS+OFTs06Aphcr0IcM410MAZTkUh
DURNSeSSGShKCTS+2/GEqrFdAwbw01UIjo7BQQq2Ie6/9K7UeVswk2eHBkYklQqbWPqOBVR7UW4j
213URW6j7ZYqqHC7e7jOPZvGO3FODh50ojZrHOuHQ3BWx7ZouMACfmzC/TkMFsGSqkejiXhDmw4U
FEjSJngerRfrmUb5LeJ1xoLVAv98gz8GwcLxD3Qo6lqW9N3clHZFuZ/bpDHbLWx/bQd3y1lZFfiE
nFhWypPQjo9oJ5KEyMTlEB1Zyho6PsmhbfhyYT+IZSP7m3KiM8eiiAV2weZ8kmLmSYmPxemmgOr/
1aZpcAqRCrVyGrx7EPvn3hfYWLmRt+0GM2w733DOn+nRfqwPYRBu58bQM6m7OCzAwKa4MrhquUYL
O3BhSkBuciV8BkG0CKgeKLlzTRnkHLpMBgHu0eKQJekBUvKL8hdo5THcLHFB3aHTP2bGSeRJ43n6
2lU8bgPsVt+mUXKxDiXGV1MSK6W3XjcLgknrvyuIILyDvwqC/xsuSvX+GtfRtmlgkudWi1JHAmKz
aCtjkZWFVPuCWCw8WG6jJd5HKG94B7WWtC2S5YorzHQTCJfZvWoEkc5i0iEte/wSqd7Lv9CxOONt
LXlAcD3du0pD7hDEvlVs0huIVmZpO1PRsaiL8t5AfYG8TIRPnz9Ws8xGU4XiXnvPN/A3IBSY6exA
ZNpq7YU2ENRmB99pO2Hy9iu8QP8t6jAgVrKaXX38EcesQoeLReOHGEwoVveQ63tIQpirMoWnmIAU
acLQgAiHSLqx7A6yDhz9xcVlh1oSuHNFyVAKdVAKyrITIvGON9EGtV0741LKzXqxJY7y56TehOES
78Ozp9A5I1qcsk68JNaCeJKO551Ts8hFLZqpERGCdpAPqjKx8laNBjmHs4bAcFm1GliGbRKNOiys
3veQbgm7FYdxF23l0wfBBBL6kKXj6dPB8HO8Q+I3cQaJznmHWvcW4NPX9+86e4X4n+IBbNFOTKqz
RZEYfY9C/2xFtFiFPlD9779cbhC8jkK+DbCLWkNQssozyXZwLkqJyRQGnYq9QvvdqNjVDukEUOe0
D8QeRoEyLzlRV6Ti7b22jT3Vbv3srRVQ6t1wyx7S5nK9jhB4urI7MoCT7BwsHokHbnuiQxb5b+B2
NyjY/A/RTthVhbkf+P3r+9dvn5BSxw9krvUzL+NVDCaKQObpXdSW9c26UjLhnyTQvEP1j3A9pJxP
dc5XSETSPThkQupe3l+//rBuma2ZUce9znHOnWc4DCIK1wt/pjtwGydlBY7a+n2Y2n/HCCng5Jy2
EcFmvV6w9sIUKK8l1eABzG/YG/Q2Ee/eskUbchKw2YikYRWO4dLdAD08r9ozgyeKVhi2gnfwsmQg
Qb8naeokj1FHN2ecr2rX4p2Lr9RYVXUYoU7hNlFa2tlPbEwmhqWTv/38O8BUJXoN6ZjaaVimKaz0
umWwcEwXDuZOj2CoQDdGvqhH9ZM7X8k4PYFH4b7kYQGtleO3/wV9/qFDphAG9ISUMoj5PkvO86ZE
hkxJ+xsht82dQVOLbJ9UMUMW/J5nm6VtoujgHWf/UjMIhZzw8SnF/Bd0BbrqSBysAfOsl79nbKI9
O8eV4ir/CIK1Ekqp3lE988nB0xZo7/S+4tNBUmeZWkKmt8Gk0qqkjjmFPEg19yU6GCPqzmrTRCI/
pElzv+OyrGK9bPpwZpfJ+1uT11WqD+FJt3LVF52WrPJeqGuYcRdJibtSTSEzeDOJiGe45Vzf2h4J
t+z2FKeY0Drc4cHJaQeJtkciBUdePBeUBzyk7KlRn7rTpc/rNRkV/Yrb2dV81IlbVmpIsFNII9wc
WGl5d4mWJe5A0MXHcv9ZdlFmQkmZeZza9ysaCk/Qxwl3HkPSiDJldQvZMXw4BOSbG1K7xxYOHsxE
k6aaBrVLm7kRA2XL648UPkCKgwe6MkjwXBw9sM5CWhxc6v2dBk/X7sXR8RMHkM7AroRMeJVkWsB3
hhoRzHmWdgDv2WoZYIhj4gz9iDAOoAhY5wNGutSAY5q+7BzdxcoSonLxdS+L/FZiKTp1Nq5vtEw6
7E3urHHI1AhpxFcL1E90RK/cY55X4Qq//RZln7MZFbbJnvZNZldmv0It+V/qXDCczEo8GW2Xm788
aK5EYReiVlH/QE1Pc/FSVY2Uri5yKl2PW/it337C2ArLj/yUwC0krD9LkefqX4muxbp0bY9AKYhU
/QZH3Cj2WKXgt7yy0/jYGONbiKLU4SNyCPBGsfn5UtQ+MpfOHSWAdANE96wWnDK8Qk1yHFQmyDlc
Fc1t2itZL5fPZbiiMd5NhI81ho8em6TcfRevEWl6g4y5OtW7PUk9Bum0RsG1vZU5Z6ohDhaIbg1U
Z0iqXVrpuBwMvMUzJPo0PmIhRxzmvGw2vBR66gqlsR3xEHVAa2cQNTWWhKDXkH4W2oPBa/WeJ5sC
4w/5AMbkEdWKqVsTS4/FXtRTYMmBCQ4fOejkkOVx/OKO2T3IDOC/v318zmTKNdWLYL3EncgG/AZ3
oBrwzR18Fm/XxDMvBg35C+7h26wkcsHA/pzYLWykJN53MMiMeDdKIUshGsw6Zua7bq/OotKsQBs5
6Y6acDnFgvHXloBECvn/jF1Jc9y4kv4rPr4XMT1NgvuhDyySVaJFsCiCtUgXhtrWvKcYyXa01TPd
/36QABcsCdYcJFv5JbEvCSCXKMrcXcHx2KEGNcFZ7Nh2OHx2OKScML6eWBsnTBbXuGEFtXdaMQP/
/vnx8v7pd3BAKj/99I93Phbf/v708v77y9evL18//Tpx/cIP1F/+/frjn2bqBSwxpl6igpcVqw+t
cAuln2INkDXafmmgIBCCf3CzL1UWh50ksFUH4rmHUEWrM3Y0Akw/esyUUcaCqtvPwkerznBf0a5R
tMTEGibUBHUaXyrWemkIq6kWfxdok33L+xwSlK/H3/i5iUO/ylXk+evzjw/36lHWR1D0PqHvnoKh
aYm5MhYdiX33MJ/cmzoS7I+747A/PT2NR12M5tiQg4Lf2aj3ULeP47z7aIOer8JinbfG8fHj37zO
aysog1nbWWaVwjlSmSYECtHMcHyxXp26lnGtx4bTzuhDezwL0uShDkPAx9+prQezF6RrWKfqzMoC
G9ANFpcXYnVHXkoWqCFhIYAPp0zRaxTh9IKSGT+jYnRaw7bOgbtCEV80xSnw2WxGZOakKSX17gGo
la2YDxImff4Js6FYt1VLF134hhYXM1pB5sua6fVJyw0MxeBfacSM3XJwkAsGu9wwUQXyaYBTYIOd
6AGfvbG86+0wL3AG/WLG15youH3OBApf2no6xqwHWnvtRrjIwQV14NCPJ0BpaOKNTdPpXTbdJjI1
tjDQj3Ku68zdNSfa1d9CE1fgRiHBRBiU2BwlZIWf8k3YsyrHl6Ia9ZkuBtNVNxMH2sBluqbe7+FS
Dj/LcqYrWHW7UbF2O/J8emwfaDceHqw5AMf5d2VE//n28frj7eUvPpbtq2wo/em6PJ1w/tll9DQV
jIHPfwxRWHTY8djtcjgBugKxiiZpqphc0Xc+SHla+fRmlytcjXoeWRmkGyQR97g/NsZQfWxzqoZk
FB7ktXzgpqlmdRAnWOHuVAsq/od2dJBPqEwNkLHEBhHkt1fw1KnE8uEJwIFCLUHXIZ67h45//P3L
f5vyfyUiOn2aTDXBdMcZhO/jO0/v5RPf6/g2/1VEded7v0j1539qETWGbvSjNB3FYdAesvPthVWm
5UqibuHKdW0nTpDjSmHg/1NeNadYASuwlEZuOVOS+GWixGCoY5eTEwpanjHRywB0yuWTgHmpflC2
UO2gbKI2wq5+5F3t3Hb549DndWMjxV3V94/nurrYqTWPfDkFF772Z5Y7oqU1mhICzN9jc2UpTX+8
DvpdxFKcvG2P7Y3vi6rMIeTOvV0uvg2dq37Q/arMYNXc38F7lZG6zcf3moHtTj12GTszHSpatzWk
hWVVF9WNSnzOWSdbCml4Tt3XVVPaFWyqSy2KZkPs1PY1qxw9NtSHJTsx7fqXby8/n39++vH67cvH
H2+YRbSLxRqQcEGSI4OLhUnjRw4g81yAMl9gu9aeYycCP8awAdy8j03Ne+u3yCcqx6iHF5g/qvsH
01mRnOhO6zSRmAiUjj2aAFjIuAUmaTz7BnVabRT1C6AKszBv2f2m8N3vzz9+8COsKJZ1JpAVpGWn
iduCWl5c4TQFDM/urnosi6F1rpPl3KUxS65WjudrGmE6+HMhx/3k71KPT45VUO45fEn/ZUJBG2Sj
CXwvhLPhGKaVUVhAIAjR6MdGJ0wI/8aqyT7x8Sd82TyiEaj1VT2kmOq3HDfFXeCririCeqlbcKdr
UpkfF2GqNtVmUyxXIYL68tcPvgsbZ2fZBbZJqj38PKOVBJWYBeen/iwKNL1flW468rdYVEf2E3Wf
RsiYGrq6IKnvoQIAUmc5c/al3RZaS/T107HNrdx2JS+aTy/Yy6Cczj0X7YTWgi4cyhknzDjcUw5O
Ka6EzesWQWy6IAsDi5gmSMvLhdedeZc3/Ojpyl5qW6ax3f4P9JrGzs+kpaQ5fqXOuVlCIEeYRDuj
WRaqb+pILy6B2W6N9I1bXtnRg8t9hWxMvm0f8XPSNFo3wXpecTaZKslFcH1KwdWXRUBMR0VKRDms
eeDQtDn4hTpQZq1Fcvr7JrUIgjT1rHHR1ezInBvItQcrq0DTkLCLJS3+2e5Wb+IXZ0vKSAoiifPr
Hx9/8gPG1s55OPTVIR+OvVltfu44deoKjKY2fyMCfolM/V/+93W6YVsPrEt1Lv4cNhnMzY/YDrOy
lIyEmTK3dCQlOOJftOvlFXLKNSsLO+DO+pFKqZVlb8//o75u8wSngzI/UaheUmY6k+/AJhmq5UVG
6RUI27k0Dj/Q2kT5NHZkRwJXdilqTqh9rGtH6xC+9ug8+COWznOrztoZTwWS1HMBPg6klYg1giJ+
os5lvd8XwV2EsO0rpr/VK+QxHwoSo5qIKhcd4kDvGBXt4UIBva5fYuh2zaP9taRvhbJV2VyBoboy
l4zqiig3vBGunE5o3GyJo9+BaizQsbd3iH8oP1q6Be5qDvCYy2U5L1Z6cpfDvezjWFyIp56zZjr0
fOzh9NRF14wENQQTZGYGtlPeiOYCA9HKZPdAkqt6W2oA+pWICd6VD2prmnA5jCfeXbwVTb83dpXc
ktvMAmaTieGT0sW01TiChfhXu0u5CMy7NAhspGYdJGs3Kk8szaZ91oBATEQtUWcG/U1wTRFcwSID
rhmCOPIxehH6MdFugJTi+WGUbJUCpI4kzpBK824M/ehqV1oA6saoAiRKsJIAlDi0DhSeiGe4UVjg
SHXvtyqUpfjoUHliVKV4mSR0F4SJ3RZSPM+QaXrIT4cKOoFkIbIazLqcNtIPkRcEdiP2QxZGEdId
ZZZlETIGL3VTaNp0VDVmEH9yCU7TbpXE6UHQeP2Qiu/PH1zAwh6Bl6hnu3o4HU495snS4tH2kgUt
k8Bhv6ywhD6mlqExKLYxK536HvFdQKRrnKsQdtTSOTK8MhxCvbKqHH6SqOrWC5CREAssVw7J1XcA
ge/hlRh4izjcrmo822XlHDHBcw4TD28BgPAZvvDcDbfKxgL00WXFiyQmPlqAaz3u83Z+9dnM5j6F
MBnbLL53k2efUz+6c8oPa4TArqkYLZDhKJxvorVhXeUwj5kYhmvnY0Og4L/yuh8LQ8PHydgxXEVp
5itZjLrjXXEfusQaLGXVNHxFpXa15XbPh0yBVaCO7sccNb1c2j3x+fFgb2cp7g3J/oAlu0+iIIkc
YdImnsncHkq2lT0r7mhp535oIj9lFMucQ8RzmNJMHFw6zO2m4mRkHt7Vd7EfIEtDvaN5hZaAI50j
UNPa8JHLY/M6ZKqbs8JxDTvDn4uQYAXks6j3yeZIa+q24tKRXW25/0Z280kgcQK6bbYJGjbUGpxt
t5TkwU1lFg4uXyHzBgDiRw6AELS8IXFUPyQxusBIaGsXEI5KfGQTBYAgbQr02IvR3VVgPuZpUeOI
kc0cgCzB6iBu0hKy1cqSJUCbAOKHxuRGE8RxkNldIYAQ6QoBmIajCpRtTQ1Z2Azd2WnRBd5mYYci
jkK7RFx2JUEaIwONVu2e+DtaTEIjlmuf8IULi6C77vuFaq2/DC8ao1IfaPhsTQqaBFhiCTa4aYJN
bJqkeMaO04HCsFVPDqNlSNEyZMjazKnY3KVZgPJGJEB6UwAhuvFLCLs1W5ZYYSmCBD0GICToHGuH
Qt4j1mw44vEhF9Zi4BMYv1VTeZJkq5CcI0k9dItou4K6bEInjqfrMN73+X3V4psMPHNl2CzqqGHw
tnxCcSMHVbAncew6UpDNyu6qZuz2FfbxrsvHnrmC86yySDcGuD9NZecfi/2+26pE2bGMePkOlRxa
1p36se7YZhJ1H0QEkwM5EHsEHbIcSr1464RX9x2LtBjhC8KaOOXiGjZ5SOTFsUNMSFJ08khohCip
TW6MdJs3SLENGnaqSL7h4Bvgdl3lDuj8nHhJsLV2ShZMopD7SoqXOAhD7PQJV1txmiJAR1IHPUuQ
LLqahgFBPuhonMTh0CPIteLCAroNPkQh++x7ab616bOhK8siRmrFN8PQ40IUikRBnCB7/akoM880
7F8hgtoKzhzXsqt8LL+nJpbeAsyy7wZW2ys040dnZP/hZOyag5ODv1ByiJML9Ei9ZaCyrBy04vLV
llRT8VOVfIy0AeI7gBiu0dEyUVaECcXfd0wmR3AanW0XbAplbBhYEmGNTCkX9fC7kMInaZn62OvR
ysSSlKCXVxxI8DsO3jCpw+f0ulznxMNdd6osm9soZwgINrCGIgmRuXNHiwgRKwba+fhOLpAtcUsw
II3D6aGHFYzT8T2GI5G/lRWEnim6E5xrse85HKcxFgN14Rh84qN5n4eUbN4KXtIgSYKD3aQApH5p
VxSAzAkQFxBgxRPIlnjCGRq+bwwMLSCH4vaAZhiT5A65n5FIdbfHBrd8pdsqjXius/MTGrAj9b1x
Pcv8jVq0mdMJjEPnBz57sg33no/6oRLycK49uUwkCAkBhuXujyCs9VCDF2PlPW7GKlr1h6oFB0eT
JwC4RcsfR8p+80xm46Z/Jl/6Wjg/Hoeei2w2XlbS7OxwPPOyVN14qVmFVUVl3MNFIbvLXX53kU/A
w5X0lr3RGHradmHNQiIwGMmMpqWMyoAXxGKFuLW5GcR6ikXx8fIGavN/vD+/oZZxYgCKLiua3HE9
JpnYsRjLgc25WnmJActZg9C73sgSWLB0FjWBzbSs0hd3eGIa11CATfSxqc1ABIuHMKyplBf3ye8F
NsvBV+mRsXpnuIZBXVXuCpqj7ABYrSqMXv7rz29fwObBjjs1fUr35WxduiQnaFwKCrBlEkB4sfC1
zRqiCUhdT/QyU3yUDyRNPMOWFRBe/Cjz1Cd5QZ31ItVVXCR07Yhn+aHVSz+ZLOL+VoDD1Blfafr7
v0LXrIxkG8365UbTcbLj3XfBU1fbWrrpK5FYLQ6PCmi02gWNiJ7S9Axh3PIqyFazChZXwU1Tk4UW
mB3IqT6qlClAaVanNn/hQ8RRo68k0e6UGbB7sSMxUY46/AAwdjmrC+XyDWj8w64pzdaRS8HDKe/v
F1tmtJ2ajifhUNUEjKGOY9eFstMMtXQ6mOVfNtGyMMIarmUH729i93d2r8LnMglf2TqKqUMJXARG
MTv9c94+jQU9lqi9O3CY6shAS9OOpvo5dCW7p5jAcaUvOaGljog5zRe1EC0xQU9DTJye4DTzEuSr
NCPuIgocPYStaGolOsRB7Jo5AGaJMRvm6241peoJ7EJRRzbwzar6ambfVwOm+wCQrUg0U8STp02d
VIH09G3VYxUdwlT1xiRpk0aJnk4RDRF6sw0oq8MkviL7EKOR5yMkQ21J0O8fUz6EjOWOPbJCt/0C
6gD2qEEQXcHvMv7KCmyL4r32MahUoeYTU8oNPellkDr3mlzYsdj3IvwdVGr5ODQUZn/IruxXBX6L
au5gUFTLiGBhTx0+PRaGzFFChWF761qY2MYCyJn4YoMeXierA1RWmrH8VDo2Bc4BsaVdcTkgkUvj
kySwTOfFGKBB5FDclU07O4V09ZOwpzBL7bKcEiKWbauikB0hAFQOzXB0kWBIaBbiQiPfwy+sZhg9
jUoQFlA7RVg43Z+EnjEybcuRlbpR04nBkj/MA/tK09/dl7KGZitfijILQtekm9SZ9dadiIaPb6H2
3hm+wNcdfLo8+E21jts6Myzpzs8FapstRFvZ2eLY19eKj79jM0jFBiQR8Jd3EjZPLTtRVNNoZYbD
rjjrLux4ybhUcHCtNBoXiBybOebFkKb6PagCllGgj0CMSZ6GbnGJg9Z2UczxsEL2uUrBlNOV3YVz
bCCse4WYv1kkzkL0lwwD267RPm/50VPVB10x3X3GSq9ZkwUe+gm8mZHEz7HP+MoaB2j7wG6c+Fh6
AiH4N2lCrvg3aYJXCN7VojRDk+NQnMQYZAuwOhbpVnUamMYhppJi8Kgv5jqUqm/3OpSpMSUMKCL4
bJkk3VslkpK5q05cPke1WBWm6VioS306LoPOYDlwMHW8qyhcXZpGN5qWi+i+jzYfIJELIXiTcyRK
HY0C2O3CZGiHTTIkkiUY0oYROjbsE4CCndPUw4eUgFIPb3gBZttrcXehWEkfICDV5OcEByGYy9lQ
gFhZ+px1O3BOIRzZqPHowP/OZongoOKhvWweYVREV41XkdhXn3U1BDTg8OIP9Ixexa0syxkGSZo1
By6YeWiPwauxHweO/QEEbYIfUnWmyMNHtRKExZE8nDluzMX5EPL/YfODWzNbsBFUJFOYTLvkFbJF
TB1DL8M0ltBzzBApQt4ovxjuTb6rd2hwl8JcFcH3mBIOr6l77f5g1+0FbaTHskJFgWJyTt1rB9G6
H9tqgfAb9x4O7xiLyhDPDMpVWD9+Pi9pr2WHZ5Zj+6gAal4sbx+PtwoEzzTdLSbKpc/7XXmL7UrR
lFaGWlqpzLXTG4bSjY9Fo4PPbK3Ne/D8W/OxQI8DGs+3H6u20tqxpvodxlyqPr/gCfC6a/Fq4QOI
3lCbNbAjemhjQzoado6LCuIEOJyw9uC+vMrpE3qrVfez14tRBrhTCno49l1zOpi+EwE55S32BM6x
YeD8evV4Q88uwPBvpJt5cwBOcR36vGW0Bispx8dqsXlW193xOpbn0ijzcMR2pqIyZzhQ2uNQ72t1
DtEKvLcCpkamXalgpmqELxJJ3yUBqo8sQPkSo1ZbJMWHMfKFiN13aliVAtdaBqD3ed3yqVgeLwJ7
18s3l009S6sAH3vN4JiXM+Ou7M/CYzGrmqrQrrcn5zhfX5/nU/HH3z9U+/OplXIqXoqWhtJQGRp7
HM4uhrI+1ODpw83R5+C+wQGysndBs1cdFy7MftX+XdzlWFVWmuLL9z9ebId657qsYFE9m33E/wAr
pUYdc+V5t955aZlqiU/OFb6+fA+b129//vXp+w+4ovhp5noOG0WeWWn63YtCh16veK/r72GSIS/P
G6bbkkfeZdC6FSJje6gwdVHJOpxadWcS2dOKEv6jt5ZA9k3O7saGJy69kBvopYUABDoxBxf/Ru13
pz24VkKoZ5o3zbFQGx5rYK27F4+gVvObPQwdaw8kJAWRfvn6r9eP57dPw1lJeWlpGCMOx/sAtdWg
jyd+IOR9l3cDyB9+rCc0+UKUXYZbRgm2ip4gPHEB2hF8ZWeM/8KutYD51FSL29Wlxkid1FXEeogX
DQgL3ToNBf/l5fcvz+92PAdxfBEDax4gSwUMaIoXWJ3x53AR4ZNJ9+sKiUbSB6hCYsPZ08Igi0+b
VD2eLKmNu6p9wOicUJlpSKCrcx8DyqFgxjPPClbDkeL9uPJA9IEODQO98nyuwNfoZzyTzw1E09wV
mHXiynXPsykGrAb3EK00xxCa9wyl9xkYvOZ4edpLir5urhzHc+Rn+MccCjCdbINjdHze5QXxkhst
zpmSwMOkAoPHR3ucVaGuE65AbcbzJ/gFq8mGX/YqXLxfrtihyGBxDAv4FaF3xSaPqzICxJ5hTJ54
KwHs+szgifF25r/8SNVUV7CHzIscuQKEvYxoLIGHTnMGOoahA/H9wJUnLD7pjbY+tVyYR+fTEKue
ehT6ESLdozkOx1OHRyBUeM5pFBAs4XPhaT7sFIQvBRQDrnUvI/TU6CLyVATm4ttdCrPsnOR8g5lx
ZUOwxR5YhvEbERF6uQ/i0OHHTO4R95dqV+S48xPBQYj+8CiVAL89v33/F+yW4FvL2u1k0bpzz1Ht
5kkDnK4ydS4pm2jQXclBU3IU4zGGZ1tKj6YMNaO/vasV+PXruu3rFTGFy5OXEmzeTsIijQ37C5UO
NbBasHTlrEoq6jl9Ipge4xdyvQt4XrSwv8hT1YxD+UAIDppFlQXKCBDYOdVkLRzpeInDQGzmOdFh
9NB345mjuMqWsD4VwHRS2/ieZsS74sXjRzhMypoZzl3i6Ze2KkKwTX1mOHRpx+7tdm+PZ74QjebM
mGFxWYHtxEuZh4FLNyfs22PHz7PYc90yEvaZ56HVkQhy82RxdsVwDiOyzVReiI/KE0vPceGrPzyO
A0FG5nCOfGzI5k9cyE1s+lAVd23N8qVVzb5CaFDhIELo7SOrKoR+imPfUSYvQQdnFRPUHG5mqAo/
Tu0UQUT3sQQbWpFoc6LQa+P7PtsjbXresftHm/5U+oY5ICBiEI67U3mocO/4K1NZoY4oKJPZ9mc9
zx0piAi6UBy7EZnVJr5xpAf2nBnDTDmE/Qesrf941hb6f27tV/x0n6pbtkpF7yomCDYoHBHBS6XP
ze//R9mTLTeO5Pi+X6GnjZ7Y7Sge4qHdmAeKpCS2eRWTkuV+UahtVZVjfa3smunar18gk6TyQKp6
nmwBYJ5IJBKJBL588MwqD6cvjy+nh9n5+PD4att0OGMVHWspwYvITZLedCtdmahY4dkCZAyWpbQY
T6z0LQS3WI3HccqpZbAc4BY7ZpYez773r8/P6IjCD8s2m0+69/y5a4xyvxvyxUzw9K7tcjgOr4qu
UvOCjEYRT3OWucCJyeLwCsRbyyhMVgl7SLEmy5usL+SHbG1n8gsG1wQrkro5VCDhKLhsyL1A+QpY
Se9koHcXE6HIj8oIxTBZ5Yc0LWgvu5GGp2Kx6jUixo9iuLoYwaaKlU8uNjKeDLRUkoHi4FxrOdpE
dbxp2K3STwx991CtGrJByU+ncOCQi4XsufQY2s4Np0S5qlyzEqlmVjm2tgAdX+4fn56O5x82g1HS
98kQ4VwZNLzAUH3XhJL6HWXEw+n+FWPW/ufs7fwKguL99fzO02g8P/6p1DGuJO7ZaCywLInmPqGM
A2IRz6ldZcDnSTh3A535BdxzdHDFWn/uGOCU+b6chGKEBv48oKCl7yVEW8ud7zlJkXo+HbhekG2z
xPXJGIsCf1vFUWRUi1A5kspgd269iFXt3mwMv6lc9qsDYEk++WvTJ/IrZGwi1CeUJUkYxLFs+lXI
L9Z2uQjTOo4hqa4MmqCg3LAv+NCZm+MwIPCe5+rH8ZzgvgFx9eNlH7vGvAAwCM3yABzS7gYCf8Mc
16PNYQP/gvYF/QkpX/9pPiLXNThcgM2NDT3GIjlGuwpXr87GJdwG7pzYIwEcUMdMPIyQ6vaAv/Vi
OTjoCF0sHLNdCCUGFuGk7jkuk73vedPxWrAjcvlRWQQmY/JhI53WJ30hiIdsxvLFB8n/pxfrEopc
+eQggeOA5kqXDAMk4w0JgmDfnGoOVv3hLoiA9K8c8Qs/XhjKZXITxwSjbVjsOcRATYMiDdTjMwij
f5yeTy8fM0x3aYzYts3CuePLjpgyIvbNeswyL5vYJ0ECGuLbGUQg+iuT1aKsiwJvw+Tir5cg1Ous
m318fwG1UysWNQoMOyJm6xJrXqMXm/jj+/0J9u+X0ytmqz09vZnlTWMd+ebaqQJPi401bO+kX/po
l+KpArMhCsGoYtibIpbQ8fl0PkJpL7Cd2M4zoMQXNd4ml3pD05RR4E0RBKEOLKq9Z+7cCHUNkcKh
C2IAKlzF1jFAdETsLAgn/QkntG9uDAgNiDXd7BwvuSLBmp0Xzg2pjtDAqAOhMUkbG0IBoBFVbhDO
I6qVGJztSiODMCI4jMOpi4kLekG0LPLkYDwTNPIIdQfg4RU1EdER0c2I7Hwcm4zW7BbkBCzCgIKC
pKUa6frxFU7bsTD0DLat+kXlqFYQCeHbN1bEu64xhABuQXYS4N5WTe+6tBV/otg5V3YKjvcNAwWC
ifaxzvGdNvWNYa2bpnZcElUFVVPqR2cUrQsvcg+YdUtDdVmSVub5QICJQeh+C+Y1HThmaHVwEyZ0
/hqJgHY5mwjmebq2KxtAECyTld5mEJdme/M+zm/snMaCNPIrZZukhTaX5yXAzEPjqAUEsUes+eQm
8q+s+ex2EZkSGqGhIc0BGjvRYZdWcnuVRvFmrp6O79+s203WumFgbIr4Hi402ADfcsxDuTa17ClR
jbYNa2OwZm4YeuTpy/hYOqgjLjEsB+k+8+LYEUk4B+OBcuRXPlNP9qO7kGji9/eP1+fH/zuhBZKr
GYYlgNNjAuy2lJ97STg4l7uxJ4s+DRt7i2vIaH+t3Mi1YhdxHFmQeRJEqm3aRJOPpCWqihWaEFSw
vedY7it1MvpptU7k010BnCcH4NNwrm8Zn8+967iWYd9zTwcbLnAc63dz7fZQac2+hE8DuzFWJosI
n8oBn87nLHYsD1NlQtSWQ/KtqcFFrqW3qxSm2DKCHOddwVlmbKjR8mU+tw7vKgXd04Kr4phHsHR6
S6XbZOE4lp6wwnMDy1Ip+oXrW1ZgB+LcUh/Mou+4qmVfYb/KzVwYJNK4ZRAuoWNKwjRKMMkS6/3E
jaqr8+vLB3wyJQbmL03fP+A8fzw/zH55P37A4eTx4/S32ReJVLGisn7pxAs6ytuAx/CCV/A7Z+H8
abns4lj9Og6Aoes6f1JQ44oL14sqaKie3vPUxf8xA4kPp86P8yNeIcl9lkrMur123TuK2tTLMr1+
ZB5ylfHG1XE8j7RbSwH0x00GQL+yvzYX6d6b0y+zJ6z8uodX1vuucT/9ewkz5tPmtQueesfGexxs
3LmqyIxT6ZFBE0Y20YTj9NFV7uKscI179Atm3DSFXUObQUfLejgSa7HJFfwuZ+5+QRlT+deDiMhc
x2gFR4kJM9sCde51+iQ07srF50ajBZg2fl4Y4cqSBJa17M28KQy2P/vXGUP/FBvDL+MwcUNq8Lmm
MnF8P/vFuhbVxragxtj8M6CnXmRylQDb3BY4//raooRFn6mQEs71sUv1ZG74oNT7PnSuCEFYhYGt
ObjY/EDjkdELaEmDUwMcIZiEtnpjAb6wz+DQRc2fIU8N5sTF54eGxwRXvj2HfvMxEcxd8s0NHw/u
yYCu4I02I8IT56AGsZ6KVC9FJkZLB+F/hcVwkcfks83LgHgkJ+jSVoizaGT0pGdQff16/vg2S+DM
+Hh/fPl083o+HV9m/YX7P6V8d8r63ZVGAot5Dul9jNimC4bIoBrQ1Rl9mcI5Tt9xy3XW+4rjqAQN
dKinvIydlpSzUIHJNg48j4IdxL256gEiMLt5eW3Zkvt/uDBdRwqW/StCZmEJdTusl/gnEs9z2Djn
vGJ1P//3n7dG5qwUw0BQOsOcK6KK16FU4Oz15enHoAx+astSLVWxEl82KPTrcyJDgErIhbmsWJ6O
b0rGc/7sy+tZaDL60IJg9Rf7u9+sw1vWy41nU6A4cqE3D6AtmaBiQmrDh9Eo5jojc6C+rgXQN7gT
Duk2LaBcs3hdGqsEgHttQSX9Eg4qvjncWRKGgU1HLvZe4ATGguFHHs/OmNwxzujIpum2zKetb8IR
K236K06Bm7zM69xgiVS4DGFQzvOX4/1p9kteB47nuX+TXx8R0UVH8e0srOpmq9yo2E44vND+9fXp
ffaBl4r/OD29vs1eTv+0qvnbqrobNxPFPGS6f/DC1+fj27fH+3fp7d3UjWRNvZParZND0slezwLA
30qt2636TgqR7Lbo003eNdQ7zUxOsQs/+IXTIVsqj+gQnrUgTvc8b5/2+Egl42n5KipX1AXN8nKF
njQSJwPupmLICq3yqHD6BuqvWI9O/k3ZrO8OXS67PSFd2STZAY652cUtTC2nVe/TEbbOqwPGYqXq
xfbYcPgd26AvE4VlMNzZJLy9dLxmnYFAo68O8SsMRpluQL0K1dIQzorSDecmvN633Cy3iPdXkENG
Hynvva1BQsXoKsXxcLxqlcDqpHdJllueeyM6qTJgTCu6bra7PLHji4VLB19E5A5mwsJrO5hAnYt3
1e16ZTmm4LRWlkdAiNxmpV5cwiwusLiQ1snas+nvgP+8p0MVI27ZpBvKqIe4NqnzcnSrzB7f356O
P2bt8eX0pMyWhpFLWHZFttYWBy/1glEKv0jg5fnx4etJ41vhYl/s4Z99pDjJKtislaWivWz547yv
k12xU0scgFQcc0SnRQfb0eFzXlERLsUsu97W9xxt0XJ7O8rDqTaMD4OozT72g0h5oj+iirJYeJbg
oDKNP6eVQZlmHlORj0aKqnC82P/cm83r8jZRZNCIYH0UxCEJj/ygMxbHstnzqxPbuG1VSxXK3Hyd
pOQLEJyovXivjyFVQNoziuOarsjrnkcuP3zeFt2NLtQLjBdQZ001cuXqfHw+zf74/uULSK1Mv25a
wdZfZZhqT+7dSvMIHK+VqKJ4Jcvj/f88PX799gGKdplm47t544U84IaXuSJix6XxiCnnKzjPzb3e
8TVExWAu1ys1Xz3H9Ds/cD5T704QLdhNWmIjUGFnBPZZ480rlXC3Xntz30uUy3FEjH61llqTivnh
YrV2QrU86EbguDcrx9e7IVaMpbimr3xYM1LMboy1URbrTW8ZzAv+ps882bBxwWD0KOKDKXT21L4L
jqc2JRp5oeDxdm5L2c/5gtRjQF0wLAE1KaErtSaKkNqVtbHyFFtDRQ5VqRm2S/pMBCmkW8Rj5zm0
/q5RUQq1RNLGQaAYsqTW4SLuqCgs0rAZcaykHhiR6i84PYS32bBd4DlR2VIFL7PQdSKyyi7dp3VN
1znE5CTlyk+kx1jTJqsKWTEzDgOXelmzrZUX61xKbYrMFEkAlGcAfk5ZuzGyTr3uqbDlQNYlt3JX
t1g6SYhhKPKuuLxfeTvdo7EAPzD8FJA+meMrrMsQc1iabnk0Nr2xSdptaQ2NYy1LdsLJ4XU4kKlx
4Ths2+UJZRPig5WXN0WtFrLM4dxxWK2MgS3Wy7wGhKUsPHZ1d/pX6aaAX9SuybENT2ysNiBttuuk
0wuqkjQpS2tB/M7PqLz1bO5EHA0j0xfI2ksnIF26OJV4f6OXDSy0buquYLYZyuFIZY5iXib04UEg
c5DBtvLKRh2n/Peb/E4FrXpPFqWCf6tl0RnLZL0id0COKkFRaeT36AjdNGWfS/d64jf28IdWctOs
y/ywSSo6Ai7SgEqblFmhtbQPY1/jBejhuHBk6F2uArYp6t2pCrxNyr5p9Y7vivwWgyPQz4F4O+46
I7uMQlDgcyFLz4pea9pvybJLVFB/W9SbpNZbdpPXrACRdaXmMrVlMOdYeesWgLrZNXo9OFQoo6y1
VAmMZQUcYOsknET6rjE6UCV3PP6P5SseCm3daOKmKjDYVrPqjdIafDeV21Z8tS37ghSqdU/HShe4
rqBfUSIWNHhLoDfEwq6OxzBYHba9os1rGLa6V3vY5n1S3tV7DQpyEfZLEnjZevXFNRKUakwXmibP
6MddMhGcIG2dAUmFs1ykhuwD1B3rjUUiU3RFlez177ocCrQuna5J08RgA9gf6GgWAlmxbb1WB5Hl
VaGKKgTCJiQXzR8tqXuZWi0++NPzg6kUfZ7YRCjg8hKj5OWaFDVCffCOV7okxJitCSskuTGBhMSV
i6ySrv+tuVPLlaGEkIZtj9IiOappWa5Lkn4DkqnS56bfdFvWVwmjIwByyYyq1qFlviawvdXvedfo
AjuVH75yUFHgQ3wVuC9gmakgLGwYgKmFI8yusvx+l4EGZgoykVfusNnSj+u4WlWSKXa5ZAK1wxs8
e0cfTEJr5OokvnsmNVv+uLkwxIOUNHCgEMFQlMKWr9Co9vz68Xr/SqYkw09vlrQE4e+nddk/deQn
VehkSiA8tMWSfUX7rdCGef4FxXirlKLR6xH4KFoeDmKTFoey6HtQS/Ia9MRaHUUjuiCPWiCipygw
jGuHG4gK3ZZtccCIzNr3da0Ffuev2bt0A7oRO2xSdS7Vr9u0UAFJXcPOkuaHOr+VIqYS73Vw7Ilw
dCKGgEj61+YdKyzmXKRbQR1FXfRcYBe5PU7ZXwhLxyegX8OO0GTbtC+1ejWqrGA8I2K+B5FSY+rE
7dKYA8YnYZ1jDoXlED9THiqMhbkFAV5nIifj371/U5i7VhbM6/vHLL3csWX0cknDaO84OGvWXu6R
zTbWYGv5gFa7w6Fd0/TY00OvbPgTvu9x2vlNy7XCBdOYn68Ydf6T2zQZxWRJyOdkv/VcZ9Ne6VfB
WtcN90PXVD6CKYXPr44az2vtuVcqaMaBe6agvNcWjKVTW2KiVALX9640iJWx65otmsAwJI0mYThK
VaQQ3sV4cb2IrrYGS+Rv8StNd5p4WJhzZ+nT8Z14PcHXRFppAqbjYQn0GbvNKJWGx5apJhtIDTvy
f81E2KwGVPp89nB6wwvi2evLjKWsmP3x/WO2LG9QUB1YNns+/hg9aI9P76+zP06zl9Pp4fTw31DL
SSlpc3p6484QzxhI9fHly+v4JXa0eD5+fXz5agsVUmVpbLmFAnTR2jIZ8QWe1cyyEwDG1weKA+EQ
bJVmggDjjNx2SUt93ur56uSe8InPOiNOmkDYq+X4dYIBa/Q6OSrD/DRdU5qM1D4dP2Dgn2frp++n
WXn8cTpPbs+cyaoEJuXhJL3g4IxUNIemLu/02rLblHL4GFCe3i+EGf0SbgPHh6+nj0/Z9+PTryCj
T7wRs/Ppf78/nk9iuxMk496P/gvAYacX9Ap7UNcBrwa2v6KFk5x6nzahySEyyWzJBi/lXAlnxwn6
Do55sHcyluMBZaVrEBt8D5sbsTRHOOjWtmCGEwmOKF2qKTcnTMUqC+ZiDFVahFtAFJqOTjg3fEZI
mbRlLFLdoLkg4LHFyaJUPYcsE45+cjbPAeSFmjKVbfvtXhPR+Y7la50hynzd9BaTC8fr+/kYrSe9
i9LQ13H8GlcFFhnXtlXgqs8KbirUR4ebfUFJwhM4yX2c4FCtYNeHYxl6sKxtEg9UQPizWxsMVto2
Pgz4noLuuex4Ii2FR4rmNum6ounUnqiuL0LnYHkvNrRVse+3cuQiwUxo+FjdqtA7oNOiSOa/86Ha
a3EsUY+Cv17g7pcahoGqCv/4gfxkXcbMQ0cL8ckjW8Jg5+Je15Djm6RhN6qRauLX9tuP98d7OPZx
YUozbLu5uwxYPcT62qd5sdNnBc8SPPPLFT3Md1z5kuVKI+Qvh+1Cr49Dr0oxmQRD1atJHEwKW9MH
KuzcgV/NeAR20BAO9baC09ZqhSGTPKm2MSsB/GbU/sYH43R+fPt2OsNwXFR+dUJWyCCyr7asyILE
VRHrzoSNSp0+oO0+8SJ7CNJqpwt0A+1fUaOxSlvg4mWWDs1UhUmVBYEf2reROu89LzL26gGMIb+s
7eE0ljg7fOCaG9oLiq/stefYT6fixOBc2f6Ea6JQ0NXFQM6/ut6XcPJvG6YY8jkPcCVaA2GAdU3K
bC85M1RSEtosdbG2gg5CsQO767gV0yGKlUiARuVeA/d6+8W/epEjdGyxLvJGNAyHTf0YSXjvbN/X
qT3a7kSU/0UiTInALEEaFdquhu3zLxRJutopJMo02Tq5Av4ALvlZWXxidfvRiNoUxslawm53Vi3w
QnQ57tH4Pp18jiSF+u18wjgzr++nB3RD/vL49fv5qEUzxIIGU666hnv6gokvfn3uDWlvsPm25jkN
VsYR+oK5WqVEZnAATTbquvopSpr169tZj7qXHhKbSKgj4MMM2Tkzw3Q4g2SyVYxrEtR3s3R+W3Zl
PjT/Bw2bLdftFbQZOVveDZNbWcGQhPHPmWwsp79r5dw5/CewbFsRMPlUI4Bd70auq1wTStS4nRRU
4wWNUAc88+Mt2jlsX4m8zfHe/GyT+YxhhDByPAUNw4CyrpYIflqb/Y+306+peKD79nT683T+lJ2k
XzP2z8eP+2+mmV0UjglC2sLn3Qp8T5+Uf7V0vVnJ08fp/HL8OM0qPKYbOq9oBDrYl32lJIMRmHpX
8ACRE5ZqnaUShe1ABRxeA2gJmQDBhlzCaLGVcgpVqfLjsCyb9IYADebuv8cjhofZ3CayIRqJhwOD
FKxTxOu0m5ylj7Xw5ghi2SYtZJaagFZjxIUCL1cIfpWKKPtVpXZAIFb4Vw6Eg6jbJVM2Jd7fYlWh
uc9Si5qsSJQPArbZHFJ6Q0aSdBnZkqgDdsfzR8F/ljp3W67LK6O4ZZtUh2SbIgTGcPQGpp83pIkO
cRv22RiAhm2KZXJ1Nqqeusy+jPY+r9ULySqvWF+Q+dnwLgjvQyRvWLwdEZl1CJhIzyQXLuH4FpE2
ZUPZOjjdssOTeY3mjc0tHn3rdZ6NDA4U1FUj/zBpKfd0gWJ+OA+ki24O5bnjHaOhHEwdckZsOPfM
kkJHDhLIoUN2WnWI4MgyV1z6OZRbb/WGYELZwJKAkxNYvDRFk1p/MZ/r7QRgYDS+DRyjQWmZ7zDg
VFFqCN6oQNG3ZbjRJpMq9ClfXTEMQ+L4Pum3zKjCTAeq4oVj8jV86npz5sT04wLRwFvSZRtRZG53
wbIZHEKvVCz2AcbmHvkURsxC7wdy9mjBQVPmZRnap8n/M/YkzW3jzN7fr3DlNFOVvFibLb+qHEAS
khhzM0nJci4sxVYc1dhWSpbrm3y//nUDBImlIecwzqi7iR2NRm/AV2BtaBJOrgbrtQXG1Tz51wLm
9VBXPsi6eDYbDoLeANPvNWEq+f60e/nnr4HM6V7OA4GHzry9YNgT4Xtw9lfv0/G3s1sD1Hl5xzpN
1mGRRM6WADhMg+8rfOze+SSLw8tp4F1ydQxDtHQM8d22xlSJJrSap6PBuEu+KjNpYfLVen8AmeUU
iyrr6WTgvu+Cn9SH3eOjcT7rNmib0SrTdB2n+n3LwOXAQxd5bU2zwi44SBIBZ7Xna905jMKHxdLZ
BwrH4Hazisl3TAw603HBQCkngt6Mvvt1RFPL69lRjlS/9rLt8ccOhbVWsj/7Cwf0uDmA4P83PZ7y
VVEMlPHUL1+r9PS9YJl5ZTOwwOHpx+SsMtCDPPOPIaYVf6+QujbczVgYwrEZB3FiDX5HEcPfDISH
jJKfODDIBhgc+lpUYan7RAiUY7dEqEUjw5fkW0N63wTS/7qErDqNLi9o1aXA88u1JyFKi54MT6Dj
6XB6OaFvmIrg6nJyqgQ7pYqN9gUnSjQfDU4SrEf0u23y68n4ZOHQuYsT+HI6vDj5/eR01ya+5FES
fTkiD7ayDkWuyt86AM608cV0MG0xXUmIEzIiWU+UstYfyeGegAqWM/cFDHzxU9gL+vqrWwE1tC3t
527rJaJJ8xWXDwIb1ucWe+LBFEmgIrPJ4FNJAqy4qIiyBRy3Uk1H5OpUYcp0m4w1JhqLWK5PGfYK
DCGkdCyxqXqDm2gYU4OGmALfCp7zLC71Ny7xjQgM7+4QRmmMe4wS+KQvL8O8onPpifrgQtPq0bw0
wJTJNyHx83JpPREKwHR2MaSfjl/NSL68isvuHQt9LjEEdL7kpCsFfhPnBrWAoCxG2y1WUUEFfK3Q
At/Eea2bCQTQ+ilKNioU0IyTzRM4dLXRR0dC0Z2+av0ciZjV1mPw/rB/3f84ni1+/9oePq3OHt+2
r0cjM0OXgfs0qWrSvOR3gemA24IaXtESOEh2PKJvynDPmIN0SuLW0wvtcRSX9agNk8ojs+cx8zyJ
ZnG1aIq40BRP4aKEhnRFagKdxOQgbrICQ0lcRIGaYE4g6kDXJvXviZsA8cCzNmIKXJG6GoVNCqKk
oszr3KrxOhBRAJrE2H12GydhbjRJQbp3dlwMX4FYRiHgEsVTXpvhXylPEpbl61MRt9WynLHQHPx+
EbTIUSOiXpq8gBuGLzBHEc8L2m9H4UHuLhLSot21pcxHTbCs6zyjWsPmsK7neNskylhgpGSYaFpD
BYFiecGMtSIfj5LU+qZooUT0rLy2PO3v/9Hvf5isotz+2B62L/f4sNbr7tH0/Y1Dj7Mv1lIVU1vD
plLF/FlFnfybXp+Pp6Mh1UORIHs8nZC4Kp6MxloeIQs1Gfi+GhvB3RoujEJ+eU5lGNCJRPYfuC6R
NRcsSVlF1iyjr3t+hC8wr5tVSB8Mi1vYzRnqjT0zWe3fDveEqhyqqkohQE40PQNA+aomoEESdVBr
Cq0aOqUjixM4A/W+FCGlSmUJXIhYkyJxN1YxDMgS/q60u5iEyWfpDZD1Ovh8+4LZ3M4E8qzYwHVQ
pHCr3PPnPVJtlYuaWu5F9ELhWx94kGdr4NbL+cJubJRqXWrPfYFRioVy+7w/bvEZI0qfIN+OBC4S
kruK+FgW+uv59dFdBWWRVoZbmgCI3ESUXC+QmbZuJUTE9s9RsePHIMDGanKQar7RzI53Ysz2bSx8
uWSc9P7t5eF2d9hqaSskAoblr+r363H7fJa/nIU/d7/+PntFHdUPmOXeFCKz8zw/7R8BXO1DY6RV
lh4CLVNaHPabh/v9s+9DEi99m9fF59lhu32938Aiu9kf4htfIe+RSt3I/6ZrXwEOTiC58Fs9S3bH
rcQGb7snVKZ0g0QU9ecfia9u3jZP+Eqhr2Ukvp9rNPWorbzePe1e/vUVRGG7oKg/WgkabxLS3qzk
N5SGZF2HvUaK/3u8378ov3jHviaJm1nF4EzSzEMtXCi/bKDUFMPf0fhKSw1iYENMeWEIdC0aTr/B
eHJJJQnpKUb4XItdLcAvLy+uRg6iPZ/shhR11r6NZcLLenp1OWIOvEonk3MjZUiLUC6HtG6howmV
APouHRq1Rx67N75HWXr0Yp4mZLXn5TsQ5WknSSNpCvxwVWEI9KsNEBuW1PkoMUrEN4u79X0Q31QX
w3NmfyCsQ/SNWqKrymtf7AkIidugEtaeKZU1ErH1bWI3C0BNwt20HHF5I9Kpue4GqBYCoQE1CnpC
Npu+O3oLdIa3bpBBzsqoqaG/Pv1c6/QZF3lYk2kuSo7uxvCjLvMkMSNeJC4NFwVIwaxcU+MhaeoY
V0soLLMyWmJxByLI91fBvvpOt8oO061X+BXOUwHs9h/8aEK4oQt1N/r76v56QZg213nGhCNz+10/
HfBlsWbNcJqlwnOZmkWdBgvRVj6gxKEvHZ/tkjWUt+Q27FoWbH0vfFeGZMpxREtGiaPBpb9FtzLM
EdUKxbtfyGj1cBq6L8oX2wPGsWzwjvK8f9kd4eZCKDZOkXWTz2yP5rFTHXt5OOx3D0Y2yywqc9uj
SsksLXmnK2R6NkO+EoBuIWTAzjSuJX52fMsEFims0YjpIpxM29N0Lwr3zFN8Uqam9lLm2bk9Ox42
9xhl5WzpqtZKhx9S6dAErNJzb/QIaGhTmwjhmmtcqwEI0mMJN+vQ9dymyDr7GHWH78lmGF6jXbfl
yqsN9wcF80Rideg2MtkGz+sFAa1IKOwYAlrUMdke4hRSQc7u/PTfz4o57ZJdc8pnULh8FAlfC7b4
P927D62rl/t473LdsGh+eTXULkgtsBqMz6eG+mdJuRworSJRjTbZcU6phKskTgPT+wBBkmWFdUnn
mBRulfD/GQ+pFRNiwg7dUjs4Hzc3SxY1U3PtlOWygIMkq90Ju+Ee7pTbehdlBDAFU2mt3oEAL7mf
nnQyZOGCN7d5GbVGRO1qypI4YjUsdTjxWVnpvQAQXFlZYciNQ8PLuAU0a1bXpQtGT1OY2TCxhEOB
rHi4LGk7MpCMGtNPtwX1RfqExdH7ZY8by3wpQXTZFo0q2fneF+TyNYgM2Rh/e4nRJTwQ06WxYB7D
tKCLtTEgHRiIQzrFSEeCigS0DtNisFaBnEiqF079X98ZsK+ewUK4d6zwG0wKg95q2jJbO7UjpFUI
NasxURQS3Czz2sgquH53ASFFSSs6EZVnmCpT2s89ld4y0+6/PtHf+awaWh3LQwkjmxDUcpqIorI4
6QpTi2mohk0H4Pgae7gl6/ZwfxK0iFOzrGi0mdYxYm1au01+IhRocfaVh54UQKpkdFjHcMjYVKUr
dPKNstf12DH90XhB3zYVxbeqppwovuUZl4Oqc0lD/rLYXscicKmarFNCWn/gvNDLjBPeIDjOdP9d
kAnRZnDnwWP4QhaWd0Ud685OBrhhydxsPFwazHlToM59uB+cDhUsYzj24eofzzOG8ZfUkpxVnWFd
nUQ2IJYA6dul18QkgijV2dQCgEZOoYAUxywaWajLA8ZHtPS4TY3Rk2DLZVoC65Ib0Tk3sxS4DvX4
gcQMrQLCWlsJmFpkVo2NjSlh5l6FITEAIUb49vZeqVLWCXKYm4TdWbuth2LytLiE/dZEZMIuipIl
twwE8Blce/Pbvg8aaZxFZnyWhhMBNWKZk3tNo0w5jFJeuFbmcHP/U89XnGFcT2cKeLbAwNqMxS1P
0md9BUtZSFDSDKClWMAZlM9LMiZF0RAbRCLyAPla40lUI2hkqOuzC7OXoIbp2mSYZ+QIydGKPsEt
7XO0ioQo2EuCvbBZ5VcXF+eeONpopk4jVThdoPTMyavPM1Z/5mv8m9VWld1ONk+btILvDMjKJsHf
ysQS5hEvMDhuPLqk8HGOVoyK118+7F730+nk6tPgA0W4rGdTnfnalUoIUezb8ce0KzGrHUlEgHwH
vECWt4bzzqlhk8qH1+3bw/7sBzWcQpKzNI4IurbTkpjoVepJWyKwqJbSWZQA4qhjoqPY8okWyHAR
J1HJqXNbfoypuDBNVefs3WKveZnpw27pIeq0cH5Sx6lEWLeOxXIOh0CgF9CCRGe0NcjTWZu61bCl
4z/qdO91PO5sdOXElfRBk15cWr15iYENlqTAor5wEwRLhJw7NvOJe1wc6PYdSQGhh1Xl935ZOKXq
KJnvjqo04NYhJQAWvwosGvubEPiXPiryt5SCZCI6tTTgBl0tzB4qmJSABGukLvkGlTzKjBu/wkeY
K7doMGWqT2dkkTpBkKfoMEuM9KS2qRxZu8N8S2LaKNFRgPD6HgElEvd1fyMahPIu2Z6xyMAUCGeJ
bycHm6cBjyIeEaXPSjZPOche7ekLJX0Zdfx/ba2QNM5gv1tiTOrbCYvC2mY32XpslQigC5fqwl28
ZVuPDUHvJ3SCurMD+iQa5GoF7/mkcOuiBuyuWpmh2g5bkJDmtvTE6boN52XulKJg3tOpI7DVNwpO
XWQUzr3xdahvsaYzAtHsNi+vaT6ZWaONv3XxWfw2EmdJiOc2KpCGQ4+ENPRjIiJnXubhhPglyuCt
z3uUkbfulgiPNZ4gkdl2lYtwGRWa/4peB3XLnJfChwyuWrm2mwSDtH5ib40K7UiXapmVRWj/buam
T2wL9dstQ14s6O0XxgZzj5UYrrtwIZDhDQJuC2LZqFHVx0JQ3XKGvlGY3ZKOwxdUywLzuPvxPiWW
QDpCew/1uJh2eLQ8FJhPnF4xkvAP2lfdZu/StFcJj9NrxHwHOPOf7VeFR3WU6Ks2qZQUbIjU/ZpN
qk4qb0AqpwvsSS5Hl2bpPeZSe7DPwEwn555vppOhF+MvzcijY+IuKCujRWI8o2Hh6DVjEdG2eIuI
0mJaJJMT/aA8FS2SK+/nV6N3P7+anJ/4nIqoNUnGV/5RvKQlGiSCCysuwYZ61NooZDA80UBAUuoa
pGFVGMd201St9LmhU/g6rvAjX9G+6VZ4azUr8IWvPN9GVHhn8rs+UjkWDYIx3ZSB1cTrPJ42pV2N
gFKx24hMMXopT/Vsygoccowlp+BZzZd63u8OU+asjllGYO7KOEmo0uaMJ7rhuYOXnF+75HGIGfUi
ApEt49otRvQtprpXL8vruFqYCKGk0J8MSzyZi7I4tBK59o906TZA6S65vX877I6/3SAqPMr0u/kd
qv5uMJ6lsYxQbbpnlOGBrIQLkyFqBu3ntOEYM7zzyCFQYqNUTrcERnOaaNHkULV4JsCoEJFCRRyH
Eunx7JEyKsYmVcIPpy5j0oTrSrMKYsrUXYmtWHu62oLRjwehU4V4GDSDXi9FBFRxJ0Sk0A5Bd8go
fSSIlahFl14LWhfQlBaKLzETiv30JokWbf7y4fPr993L57fX7QFTpX6Sj15+ILpYwWJ+ZxTqPM3v
aNNjR8OKgkEr6NxFHRU+WVrEnuANRXTHPDnl+jazGXpkefIVabWBhJ2DrJZU9DbsKYEn2N75LQ3a
I+a2DbQD9gYU2u/A0xO+IkMGW+Vlv+r1AF7oxJcPT5uXB3Tn/4h/Hvb/efn4e/O8gV+bh1+7l4+v
mx9bKHD38HH3ctw+ItP4+P3Xjw+Sj1xvDy/bp7Ofm8PD9gWdR3p+Iv0+ts/7w++z3cvuuNs87f4r
MjBpsQihSFqPto5mxUqZHb4PlD5FJZKDaUajGFM5oq9flpsPF2oo2E2qdI9Ph0GKVZDTF2OYutyb
Zty6WRL6AsOZoZHQTiv0GCm0f4g7j2ebmfd6NGCiOEpS3X/4/eu4P7vHDNjdo7XaXAhiNAYagRYG
eOjCOYtIoEtaXYciP7IX4X6Cdz4S6JKWuuGuh5GE3W3Gabi3JQqjKy0F4rooXGoAuiWgEtAlBWEA
pFF3UFq44SfSopA7U1dZ48NOz2C9G9pSzWeD4TRdJg4iW+pP0mtAt+niH2L2l/UCDnCnkDZvlTX3
ceqWwLM5vj6qfGLfvj/t7j/9s/19di+W8CM+8vfbWbllxZw6I3f58DAkYILQHmgAV1T0bYcuI6LO
Kh06MOC+Kz6cTAZXqlfs7fhz+3Lc3W+O24cz/iK6Brv37D+7488z9vq6v98JVLQ5bpy+hnrOTTWl
oeGMqSgXILWx4XmRJ3eD0Tnli9zt2nlcwaogCqn4TUw/WN4NxYIBzzNoZMiMiBRDgeHV7UTgzkQ4
C1yYqRfvoKTuSbXHLSYpbx1YPguI7hbQslO9XZ+qGsTQNrmTtYcWagrcHYNB1fUydddlVYmMzdKF
FtPOeEYSJC6nwkXK3PFdU4O+kpTShLt73L4e3RrKcDQkpkuApb8ijXS3AkJhiBPJfZyxXfsVfZIi
SNg1H1K+VgZBRdVcD86jeOZyw4VMYGYtAzVfNiKNxgRsQvQmjWFj8AT/9be3TKOB/r6i2nQLNqCA
w8mFy0YXbDKgzgpAUHf5jlWN3BrQtSXI50Rht8XEfPdSyhUi97G7KBl3jx2AySAvF5zF3TJyZzy/
xQj7U6sC8/fAff4Euw4Z3mGlMtxZGoCbUNwT4GS8b3u8cHeVzcS/7mZo+TA1R7ws4BZ9qnctSVNV
fNhMyEfOuyl11yZcS2cxIUm18N5CYFerCKwa5bTvn38dtq+vpkCvxmWWSEO6XaJliLTR07FH4a6+
prWCPXpxYp8Jg6aKtYVbz/75LHt7/r49yGhg+27SLs2sipuwKPXnAFUvy2Cu8msQmJb/2o2UuHd4
nCAKaYtFT+HU+zXGyw3HoKTijqgbJUeMo363/o5QyeZ/RFx6nAtsOrwf+HuGbROeydbF5Wn3/bCB
i9Jh/3bcvRCnID50TzEdAS9Dd18goj0stDdIvDQkTu5rLa2zj4RGdXIh9QgKSegfOKSjOBLC1VkG
UjJa2genSE71xSvD9B3tZU2SyHOCLVzhDMOWChaZ1nUXJ+bc2ZsaHmokRhUp5txRmbpEi3iWNZdX
Eyp2RCNjdYqRvISQ1GOpu0ePxZE5HzOKZwBNGNLRIBrJDbqrLaZXk3/Dk/Krog1HvvxqNuGFJ9Ga
RTf+w/JUI1f0S6lUM/+QFBq6otJUaXRt8gF6RaAecB2SKbH0+UrFw9DNfO3elS287ZXBqrsUc9oA
FhXWmJ6aRBbLIGlpqmUgyLqa1pPzqybkZavr5ipMp48CvQ6rKfo2rxCLZXQUvTMK0Fy2XmGqBPeQ
3x6OGDcPN9FXkasFc7Nsjm+H7dn9z+39P7uXRz3/Grpy6Lr90nCndvHVlw+6Alni+boumd49n6I1
zyJW3tn10e41WDCwcUxYVNXepvUU4hDC/5MtVL6vfzAcqsggzrB1wsF8po6yxHuGYRAJKxvhJKgd
YRi+bLQ0iEE+x5xj2rJR4cEgumdhcdfMShFsq2uVdJKEZx5sxtErNtaN/wo1i7MI/pQwNtAEg0fl
ZUReb/C1ZvGwToAp0rrFKU03LHHrwLxuVniZQlng7r1TfI5KBRzGepcEBfrhwJYSz5zWncWo268h
MNW4NmT1cHBhUrg3RmhMvWzMr4z0ROKCq9IAmnxGYGBf8+COzv1okPiEXUHCyltGuoJJvJykHnRh
iD/h2EDqqYXjwL3rh5qftLyg979hxUZ5qve4Q6HjIkpyieFU+03KKRYULgato2RpRCOCTN/F+/Q9
QChFjSI+QS7AFP36G4L11SwhmA2OGNoWKWLHC+qzmF3Qk9bimSd5Qo+uF7BfTtFgSgFqt7XoIPxq
d896La0fh2ZuuOVpiAAQQxKTfNPTGGkI3YfUoM898DEJb71Ore2v20FblIjqWbFEheKoLrOyZHeS
JegHa5WHMXCAFW8EQY9CLgLcRY+HlyARSGhwHYQbWZzghxmllXF8c1EigM1iJLdBHNpfF7wEBqkQ
UgO3/bF5ezpibuPj7vENHyV8liaizWG7gSPnv9v/0+4+8DGK9E0a3ME8fzl3EOhxDFdCdHc/17iI
QleonhLf0txGp+uLoviOUWJs6hMMHCNF6RTf54jnGXoFf5lqHg+IgFujz2UV8TBNTcCzEO7cpXZZ
qOaJXDraoN/oB0+SGylp8XfHx0j/FNMrNky+NTUziojLG7wkUQJkWsRGctw8jjDHPAgZpZbBQ3gC
qHW/ivQ3fxV0zmvMA57PIn0h6980+oFkIGpxJuvhFpgLI9ej0dogjfD6lukpBwUo4kVeWzApLIEU
AOfvsFt/FZxAaftEbSs+OdKPaUNW4qSA/jrsXo7/iDTrD8/b10fXU0VIVteiQ5q8JIHoSGmGD4qW
itwNIlIxamJSBSFzRTQgvicgZSWdpfDSS3GzjHn9ZdxNcitQOyWMNdcYdDJuWyqeEid3nnoF/UTG
YZ3C9woxyD9BjlcJXpZAznWui5/BfyBOBnnF9anyDn+n+9s9bT8dd8+t5PsqSO8l/OBOlqyr1eo4
MIwuXIbcCDfQsBXIdtR21EiiW1bOmhoWsrBEaRZeqkBBTR/UNhWZzIgtcAngcSCa1gS1JiHO/7+y
I9uN24j9Sh77UAR26hjpQx60OrzCrg7r8K6fFm6yCIrAThDbRT6/PEYSh8NR2id7h5zRnDyGHDLb
4GvwsvUeHnYw9fwQ/PLi3ZXcl4AJ/Anjr1SWWanLk4wMuYAjh7PNMRISvraErW3SGx5Kz8+p8WVS
lXh5izSEuhdkXXZJNhsKfuLymDGhPl1fWVYYHmrbqNRwdxWoOOPxVPlpq2Xz7OrNuQZMV4n/vO+8
cJCOwGTnv16/UJ7v8un55cfr4/npRUYhSVBjB0WQIkuFhbMbR17jcny8+HlpYc3ZDaMwtKaOwKty
VC39WeiNmZn85NfW2D0rILwKI4+stIP+MTEHNCL9O9jAsj7+NirMKti46ZMa9JG6HJDDw1eW0RNM
NsbIQIdbi/qmosENxn6U6poEspCnUeyKv67Rb8tiCHuZlXeBD5BCGWs4nkBxNrG03oTl3v7q11IK
C7iC7fzP4BzkxBXwLDoZ87q2QpQxmZfJF0F2KVZCubycWKmKnbp6rvwNyo9hwl2JzyWDSyfnEDW3
K1g+ctb8OOS1jv3AzSGc5D2TaEPd5lBLmkRlQKn6xn/4v7QG5LcIv9M1WYJBAGwpcT4ZjHw46oZl
yXz3MeBLEtE1+k1MXX7fFRvhaFUXec9ZDKXfjxv9Lp5W3C0VqEJ7IMThqCdInNWQNDj2KnNpn25R
KyJgXmdhdBp73u6qU3szEK0NuhJxdgyqRVouu2FMjO3oACvTyiElyb8v2oMdaiOorwZCNT/36gWG
43yemqlbieNsy5ut0lzndaT5xngKBcdpUAPxwHFavEuQCoQWIQntD6AE3YSkGp2h4VgBx1lIT5b5
FzCC7RTEE2eI/RuDBGIq+kn7B2nqQmFgJm+3+z++e/9e1x/omoETxSM/70kr9n0xF9ITTNsWQ01q
ikX4b5pv359/f7P/9unr63eWS7YPT1+kxoJphNAttPEuDbxiDL81CgMdA0ndG4dFu0fD1oh0YIBx
ymuRvimGEOipHm0CEppEpG8YeyCO7Hop7hPQKV191zwgCDptMczjkPQ7uaFZuppB85ivPlxY/V8Q
f919hTv33iEebkH0BQE4871eaI/wmExpdH3V+Z0FCKmfXykbZ8jNmC4q+xAX+ooSlU0Ue3H7NdrW
2xXncJfnrbKLsC0CPfMW5v3b8/e/n9BbD0bz+Ppy/nmGf84vn96+fStzaqFBldrGUAJhhqi2w+w5
SxyihXERANP2UhM1zG0sFgEbbQczEqPjv3jnP+RHaSlx59MFxdflEfTDgSHAFJsDPXNQCN2h914n
cymbnf2LJQ5W0AYFeBPff7x8r4tJT+0d9FpDmVu6+wpC+XMNhW5gGO8q+FDZpeM+6U6gdYxTa+/0
TnHY0Smf0oTt89zQ39yCs8vISgIkmjggDfi8QV1LL0ux2BGECFF41czz+H829Cz+0vQBTS/2Hgvz
y091Veo9ENZZrpiWMlKp8THBWPd5nsHRZnuJIV0xz4rwlq8sa39+eHl4g0L2JzQ6BvcrZLDUUqxV
6Mf+5zJ+O5V3kThzKFOCToRyLwilGLUyyJni0cVIj/VX0w5mpR5ALw4TfcG+NbUAJiXpaNCXdIyF
WLJ3HVboQcayylWN+VMIA7VA1DNnjJro7LBjCMtvjZfn1B96keY9+Tfn2Z8eRdhundTYBZkb3bUf
HUXQpdBhwZovNM/V6b2XoIg8uMRNakD+66blMcsYPCjizTdH61AYc7u1cabLTh2A1wCeDuWwxav1
QMMx0FxYM7wx1ugOraJgrtAeWroVCsZJwuNNmHTnpRtJXUVuRVGYDo0hJzUi/mqqoooged2MRSEn
hjInEb6nvsKfAVeWE5UH09l2eV7B8e1u7W4H7U06qm7IIYbbYF4jT24j04OrY54YtUlsv4+F69kI
MCyQVgsDxZOw5rEsEuwBtny8WtPXTdnnRkXKyWrXnXGqqmwCYrAM3B0n3kwW43S7pa+TlnK8ys/7
oOkCFVbfvGTbAAOCTQH0kkIh6edyU7lzmcAIN1QhYh7EKEDo8VQ2UVq3gyY3+ZTlS96ySYDV07ZY
ak3Ey51gXa6+IVpwn0dVtyuzPNy9nl7d39dAE3Q7GGXPyMzLq8aHkOOWButCZ2sxTVqsYDnYwoT5
qL+R7MnI6ae3vEmbu3nFwkM3bashAUbWrnAq0YUYsoE6B4qmg53l+8GPay/oDFm54h0Qs47EJvZx
uZNmPMmZvXVaMZyhsAB74dRs0/Lyjz+vyIYcudPhCwcp5vENxJJY0xNUGSh2hnkFJ7HYEOjF3pFg
uriOt+HERqMPPFuRV/CMsj3A6c6THe3SlW8UZSGCK7hSlzFq7ydVdkD+pSK1MWhStddvACmVQOmM
Fr5l0MlHjBMIjT8/XFtCoxLoA5YVCvxG+uOk299PhtuxF6Z8TB7prKjE6sbWrhVpK9vcRCpQzoxj
Jh9tOc1+vyn2o3TEImlj5jNWbCnsJbraZHjODS+HhYc27sReHD/YCVIERm4Z0mf4SH9kL2ZQxBLl
5FOykePtjUdT0jaJO4JQRXz9cB+Ommxg2qw4kYMRn2ujhhtte6wPGNa2C6ybszTu7zvp2TCcn19Q
IcW7ofTbP+cfD1/OMgDrbrQpz6SQoeW+6ZbI2F44Fco9bqNattlJwtJNeoGWfxWH293v9iAXAP9x
VEzs0A4EXZL1+JInyEG732WDbcuiK7eqrCnJcRyjj8UPJmhW3kW88BxJZFPYCj/aLBoOHJMVxrlB
57MVOLmDNfsGczzGT5v0ZIujceTIqNGJ7meur8zrE5qWbX5E25FF5gdi69GaDs7RQCIBXRxen7a2
Nwsh7ABjMJNwENj5Sj96hSAS18K7gsqEa5EsHsdI/A6CHgNO6sMtY4iP0eE12xA19vIsx15WERTk
pdjg97tKjRxGiXaCR9XGXRUzcfIkoI6OUWGCiiANx3tGru/k1gL0xFZS0AN8U0akWb+1ouyqQ2L6
I/GiTuGF1QIG3lD+9qLgNPRuQI9tV+lLEo+i5FUK+tkaRRnI0b5cISvQyDoCBftAo/HKEVEsSIJI
4XdZhoQ5QopG6M8O3fC9rJcCHTPEZjxBYBH2u/sXhA7BxN4EAgA=
--===============3576018883786439397==--

