Content-Type: multipart/mixed; boundary="===============3458557451728527169=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next v5 4/8] bpf: support attaching freplace programs to multiple attach points
Date: Thu, 17 Sep 2020 07:46:08 +0800
Message-ID: <202009170717.M75ewFSA%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3458557451728527169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <160017006133.98230.8867570651560085505.stgit@toke.dk>
References: <160017006133.98230.8867570651560085505.stgit@toke.dk>
TO: "Toke H=C3=B8iland-J=C3=B8rgensen" <toke@redhat.com>

Hi "Toke,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Toke-H-iland-J-rgensen/bpf=
-change-logging-calls-from-verbose-to-bpf_log-and-use-log-pointer/20200916-=
085115
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
compiler: s390-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   kernel/bpf/verifier.c:2624:9: warning: Identical condition 'err', second=
 condition is always false [identicalConditionAfterEarlyExit]
    return err;
           ^
   kernel/bpf/verifier.c:2607:6: note: first condition
    if (err)
        ^
   kernel/bpf/verifier.c:2624:9: note: second condition
    return err;
           ^
>> kernel/bpf/verifier.c:11206:36: warning: Either the condition 'if(tgt_pr=
og&&conservative)' is redundant or there is possible null pointer dereferen=
ce: tgt_prog. [nullPointerRedundantCheck]
          prog->aux->tgt_prog_type !=3D tgt_prog->type) ||
                                      ^
   kernel/bpf/verifier.c:11211:6: note: Assuming that condition 'if(tgt_pro=
g&&conservative)' is not redundant
     if (tgt_prog && conservative)
        ^
   kernel/bpf/verifier.c:11206:36: note: Null pointer dereference
          prog->aux->tgt_prog_type !=3D tgt_prog->type) ||
                                      ^
   kernel/bpf/verifier.c:11208:38: warning: Either the condition 'if(tgt_pr=
og&&conservative)' is redundant or there is possible null pointer dereferen=
ce: tgt_prog. [nullPointerRedundantCheck]
          prog->aux->tgt_attach_type !=3D tgt_prog->expected_attach_type))
                                        ^
   kernel/bpf/verifier.c:11211:6: note: Assuming that condition 'if(tgt_pro=
g&&conservative)' is not redundant
     if (tgt_prog && conservative)
        ^
   kernel/bpf/verifier.c:11208:38: note: Null pointer dereference
          prog->aux->tgt_attach_type !=3D tgt_prog->expected_attach_type))
                                        ^
   kernel/bpf/verifier.c:11377:6: warning: Variable 'ret' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
    ret =3D -ENOMEM;
        ^
   kernel/bpf/verifier.c:11359:0: note: Variable 'ret' is reassigned a valu=
e before the old one has been used.
    int i, len, ret =3D -EINVAL;
   ^
   kernel/bpf/verifier.c:11377:6: note: Variable 'ret' is reassigned a valu=
e before the old one has been used.
    ret =3D -ENOMEM;
        ^
   kernel/bpf/verifier.c:11434:6: warning: Variable 'ret' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
    ret =3D replace_map_fd_with_map_ptr(env);
        ^
   kernel/bpf/verifier.c:11377:6: note: Variable 'ret' is reassigned a valu=
e before the old one has been used.
    ret =3D -ENOMEM;
        ^
   kernel/bpf/verifier.c:11434:6: note: Variable 'ret' is reassigned a valu=
e before the old one has been used.
    ret =3D replace_map_fd_with_map_ptr(env);
        ^
   kernel/bpf/verifier.c:11434:6: warning: Variable 'ret' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
    ret =3D replace_map_fd_with_map_ptr(env);
        ^
   kernel/bpf/verifier.c:11405:7: note: Variable 'ret' is reassigned a valu=
e before the old one has been used.
     ret =3D -EINVAL;
         ^
   kernel/bpf/verifier.c:11434:6: note: Variable 'ret' is reassigned a valu=
e before the old one has been used.
    ret =3D replace_map_fd_with_map_ptr(env);
        ^
   kernel/bpf/verifier.c:11451:6: warning: Variable 'ret' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
    ret =3D check_subprogs(env);
        ^
   kernel/bpf/verifier.c:11447:6: note: Variable 'ret' is reassigned a valu=
e before the old one has been used.
    ret =3D -ENOMEM;
        ^
   kernel/bpf/verifier.c:11451:6: note: Variable 'ret' is reassigned a valu=
e before the old one has been used.
    ret =3D check_subprogs(env);
        ^
   kernel/bpf/verifier.c:1963:25: warning: Local variable func shadows oute=
r function [shadowFunction]
    struct bpf_func_state *func;
                           ^
   kernel/bpf/verifier.c:535:31: note: Shadowed declaration
   static struct bpf_func_state *func(struct bpf_verifier_env *env,
                                 ^
   kernel/bpf/verifier.c:1963:25: note: Shadow variable
    struct bpf_func_state *func;
                           ^
   kernel/bpf/verifier.c:1996:25: warning: Local variable func shadows oute=
r function [shadowFunction]
    struct bpf_func_state *func;
                           ^
   kernel/bpf/verifier.c:535:31: note: Shadowed declaration
   static struct bpf_func_state *func(struct bpf_verifier_env *env,
                                 ^
   kernel/bpf/verifier.c:1996:25: note: Shadow variable
    struct bpf_func_state *func;
                           ^
   kernel/bpf/verifier.c:7316:25: warning: Local variable src_reg shadows o=
uter variable [shadowVar]
     struct bpf_reg_state *src_reg =3D &regs[insn->src_reg];
                           ^
   kernel/bpf/verifier.c:7220:54: note: Shadowed declaration
    struct bpf_reg_state *dst_reg, *other_branch_regs, *src_reg =3D NULL;
                                                        ^
   kernel/bpf/verifier.c:7316:25: note: Shadow variable
     struct bpf_reg_state *src_reg =3D &regs[insn->src_reg];

# https://github.com/0day-ci/linux/commit/63e92b3278bbe1301a49b822500ebed16=
6c130a3
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Toke-H-iland-J-rgensen/bpf-change-logging-=
calls-from-verbose-to-bpf_log-and-use-log-pointer/20200916-085115
git checkout 63e92b3278bbe1301a49b822500ebed166c130a3
vim +11206 kernel/bpf/verifier.c

1e6c62a8821557 Alexei Starovoitov     2020-08-27  11039  =

23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11040  int bpf_=
check_attach_target(struct bpf_verifier_log *log,
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11041  			    c=
onst struct bpf_prog *prog,
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11042  			    c=
onst struct bpf_prog *tgt_prog,
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11043  			    u=
32 btf_id,
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11044  			    s=
truct btf_func_model *fmodel,
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11045  			    l=
ong *tgt_addr,
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11046  			    c=
onst char **tgt_name,
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11047  			    c=
onst struct btf_type **tgt_type)
38207291604401 Martin KaFai Lau       2019-10-24  11048  {
be8704ff07d237 Alexei Starovoitov     2020-01-20  11049  	bool prog_extensi=
on =3D prog->type =3D=3D BPF_PROG_TYPE_EXT;
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  11050  	const char prefix=
[] =3D "btf_trace_";
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11051  	int ret =3D 0, su=
bprog =3D -1, i;
38207291604401 Martin KaFai Lau       2019-10-24  11052  	const struct btf_=
type *t;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11053  	bool conservative=
 =3D true;
38207291604401 Martin KaFai Lau       2019-10-24  11054  	const char *tname;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11055  	struct btf *btf;
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11056  	long ad=
dr =3D 0;
38207291604401 Martin KaFai Lau       2019-10-24  11057  =

f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  11058  	if (!btf_id) {
2bc773a4b52761 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11059  		bpf_lo=
g(log, "Tracing programs must provide btf_id\n");
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  11060  		return -EINVAL;
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  11061  	}
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11062  	btf =3D=
 tgt_prog ? tgt_prog->aux->btf : btf_vmlinux;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11063  	if (!btf) {
2bc773a4b52761 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11064  		bpf_lo=
g(log,
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11065  			"FENTRY/FEXIT p=
rogram can only be attached to another program annotated with BTF\n");
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11066  		return -EINVAL;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11067  	}
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11068  	t =3D btf_type_by=
_id(btf, btf_id);
38207291604401 Martin KaFai Lau       2019-10-24  11069  	if (!t) {
2bc773a4b52761 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11070  		bpf_lo=
g(log, "attach_btf_id %u is invalid\n", btf_id);
38207291604401 Martin KaFai Lau       2019-10-24  11071  		return -EINVAL;
38207291604401 Martin KaFai Lau       2019-10-24  11072  	}
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11073  	tname =3D btf_nam=
e_by_offset(btf, t->name_off);
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  11074  	if (!tname) {
2bc773a4b52761 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11075  		bpf_lo=
g(log, "attach_btf_id %u doesn't have a name\n", btf_id);
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  11076  		return -EINVAL;
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  11077  	}
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11078  	if (tgt_prog) {
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11079  		struct bpf_prog_=
aux *aux =3D tgt_prog->aux;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11080  =

5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11081  		for (i =3D 0; i =
< aux->func_info_cnt; i++)
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11082  			if (aux->func_i=
nfo[i].type_id =3D=3D btf_id) {
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11083  				subprog =3D i;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11084  				break;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11085  			}
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11086  		if (subprog =3D=
=3D -1) {
2bc773a4b52761 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11087  			bpf_l=
og(log, "Subprog %s doesn't exist\n", tname);
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11088  			return -EINVAL;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11089  		}
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11090  		conservative =3D=
 aux->func_info_aux[subprog].unreliable;
be8704ff07d237 Alexei Starovoitov     2020-01-20  11091  		if (prog_extensi=
on) {
be8704ff07d237 Alexei Starovoitov     2020-01-20  11092  			if (conservativ=
e) {
2bc773a4b52761 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11093  				bpf_=
log(log,
be8704ff07d237 Alexei Starovoitov     2020-01-20  11094  					"Cannot repla=
ce static functions\n");
be8704ff07d237 Alexei Starovoitov     2020-01-20  11095  				return -EINVAL;
be8704ff07d237 Alexei Starovoitov     2020-01-20  11096  			}
be8704ff07d237 Alexei Starovoitov     2020-01-20  11097  			if (!prog->jit_=
requested) {
2bc773a4b52761 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11098  				bpf_=
log(log,
be8704ff07d237 Alexei Starovoitov     2020-01-20  11099  					"Extension pr=
ograms should be JITed\n");
be8704ff07d237 Alexei Starovoitov     2020-01-20  11100  				return -EINVAL;
be8704ff07d237 Alexei Starovoitov     2020-01-20  11101  			}
be8704ff07d237 Alexei Starovoitov     2020-01-20  11102  		}
be8704ff07d237 Alexei Starovoitov     2020-01-20  11103  		if (!tgt_prog->j=
ited) {
2bc773a4b52761 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11104  			bpf_l=
og(log, "Can attach to only JITed progs\n");
be8704ff07d237 Alexei Starovoitov     2020-01-20  11105  			return -EINVAL;
be8704ff07d237 Alexei Starovoitov     2020-01-20  11106  		}
be8704ff07d237 Alexei Starovoitov     2020-01-20  11107  		if (tgt_prog->ty=
pe =3D=3D prog->type) {
be8704ff07d237 Alexei Starovoitov     2020-01-20  11108  			/* Cannot fentr=
y/fexit another fentry/fexit program.
be8704ff07d237 Alexei Starovoitov     2020-01-20  11109  			 * Cannot attac=
h program extension to another extension.
be8704ff07d237 Alexei Starovoitov     2020-01-20  11110  			 * It's ok to a=
ttach fentry/fexit to extension program.
be8704ff07d237 Alexei Starovoitov     2020-01-20  11111  			 */
2bc773a4b52761 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11112  			bpf_l=
og(log, "Cannot recursively attach\n");
be8704ff07d237 Alexei Starovoitov     2020-01-20  11113  			return -EINVAL;
be8704ff07d237 Alexei Starovoitov     2020-01-20  11114  		}
be8704ff07d237 Alexei Starovoitov     2020-01-20  11115  		if (tgt_prog->ty=
pe =3D=3D BPF_PROG_TYPE_TRACING &&
be8704ff07d237 Alexei Starovoitov     2020-01-20  11116  		    prog_extensi=
on &&
be8704ff07d237 Alexei Starovoitov     2020-01-20  11117  		    (tgt_prog->e=
xpected_attach_type =3D=3D BPF_TRACE_FENTRY ||
be8704ff07d237 Alexei Starovoitov     2020-01-20  11118  		     tgt_prog->e=
xpected_attach_type =3D=3D BPF_TRACE_FEXIT)) {
be8704ff07d237 Alexei Starovoitov     2020-01-20  11119  			/* Program exte=
nsions can extend all program types
be8704ff07d237 Alexei Starovoitov     2020-01-20  11120  			 * except fentr=
y/fexit. The reason is the following.
be8704ff07d237 Alexei Starovoitov     2020-01-20  11121  			 * The fentry/f=
exit programs are used for performance
be8704ff07d237 Alexei Starovoitov     2020-01-20  11122  			 * analysis, st=
ats and can be attached to any program
be8704ff07d237 Alexei Starovoitov     2020-01-20  11123  			 * type except =
themselves. When extension program is
be8704ff07d237 Alexei Starovoitov     2020-01-20  11124  			 * replacing XD=
P function it is necessary to allow
be8704ff07d237 Alexei Starovoitov     2020-01-20  11125  			 * performance =
analysis of all functions. Both original
be8704ff07d237 Alexei Starovoitov     2020-01-20  11126  			 * XDP program =
and its program extension. Hence
be8704ff07d237 Alexei Starovoitov     2020-01-20  11127  			 * attaching fe=
ntry/fexit to BPF_PROG_TYPE_EXT is
be8704ff07d237 Alexei Starovoitov     2020-01-20  11128  			 * allowed. If =
extending of fentry/fexit was allowed it
be8704ff07d237 Alexei Starovoitov     2020-01-20  11129  			 * would be pos=
sible to create long call chain
be8704ff07d237 Alexei Starovoitov     2020-01-20  11130  			 * fentry->exte=
nsion->fentry->extension beyond
be8704ff07d237 Alexei Starovoitov     2020-01-20  11131  			 * reasonable s=
tack size. Hence extending fentry is not
be8704ff07d237 Alexei Starovoitov     2020-01-20  11132  			 * allowed.
be8704ff07d237 Alexei Starovoitov     2020-01-20  11133  			 */
2bc773a4b52761 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11134  			bpf_l=
og(log, "Cannot extend fentry/fexit\n");
be8704ff07d237 Alexei Starovoitov     2020-01-20  11135  			return -EINVAL;
be8704ff07d237 Alexei Starovoitov     2020-01-20  11136  		}
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11137  	} else {
be8704ff07d237 Alexei Starovoitov     2020-01-20  11138  		if (prog_extensi=
on) {
2bc773a4b52761 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11139  			bpf_l=
og(log, "Cannot replace kernel functions\n");
be8704ff07d237 Alexei Starovoitov     2020-01-20  11140  			return -EINVAL;
be8704ff07d237 Alexei Starovoitov     2020-01-20  11141  		}
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11142  	}
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  11143  =

f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  11144  	switch (prog->exp=
ected_attach_type) {
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  11145  	case BPF_TRACE_RA=
W_TP:
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11146  		if (tgt_prog) {
2bc773a4b52761 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11147  			bpf_l=
og(log,
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11148  				"Only FENTRY/F=
EXIT progs are attachable to another BPF prog\n");
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11149  			return -EINVAL;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11150  		}
38207291604401 Martin KaFai Lau       2019-10-24  11151  		if (!btf_type_is=
_typedef(t)) {
2bc773a4b52761 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11152  			bpf_l=
og(log, "attach_btf_id %u is not a typedef\n",
38207291604401 Martin KaFai Lau       2019-10-24  11153  				btf_id);
38207291604401 Martin KaFai Lau       2019-10-24  11154  			return -EINVAL;
38207291604401 Martin KaFai Lau       2019-10-24  11155  		}
f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  11156  		if (strncmp(pref=
ix, tname, sizeof(prefix) - 1)) {
2bc773a4b52761 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11157  			bpf_l=
og(log, "attach_btf_id %u points to wrong type name %s\n",
38207291604401 Martin KaFai Lau       2019-10-24  11158  				btf_id, tname);
38207291604401 Martin KaFai Lau       2019-10-24  11159  			return -EINVAL;
38207291604401 Martin KaFai Lau       2019-10-24  11160  		}
38207291604401 Martin KaFai Lau       2019-10-24  11161  		tname +=3D sizeo=
f(prefix) - 1;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11162  		t =3D btf_type_b=
y_id(btf, t->type);
38207291604401 Martin KaFai Lau       2019-10-24  11163  		if (!btf_type_is=
_ptr(t))
38207291604401 Martin KaFai Lau       2019-10-24  11164  			/* should never=
 happen in valid vmlinux build */
38207291604401 Martin KaFai Lau       2019-10-24  11165  			return -EINVAL;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11166  		t =3D btf_type_b=
y_id(btf, t->type);
38207291604401 Martin KaFai Lau       2019-10-24  11167  		if (!btf_type_is=
_func_proto(t))
38207291604401 Martin KaFai Lau       2019-10-24  11168  			/* should never=
 happen in valid vmlinux build */
38207291604401 Martin KaFai Lau       2019-10-24  11169  			return -EINVAL;
38207291604401 Martin KaFai Lau       2019-10-24  11170  =

23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11171  		break;
15d83c4d7cef5c Yonghong Song          2020-05-09  11172  	case BPF_TRACE_IT=
ER:
15d83c4d7cef5c Yonghong Song          2020-05-09  11173  		if (!btf_type_is=
_func(t)) {
2bc773a4b52761 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11174  			bpf_l=
og(log, "attach_btf_id %u is not a function\n",
15d83c4d7cef5c Yonghong Song          2020-05-09  11175  				btf_id);
15d83c4d7cef5c Yonghong Song          2020-05-09  11176  			return -EINVAL;
15d83c4d7cef5c Yonghong Song          2020-05-09  11177  		}
15d83c4d7cef5c Yonghong Song          2020-05-09  11178  		t =3D btf_type_b=
y_id(btf, t->type);
15d83c4d7cef5c Yonghong Song          2020-05-09  11179  		if (!btf_type_is=
_func_proto(t))
15d83c4d7cef5c Yonghong Song          2020-05-09  11180  			return -EINVAL;
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11181  		ret =
=3D btf_distill_func_proto(log, btf, t, tname, fmodel);
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11182  		if (re=
t)
15d83c4d7cef5c Yonghong Song          2020-05-09  11183  			return ret;
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11184  		break;
be8704ff07d237 Alexei Starovoitov     2020-01-20  11185  	default:
be8704ff07d237 Alexei Starovoitov     2020-01-20  11186  		if (!prog_extens=
ion)
be8704ff07d237 Alexei Starovoitov     2020-01-20  11187  			return -EINVAL;
be8704ff07d237 Alexei Starovoitov     2020-01-20  11188  		/* fallthrough */
ae24082331d9bb KP Singh               2020-03-04  11189  	case BPF_MODIFY_R=
ETURN:
9e4e01dfd3254c KP Singh               2020-03-29  11190  	case BPF_LSM_MAC:
fec56f5890d93f Alexei Starovoitov     2019-11-14  11191  	case BPF_TRACE_FE=
NTRY:
fec56f5890d93f Alexei Starovoitov     2019-11-14  11192  	case BPF_TRACE_FE=
XIT:
fec56f5890d93f Alexei Starovoitov     2019-11-14  11193  		if (!btf_type_is=
_func(t)) {
2bc773a4b52761 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11194  			bpf_l=
og(log, "attach_btf_id %u is not a function\n",
fec56f5890d93f Alexei Starovoitov     2019-11-14  11195  				btf_id);
fec56f5890d93f Alexei Starovoitov     2019-11-14  11196  			return -EINVAL;
fec56f5890d93f Alexei Starovoitov     2019-11-14  11197  		}
be8704ff07d237 Alexei Starovoitov     2020-01-20  11198  		if (prog_extensi=
on &&
2bc773a4b52761 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11199  		    bt=
f_check_type_match(log, prog, btf, t))
be8704ff07d237 Alexei Starovoitov     2020-01-20  11200  			return -EINVAL;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11201  		t =3D btf_type_b=
y_id(btf, t->type);
fec56f5890d93f Alexei Starovoitov     2019-11-14  11202  		if (!btf_type_is=
_func_proto(t))
fec56f5890d93f Alexei Starovoitov     2019-11-14  11203  			return -EINVAL;
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11204  =

63e92b3278bbe1 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11205  		if ((p=
rog->aux->tgt_prog_type &&
63e92b3278bbe1 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15 @11206  		     p=
rog->aux->tgt_prog_type !=3D tgt_prog->type) ||
63e92b3278bbe1 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11207  		    (p=
rog->aux->tgt_attach_type &&
63e92b3278bbe1 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11208  		     p=
rog->aux->tgt_attach_type !=3D tgt_prog->expected_attach_type))
63e92b3278bbe1 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11209  			retur=
n -EINVAL;
63e92b3278bbe1 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11210  =

23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11211  		if (tg=
t_prog && conservative)
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11212  			t =3D NULL;
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11213  =

23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11214  		ret =
=3D btf_distill_func_proto(log, btf, t, tname, fmodel);
fec56f5890d93f Alexei Starovoitov     2019-11-14  11215  		if (ret < 0)
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11216  			retur=
n ret;
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11217  =

5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11218  		if (tgt_prog) {
e9eeec58c992c4 Yonghong Song          2019-12-04  11219  			if (subprog =3D=
=3D 0)
e9eeec58c992c4 Yonghong Song          2019-12-04  11220  				addr =3D (long=
) tgt_prog->bpf_func;
e9eeec58c992c4 Yonghong Song          2019-12-04  11221  			else
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11222  				addr =3D (long=
) tgt_prog->aux->func[subprog]->bpf_func;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11223  		} else {
fec56f5890d93f Alexei Starovoitov     2019-11-14  11224  			addr =3D kallsy=
ms_lookup_name(tname);
fec56f5890d93f Alexei Starovoitov     2019-11-14  11225  			if (!addr) {
2bc773a4b52761 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11226  				bpf_=
log(log,
fec56f5890d93f Alexei Starovoitov     2019-11-14  11227  					"The address =
of function %s cannot be found\n",
fec56f5890d93f Alexei Starovoitov     2019-11-14  11228  					tname);
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11229  				retu=
rn -ENOENT;
fec56f5890d93f Alexei Starovoitov     2019-11-14  11230  			}
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  11231  		}
18644cec714aab Alexei Starovoitov     2020-05-28  11232  =

1e6c62a8821557 Alexei Starovoitov     2020-08-27  11233  		if (prog->aux->s=
leepable) {
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11234  			ret =3D -EINVAL;
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11235  			switch (prog->t=
ype) {
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11236  			case BPF_PROG_T=
YPE_TRACING:
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11237  				/* fentry/fexi=
t/fmod_ret progs can be sleepable only if they are
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11238  				 * attached to=
 ALLOW_ERROR_INJECTION and are not in denylist.
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11239  				 */
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11240  				if (!check_non=
_sleepable_error_inject(btf_id) &&
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11241  				    within_err=
or_injection_list(addr))
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11242  					ret =3D 0;
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11243  				break;
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11244  			case BPF_PROG_T=
YPE_LSM:
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11245  				/* LSM progs c=
heck that they are attached to bpf_lsm_*() funcs.
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11246  				 * Only some o=
f them are sleepable.
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11247  				 */
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11248  				if (check_slee=
pable_lsm_hook(btf_id))
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11249  					ret =3D 0;
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11250  				break;
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11251  			default:
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11252  				break;
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11253  			}
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11254  			if (r=
et) {
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11255  				bpf_=
log(log, "%s is not sleepable\n", tname);
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11256  				retu=
rn ret;
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11257  			}
1e6c62a8821557 Alexei Starovoitov     2020-08-27  11258  		} else if (prog-=
>expected_attach_type =3D=3D BPF_MODIFY_RETURN) {
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11259  			ret =
=3D check_attach_modify_return(prog, addr, tname);
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11260  			if (r=
et) {
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11261  				bpf_=
log(log, "%s() is not modifiable\n", tname);
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11262  				retu=
rn ret;
18644cec714aab Alexei Starovoitov     2020-05-28  11263  			}
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11264  		}
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11265  =

23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11266  		break;
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11267  	}
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11268  	*tgt_ad=
dr =3D addr;
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11269  	if (tgt=
_name)
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11270  		*tgt_n=
ame =3D tname;
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11271  	if (tgt=
_type)
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11272  		*tgt_t=
ype =3D t;
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11273  	return =
0;
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11274  }
23c5f908e2d812 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-15  11275  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3458557451728527169==--

