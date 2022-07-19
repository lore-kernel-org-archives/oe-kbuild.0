Content-Type: multipart/mixed; boundary="===============4225099348156914555=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/zstd/decompress/zstd_decompress.c:1252:44: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Wed, 20 Jul 2022 01:26:06 +0800
Message-ID: <202207200107.DpM7d7hO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4225099348156914555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: lib/zstd/=
decompress/zstd_decompress.c:1252:44: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Nick Terrell <terrelln@fb.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ca85855bdcae8f84f1512e88b4c75009ea17ea2f
commit: e0c1b49f5b674cca7b10549c53b3791d0bbc90a8 lib: zstd: Upgrade to late=
st upstream zstd version 1.4.10
date:   8 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20220718 (https://download.01.org/0day-ci/archi=
ve/20220720/202207200107.DpM7d7hO-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De0c1b49f5b674cca7b10549c53b3791d0bbc90a8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e0c1b49f5b674cca7b10549c53b3791d0bbc90a8
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   lib/zstd/decompress/zstd_decompress.c: In function 'ZSTD_loadDEntropy':
>> lib/zstd/decompress/zstd_decompress.c:1252:44: warning: use of uninitial=
ized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1252 |         unsigned offcodeMaxValue =3D MaxOff, offcodeLog;
         |                                            ^~~~~~~~~~
     'ZSTD_decompressBegin_usingDict.part.0': events 1-2
       |
       | 1354 | size_t ZSTD_decompressBegin_usingDict(ZSTD_DCtx* dctx, cons=
t void* dict, size_t dictSize)
       |      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |        |
       |      |        (1) entry to 'ZSTD_decompressBegin_usingDict.part.0'
       |......
       | 1357 |     if (dict && dictSize)
       |      |        ~
       |      |        |
       |      |        (2) following 'true' branch...
       |
     'ZSTD_decompressBegin_usingDict.part.0': event 3
       |
       |lib/zstd/decompress/../common/zstd_internal.h:38:22:
       |   38 | #define ZSTD_isError ERR_isError   /* for inlining */
   lib/zstd/decompress/../common/zstd_internal.h:84:7: note: in definition =
of macro 'RETURN_ERROR_IF'
       |   84 |   if (cond) { \
       |      |       ^~~~
   lib/zstd/decompress/zstd_decompress.c:1359:13: note: in expansion of mac=
ro 'ZSTD_isError'
       | 1359 |             ZSTD_isError(ZSTD_decompress_insertDictionary(d=
ctx, dict, dictSize)),
       |      |             ^~~~~~~~~~~~
       |
     'ZSTD_decompressBegin_usingDict.part.0': event 4
       |
       |lib/zstd/decompress/../common/zstd_internal.h:38:22:
       |   38 | #define ZSTD_isError ERR_isError   /* for inlining */
   lib/zstd/decompress/../common/zstd_internal.h:84:7: note: in definition =
of macro 'RETURN_ERROR_IF'
       |   84 |   if (cond) { \
       |      |       ^~~~
   lib/zstd/decompress/zstd_decompress.c:1359:13: note: in expansion of mac=
ro 'ZSTD_isError'
       | 1359 |             ZSTD_isError(ZSTD_decompress_insertDictionary(d=
ctx, dict, dictSize)),
       |      |             ^~~~~~~~~~~~
       |
       +--> 'ZSTD_decompress_insertDictionary': events 5-6
              |
              | 1309 | static size_t ZSTD_decompress_insertDictionary(ZSTD_=
DCtx* dctx, const void* dict, size_t dictSize)
              |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (5) entry to 'ZSTD_decompress_insertDi=
ctionary'
              | 1310 | {
              | 1311 |     if (dictSize < 8) return ZSTD_refDictContent(dct=
x, dict, dictSize);
              |      |        ~       =

              |      |        |
              |      |        (6) following 'false' branch (when 'dictSize =
> 7')...
              |
            'ZSTD_decompress_insertDictionary': event 7
              |
              |include/asm-generic/unaligned.h:14:15:
              |   14 |         __pptr->x;                                  =
                            \
              |      |         ~~~~~~^~~
              |      |               |
              |      |               (7) ...to here
   include/uapi/linux/byteorder/little_endian.h:34:51: note: in definition =
of macro '__le32_to_cpu'
              |   34 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
              |      |                                                   ^
   include/asm-generic/unaligned.h:32:28: note: in expansion of macro '__ge=
t_unaligned_t'
              |   32 |         return le32_to_cpu(__get_unaligned_t(__le32,=
 p));
              |      |                            ^~~~~~~~~~~~~~~~~
              |
            'ZSTD_decompress_insertDictionary': event 8
              |
              |lib/zstd/decompress/zstd_decompress.c:1313:12:
              | 1313 |         if (magic !=3D ZSTD_MAGIC_DICTIONARY) {
              |      |            ^
              |      |            |
              |      |            (8) following 'false' branch...
              |
            'ZSTD_decompress_insertDictionary': event 9
              |
              |include/asm-generic/unaligned.h:14:15:
              |   14 |         __pptr->x;                                  =
                            \
              |      |         ~~~~~~^~~
              |      |               |
              |      |               (9) ...to here
   include/uapi/linux/byteorder/little_endian.h:34:51: note: in definition =
of macro '__le32_to_cpu'
              |   34 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
              |      |                                                   ^
   include/asm-generic/unaligned.h:32:28: note: in expansion of macro '__ge=
t_unaligned_t'
              |   32 |         return le32_to_cpu(__get_unaligned_t(__le32,=
 p));
              |      |                            ^~~~~~~~~~~~~~~~~
              |
            'ZSTD_decompress_insertDictionary': event 10
              |
              |lib/zstd/decompress/zstd_decompress.c:1319:30:
              | 1319 |     {   size_t const eSize =3D ZSTD_loadDEntropy(&dc=
tx->entropy, dict, dictSize);
              |      |                              ^~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                              |
              |      |                              (10) calling 'ZSTD_load=
DEntropy' from 'ZSTD_decompress_insertDictionary'
              |
              +--> 'ZSTD_loadDEntropy': event 11
                     |
                     | 1222 | ZSTD_loadDEntropy(ZSTD_entropyDTables_t* entr=
opy,
                     |      | ^~~~~~~~~~~~~~~~~
                     |      | |
                     |      | (11) entry to 'ZSTD_loadDEntropy'
                     |
                   'ZSTD_loadDEntropy': event 12

vim +1252 lib/zstd/decompress/zstd_decompress.c

e0c1b49f5b674c Nick Terrell 2020-09-11  1217  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1218  /*! ZSTD_loadDEntropy() :
e0c1b49f5b674c Nick Terrell 2020-09-11  1219   *  dict : must point at begi=
nning of a valid zstd dictionary.
e0c1b49f5b674c Nick Terrell 2020-09-11  1220   * @return : size of entropy =
tables read */
e0c1b49f5b674c Nick Terrell 2020-09-11  1221  size_t
e0c1b49f5b674c Nick Terrell 2020-09-11  1222  ZSTD_loadDEntropy(ZSTD_entrop=
yDTables_t* entropy,
e0c1b49f5b674c Nick Terrell 2020-09-11  1223                    const void*=
 const dict, size_t const dictSize)
e0c1b49f5b674c Nick Terrell 2020-09-11  1224  {
e0c1b49f5b674c Nick Terrell 2020-09-11  1225      const BYTE* dictPtr =3D (=
const BYTE*)dict;
e0c1b49f5b674c Nick Terrell 2020-09-11  1226      const BYTE* const dictEnd=
 =3D dictPtr + dictSize;
e0c1b49f5b674c Nick Terrell 2020-09-11  1227  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1228      RETURN_ERROR_IF(dictSize =
<=3D 8, dictionary_corrupted, "dict is too small");
e0c1b49f5b674c Nick Terrell 2020-09-11  1229      assert(MEM_readLE32(dict)=
 =3D=3D ZSTD_MAGIC_DICTIONARY);   /* dict must be valid */
e0c1b49f5b674c Nick Terrell 2020-09-11  1230      dictPtr +=3D 8;   /* skip=
 header =3D magic + dictID */
e0c1b49f5b674c Nick Terrell 2020-09-11  1231  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1232      ZSTD_STATIC_ASSERT(offset=
of(ZSTD_entropyDTables_t, OFTable) =3D=3D offsetof(ZSTD_entropyDTables_t, L=
LTable) + sizeof(entropy->LLTable));
e0c1b49f5b674c Nick Terrell 2020-09-11  1233      ZSTD_STATIC_ASSERT(offset=
of(ZSTD_entropyDTables_t, MLTable) =3D=3D offsetof(ZSTD_entropyDTables_t, O=
FTable) + sizeof(entropy->OFTable));
e0c1b49f5b674c Nick Terrell 2020-09-11  1234      ZSTD_STATIC_ASSERT(sizeof=
(entropy->LLTable) + sizeof(entropy->OFTable) + sizeof(entropy->MLTable) >=
=3D HUF_DECOMPRESS_WORKSPACE_SIZE);
e0c1b49f5b674c Nick Terrell 2020-09-11  1235      {   void* const workspace=
 =3D &entropy->LLTable;   /* use fse tables as temporary workspace; implies=
 fse tables are grouped together */
e0c1b49f5b674c Nick Terrell 2020-09-11  1236          size_t const workspac=
eSize =3D sizeof(entropy->LLTable) + sizeof(entropy->OFTable) + sizeof(entr=
opy->MLTable);
e0c1b49f5b674c Nick Terrell 2020-09-11  1237  #ifdef HUF_FORCE_DECOMPRESS_X1
e0c1b49f5b674c Nick Terrell 2020-09-11  1238          /* in minimal huffman=
, we always use X1 variants */
e0c1b49f5b674c Nick Terrell 2020-09-11  1239          size_t const hSize =
=3D HUF_readDTableX1_wksp(entropy->hufTable,
e0c1b49f5b674c Nick Terrell 2020-09-11  1240                               =
                   dictPtr, dictEnd - dictPtr,
e0c1b49f5b674c Nick Terrell 2020-09-11  1241                               =
                   workspace, workspaceSize);
e0c1b49f5b674c Nick Terrell 2020-09-11  1242  #else
e0c1b49f5b674c Nick Terrell 2020-09-11  1243          size_t const hSize =
=3D HUF_readDTableX2_wksp(entropy->hufTable,
e0c1b49f5b674c Nick Terrell 2020-09-11  1244                               =
                   dictPtr, (size_t)(dictEnd - dictPtr),
e0c1b49f5b674c Nick Terrell 2020-09-11  1245                               =
                   workspace, workspaceSize);
e0c1b49f5b674c Nick Terrell 2020-09-11  1246  #endif
e0c1b49f5b674c Nick Terrell 2020-09-11  1247          RETURN_ERROR_IF(HUF_i=
sError(hSize), dictionary_corrupted, "");
e0c1b49f5b674c Nick Terrell 2020-09-11  1248          dictPtr +=3D hSize;
e0c1b49f5b674c Nick Terrell 2020-09-11  1249      }
e0c1b49f5b674c Nick Terrell 2020-09-11  1250  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1251      {   short offcodeNCount[M=
axOff+1];
e0c1b49f5b674c Nick Terrell 2020-09-11 @1252          unsigned offcodeMaxVa=
lue =3D MaxOff, offcodeLog;
e0c1b49f5b674c Nick Terrell 2020-09-11  1253          size_t const offcodeH=
eaderSize =3D FSE_readNCount(offcodeNCount, &offcodeMaxValue, &offcodeLog, =
dictPtr, (size_t)(dictEnd-dictPtr));
e0c1b49f5b674c Nick Terrell 2020-09-11  1254          RETURN_ERROR_IF(FSE_i=
sError(offcodeHeaderSize), dictionary_corrupted, "");
e0c1b49f5b674c Nick Terrell 2020-09-11  1255          RETURN_ERROR_IF(offco=
deMaxValue > MaxOff, dictionary_corrupted, "");
e0c1b49f5b674c Nick Terrell 2020-09-11  1256          RETURN_ERROR_IF(offco=
deLog > OffFSELog, dictionary_corrupted, "");
e0c1b49f5b674c Nick Terrell 2020-09-11  1257          ZSTD_buildFSETable( e=
ntropy->OFTable,
e0c1b49f5b674c Nick Terrell 2020-09-11  1258                              o=
ffcodeNCount, offcodeMaxValue,
e0c1b49f5b674c Nick Terrell 2020-09-11  1259                              O=
F_base, OF_bits,
e0c1b49f5b674c Nick Terrell 2020-09-11  1260                              o=
ffcodeLog,
e0c1b49f5b674c Nick Terrell 2020-09-11  1261                              e=
ntropy->workspace, sizeof(entropy->workspace),
e0c1b49f5b674c Nick Terrell 2020-09-11  1262                              /=
* bmi2 */0);
e0c1b49f5b674c Nick Terrell 2020-09-11  1263          dictPtr +=3D offcodeH=
eaderSize;
e0c1b49f5b674c Nick Terrell 2020-09-11  1264      }
e0c1b49f5b674c Nick Terrell 2020-09-11  1265  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1266      {   short matchlengthNCou=
nt[MaxML+1];
e0c1b49f5b674c Nick Terrell 2020-09-11  1267          unsigned matchlengthM=
axValue =3D MaxML, matchlengthLog;
e0c1b49f5b674c Nick Terrell 2020-09-11  1268          size_t const matchlen=
gthHeaderSize =3D FSE_readNCount(matchlengthNCount, &matchlengthMaxValue, &=
matchlengthLog, dictPtr, (size_t)(dictEnd-dictPtr));
e0c1b49f5b674c Nick Terrell 2020-09-11  1269          RETURN_ERROR_IF(FSE_i=
sError(matchlengthHeaderSize), dictionary_corrupted, "");
e0c1b49f5b674c Nick Terrell 2020-09-11  1270          RETURN_ERROR_IF(match=
lengthMaxValue > MaxML, dictionary_corrupted, "");
e0c1b49f5b674c Nick Terrell 2020-09-11  1271          RETURN_ERROR_IF(match=
lengthLog > MLFSELog, dictionary_corrupted, "");
e0c1b49f5b674c Nick Terrell 2020-09-11  1272          ZSTD_buildFSETable( e=
ntropy->MLTable,
e0c1b49f5b674c Nick Terrell 2020-09-11  1273                              m=
atchlengthNCount, matchlengthMaxValue,
e0c1b49f5b674c Nick Terrell 2020-09-11  1274                              M=
L_base, ML_bits,
e0c1b49f5b674c Nick Terrell 2020-09-11  1275                              m=
atchlengthLog,
e0c1b49f5b674c Nick Terrell 2020-09-11  1276                              e=
ntropy->workspace, sizeof(entropy->workspace),
e0c1b49f5b674c Nick Terrell 2020-09-11  1277                              /=
* bmi2 */ 0);
e0c1b49f5b674c Nick Terrell 2020-09-11  1278          dictPtr +=3D matchlen=
gthHeaderSize;
e0c1b49f5b674c Nick Terrell 2020-09-11  1279      }
e0c1b49f5b674c Nick Terrell 2020-09-11  1280  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1281      {   short litlengthNCount=
[MaxLL+1];
e0c1b49f5b674c Nick Terrell 2020-09-11  1282          unsigned litlengthMax=
Value =3D MaxLL, litlengthLog;
e0c1b49f5b674c Nick Terrell 2020-09-11  1283          size_t const litlengt=
hHeaderSize =3D FSE_readNCount(litlengthNCount, &litlengthMaxValue, &litlen=
gthLog, dictPtr, (size_t)(dictEnd-dictPtr));
e0c1b49f5b674c Nick Terrell 2020-09-11  1284          RETURN_ERROR_IF(FSE_i=
sError(litlengthHeaderSize), dictionary_corrupted, "");
e0c1b49f5b674c Nick Terrell 2020-09-11  1285          RETURN_ERROR_IF(litle=
ngthMaxValue > MaxLL, dictionary_corrupted, "");
e0c1b49f5b674c Nick Terrell 2020-09-11  1286          RETURN_ERROR_IF(litle=
ngthLog > LLFSELog, dictionary_corrupted, "");
e0c1b49f5b674c Nick Terrell 2020-09-11  1287          ZSTD_buildFSETable( e=
ntropy->LLTable,
e0c1b49f5b674c Nick Terrell 2020-09-11  1288                              l=
itlengthNCount, litlengthMaxValue,
e0c1b49f5b674c Nick Terrell 2020-09-11  1289                              L=
L_base, LL_bits,
e0c1b49f5b674c Nick Terrell 2020-09-11  1290                              l=
itlengthLog,
e0c1b49f5b674c Nick Terrell 2020-09-11  1291                              e=
ntropy->workspace, sizeof(entropy->workspace),
e0c1b49f5b674c Nick Terrell 2020-09-11  1292                              /=
* bmi2 */ 0);
e0c1b49f5b674c Nick Terrell 2020-09-11  1293          dictPtr +=3D litlengt=
hHeaderSize;
e0c1b49f5b674c Nick Terrell 2020-09-11  1294      }
e0c1b49f5b674c Nick Terrell 2020-09-11  1295  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1296      RETURN_ERROR_IF(dictPtr+1=
2 > dictEnd, dictionary_corrupted, "");
e0c1b49f5b674c Nick Terrell 2020-09-11  1297      {   int i;
e0c1b49f5b674c Nick Terrell 2020-09-11  1298          size_t const dictCont=
entSize =3D (size_t)(dictEnd - (dictPtr+12));
e0c1b49f5b674c Nick Terrell 2020-09-11  1299          for (i=3D0; i<3; i++)=
 {
e0c1b49f5b674c Nick Terrell 2020-09-11  1300              U32 const rep =3D=
 MEM_readLE32(dictPtr); dictPtr +=3D 4;
e0c1b49f5b674c Nick Terrell 2020-09-11  1301              RETURN_ERROR_IF(r=
ep=3D=3D0 || rep > dictContentSize,
e0c1b49f5b674c Nick Terrell 2020-09-11  1302                              d=
ictionary_corrupted, "");
e0c1b49f5b674c Nick Terrell 2020-09-11  1303              entropy->rep[i] =
=3D rep;
e0c1b49f5b674c Nick Terrell 2020-09-11  1304      }   }
e0c1b49f5b674c Nick Terrell 2020-09-11  1305  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1306      return (size_t)(dictPtr -=
 (const BYTE*)dict);
e0c1b49f5b674c Nick Terrell 2020-09-11  1307  }
e0c1b49f5b674c Nick Terrell 2020-09-11  1308  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4225099348156914555==--

