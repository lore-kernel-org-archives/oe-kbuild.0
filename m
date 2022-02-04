Content-Type: multipart/mixed; boundary="===============1895038025461619768=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/net/bpf_jit_comp.c:225 bpf_int_jit_compile() error: uninitialized symbol 'pass'.
Date: Fri, 04 Feb 2022 09:29:09 +0800
Message-ID: <202202040124.7MMKaXXV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1895038025461619768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   88808fbbead481aedb46640a5ace69c58287f56a
commit: 51c66ad849a703d9bbfd7704c941827aed0fd9fd powerpc/bpf: Implement ext=
ended BPF on PPC32
date:   10 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 10 months ago
config: powerpc-randconfig-m031-20220130 (https://download.01.org/0day-ci/a=
rchive/20220204/202202040124.7MMKaXXV-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/powerpc/net/bpf_jit_comp.c:225 bpf_int_jit_compile() error: uninitiali=
zed symbol 'pass'.

vim +/pass +225 arch/powerpc/net/bpf_jit_comp.c

4ea76e90a97d22 Christophe Leroy 2021-03-22   87  =

4ea76e90a97d22 Christophe Leroy 2021-03-22   88  struct bpf_prog *bpf_int_j=
it_compile(struct bpf_prog *fp)
4ea76e90a97d22 Christophe Leroy 2021-03-22   89  {
4ea76e90a97d22 Christophe Leroy 2021-03-22   90  	u32 proglen;
4ea76e90a97d22 Christophe Leroy 2021-03-22   91  	u32 alloclen;
4ea76e90a97d22 Christophe Leroy 2021-03-22   92  	u8 *image =3D NULL;
4ea76e90a97d22 Christophe Leroy 2021-03-22   93  	u32 *code_base;
4ea76e90a97d22 Christophe Leroy 2021-03-22   94  	u32 *addrs;
4ea76e90a97d22 Christophe Leroy 2021-03-22   95  	struct powerpc64_jit_data=
 *jit_data;
4ea76e90a97d22 Christophe Leroy 2021-03-22   96  	struct codegen_context cg=
ctx;
4ea76e90a97d22 Christophe Leroy 2021-03-22   97  	int pass;
4ea76e90a97d22 Christophe Leroy 2021-03-22   98  	int flen;
4ea76e90a97d22 Christophe Leroy 2021-03-22   99  	struct bpf_binary_header =
*bpf_hdr;
4ea76e90a97d22 Christophe Leroy 2021-03-22  100  	struct bpf_prog *org_fp =
=3D fp;
4ea76e90a97d22 Christophe Leroy 2021-03-22  101  	struct bpf_prog *tmp_fp;
4ea76e90a97d22 Christophe Leroy 2021-03-22  102  	bool bpf_blinded =3D fals=
e;
4ea76e90a97d22 Christophe Leroy 2021-03-22  103  	bool extra_pass =3D false;
4ea76e90a97d22 Christophe Leroy 2021-03-22  104  =

4ea76e90a97d22 Christophe Leroy 2021-03-22  105  	if (!fp->jit_requested)
4ea76e90a97d22 Christophe Leroy 2021-03-22  106  		return org_fp;
4ea76e90a97d22 Christophe Leroy 2021-03-22  107  =

4ea76e90a97d22 Christophe Leroy 2021-03-22  108  	tmp_fp =3D bpf_jit_blind_=
constants(org_fp);
4ea76e90a97d22 Christophe Leroy 2021-03-22  109  	if (IS_ERR(tmp_fp))
4ea76e90a97d22 Christophe Leroy 2021-03-22  110  		return org_fp;
4ea76e90a97d22 Christophe Leroy 2021-03-22  111  =

4ea76e90a97d22 Christophe Leroy 2021-03-22  112  	if (tmp_fp !=3D org_fp) {
4ea76e90a97d22 Christophe Leroy 2021-03-22  113  		bpf_blinded =3D true;
4ea76e90a97d22 Christophe Leroy 2021-03-22  114  		fp =3D tmp_fp;
4ea76e90a97d22 Christophe Leroy 2021-03-22  115  	}
4ea76e90a97d22 Christophe Leroy 2021-03-22  116  =

4ea76e90a97d22 Christophe Leroy 2021-03-22  117  	jit_data =3D fp->aux->jit=
_data;
4ea76e90a97d22 Christophe Leroy 2021-03-22  118  	if (!jit_data) {
4ea76e90a97d22 Christophe Leroy 2021-03-22  119  		jit_data =3D kzalloc(siz=
eof(*jit_data), GFP_KERNEL);
4ea76e90a97d22 Christophe Leroy 2021-03-22  120  		if (!jit_data) {
4ea76e90a97d22 Christophe Leroy 2021-03-22  121  			fp =3D org_fp;
4ea76e90a97d22 Christophe Leroy 2021-03-22  122  			goto out;
4ea76e90a97d22 Christophe Leroy 2021-03-22  123  		}
4ea76e90a97d22 Christophe Leroy 2021-03-22  124  		fp->aux->jit_data =3D ji=
t_data;
4ea76e90a97d22 Christophe Leroy 2021-03-22  125  	}
4ea76e90a97d22 Christophe Leroy 2021-03-22  126  =

4ea76e90a97d22 Christophe Leroy 2021-03-22  127  	flen =3D fp->len;
4ea76e90a97d22 Christophe Leroy 2021-03-22  128  	addrs =3D jit_data->addrs;
4ea76e90a97d22 Christophe Leroy 2021-03-22  129  	if (addrs) {
4ea76e90a97d22 Christophe Leroy 2021-03-22  130  		cgctx =3D jit_data->ctx;
4ea76e90a97d22 Christophe Leroy 2021-03-22  131  		image =3D jit_data->imag=
e;
4ea76e90a97d22 Christophe Leroy 2021-03-22  132  		bpf_hdr =3D jit_data->he=
ader;
4ea76e90a97d22 Christophe Leroy 2021-03-22  133  		proglen =3D jit_data->pr=
oglen;
4ea76e90a97d22 Christophe Leroy 2021-03-22  134  		alloclen =3D proglen + F=
UNCTION_DESCR_SIZE;
4ea76e90a97d22 Christophe Leroy 2021-03-22  135  		extra_pass =3D true;
4ea76e90a97d22 Christophe Leroy 2021-03-22  136  		goto skip_init_ctx;
4ea76e90a97d22 Christophe Leroy 2021-03-22  137  	}
4ea76e90a97d22 Christophe Leroy 2021-03-22  138  =

4ea76e90a97d22 Christophe Leroy 2021-03-22  139  	addrs =3D kcalloc(flen + =
1, sizeof(*addrs), GFP_KERNEL);
4ea76e90a97d22 Christophe Leroy 2021-03-22  140  	if (addrs =3D=3D NULL) {
4ea76e90a97d22 Christophe Leroy 2021-03-22  141  		fp =3D org_fp;
4ea76e90a97d22 Christophe Leroy 2021-03-22  142  		goto out_addrs;
4ea76e90a97d22 Christophe Leroy 2021-03-22  143  	}
4ea76e90a97d22 Christophe Leroy 2021-03-22  144  =

4ea76e90a97d22 Christophe Leroy 2021-03-22  145  	memset(&cgctx, 0, sizeof(=
struct codegen_context));
4ea76e90a97d22 Christophe Leroy 2021-03-22  146  =

4ea76e90a97d22 Christophe Leroy 2021-03-22  147  	/* Make sure that the sta=
ck is quadword aligned. */
4ea76e90a97d22 Christophe Leroy 2021-03-22  148  	cgctx.stack_size =3D roun=
d_up(fp->aux->stack_depth, 16);
4ea76e90a97d22 Christophe Leroy 2021-03-22  149  =

4ea76e90a97d22 Christophe Leroy 2021-03-22  150  	/* Scouting faux-generate=
 pass 0 */
4ea76e90a97d22 Christophe Leroy 2021-03-22  151  	if (bpf_jit_build_body(fp=
, 0, &cgctx, addrs, false)) {
4ea76e90a97d22 Christophe Leroy 2021-03-22  152  		/* We hit something ille=
gal or unsupported. */
4ea76e90a97d22 Christophe Leroy 2021-03-22  153  		fp =3D org_fp;
4ea76e90a97d22 Christophe Leroy 2021-03-22  154  		goto out_addrs;
4ea76e90a97d22 Christophe Leroy 2021-03-22  155  	}
4ea76e90a97d22 Christophe Leroy 2021-03-22  156  =

4ea76e90a97d22 Christophe Leroy 2021-03-22  157  	/*
4ea76e90a97d22 Christophe Leroy 2021-03-22  158  	 * If we have seen a tail=
 call, we need a second pass.
4ea76e90a97d22 Christophe Leroy 2021-03-22  159  	 * This is because bpf_ji=
t_emit_common_epilogue() is called
4ea76e90a97d22 Christophe Leroy 2021-03-22  160  	 * from bpf_jit_emit_tail=
_call() with a not yet stable ctx->seen.
4ea76e90a97d22 Christophe Leroy 2021-03-22  161  	 */
4ea76e90a97d22 Christophe Leroy 2021-03-22  162  	if (cgctx.seen & SEEN_TAI=
LCALL) {
4ea76e90a97d22 Christophe Leroy 2021-03-22  163  		cgctx.idx =3D 0;
4ea76e90a97d22 Christophe Leroy 2021-03-22  164  		if (bpf_jit_build_body(f=
p, 0, &cgctx, addrs, false)) {
4ea76e90a97d22 Christophe Leroy 2021-03-22  165  			fp =3D org_fp;
4ea76e90a97d22 Christophe Leroy 2021-03-22  166  			goto out_addrs;
4ea76e90a97d22 Christophe Leroy 2021-03-22  167  		}
4ea76e90a97d22 Christophe Leroy 2021-03-22  168  	}
4ea76e90a97d22 Christophe Leroy 2021-03-22  169  =

4ea76e90a97d22 Christophe Leroy 2021-03-22  170  	/*
4ea76e90a97d22 Christophe Leroy 2021-03-22  171  	 * Pretend to build prolo=
gue, given the features we've seen.  This will
4ea76e90a97d22 Christophe Leroy 2021-03-22  172  	 * update ctgtx.idx as it=
 pretends to output instructions, then we can
4ea76e90a97d22 Christophe Leroy 2021-03-22  173  	 * calculate total size f=
rom idx.
4ea76e90a97d22 Christophe Leroy 2021-03-22  174  	 */
4ea76e90a97d22 Christophe Leroy 2021-03-22  175  	bpf_jit_build_prologue(0,=
 &cgctx);
4ea76e90a97d22 Christophe Leroy 2021-03-22  176  	bpf_jit_build_epilogue(0,=
 &cgctx);
4ea76e90a97d22 Christophe Leroy 2021-03-22  177  =

4ea76e90a97d22 Christophe Leroy 2021-03-22  178  	proglen =3D cgctx.idx * 4;
4ea76e90a97d22 Christophe Leroy 2021-03-22  179  	alloclen =3D proglen + FU=
NCTION_DESCR_SIZE;
4ea76e90a97d22 Christophe Leroy 2021-03-22  180  =

4ea76e90a97d22 Christophe Leroy 2021-03-22  181  	bpf_hdr =3D bpf_jit_binar=
y_alloc(alloclen, &image, 4, bpf_jit_fill_ill_insns);
4ea76e90a97d22 Christophe Leroy 2021-03-22  182  	if (!bpf_hdr) {
4ea76e90a97d22 Christophe Leroy 2021-03-22  183  		fp =3D org_fp;
4ea76e90a97d22 Christophe Leroy 2021-03-22  184  		goto out_addrs;
4ea76e90a97d22 Christophe Leroy 2021-03-22  185  	}
4ea76e90a97d22 Christophe Leroy 2021-03-22  186  =

4ea76e90a97d22 Christophe Leroy 2021-03-22  187  skip_init_ctx:
4ea76e90a97d22 Christophe Leroy 2021-03-22  188  	code_base =3D (u32 *)(ima=
ge + FUNCTION_DESCR_SIZE);
4ea76e90a97d22 Christophe Leroy 2021-03-22  189  =

4ea76e90a97d22 Christophe Leroy 2021-03-22  190  	if (extra_pass) {
4ea76e90a97d22 Christophe Leroy 2021-03-22  191  		/*
4ea76e90a97d22 Christophe Leroy 2021-03-22  192  		 * Do not touch the prol=
ogue and epilogue as they will remain
4ea76e90a97d22 Christophe Leroy 2021-03-22  193  		 * unchanged. Only fix t=
he branch target address for subprog
4ea76e90a97d22 Christophe Leroy 2021-03-22  194  		 * calls in the body.
4ea76e90a97d22 Christophe Leroy 2021-03-22  195  		 *
4ea76e90a97d22 Christophe Leroy 2021-03-22  196  		 * This does not change =
the offsets and lengths of the subprog
4ea76e90a97d22 Christophe Leroy 2021-03-22  197  		 * call instruction sequ=
ences and hence, the size of the JITed
4ea76e90a97d22 Christophe Leroy 2021-03-22  198  		 * image as well.
4ea76e90a97d22 Christophe Leroy 2021-03-22  199  		 */
4ea76e90a97d22 Christophe Leroy 2021-03-22  200  		bpf_jit_fixup_subprog_ca=
lls(fp, code_base, &cgctx, addrs);
4ea76e90a97d22 Christophe Leroy 2021-03-22  201  =

4ea76e90a97d22 Christophe Leroy 2021-03-22  202  		/* There is no need to p=
erform the usual passes. */
4ea76e90a97d22 Christophe Leroy 2021-03-22  203  		goto skip_codegen_passes;
4ea76e90a97d22 Christophe Leroy 2021-03-22  204  	}
4ea76e90a97d22 Christophe Leroy 2021-03-22  205  =

4ea76e90a97d22 Christophe Leroy 2021-03-22  206  	/* Code generation passes=
 1-2 */
4ea76e90a97d22 Christophe Leroy 2021-03-22  207  	for (pass =3D 1; pass < 3=
; pass++) {
4ea76e90a97d22 Christophe Leroy 2021-03-22  208  		/* Now build the prologu=
e, body code & epilogue for real. */
4ea76e90a97d22 Christophe Leroy 2021-03-22  209  		cgctx.idx =3D 0;
4ea76e90a97d22 Christophe Leroy 2021-03-22  210  		bpf_jit_build_prologue(c=
ode_base, &cgctx);
4ea76e90a97d22 Christophe Leroy 2021-03-22  211  		bpf_jit_build_body(fp, c=
ode_base, &cgctx, addrs, extra_pass);
4ea76e90a97d22 Christophe Leroy 2021-03-22  212  		bpf_jit_build_epilogue(c=
ode_base, &cgctx);
4ea76e90a97d22 Christophe Leroy 2021-03-22  213  =

4ea76e90a97d22 Christophe Leroy 2021-03-22  214  		if (bpf_jit_enable > 1)
4ea76e90a97d22 Christophe Leroy 2021-03-22  215  			pr_info("Pass %d: shrin=
k =3D %d, seen =3D 0x%x\n", pass,
4ea76e90a97d22 Christophe Leroy 2021-03-22  216  				proglen - (cgctx.idx *=
 4), cgctx.seen);
4ea76e90a97d22 Christophe Leroy 2021-03-22  217  	}
4ea76e90a97d22 Christophe Leroy 2021-03-22  218  =

4ea76e90a97d22 Christophe Leroy 2021-03-22  219  skip_codegen_passes:
4ea76e90a97d22 Christophe Leroy 2021-03-22  220  	if (bpf_jit_enable > 1)
4ea76e90a97d22 Christophe Leroy 2021-03-22  221  		/*
4ea76e90a97d22 Christophe Leroy 2021-03-22  222  		 * Note that we output t=
he base address of the code_base
4ea76e90a97d22 Christophe Leroy 2021-03-22  223  		 * rather than image, si=
nce opcodes are in code_base.
4ea76e90a97d22 Christophe Leroy 2021-03-22  224  		 */
4ea76e90a97d22 Christophe Leroy 2021-03-22 @225  		bpf_jit_dump(flen, progl=
en, pass, code_base);
4ea76e90a97d22 Christophe Leroy 2021-03-22  226  =


:::::: The code at line 225 was first introduced by commit
:::::: 4ea76e90a97d22f86adbb10044d29d919e620f2e powerpc/bpf: Move common fu=
nctions into bpf_jit_comp.c

:::::: TO: Christophe Leroy <christophe.leroy@csgroup.eu>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1895038025461619768==--

