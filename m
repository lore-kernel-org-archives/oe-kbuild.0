Content-Type: multipart/mixed; boundary="===============7060083510546544062=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next v2] bpf: Refactor check_cfg to use a structured loop.
Date: Sat, 21 Nov 2020 11:33:22 +0800
Message-ID: <202011211140.R5n0URpL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7060083510546544062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20201121015509.3594191-1-wedsonaf@google.com>
References: <20201121015509.3594191-1-wedsonaf@google.com>
TO: Wedson Almeida Filho <wedsonaf@google.com>
TO: bpf(a)vger.kernel.org
TO: daniel(a)iogearbox.net
CC: ast(a)kernel.org
CC: Wedson Almeida Filho <wedsonaf@google.com>

Hi Wedson,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Wedson-Almeida-Filho/bpf-R=
efactor-check_cfg-to-use-a-structured-loop/20201121-100148
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
compiler: arceb-elf-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   kernel/bpf/verifier.c:2670:9: warning: Identical condition 'err', second=
 condition is always false [identicalConditionAfterEarlyExit]
    return err;
           ^
   kernel/bpf/verifier.c:2653:6: note: first condition
    if (err)
        ^
   kernel/bpf/verifier.c:2670:9: note: second condition
    return err;
           ^
>> kernel/bpf/verifier.c:8161:10: warning: Identical condition 'ret', secon=
d condition is always false [identicalConditionAfterEarlyExit]
     return ret;
            ^
   kernel/bpf/verifier.c:8147:7: note: first condition
     if (ret)
         ^
   kernel/bpf/verifier.c:8161:10: note: second condition
     return ret;
            ^
   kernel/bpf/verifier.c:1994:25: warning: Local variable func shadows oute=
r function [shadowFunction]
    struct bpf_func_state *func;
                           ^
   kernel/bpf/verifier.c:551:31: note: Shadowed declaration
   static struct bpf_func_state *func(struct bpf_verifier_env *env,
                                 ^
   kernel/bpf/verifier.c:1994:25: note: Shadow variable
    struct bpf_func_state *func;
                           ^
   kernel/bpf/verifier.c:2027:25: warning: Local variable func shadows oute=
r function [shadowFunction]
    struct bpf_func_state *func;
                           ^
   kernel/bpf/verifier.c:551:31: note: Shadowed declaration
   static struct bpf_func_state *func(struct bpf_verifier_env *env,
                                 ^
   kernel/bpf/verifier.c:2027:25: note: Shadow variable
    struct bpf_func_state *func;

vim +/ret +8161 kernel/bpf/verifier.c

475fb78fbf48592 Alexei Starovoitov   2014-09-26  8106  =

13a826a70281cfb Wedson Almeida Filho 2020-11-21  8107  /* Visits the instru=
ction at index t and returns one of the following:
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8108   *  < 0 - an error o=
ccurred
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8109   *  DONE_EXPLORING -=
 the instruction was fully explored
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8110   *  KEEP_EXPLORING -=
 there is still work to be done before it is fully explored
475fb78fbf48592 Alexei Starovoitov   2014-09-26  8111   */
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8112  static int visit_ins=
n(int t, int insn_cnt, struct bpf_verifier_env *env)
475fb78fbf48592 Alexei Starovoitov   2014-09-26  8113  {
475fb78fbf48592 Alexei Starovoitov   2014-09-26  8114  	struct bpf_insn *in=
sns =3D env->prog->insnsi;
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8115  	int ret;
475fb78fbf48592 Alexei Starovoitov   2014-09-26  8116  =

13a826a70281cfb Wedson Almeida Filho 2020-11-21  8117  	/* All non-branch i=
nstructions have a single fall-through edge. */
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8118  	if (BPF_CLASS(insns=
[t].code) !=3D BPF_JMP &&
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8119  	    BPF_CLASS(insns=
[t].code) !=3D BPF_JMP32)
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8120  		return push_insn(t=
, t + 1, FALLTHROUGH, env, false);
475fb78fbf48592 Alexei Starovoitov   2014-09-26  8121  =

13a826a70281cfb Wedson Almeida Filho 2020-11-21  8122  	switch (BPF_OP(insn=
s[t].code)) {
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8123  	case BPF_EXIT:
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8124  		return DONE_EXPLOR=
ING;
475fb78fbf48592 Alexei Starovoitov   2014-09-26  8125  =

13a826a70281cfb Wedson Almeida Filho 2020-11-21  8126  	case BPF_CALL:
2589726d12a1b12 Alexei Starovoitov   2019-06-15  8127  		ret =3D push_insn(=
t, t + 1, FALLTHROUGH, env, false);
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8128  		if (ret)
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8129  			return ret;
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8130  =

07016151a446d25 Daniel Borkmann      2016-04-05  8131  		if (t + 1 < insn_c=
nt)
5d839021675a2e1 Alexei Starovoitov   2019-05-21  8132  			init_explored_sta=
te(env, t + 1);
cc8b0b92a1699bc Alexei Starovoitov   2017-12-14  8133  		if (insns[t].src_r=
eg =3D=3D BPF_PSEUDO_CALL) {
5d839021675a2e1 Alexei Starovoitov   2019-05-21  8134  			init_explored_sta=
te(env, t);
2589726d12a1b12 Alexei Starovoitov   2019-06-15  8135  			ret =3D push_insn=
(t, t + insns[t].imm + 1, BRANCH,
2589726d12a1b12 Alexei Starovoitov   2019-06-15  8136  					env, false);
475fb78fbf48592 Alexei Starovoitov   2014-09-26  8137  		}
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8138  		return ret;
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8139  =

13a826a70281cfb Wedson Almeida Filho 2020-11-21  8140  	case BPF_JA:
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8141  		if (BPF_SRC(insns[=
t].code) !=3D BPF_K)
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8142  			return -EINVAL;
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8143  =

475fb78fbf48592 Alexei Starovoitov   2014-09-26  8144  		/* unconditional j=
ump with single edge */
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8145  		ret =3D push_insn(=
t, t + insns[t].off + 1, FALLTHROUGH, env,
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8146  				true);
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8147  		if (ret)
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8148  			return ret;
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8149  =

b5dc0163d8fd78e Alexei Starovoitov   2019-06-15  8150  		/* unconditional j=
mp is not a good pruning point,
b5dc0163d8fd78e Alexei Starovoitov   2019-06-15  8151  		 * but it's marked=
, since backtracking needs
b5dc0163d8fd78e Alexei Starovoitov   2019-06-15  8152  		 * to record jmp h=
istory in is_state_visited().
b5dc0163d8fd78e Alexei Starovoitov   2019-06-15  8153  		 */
b5dc0163d8fd78e Alexei Starovoitov   2019-06-15  8154  		init_explored_stat=
e(env, t + insns[t].off + 1);
f1bca824dabba4f Alexei Starovoitov   2014-09-29  8155  		/* tell verifier t=
o check for equivalent states
f1bca824dabba4f Alexei Starovoitov   2014-09-29  8156  		 * after every cal=
l and jump
f1bca824dabba4f Alexei Starovoitov   2014-09-29  8157  		 */
c3de6317d748e23 Alexei Starovoitov   2015-04-14  8158  		if (t + 1 < insn_c=
nt)
5d839021675a2e1 Alexei Starovoitov   2019-05-21  8159  			init_explored_sta=
te(env, t + 1);
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8160  =

13a826a70281cfb Wedson Almeida Filho 2020-11-21 @8161  		return ret;
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8162  =

13a826a70281cfb Wedson Almeida Filho 2020-11-21  8163  	default:
475fb78fbf48592 Alexei Starovoitov   2014-09-26  8164  		/* conditional jum=
p with two edges */
5d839021675a2e1 Alexei Starovoitov   2019-05-21  8165  		init_explored_stat=
e(env, t);
2589726d12a1b12 Alexei Starovoitov   2019-06-15  8166  		ret =3D push_insn(=
t, t + 1, FALLTHROUGH, env, true);
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8167  		if (ret)
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8168  			return ret;
475fb78fbf48592 Alexei Starovoitov   2014-09-26  8169  =

13a826a70281cfb Wedson Almeida Filho 2020-11-21  8170  		return push_insn(t=
, t + insns[t].off + 1, BRANCH, env, true);
475fb78fbf48592 Alexei Starovoitov   2014-09-26  8171  	}
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8172  }
13a826a70281cfb Wedson Almeida Filho 2020-11-21  8173  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7060083510546544062==--

