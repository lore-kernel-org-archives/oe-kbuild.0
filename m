Content-Type: multipart/mixed; boundary="===============3600483356096447996=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/test_bpf.c:12229:9: warning: %lu in format string (no. 2) requires 'unsigned long' but the argument type is 'signed long'. [invalidPrintfArgType_uint]
Date: Sat, 23 Apr 2022 19:53:24 +0800
Message-ID: <202204231940.jXeLiY1C-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3600483356096447996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Johan Almbladh <johan.almbladh@anyfinetworks.com>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c00c5e1d157bec0ef0b0b59aa5482eb8dc7e8e49
commit: 29eef85be2f60b1027214b4bfc4b1a9d592830a7 bpf/tests: Add tail call l=
imit test with external function call
date:   7 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 months ago
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 29eef85be2f60b1027214b4bfc4b1a9d592830a7
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> lib/test_bpf.c:12229:9: warning: %lu in format string (no. 2) requires '=
unsigned long' but the argument type is 'signed long'. [invalidPrintfArgTyp=
e_uint]
    return snprintf(buf, sizeof(buf),
           ^
   lib/test_bpf.c:12229:9: warning: %lu in format string (no. 5) requires '=
unsigned long' but the argument type is 'signed long'. [invalidPrintfArgTyp=
e_uint]
    return snprintf(buf, sizeof(buf),
           ^
   lib/test_bpf.c:12229:9: warning: %lu in format string (no. 8) requires '=
unsigned long' but the argument type is 'signed long'. [invalidPrintfArgTyp=
e_uint]
    return snprintf(buf, sizeof(buf),
           ^

vim +12229 lib/test_bpf.c

874be05f525e87 Johan Almbladh 2021-08-09  12204  =

874be05f525e87 Johan Almbladh 2021-08-09  12205  #define TAIL_CALL(offset)	=
		       \
874be05f525e87 Johan Almbladh 2021-08-09  12206  	BPF_LD_IMM64(R2, TAIL_CAL=
L_MARKER),	       \
874be05f525e87 Johan Almbladh 2021-08-09  12207  	BPF_RAW_INSN(BPF_ALU | BP=
F_MOV | BPF_K, R3, 0, \
874be05f525e87 Johan Almbladh 2021-08-09  12208  		     offset, TAIL_CALL_M=
ARKER),	       \
874be05f525e87 Johan Almbladh 2021-08-09  12209  	BPF_JMP_IMM(BPF_TAIL_CALL=
, 0, 0, 0)
874be05f525e87 Johan Almbladh 2021-08-09  12210  =

29eef85be2f60b Johan Almbladh 2021-09-14  12211  /*
29eef85be2f60b Johan Almbladh 2021-09-14  12212   * A test function to be c=
alled from a BPF program, clobbering a lot of
29eef85be2f60b Johan Almbladh 2021-09-14  12213   * CPU registers in the pr=
ocess. A JITed BPF program calling this function
29eef85be2f60b Johan Almbladh 2021-09-14  12214   * must save and restore a=
ny caller-saved registers it uses for internal
29eef85be2f60b Johan Almbladh 2021-09-14  12215   * state, for example the =
current tail call count.
29eef85be2f60b Johan Almbladh 2021-09-14  12216   */
29eef85be2f60b Johan Almbladh 2021-09-14  12217  BPF_CALL_1(bpf_test_func, =
u64, arg)
29eef85be2f60b Johan Almbladh 2021-09-14  12218  {
29eef85be2f60b Johan Almbladh 2021-09-14  12219  	char buf[64];
29eef85be2f60b Johan Almbladh 2021-09-14  12220  	long a =3D 0;
29eef85be2f60b Johan Almbladh 2021-09-14  12221  	long b =3D 1;
29eef85be2f60b Johan Almbladh 2021-09-14  12222  	long c =3D 2;
29eef85be2f60b Johan Almbladh 2021-09-14  12223  	long d =3D 3;
29eef85be2f60b Johan Almbladh 2021-09-14  12224  	long e =3D 4;
29eef85be2f60b Johan Almbladh 2021-09-14  12225  	long f =3D 5;
29eef85be2f60b Johan Almbladh 2021-09-14  12226  	long g =3D 6;
29eef85be2f60b Johan Almbladh 2021-09-14  12227  	long h =3D 7;
29eef85be2f60b Johan Almbladh 2021-09-14  12228  =

29eef85be2f60b Johan Almbladh 2021-09-14 @12229  	return snprintf(buf, size=
of(buf),
29eef85be2f60b Johan Almbladh 2021-09-14  12230  			"%ld %lu %lx %ld %lu %l=
x %ld %lu %x",
29eef85be2f60b Johan Almbladh 2021-09-14  12231  			a, b, c, d, e, f, g, h,=
 (int)arg);
29eef85be2f60b Johan Almbladh 2021-09-14  12232  }
29eef85be2f60b Johan Almbladh 2021-09-14  12233  #define BPF_FUNC_test_func=
 __BPF_FUNC_MAX_ID
29eef85be2f60b Johan Almbladh 2021-09-14  12234  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3600483356096447996==--

