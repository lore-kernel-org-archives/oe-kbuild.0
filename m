Content-Type: multipart/mixed; boundary="===============6911856938721275664=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/bpf/core.c:1054:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 12 Sep 2022 14:05:43 +0800
Message-ID: <202209121306.rN28NgzW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6911856938721275664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: kernel/bp=
f/core.c:1054:13: warning: use of uninitialized value '<unknown>' [CWE-457]=
 [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Song Liu <song@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   80e78fcce86de0288793a0ef0f6acf37656ee4cf
commit: d24d2a2b0a81dd5e9bb99aeb4559ec9734e1416f bpf: bpf_prog_pack: Set pr=
oper size before freeing ro_header
date:   7 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20220911 (https://download.01.org/0day-ci/archi=
ve/20220912/202209121306.rN28NgzW-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd24d2a2b0a81dd5e9bb99aeb4559ec9734e1416f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d24d2a2b0a81dd5e9bb99aeb4559ec9734e1416f
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   kernel/bpf/core.c:1601:12: warning: no previous prototype for 'bpf_probe=
_read_kernel' [-Wmissing-prototypes]
    1601 | u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const void=
 *unsafe_ptr)
         |            ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/core.c: In function 'bpf_jit_binary_pack_alloc':
>> kernel/bpf/core.c:1054:13: warning: use of uninitialized value '<unknown=
>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1054 |         u32 size, hole, start;
         |             ^~~~
     'bpf_jit_binary_pack_alloc': event 1
       |
       | 1054 |         u32 size, hole, start;
       |      |             ^~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   In file included from kernel/bpf/core.c:21:
   kernel/bpf/core.c: In function 'bpf_jit_blind_insn':
   kernel/bpf/core.c:1306:76: warning: use of uninitialized value 'aux[1].i=
mm' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1306 |                 *to++ =3D BPF_ALU64_IMM(BPF_MOV, BPF_REG_AX, imm=
_rnd ^ aux[1].imm);
         |                                                                 =
     ~~~~~~^~~~
   include/linux/filter.h:116:26: note: in definition of macro 'BPF_ALU64_I=
MM'
     116 |                 .imm   =3D IMM })
         |                          ^~~
     'bpf_jit_blind_constants': events 1-7
       |
       |kernel/bpf/core.c:1374:18:
       | 1374 | struct bpf_prog *bpf_jit_blind_constants(struct bpf_prog *p=
rog)
       |      |                  ^~~~~~~~~~~~~~~~~~~~~~~
       |      |                  |
       |      |                  (1) entry to 'bpf_jit_blind_constants'
       | 1375 | {
       | 1376 |         struct bpf_insn insn_buff[16], aux[2];
       |      |                                        ~~~
       |      |                                        |
       |      |                                        (2) region created o=
n stack here
       |......
       | 1382 |         if (!bpf_jit_blinding_enabled(prog) || prog->blinde=
d)
       |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |                                |
       |      |            |                                (4) ...to here
       |      |            (3) following 'true' branch...   (5) following '=
false' branch...
       |......
       | 1385 |         clone =3D bpf_prog_clone_create(prog, GFP_USER);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (6) ...to here
       |      |                 (7) calling 'bpf_prog_clone_create' from 'b=
pf_jit_blind_constants'
       |
       +--> 'bpf_prog_clone_create': event 8
              |
              | 1332 | static struct bpf_prog *bpf_prog_clone_create(struct=
 bpf_prog *fp_other,
              |      |                         ^~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (8) entry to 'bpf_prog_clone=
_create'
              |
            'bpf_prog_clone_create': event 9
              |
              |include/linux/fortify-string.h:223:12:
              |  223 |         if (p_size < size || q_size < size)
              |      |            ^
              |      |            |
              |      |            (9) following 'false' branch...
              |
            'bpf_prog_clone_create': event 10
              |
              |   41 | #define __underlying_memcpy     __builtin_memcpy
              |      |                                 ^
              |      |                                 |
              |      |                                 (10) ...to here
   include/linux/fortify-string.h:225:16: note: in expansion of macro '__un=
derlying_memcpy'
              |  225 |         return __underlying_memcpy(p, q, size);
              |      |                ^~~~~~~~~~~~~~~~~~~
              |
       <------+
       |
     'bpf_jit_blind_constants': events 11-16
       |
       |kernel/bpf/core.c:1385:17:
       | 1385 |         clone =3D bpf_prog_clone_create(prog, GFP_USER);
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (11) returning to 'bpf_jit_blind_constants'=
 from 'bpf_prog_clone_create'
       | 1386 |         if (!clone)
       |      |            ~     =

       |      |            |
       |      |            (12) following 'false' branch (when 'clone' is n=
on-NULL)...
       |......
       | 1389 |         insn_cnt =3D clone->len;
       |      |                    ~~~~~~~~~~
       |      |                         |
       |      |                         (13) ...to here
       |......
       | 1392 |         for (i =3D 0; i < insn_cnt; i++, insn++) {
       |      |                     ~~~~~~~~~~~~
       |      |                       |
       |      |                       (14) following 'true' branch (when 'i=
nsn_cnt > i')...
       |......
       | 1397 |                 if (insn[0].code =3D=3D (BPF_LD | BPF_IMM |=
 BPF_DW) &&
       |      |                     ~~~~~~~~~~~~
       |      |                            |
       |      |                            (15) ...to here
       |......
       | 1401 |                 rewritten =3D bpf_jit_blind_insn(insn, aux,=
 insn_buff,
       |      |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
       |      |                             |
       |      |                             (16) calling 'bpf_jit_blind_ins=
n' from 'bpf_jit_blind_constants'

vim +1054 kernel/bpf/core.c

4f3446bb809f20 Daniel Borkmann 2016-05-13  1037  =

33c9805860e584 Song Liu        2022-02-04  1038  /* Allocate jit binary fro=
m bpf_prog_pack allocator.
33c9805860e584 Song Liu        2022-02-04  1039   * Since the allocated mem=
ory is RO+X, the JIT engine cannot write directly
33c9805860e584 Song Liu        2022-02-04  1040   * to the memory. To solve=
 this problem, a RW buffer is also allocated at
33c9805860e584 Song Liu        2022-02-04  1041   * as the same time. The J=
IT engine should calculate offsets based on the
33c9805860e584 Song Liu        2022-02-04  1042   * RO memory address, but =
write JITed program to the RW buffer. Once the
33c9805860e584 Song Liu        2022-02-04  1043   * JIT engine finishes, it=
 calls bpf_jit_binary_pack_finalize, which copies
33c9805860e584 Song Liu        2022-02-04  1044   * the JITed program to th=
e RO memory.
33c9805860e584 Song Liu        2022-02-04  1045   */
33c9805860e584 Song Liu        2022-02-04  1046  struct bpf_binary_header *
33c9805860e584 Song Liu        2022-02-04  1047  bpf_jit_binary_pack_alloc(=
unsigned int proglen, u8 **image_ptr,
33c9805860e584 Song Liu        2022-02-04  1048  			  unsigned int alignmen=
t,
33c9805860e584 Song Liu        2022-02-04  1049  			  struct bpf_binary_hea=
der **rw_header,
33c9805860e584 Song Liu        2022-02-04  1050  			  u8 **rw_image,
33c9805860e584 Song Liu        2022-02-04  1051  			  bpf_jit_fill_hole_t b=
pf_fill_ill_insns)
33c9805860e584 Song Liu        2022-02-04  1052  {
33c9805860e584 Song Liu        2022-02-04  1053  	struct bpf_binary_header =
*ro_header;
33c9805860e584 Song Liu        2022-02-04 @1054  	u32 size, hole, start;
33c9805860e584 Song Liu        2022-02-04  1055  =

33c9805860e584 Song Liu        2022-02-04  1056  	WARN_ON_ONCE(!is_power_of=
_2(alignment) ||
33c9805860e584 Song Liu        2022-02-04  1057  		     alignment > BPF_IMA=
GE_ALIGNMENT);
33c9805860e584 Song Liu        2022-02-04  1058  =

33c9805860e584 Song Liu        2022-02-04  1059  	/* add 16 bytes for a ran=
dom section of illegal instructions */
33c9805860e584 Song Liu        2022-02-04  1060  	size =3D round_up(proglen=
 + sizeof(*ro_header) + 16, BPF_PROG_CHUNK_SIZE);
33c9805860e584 Song Liu        2022-02-04  1061  =

33c9805860e584 Song Liu        2022-02-04  1062  	if (bpf_jit_charge_modmem=
(size))
33c9805860e584 Song Liu        2022-02-04  1063  		return NULL;
33c9805860e584 Song Liu        2022-02-04  1064  	ro_header =3D bpf_prog_pa=
ck_alloc(size);
33c9805860e584 Song Liu        2022-02-04  1065  	if (!ro_header) {
33c9805860e584 Song Liu        2022-02-04  1066  		bpf_jit_uncharge_modmem(=
size);
33c9805860e584 Song Liu        2022-02-04  1067  		return NULL;
33c9805860e584 Song Liu        2022-02-04  1068  	}
33c9805860e584 Song Liu        2022-02-04  1069  =

33c9805860e584 Song Liu        2022-02-04  1070  	*rw_header =3D kvmalloc(s=
ize, GFP_KERNEL);
33c9805860e584 Song Liu        2022-02-04  1071  	if (!*rw_header) {
d24d2a2b0a81dd Song Liu        2022-02-17  1072  		bpf_arch_text_copy(&ro_h=
eader->size, &size, sizeof(size));
33c9805860e584 Song Liu        2022-02-04  1073  		bpf_prog_pack_free(ro_he=
ader);
33c9805860e584 Song Liu        2022-02-04  1074  		bpf_jit_uncharge_modmem(=
size);
33c9805860e584 Song Liu        2022-02-04  1075  		return NULL;
33c9805860e584 Song Liu        2022-02-04  1076  	}
33c9805860e584 Song Liu        2022-02-04  1077  =

33c9805860e584 Song Liu        2022-02-04  1078  	/* Fill space with illega=
l/arch-dep instructions. */
33c9805860e584 Song Liu        2022-02-04  1079  	bpf_fill_ill_insns(*rw_he=
ader, size);
33c9805860e584 Song Liu        2022-02-04  1080  	(*rw_header)->size =3D si=
ze;
33c9805860e584 Song Liu        2022-02-04  1081  =

33c9805860e584 Song Liu        2022-02-04  1082  	hole =3D min_t(unsigned i=
nt, size - (proglen + sizeof(*ro_header)),
33c9805860e584 Song Liu        2022-02-04  1083  		     BPF_PROG_CHUNK_SIZE=
 - sizeof(*ro_header));
33c9805860e584 Song Liu        2022-02-04  1084  	start =3D (get_random_int=
() % hole) & ~(alignment - 1);
33c9805860e584 Song Liu        2022-02-04  1085  =

33c9805860e584 Song Liu        2022-02-04  1086  	*image_ptr =3D &ro_header=
->image[start];
33c9805860e584 Song Liu        2022-02-04  1087  	*rw_image =3D &(*rw_heade=
r)->image[start];
33c9805860e584 Song Liu        2022-02-04  1088  =

33c9805860e584 Song Liu        2022-02-04  1089  	return ro_header;
33c9805860e584 Song Liu        2022-02-04  1090  }
33c9805860e584 Song Liu        2022-02-04  1091  =


:::::: The code at line 1054 was first introduced by commit
:::::: 33c9805860e584b194199cab1a1e81f4e6395408 bpf: Introduce bpf_jit_bina=
ry_pack_[alloc|finalize|free]

:::::: TO: Song Liu <songliubraving@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6911856938721275664==--

