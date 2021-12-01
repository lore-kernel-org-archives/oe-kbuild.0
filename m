Content-Type: multipart/mixed; boundary="===============5129468217711517077=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ast-bpf:relo_core 14/23] kernel/bpf/btf.c:6646 bpf_core_find_cands() error: uninitialized symbol 'main_btf'.
Date: Wed, 01 Dec 2021 16:08:11 +0800
Message-ID: <202112011647.lhISTWxn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5129468217711517077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git relo_co=
re
head:   65afd07f07d266a2b060ab282d72a8d49e0f9eaf
commit: 11b37572bb5db757ca09de550c38471c995d0f50 [14/23] bpf: Add bpf_core_=
add_cands() and wire it into bpf_core_apply_relo_insn().
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-m021-20211128 (https://download.01.org/0day-ci/arch=
ive/20211201/202112011647.lhISTWxn-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/bpf/btf.c:6646 bpf_core_find_cands() error: uninitialized symbol 'ma=
in_btf'.

vim +/main_btf +6646 kernel/bpf/btf.c

11b37572bb5db7 Alexei Starovoitov 2021-09-16  6573  =

11b37572bb5db7 Alexei Starovoitov 2021-09-16  6574  static struct bpf_cand_=
cache *
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6575  bpf_core_find_cands(str=
uct bpf_core_ctx *ctx, u32 local_type_id)
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6576  {
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6577  	const struct btf *loca=
l_btf =3D ctx->btf;
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6578  	const struct btf_type =
*local_type;
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6579  	const struct btf *main=
_btf;
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6580  	size_t local_essent_le=
n;
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6581  	struct bpf_cand_cache =
*cands, *cc;
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6582  	struct btf *mod_btf;
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6583  	const char *name;
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6584  	int id;
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6585  =

11b37572bb5db7 Alexei Starovoitov 2021-09-16  6586  	local_type =3D btf_typ=
e_by_id(local_btf, local_type_id);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6587  	if (!local_type)
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6588  		return ERR_PTR(-EINVA=
L);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6589  =

11b37572bb5db7 Alexei Starovoitov 2021-09-16  6590  	name =3D btf_name_by_o=
ffset(local_btf, local_type->name_off);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6591  	if (str_is_empty(name))
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6592  		return ERR_PTR(-EINVA=
L);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6593  	local_essent_len =3D b=
pf_core_essential_name_len(name);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6594  =

11b37572bb5db7 Alexei Starovoitov 2021-09-16  6595  	cands =3D kcalloc(1, s=
izeof(*cands), GFP_KERNEL);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6596  	if (!cands)
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6597  		return ERR_PTR(-ENOME=
M);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6598  	cands->name =3D kmemdu=
p_nul(name, local_essent_len, GFP_KERNEL);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6599  	if (!cands->name) {
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6600  		kfree(cands);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6601  		return ERR_PTR(-ENOME=
M);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6602  	}
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6603  	cands->kind =3D btf_ki=
nd(local_type);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6604  	cands->name_len =3D lo=
cal_essent_len;
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6605  =

11b37572bb5db7 Alexei Starovoitov 2021-09-16  6606  	cc =3D check_cand_cach=
e(cands, vmlinux_cand_cache, VMLINUX_CAND_CACHE_SIZE);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6607  	if (cc) {
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6608  		if (cc->cnt) {
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6609  			bpf_free_cands(cands=
);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6610  			return cc;
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6611  		}
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6612  		goto check_modules;
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6613  	}
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6614  =

11b37572bb5db7 Alexei Starovoitov 2021-09-16  6615  	/* Attempt to find tar=
get candidates in vmlinux BTF first */
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6616  	main_btf =3D bpf_get_b=
tf_vmlinux();
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6617  	cands =3D bpf_core_add=
_cands(cands, main_btf, 1);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6618  	if (IS_ERR(cands))
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6619  		return cands;
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6620  =

11b37572bb5db7 Alexei Starovoitov 2021-09-16  6621  	/* populate cache even=
 when cands->cnt =3D=3D 0 */
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6622  	populate_cand_cache(ca=
nds, vmlinux_cand_cache, VMLINUX_CAND_CACHE_SIZE);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6623  =

11b37572bb5db7 Alexei Starovoitov 2021-09-16  6624  	/* if vmlinux BTF has =
any candidate, don't go for module BTFs */
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6625  	if (cands->cnt)
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6626  		return cands;
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6627  =

11b37572bb5db7 Alexei Starovoitov 2021-09-16  6628  check_modules:
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6629  	cc =3D check_cand_cach=
e(cands, module_cand_cache, MODULE_CAND_CACHE_SIZE);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6630  	if (cc) {
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6631  		bpf_free_cands(cands);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6632  		/* if cache has it re=
turn it even if cc->cnt =3D=3D 0 */
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6633  		return cc;
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6634  	}
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6635  =

11b37572bb5db7 Alexei Starovoitov 2021-09-16  6636  	/* If candidate is not=
 found in vmlinux's BTF then search in module's BTFs */
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6637  	spin_lock_bh(&btf_idr_=
lock);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6638  	idr_for_each_entry(&bt=
f_idr, mod_btf, id) {
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6639  		if (!btf_is_module(mo=
d_btf))
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6640  			continue;
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6641  		/* linear search coul=
d be slow hence unlock/lock
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6642  		 * the IDR to avoidin=
g holding it for too long
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6643  		 */
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6644  		btf_get(mod_btf);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6645  		spin_unlock_bh(&btf_i=
dr_lock);
11b37572bb5db7 Alexei Starovoitov 2021-09-16 @6646  		cands =3D bpf_core_ad=
d_cands(cands, mod_btf, btf_nr_types(main_btf));
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6647  		if (IS_ERR(cands)) {
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6648  			btf_put(mod_btf);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6649  			return cands;
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6650  		}
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6651  		spin_lock_bh(&btf_idr=
_lock);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6652  		btf_put(mod_btf);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6653  	}
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6654  	spin_unlock_bh(&btf_id=
r_lock);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6655  	/* populate cache even=
 when cands->cnt =3D=3D 0 */
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6656  	populate_cand_cache(ca=
nds, module_cand_cache, MODULE_CAND_CACHE_SIZE);
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6657  	return cands;
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6658  }
11b37572bb5db7 Alexei Starovoitov 2021-09-16  6659  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5129468217711517077==--

