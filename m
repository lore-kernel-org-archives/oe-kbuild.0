Content-Type: multipart/mixed; boundary="===============2770896523257753766=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ast-bpf:relo_core 7/16] kernel/bpf/btf.c:6673:3-9: preceding lock on line 6668
Date: Fri, 26 Nov 2021 16:32:11 +0800
Message-ID: <202111261631.dZmQUVyP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2770896523257753766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git relo_co=
re
head:   6630cff5bc659de953a4e7ee63d2361b2bd9377d
commit: 74b77ad53dffe0269672963f67c2906d609ef4e7 [7/16] bpf: Add bpf_core_a=
dd_cands() and wire it into bpf_core_apply_relo_insn().
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c022-20211125 (https://download.01.org/0day-ci/ar=
chive/20211126/202111261631.dZmQUVyP-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/btf.c:6673:3-9: preceding lock on line 6668
   kernel/bpf/btf.c:6678:4-10: preceding lock on line 6668

vim +6673 kernel/bpf/btf.c

74b77ad53dffe02 Alexei Starovoitov 2021-09-16  6657  =

6a05dd911cedf0b Alexei Starovoitov 2021-09-08  6658  int bpf_core_apply(str=
uct bpf_core_ctx *ctx, const struct bpf_core_relo *relo,
6a05dd911cedf0b Alexei Starovoitov 2021-09-08  6659  		   int relo_idx, voi=
d *insn)
6a05dd911cedf0b Alexei Starovoitov 2021-09-08  6660  {
74b77ad53dffe02 Alexei Starovoitov 2021-09-16  6661  	struct bpf_core_cand_=
list cands =3D {};
74b77ad53dffe02 Alexei Starovoitov 2021-09-16  6662  	int err;
74b77ad53dffe02 Alexei Starovoitov 2021-09-16  6663  =

74b77ad53dffe02 Alexei Starovoitov 2021-09-16  6664  	if (relo->kind !=3D B=
PF_CORE_TYPE_ID_LOCAL) {
74b77ad53dffe02 Alexei Starovoitov 2021-09-16  6665  		struct bpf_cand_cach=
e *cc;
74b77ad53dffe02 Alexei Starovoitov 2021-09-16  6666  		int i;
74b77ad53dffe02 Alexei Starovoitov 2021-09-16  6667  =

74b77ad53dffe02 Alexei Starovoitov 2021-09-16 @6668  		mutex_lock(&cand_cac=
he_mutex);
74b77ad53dffe02 Alexei Starovoitov 2021-09-16  6669  		cc =3D bpf_core_find=
_cands(ctx, relo->type_id);
74b77ad53dffe02 Alexei Starovoitov 2021-09-16  6670  		if (IS_ERR(cc)) {
74b77ad53dffe02 Alexei Starovoitov 2021-09-16  6671  			bpf_log(ctx->log, "=
target candidate search failed for %d\n",
74b77ad53dffe02 Alexei Starovoitov 2021-09-16  6672  				relo->type_id);
74b77ad53dffe02 Alexei Starovoitov 2021-09-16 @6673  			return PTR_ERR(cc);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2770896523257753766==--

