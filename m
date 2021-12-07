Content-Type: multipart/mixed; boundary="===============8684532233945192942=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/boot/compressed/../../../../lib/zstd/decompress/huf_decompress.c:397 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead of &
Date: Tue, 07 Dec 2021 19:01:46 +0800
Message-ID: <202112071807.3EysEubE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8684532233945192942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Nick Terrell <terrelln@fb.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: e0c1b49f5b674cca7b10549c53b3791d0bbc90a8 lib: zstd: Upgrade to late=
st upstream zstd version 1.4.10
date:   4 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-m021-20211205 (https://download.01.org/0day-ci/arch=
ive/20211207/202112071807.3EysEubE-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/x86/boot/compressed/../../../../lib/zstd/decompress/huf_decompress.c:3=
97 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead=
 of &
arch/x86/boot/compressed/../../../../lib/zstd/decompress/huf_decompress.c:3=
97 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead=
 of &
arch/x86/boot/compressed/../../../../lib/zstd/decompress/huf_decompress.c:8=
50 HUF_decompress4X2_usingDTable_internal_body() warn: maybe use && instead=
 of &
arch/x86/boot/compressed/../../../../lib/zstd/decompress/huf_decompress.c:8=
50 HUF_decompress4X2_usingDTable_internal_body() warn: maybe use && instead=
 of &

Old smatch warnings:
arch/x86/boot/compressed/misc.c:292 parse_elf() warn: ignoring unreachable =
code.

vim +397 arch/x86/boot/compressed/../../../../lib/zstd/decompress/huf_decom=
press.c

e0c1b49f5b674c Nick Terrell 2020-09-11  348  =

e0c1b49f5b674c Nick Terrell 2020-09-11  349  FORCE_INLINE_TEMPLATE size_t
e0c1b49f5b674c Nick Terrell 2020-09-11  350  HUF_decompress4X1_usingDTable_=
internal_body(
e0c1b49f5b674c Nick Terrell 2020-09-11  351            void* dst,  size_t d=
stSize,
e0c1b49f5b674c Nick Terrell 2020-09-11  352      const void* cSrc, size_t c=
SrcSize,
e0c1b49f5b674c Nick Terrell 2020-09-11  353      const HUF_DTable* DTable)
e0c1b49f5b674c Nick Terrell 2020-09-11  354  {
e0c1b49f5b674c Nick Terrell 2020-09-11  355      /* Check */
e0c1b49f5b674c Nick Terrell 2020-09-11  356      if (cSrcSize < 10) return =
ERROR(corruption_detected);  /* strict minimum : jump table + 1 byte per st=
ream */
e0c1b49f5b674c Nick Terrell 2020-09-11  357  =

e0c1b49f5b674c Nick Terrell 2020-09-11  358      {   const BYTE* const ista=
rt =3D (const BYTE*) cSrc;
e0c1b49f5b674c Nick Terrell 2020-09-11  359          BYTE* const ostart =3D=
 (BYTE*) dst;
e0c1b49f5b674c Nick Terrell 2020-09-11  360          BYTE* const oend =3D o=
start + dstSize;
e0c1b49f5b674c Nick Terrell 2020-09-11  361          BYTE* const olimit =3D=
 oend - 3;
e0c1b49f5b674c Nick Terrell 2020-09-11  362          const void* const dtPt=
r =3D DTable + 1;
e0c1b49f5b674c Nick Terrell 2020-09-11  363          const HUF_DEltX1* cons=
t dt =3D (const HUF_DEltX1*)dtPtr;
e0c1b49f5b674c Nick Terrell 2020-09-11  364  =

e0c1b49f5b674c Nick Terrell 2020-09-11  365          /* Init */
e0c1b49f5b674c Nick Terrell 2020-09-11  366          BIT_DStream_t bitD1;
e0c1b49f5b674c Nick Terrell 2020-09-11  367          BIT_DStream_t bitD2;
e0c1b49f5b674c Nick Terrell 2020-09-11  368          BIT_DStream_t bitD3;
e0c1b49f5b674c Nick Terrell 2020-09-11  369          BIT_DStream_t bitD4;
e0c1b49f5b674c Nick Terrell 2020-09-11  370          size_t const length1 =
=3D MEM_readLE16(istart);
e0c1b49f5b674c Nick Terrell 2020-09-11  371          size_t const length2 =
=3D MEM_readLE16(istart+2);
e0c1b49f5b674c Nick Terrell 2020-09-11  372          size_t const length3 =
=3D MEM_readLE16(istart+4);
e0c1b49f5b674c Nick Terrell 2020-09-11  373          size_t const length4 =
=3D cSrcSize - (length1 + length2 + length3 + 6);
e0c1b49f5b674c Nick Terrell 2020-09-11  374          const BYTE* const ista=
rt1 =3D istart + 6;  /* jumpTable */
e0c1b49f5b674c Nick Terrell 2020-09-11  375          const BYTE* const ista=
rt2 =3D istart1 + length1;
e0c1b49f5b674c Nick Terrell 2020-09-11  376          const BYTE* const ista=
rt3 =3D istart2 + length2;
e0c1b49f5b674c Nick Terrell 2020-09-11  377          const BYTE* const ista=
rt4 =3D istart3 + length3;
e0c1b49f5b674c Nick Terrell 2020-09-11  378          const size_t segmentSi=
ze =3D (dstSize+3) / 4;
e0c1b49f5b674c Nick Terrell 2020-09-11  379          BYTE* const opStart2 =
=3D ostart + segmentSize;
e0c1b49f5b674c Nick Terrell 2020-09-11  380          BYTE* const opStart3 =
=3D opStart2 + segmentSize;
e0c1b49f5b674c Nick Terrell 2020-09-11  381          BYTE* const opStart4 =
=3D opStart3 + segmentSize;
e0c1b49f5b674c Nick Terrell 2020-09-11  382          BYTE* op1 =3D ostart;
e0c1b49f5b674c Nick Terrell 2020-09-11  383          BYTE* op2 =3D opStart2;
e0c1b49f5b674c Nick Terrell 2020-09-11  384          BYTE* op3 =3D opStart3;
e0c1b49f5b674c Nick Terrell 2020-09-11  385          BYTE* op4 =3D opStart4;
e0c1b49f5b674c Nick Terrell 2020-09-11  386          DTableDesc const dtd =
=3D HUF_getDTableDesc(DTable);
e0c1b49f5b674c Nick Terrell 2020-09-11  387          U32 const dtLog =3D dt=
d.tableLog;
e0c1b49f5b674c Nick Terrell 2020-09-11  388          U32 endSignal =3D 1;
e0c1b49f5b674c Nick Terrell 2020-09-11  389  =

e0c1b49f5b674c Nick Terrell 2020-09-11  390          if (length4 > cSrcSize=
) return ERROR(corruption_detected);   /* overflow */
e0c1b49f5b674c Nick Terrell 2020-09-11  391          CHECK_F( BIT_initDStre=
am(&bitD1, istart1, length1) );
e0c1b49f5b674c Nick Terrell 2020-09-11  392          CHECK_F( BIT_initDStre=
am(&bitD2, istart2, length2) );
e0c1b49f5b674c Nick Terrell 2020-09-11  393          CHECK_F( BIT_initDStre=
am(&bitD3, istart3, length3) );
e0c1b49f5b674c Nick Terrell 2020-09-11  394          CHECK_F( BIT_initDStre=
am(&bitD4, istart4, length4) );
e0c1b49f5b674c Nick Terrell 2020-09-11  395  =

e0c1b49f5b674c Nick Terrell 2020-09-11  396          /* up to 16 symbols pe=
r loop (4 symbols per stream) in 64-bit mode */
e0c1b49f5b674c Nick Terrell 2020-09-11 @397          for ( ; (endSignal) & =
(op4 < olimit) ; ) {
e0c1b49f5b674c Nick Terrell 2020-09-11  398              HUF_DECODE_SYMBOLX=
1_2(op1, &bitD1);
e0c1b49f5b674c Nick Terrell 2020-09-11  399              HUF_DECODE_SYMBOLX=
1_2(op2, &bitD2);
e0c1b49f5b674c Nick Terrell 2020-09-11  400              HUF_DECODE_SYMBOLX=
1_2(op3, &bitD3);
e0c1b49f5b674c Nick Terrell 2020-09-11  401              HUF_DECODE_SYMBOLX=
1_2(op4, &bitD4);
e0c1b49f5b674c Nick Terrell 2020-09-11  402              HUF_DECODE_SYMBOLX=
1_1(op1, &bitD1);
e0c1b49f5b674c Nick Terrell 2020-09-11  403              HUF_DECODE_SYMBOLX=
1_1(op2, &bitD2);
e0c1b49f5b674c Nick Terrell 2020-09-11  404              HUF_DECODE_SYMBOLX=
1_1(op3, &bitD3);
e0c1b49f5b674c Nick Terrell 2020-09-11  405              HUF_DECODE_SYMBOLX=
1_1(op4, &bitD4);
e0c1b49f5b674c Nick Terrell 2020-09-11  406              HUF_DECODE_SYMBOLX=
1_2(op1, &bitD1);
e0c1b49f5b674c Nick Terrell 2020-09-11  407              HUF_DECODE_SYMBOLX=
1_2(op2, &bitD2);
e0c1b49f5b674c Nick Terrell 2020-09-11  408              HUF_DECODE_SYMBOLX=
1_2(op3, &bitD3);
e0c1b49f5b674c Nick Terrell 2020-09-11  409              HUF_DECODE_SYMBOLX=
1_2(op4, &bitD4);
e0c1b49f5b674c Nick Terrell 2020-09-11  410              HUF_DECODE_SYMBOLX=
1_0(op1, &bitD1);
e0c1b49f5b674c Nick Terrell 2020-09-11  411              HUF_DECODE_SYMBOLX=
1_0(op2, &bitD2);
e0c1b49f5b674c Nick Terrell 2020-09-11  412              HUF_DECODE_SYMBOLX=
1_0(op3, &bitD3);
e0c1b49f5b674c Nick Terrell 2020-09-11  413              HUF_DECODE_SYMBOLX=
1_0(op4, &bitD4);
e0c1b49f5b674c Nick Terrell 2020-09-11  414              endSignal &=3D BIT=
_reloadDStreamFast(&bitD1) =3D=3D BIT_DStream_unfinished;
e0c1b49f5b674c Nick Terrell 2020-09-11  415              endSignal &=3D BIT=
_reloadDStreamFast(&bitD2) =3D=3D BIT_DStream_unfinished;
e0c1b49f5b674c Nick Terrell 2020-09-11  416              endSignal &=3D BIT=
_reloadDStreamFast(&bitD3) =3D=3D BIT_DStream_unfinished;
e0c1b49f5b674c Nick Terrell 2020-09-11  417              endSignal &=3D BIT=
_reloadDStreamFast(&bitD4) =3D=3D BIT_DStream_unfinished;
e0c1b49f5b674c Nick Terrell 2020-09-11  418          }
e0c1b49f5b674c Nick Terrell 2020-09-11  419  =

e0c1b49f5b674c Nick Terrell 2020-09-11  420          /* check corruption */
e0c1b49f5b674c Nick Terrell 2020-09-11  421          /* note : should not b=
e necessary : op# advance in lock step, and we control op4.
e0c1b49f5b674c Nick Terrell 2020-09-11  422           *        but curiousl=
y, binary generated by gcc 7.2 & 7.3 with -mbmi2 runs faster when >=3D1 tes=
t is present */
e0c1b49f5b674c Nick Terrell 2020-09-11  423          if (op1 > opStart2) re=
turn ERROR(corruption_detected);
e0c1b49f5b674c Nick Terrell 2020-09-11  424          if (op2 > opStart3) re=
turn ERROR(corruption_detected);
e0c1b49f5b674c Nick Terrell 2020-09-11  425          if (op3 > opStart4) re=
turn ERROR(corruption_detected);
e0c1b49f5b674c Nick Terrell 2020-09-11  426          /* note : op4 supposed=
 already verified within main loop */
e0c1b49f5b674c Nick Terrell 2020-09-11  427  =

e0c1b49f5b674c Nick Terrell 2020-09-11  428          /* finish bitStreams o=
ne by one */
e0c1b49f5b674c Nick Terrell 2020-09-11  429          HUF_decodeStreamX1(op1=
, &bitD1, opStart2, dt, dtLog);
e0c1b49f5b674c Nick Terrell 2020-09-11  430          HUF_decodeStreamX1(op2=
, &bitD2, opStart3, dt, dtLog);
e0c1b49f5b674c Nick Terrell 2020-09-11  431          HUF_decodeStreamX1(op3=
, &bitD3, opStart4, dt, dtLog);
e0c1b49f5b674c Nick Terrell 2020-09-11  432          HUF_decodeStreamX1(op4=
, &bitD4, oend,     dt, dtLog);
e0c1b49f5b674c Nick Terrell 2020-09-11  433  =

e0c1b49f5b674c Nick Terrell 2020-09-11  434          /* check */
e0c1b49f5b674c Nick Terrell 2020-09-11  435          { U32 const endCheck =
=3D BIT_endOfDStream(&bitD1) & BIT_endOfDStream(&bitD2) & BIT_endOfDStream(=
&bitD3) & BIT_endOfDStream(&bitD4);
e0c1b49f5b674c Nick Terrell 2020-09-11  436            if (!endCheck) retur=
n ERROR(corruption_detected); }
e0c1b49f5b674c Nick Terrell 2020-09-11  437  =

e0c1b49f5b674c Nick Terrell 2020-09-11  438          /* decoded size */
e0c1b49f5b674c Nick Terrell 2020-09-11  439          return dstSize;
e0c1b49f5b674c Nick Terrell 2020-09-11  440      }
e0c1b49f5b674c Nick Terrell 2020-09-11  441  }
e0c1b49f5b674c Nick Terrell 2020-09-11  442  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8684532233945192942==--

