Content-Type: multipart/mixed; boundary="===============9006497552421452493=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/bpf/verifier.c:10291:18: warning: use of uninitialized value '*(int *)((char *)&u_core_relo + offsetof(bpfptr_t, is_kernel))' [CWE-457]
Date: Sun, 14 Aug 2022 16:19:43 +0800
Message-ID: <202208141644.fKN57p0i-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9006497552421452493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: kernel/bp=
f/verifier.c:10291:18: warning: use of uninitialized value '*(int *)((char =
*)&u_core_relo + offsetof(bpfptr_t, is_kernel))' [CWE-457] [-Wanalyzer-use-=
of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alexei Starovoitov <ast@kernel.org>
CC: Andrii Nakryiko <andrii@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   aea23e7c464bfdec04b52cf61edb62030e9e0d0a
commit: fbd94c7afcf99c9f3b1ba1168657ecc428eb2c8d bpf: Pass a set of bpf_cor=
e_relo-s to prog_load command.
date:   9 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220810 (https://download.01.org/0day-ci/archi=
ve/20220814/202208141644.fKN57p0i-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dfbd94c7afcf99c9f3b1ba1168657ecc428eb2c8d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout fbd94c7afcf99c9f3b1ba1168657ecc428eb2c8d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
                     |      |                             |
                     |      |                             (21) following 'f=
alse' branch (when 'off >=3D 0')...
                     |......
                     | 1625 |         ret =3D find_subprog(env, off);
                     |      |               ~~~~~~~~~~~~~~~~~~~~~~
                     |      |               |
                     |      |               (22) ...to here
                     |
              <------+
              |
            'add_subprog_and_kfunc': event 23
              |
              | 1945 |         ret =3D add_subprog(env, 0);
              |      |               ^~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (23) returning to 'add_subprog_and_kfu=
nc' from 'add_subprog'
              |
       <------+
       |
     'bpf_check': events 24-29
       |
       |14090 |         ret =3D add_subprog_and_kfunc(env);
       |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (24) returning to 'bpf_check' from 'add_subpr=
og_and_kfunc'
       |14091 |         if (ret < 0)
       |      |            ~   =

       |      |            |
       |      |            (25) following 'false' branch (when 'ret >=3D 0'=
)...
       |......
       |14094 |         ret =3D check_subprogs(env);
       |      |               ~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (26) ...to here
       |14095 |         if (ret < 0)
       |      |            ~   =

       |      |            |
       |      |            (27) following 'false' branch (when 'ret >=3D 0'=
)...
       |......
       |14098 |         ret =3D check_btf_info(env, attr, uattr);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (28) ...to here
       |      |               (29) calling 'check_btf_info' from 'bpf_check'
       |
       +--> 'check_btf_info': events 30-39
              |
              |10348 | static int check_btf_info(struct bpf_verifier_env *e=
nv,
              |      |            ^~~~~~~~~~~~~~
              |      |            |
              |      |            (30) entry to 'check_btf_info'
              |......
              |10362 |         if (IS_ERR(btf))
              |      |            ~
              |      |            |
              |      |            (31) following 'false' branch...
              |10363 |                 return PTR_ERR(btf);
              |10364 |         if (btf_is_kernel(btf)) {
              |      |            ~~~~~~~~~~~~~~~~~~~
              |      |            ||
              |      |            |(32) ...to here
              |      |            (33) following 'false' branch...
              |......
              |10368 |         env->prog->aux->btf =3D btf;
              |      |         ~~~~~~~~~
              |      |            |
              |      |            (34) ...to here
              |......
              |10371 |         if (err)
              |      |            ~
              |      |            |
              |      |            (35) following 'false' branch (when 'err =
=3D=3D 0')...
              |......
              |10374 |         err =3D check_btf_line(env, attr, uattr);
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (36) ...to here
              |10375 |         if (err)
              |      |            ~
              |      |            |
              |      |            (37) following 'false' branch (when 'err =
=3D=3D 0')...
              |......
              |10378 |         err =3D check_core_relo(env, attr, uattr);
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (38) ...to here
              |      |               (39) calling 'check_core_relo' from 'c=
heck_btf_info'
              |
              +--> 'check_core_relo': events 40-41
                     |
                     |10279 | static int check_core_relo(struct bpf_verifie=
r_env *env,
                     |      |            ^~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (40) entry to 'check_core_relo'
                     |......
                     |10283 |         u32 i, nr_core_relo, ncopy, expected_=
size, rec_size;
                     |      |                                     ~~~~~~~~~=
~~~~
                     |      |                                     |
                     |      |                                     (41) use =
of uninitialized value '<unknown>' here
                     |
>> kernel/bpf/verifier.c:10291:18: warning: use of uninitialized value '*(i=
nt *)((char *)&u_core_relo + offsetof(bpfptr_t, is_kernel))' [CWE-457] [-Wa=
nalyzer-use-of-uninitialized-value]
   10291 |         bpfptr_t u_core_relo;
         |                  ^~~~~~~~~~~
     'bpf_check': events 1-4
       |
       |14006 | int bpf_check(struct bpf_prog **prog, union bpf_attr *attr,=
 bpfptr_t uattr)
       |      |     ^~~~~~~~~
       |      |     |
       |      |     (1) entry to 'bpf_check'
       |......
       |14022 |         if (!env)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'env' is non-=
NULL)...
       |......
       |14026 |         len =3D (*prog)->len;
       |      |               ~~~~~~~
       |      |                |
       |      |                (3) ...to here
       |......
       |14030 |         if (!env->insn_aux_data)
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch...
       |
     'bpf_check': event 5
       |
       |cc1:
       | (5): ...to here
       |
     'bpf_check': events 6-7
       |
       |include/linux/bpfptr.h:28:12:
       |   28 |         if (is_kernel)
       |      |            ^
       |      |            |
       |      |            (6) following 'true' branch...
       |   29 |                 return KERNEL_BPFPTR((void*) (uintptr_t) ad=
dr);
       |      |                                              ~~~~~~~~~~~~~~=
~~
       |      |                                              |
       |      |                                              (7) ...to here
       |
     'bpf_check': events 8-9
       |
       |kernel/bpf/verifier.c:14060:12:
       |14060 |         if (IS_ERR(btf_vmlinux)) {
       |      |            ^
       |      |            |
       |      |            (8) following 'false' branch...
       |......
       |14067 |         env->strict_alignment =3D !!(attr->prog_flags & BPF=
_F_STRICT_ALIGNMENT);
       |      |                                    ~~~~~~~~~~~~~~~~
       |      |                                        |
       |      |                                        (9) ...to here
       |
     'bpf_check': event 10
       |
       |include/linux/slab.h:764:16:
       |  764 |         return kvmalloc_array(n, size, flags | __GFP_ZERO);
       |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (10) calling 'kvmalloc_array' from 'bpf_chec=
k'
       |
       +--> 'kvmalloc_array': events 11-13
              |
              |  752 | static inline __alloc_size(1, 2) void *kvmalloc_arra=
y(size_t n, size_t size, gfp_t flags)
              |      |                                        ^~~~~~~~~~~~~~
              |      |                                        |
              |      |                                        (11) entry to=
 'kvmalloc_array'
              |......
              |  756 |         if (unlikely(check_mul_overflow(n, size, &by=
tes)))
              |      |            ~                            =

              |      |            |
              |      |            (12) following 'false' branch...
              |......
              |  759 |         return kvmalloc(bytes, flags);
              |      |                ~~~~~~~~~~~~~~~~~~~~~~   =

              |      |                |
              |      |                (13) ...to here
              |
       <------+
       |
     'bpf_check': event 14
       |
       |  764 |         return kvmalloc_array(n, size, flags | __GFP_ZERO);
       |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (14) returning to 'bpf_check' from 'kvmalloc=
_array'
       |
     'bpf_check': events 15-17
       |
       |kernel/bpf/verifier.c:14087:12:
       |14087 |         if (!env->explored_states)
       |      |            ^
       |      |            |
       |      |            (15) following 'false' branch...
       |......
       |14090 |         ret =3D add_subprog_and_kfunc(env);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (16) ...to here

vim +10291 kernel/bpf/verifier.c

fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10278  =

fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10279  static int check_core_=
relo(struct bpf_verifier_env *env,
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10280  			   const union bpf_=
attr *attr,
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10281  			   bpfptr_t uattr)
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10282  {
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10283  	u32 i, nr_core_relo, =
ncopy, expected_size, rec_size;
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10284  	struct bpf_core_relo =
core_relo =3D {};
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10285  	struct bpf_prog *prog=
 =3D env->prog;
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10286  	const struct btf *btf=
 =3D prog->aux->btf;
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10287  	struct bpf_core_ctx c=
tx =3D {
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10288  		.log =3D &env->log,
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10289  		.btf =3D btf,
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10290  	};
fbd94c7afcf99c Alexei Starovoitov 2021-12-01 @10291  	bpfptr_t u_core_relo;
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10292  	int err;
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10293  =

fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10294  	nr_core_relo =3D attr=
->core_relo_cnt;
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10295  	if (!nr_core_relo)
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10296  		return 0;
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10297  	if (nr_core_relo > IN=
T_MAX / sizeof(struct bpf_core_relo))
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10298  		return -EINVAL;
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10299  =

fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10300  	rec_size =3D attr->co=
re_relo_rec_size;
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10301  	if (rec_size < MIN_CO=
RE_RELO_SIZE ||
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10302  	    rec_size > MAX_CO=
RE_RELO_SIZE ||
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10303  	    rec_size % sizeof=
(u32))
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10304  		return -EINVAL;
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10305  =

fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10306  	u_core_relo =3D make_=
bpfptr(attr->core_relos, uattr.is_kernel);
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10307  	expected_size =3D siz=
eof(struct bpf_core_relo);
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10308  	ncopy =3D min_t(u32, =
expected_size, rec_size);
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10309  =

fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10310  	/* Unlike func_info a=
nd line_info, copy and apply each CO-RE
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10311  	 * relocation record =
one at a time.
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10312  	 */
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10313  	for (i =3D 0; i < nr_=
core_relo; i++) {
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10314  		/* future proofing w=
hen sizeof(bpf_core_relo) changes */
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10315  		err =3D bpf_check_ua=
rg_tail_zero(u_core_relo, expected_size, rec_size);
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10316  		if (err) {
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10317  			if (err =3D=3D -E2B=
IG) {
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10318  				verbose(env, "nonz=
ero tailing record in core_relo");
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10319  				if (copy_to_bpfptr=
_offset(uattr,
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10320  							  offsetof(unio=
n bpf_attr, core_relo_rec_size),
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10321  							  &expected_siz=
e, sizeof(expected_size)))
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10322  					err =3D -EFAULT;
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10323  			}
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10324  			break;
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10325  		}
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10326  =

fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10327  		if (copy_from_bpfptr=
(&core_relo, u_core_relo, ncopy)) {
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10328  			err =3D -EFAULT;
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10329  			break;
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10330  		}
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10331  =

fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10332  		if (core_relo.insn_o=
ff % 8 || core_relo.insn_off / 8 >=3D prog->len) {
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10333  			verbose(env, "Inval=
id core_relo[%u].insn_off:%u prog->len:%u\n",
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10334  				i, core_relo.insn_=
off, prog->len);
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10335  			err =3D -EINVAL;
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10336  			break;
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10337  		}
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10338  =

fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10339  		err =3D bpf_core_app=
ly(&ctx, &core_relo, i,
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10340  				     &prog->insnsi=
[core_relo.insn_off / 8]);
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10341  		if (err)
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10342  			break;
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10343  		bpfptr_add(&u_core_r=
elo, rec_size);
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10344  	}
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10345  	return err;
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10346  }
fbd94c7afcf99c Alexei Starovoitov 2021-12-01  10347  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9006497552421452493==--

