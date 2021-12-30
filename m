Content-Type: multipart/mixed; boundary="===============3447614365123481061=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/zstd/compress/zstd_opt.c:959:61: warning: Same expression on both sides of '-' because 'ip' and 'istart' represent the same value. [knownConditionTrueFalse]
Date: Thu, 30 Dec 2021 19:59:11 +0800
Message-ID: <202112301855.dFsoSuw3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3447614365123481061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Nick Terrell <terrelln@fb.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eec4df26e24e978e49ccf9bcf49ca0f2ccdaeffe
commit: e0c1b49f5b674cca7b10549c53b3791d0bbc90a8 lib: zstd: Upgrade to late=
st upstream zstd version 1.4.10
date:   7 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 7 weeks ago
compiler: h8300-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/wireless/util.c:1202:6: warning: Same expression on both sides of '-=
'. [duplicateExpression]
     [6 - 6] =3D 26950, /* MCS 9.1 : 2695.0 mbps */
        ^
>> net/wireless/nl80211.c:73:6: warning: Local variable wdev_id shadows out=
er function [shadowFunction]
    u64 wdev_id =3D 0;
        ^
   net/wireless/nl80211.h:19:19: note: Shadowed declaration
   static inline u64 wdev_id(struct wireless_dev *wdev)
                     ^
   net/wireless/nl80211.c:73:6: note: Shadow variable
    u64 wdev_id =3D 0;
        ^
   net/wireless/nl80211.c:157:7: warning: Local variable wdev_id shadows ou=
ter function [shadowFunction]
     u64 wdev_id =3D nla_get_u64(attrs[NL80211_ATTR_WDEV]);
         ^
   net/wireless/nl80211.h:19:19: note: Shadowed declaration
   static inline u64 wdev_id(struct wireless_dev *wdev)
                     ^
   net/wireless/nl80211.c:157:7: note: Shadow variable
     u64 wdev_id =3D nla_get_u64(attrs[NL80211_ATTR_WDEV]);
         ^
>> lib/zstd/compress/zstd_opt.c:959:61: warning: Same expression on both si=
des of '-' because 'ip' and 'istart' represent the same value. [knownCondit=
ionTrueFalse]
       ZSTD_opt_getNextMatchAndUpdateSeqStore(&optLdm, (U32)(ip-istart), (U=
32)(iend-ip));
                                                               ^
   lib/zstd/compress/zstd_opt.c:940:22: note: 'ip' is assigned value 'istar=
t' here.
       const BYTE* ip =3D istart;
                        ^
   lib/zstd/compress/zstd_opt.c:959:61: note: Same expression on both sides=
 of '-' because 'ip' and 'istart' represent the same value.
       ZSTD_opt_getNextMatchAndUpdateSeqStore(&optLdm, (U32)(ip-istart), (U=
32)(iend-ip));
                                                               ^
>> net/bluetooth/bnep/core.c:111:2: warning: Assignment of function paramet=
er has no effect outside the function. Did you forget dereferencing it? [us=
elessAssignmentPtrArg]
    data++;
    ^
   net/bluetooth/bnep/core.c:157:2: warning: Assignment of function paramet=
er has no effect outside the function. Did you forget dereferencing it? [us=
elessAssignmentPtrArg]
    data +=3D 2;
    ^

vim +959 lib/zstd/compress/zstd_opt.c

e0c1b49f5b674c Nick Terrell 2020-09-11   929  =

e0c1b49f5b674c Nick Terrell 2020-09-11   930  FORCE_INLINE_TEMPLATE size_t
e0c1b49f5b674c Nick Terrell 2020-09-11   931  ZSTD_compressBlock_opt_generi=
c(ZSTD_matchState_t* ms,
e0c1b49f5b674c Nick Terrell 2020-09-11   932                               =
  seqStore_t* seqStore,
e0c1b49f5b674c Nick Terrell 2020-09-11   933                               =
  U32 rep[ZSTD_REP_NUM],
e0c1b49f5b674c Nick Terrell 2020-09-11   934                           cons=
t void* src, size_t srcSize,
e0c1b49f5b674c Nick Terrell 2020-09-11   935                           cons=
t int optLevel,
e0c1b49f5b674c Nick Terrell 2020-09-11   936                           cons=
t ZSTD_dictMode_e dictMode)
e0c1b49f5b674c Nick Terrell 2020-09-11   937  {
e0c1b49f5b674c Nick Terrell 2020-09-11   938      optState_t* const optStat=
ePtr =3D &ms->opt;
e0c1b49f5b674c Nick Terrell 2020-09-11   939      const BYTE* const istart =
=3D (const BYTE*)src;
e0c1b49f5b674c Nick Terrell 2020-09-11   940      const BYTE* ip =3D istart;
e0c1b49f5b674c Nick Terrell 2020-09-11   941      const BYTE* anchor =3D is=
tart;
e0c1b49f5b674c Nick Terrell 2020-09-11   942      const BYTE* const iend =
=3D istart + srcSize;
e0c1b49f5b674c Nick Terrell 2020-09-11   943      const BYTE* const ilimit =
=3D iend - 8;
e0c1b49f5b674c Nick Terrell 2020-09-11   944      const BYTE* const base =
=3D ms->window.base;
e0c1b49f5b674c Nick Terrell 2020-09-11   945      const BYTE* const prefixS=
tart =3D base + ms->window.dictLimit;
e0c1b49f5b674c Nick Terrell 2020-09-11   946      const ZSTD_compressionPar=
ameters* const cParams =3D &ms->cParams;
e0c1b49f5b674c Nick Terrell 2020-09-11   947  =

e0c1b49f5b674c Nick Terrell 2020-09-11   948      U32 const sufficient_len =
=3D MIN(cParams->targetLength, ZSTD_OPT_NUM -1);
e0c1b49f5b674c Nick Terrell 2020-09-11   949      U32 const minMatch =3D (c=
Params->minMatch =3D=3D 3) ? 3 : 4;
e0c1b49f5b674c Nick Terrell 2020-09-11   950      U32 nextToUpdate3 =3D ms-=
>nextToUpdate;
e0c1b49f5b674c Nick Terrell 2020-09-11   951  =

e0c1b49f5b674c Nick Terrell 2020-09-11   952      ZSTD_optimal_t* const opt=
 =3D optStatePtr->priceTable;
e0c1b49f5b674c Nick Terrell 2020-09-11   953      ZSTD_match_t* const match=
es =3D optStatePtr->matchTable;
e0c1b49f5b674c Nick Terrell 2020-09-11   954      ZSTD_optimal_t lastSequen=
ce;
e0c1b49f5b674c Nick Terrell 2020-09-11   955      ZSTD_optLdm_t optLdm;
e0c1b49f5b674c Nick Terrell 2020-09-11   956  =

e0c1b49f5b674c Nick Terrell 2020-09-11   957      optLdm.seqStore =3D ms->l=
dmSeqStore ? *ms->ldmSeqStore : kNullRawSeqStore;
e0c1b49f5b674c Nick Terrell 2020-09-11   958      optLdm.endPosInBlock =3D =
optLdm.startPosInBlock =3D optLdm.offset =3D 0;
e0c1b49f5b674c Nick Terrell 2020-09-11  @959      ZSTD_opt_getNextMatchAndU=
pdateSeqStore(&optLdm, (U32)(ip-istart), (U32)(iend-ip));
e0c1b49f5b674c Nick Terrell 2020-09-11   960  =

e0c1b49f5b674c Nick Terrell 2020-09-11   961      /* init */
e0c1b49f5b674c Nick Terrell 2020-09-11   962      DEBUGLOG(5, "ZSTD_compres=
sBlock_opt_generic: current=3D%u, prefix=3D%u, nextToUpdate=3D%u",
e0c1b49f5b674c Nick Terrell 2020-09-11   963                  (U32)(ip - ba=
se), ms->window.dictLimit, ms->nextToUpdate);
e0c1b49f5b674c Nick Terrell 2020-09-11   964      assert(optLevel <=3D 2);
e0c1b49f5b674c Nick Terrell 2020-09-11   965      ZSTD_rescaleFreqs(optStat=
ePtr, (const BYTE*)src, srcSize, optLevel);
e0c1b49f5b674c Nick Terrell 2020-09-11   966      ip +=3D (ip=3D=3DprefixSt=
art);
e0c1b49f5b674c Nick Terrell 2020-09-11   967  =

e0c1b49f5b674c Nick Terrell 2020-09-11   968      /* Match Loop */
e0c1b49f5b674c Nick Terrell 2020-09-11   969      while (ip < ilimit) {
e0c1b49f5b674c Nick Terrell 2020-09-11   970          U32 cur, last_pos =3D=
 0;
e0c1b49f5b674c Nick Terrell 2020-09-11   971  =

e0c1b49f5b674c Nick Terrell 2020-09-11   972          /* find first match */
e0c1b49f5b674c Nick Terrell 2020-09-11   973          {   U32 const litlen =
=3D (U32)(ip - anchor);
e0c1b49f5b674c Nick Terrell 2020-09-11   974              U32 const ll0 =3D=
 !litlen;
e0c1b49f5b674c Nick Terrell 2020-09-11   975              U32 nbMatches =3D=
 ZSTD_BtGetAllMatches(matches, ms, &nextToUpdate3, ip, iend, dictMode, rep,=
 ll0, minMatch);
e0c1b49f5b674c Nick Terrell 2020-09-11   976              ZSTD_optLdm_proce=
ssMatchCandidate(&optLdm, matches, &nbMatches,
e0c1b49f5b674c Nick Terrell 2020-09-11   977                               =
                 (U32)(ip-istart), (U32)(iend - ip));
e0c1b49f5b674c Nick Terrell 2020-09-11   978              if (!nbMatches) {=
 ip++; continue; }
e0c1b49f5b674c Nick Terrell 2020-09-11   979  =

e0c1b49f5b674c Nick Terrell 2020-09-11   980              /* initialize opt=
[0] */
e0c1b49f5b674c Nick Terrell 2020-09-11   981              { U32 i ; for (i=
=3D0; i<ZSTD_REP_NUM; i++) opt[0].rep[i] =3D rep[i]; }
e0c1b49f5b674c Nick Terrell 2020-09-11   982              opt[0].mlen =3D 0=
;  /* means is_a_literal */
e0c1b49f5b674c Nick Terrell 2020-09-11   983              opt[0].litlen =3D=
 litlen;
e0c1b49f5b674c Nick Terrell 2020-09-11   984              /* We don't need =
to include the actual price of the literals because
e0c1b49f5b674c Nick Terrell 2020-09-11   985               * it is static f=
or the duration of the forward pass, and is included
e0c1b49f5b674c Nick Terrell 2020-09-11   986               * in every price=
. We include the literal length to avoid negative
e0c1b49f5b674c Nick Terrell 2020-09-11   987               * prices when we=
 subtract the previous literal length.
e0c1b49f5b674c Nick Terrell 2020-09-11   988               */
e0c1b49f5b674c Nick Terrell 2020-09-11   989              opt[0].price =3D =
ZSTD_litLengthPrice(litlen, optStatePtr, optLevel);
e0c1b49f5b674c Nick Terrell 2020-09-11   990  =

e0c1b49f5b674c Nick Terrell 2020-09-11   991              /* large match ->=
 immediate encoding */
e0c1b49f5b674c Nick Terrell 2020-09-11   992              {   U32 const max=
ML =3D matches[nbMatches-1].len;
e0c1b49f5b674c Nick Terrell 2020-09-11   993                  U32 const max=
Offset =3D matches[nbMatches-1].off;
e0c1b49f5b674c Nick Terrell 2020-09-11   994                  DEBUGLOG(6, "=
found %u matches of maxLength=3D%u and maxOffCode=3D%u at cPos=3D%u =3D> st=
art new series",
e0c1b49f5b674c Nick Terrell 2020-09-11   995                              n=
bMatches, maxML, maxOffset, (U32)(ip-prefixStart));
e0c1b49f5b674c Nick Terrell 2020-09-11   996  =

e0c1b49f5b674c Nick Terrell 2020-09-11   997                  if (maxML > s=
ufficient_len) {
e0c1b49f5b674c Nick Terrell 2020-09-11   998                      lastSeque=
nce.litlen =3D litlen;
e0c1b49f5b674c Nick Terrell 2020-09-11   999                      lastSeque=
nce.mlen =3D maxML;
e0c1b49f5b674c Nick Terrell 2020-09-11  1000                      lastSeque=
nce.off =3D maxOffset;
e0c1b49f5b674c Nick Terrell 2020-09-11  1001                      DEBUGLOG(=
6, "large match (%u>%u), immediate encoding",
e0c1b49f5b674c Nick Terrell 2020-09-11  1002                               =
   maxML, sufficient_len);
e0c1b49f5b674c Nick Terrell 2020-09-11  1003                      cur =3D 0;
e0c1b49f5b674c Nick Terrell 2020-09-11  1004                      last_pos =
=3D ZSTD_totalLen(lastSequence);
e0c1b49f5b674c Nick Terrell 2020-09-11  1005                      goto _sho=
rtestPath;
e0c1b49f5b674c Nick Terrell 2020-09-11  1006              }   }
e0c1b49f5b674c Nick Terrell 2020-09-11  1007  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1008              /* set prices for=
 first matches starting position =3D=3D 0 */
e0c1b49f5b674c Nick Terrell 2020-09-11  1009              {   U32 const lit=
eralsPrice =3D opt[0].price + ZSTD_litLengthPrice(0, optStatePtr, optLevel);
e0c1b49f5b674c Nick Terrell 2020-09-11  1010                  U32 pos;
e0c1b49f5b674c Nick Terrell 2020-09-11  1011                  U32 matchNb;
e0c1b49f5b674c Nick Terrell 2020-09-11  1012                  for (pos =3D =
1; pos < minMatch; pos++) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1013                      opt[pos].=
price =3D ZSTD_MAX_PRICE;   /* mlen, litlen and price will be fixed during =
forward scanning */
e0c1b49f5b674c Nick Terrell 2020-09-11  1014                  }
e0c1b49f5b674c Nick Terrell 2020-09-11  1015                  for (matchNb =
=3D 0; matchNb < nbMatches; matchNb++) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1016                      U32 const=
 offset =3D matches[matchNb].off;
e0c1b49f5b674c Nick Terrell 2020-09-11  1017                      U32 const=
 end =3D matches[matchNb].len;
e0c1b49f5b674c Nick Terrell 2020-09-11  1018                      for ( ; p=
os <=3D end ; pos++ ) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1019                          U32 c=
onst matchPrice =3D ZSTD_getMatchPrice(offset, pos, optStatePtr, optLevel);
e0c1b49f5b674c Nick Terrell 2020-09-11  1020                          U32 c=
onst sequencePrice =3D literalsPrice + matchPrice;
e0c1b49f5b674c Nick Terrell 2020-09-11  1021                          DEBUG=
LOG(7, "rPos:%u =3D> set initial price : %.2f",
e0c1b49f5b674c Nick Terrell 2020-09-11  1022                               =
       pos, ZSTD_fCost(sequencePrice));
e0c1b49f5b674c Nick Terrell 2020-09-11  1023                          opt[p=
os].mlen =3D pos;
e0c1b49f5b674c Nick Terrell 2020-09-11  1024                          opt[p=
os].off =3D offset;
e0c1b49f5b674c Nick Terrell 2020-09-11  1025                          opt[p=
os].litlen =3D litlen;
e0c1b49f5b674c Nick Terrell 2020-09-11  1026                          opt[p=
os].price =3D sequencePrice;
e0c1b49f5b674c Nick Terrell 2020-09-11  1027                  }   }
e0c1b49f5b674c Nick Terrell 2020-09-11  1028                  last_pos =3D =
pos-1;
e0c1b49f5b674c Nick Terrell 2020-09-11  1029              }
e0c1b49f5b674c Nick Terrell 2020-09-11  1030          }
e0c1b49f5b674c Nick Terrell 2020-09-11  1031  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1032          /* check further posi=
tions */
e0c1b49f5b674c Nick Terrell 2020-09-11  1033          for (cur =3D 1; cur <=
=3D last_pos; cur++) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1034              const BYTE* const=
 inr =3D ip + cur;
e0c1b49f5b674c Nick Terrell 2020-09-11  1035              assert(cur < ZSTD=
_OPT_NUM);
e0c1b49f5b674c Nick Terrell 2020-09-11  1036              DEBUGLOG(7, "cPos=
:%zi=3D=3DrPos:%u", inr-istart, cur)
e0c1b49f5b674c Nick Terrell 2020-09-11  1037  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1038              /* Fix current po=
sition with one literal if cheaper */
e0c1b49f5b674c Nick Terrell 2020-09-11  1039              {   U32 const lit=
len =3D (opt[cur-1].mlen =3D=3D 0) ? opt[cur-1].litlen + 1 : 1;
e0c1b49f5b674c Nick Terrell 2020-09-11  1040                  int const pri=
ce =3D opt[cur-1].price
e0c1b49f5b674c Nick Terrell 2020-09-11  1041                               =
   + ZSTD_rawLiteralsCost(ip+cur-1, 1, optStatePtr, optLevel)
e0c1b49f5b674c Nick Terrell 2020-09-11  1042                               =
   + ZSTD_litLengthPrice(litlen, optStatePtr, optLevel)
e0c1b49f5b674c Nick Terrell 2020-09-11  1043                               =
   - ZSTD_litLengthPrice(litlen-1, optStatePtr, optLevel);
e0c1b49f5b674c Nick Terrell 2020-09-11  1044                  assert(price =
< 1000000000); /* overflow check */
e0c1b49f5b674c Nick Terrell 2020-09-11  1045                  if (price <=
=3D opt[cur].price) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1046                      DEBUGLOG(=
7, "cPos:%zi=3D=3DrPos:%u : better price (%.2f<=3D%.2f) using literal (ll=
=3D=3D%u) (hist:%u,%u,%u)",
e0c1b49f5b674c Nick Terrell 2020-09-11  1047                               =
   inr-istart, cur, ZSTD_fCost(price), ZSTD_fCost(opt[cur].price), litlen,
e0c1b49f5b674c Nick Terrell 2020-09-11  1048                               =
   opt[cur-1].rep[0], opt[cur-1].rep[1], opt[cur-1].rep[2]);
e0c1b49f5b674c Nick Terrell 2020-09-11  1049                      opt[cur].=
mlen =3D 0;
e0c1b49f5b674c Nick Terrell 2020-09-11  1050                      opt[cur].=
off =3D 0;
e0c1b49f5b674c Nick Terrell 2020-09-11  1051                      opt[cur].=
litlen =3D litlen;
e0c1b49f5b674c Nick Terrell 2020-09-11  1052                      opt[cur].=
price =3D price;
e0c1b49f5b674c Nick Terrell 2020-09-11  1053                  } else {
e0c1b49f5b674c Nick Terrell 2020-09-11  1054                      DEBUGLOG(=
7, "cPos:%zi=3D=3DrPos:%u : literal would cost more (%.2f>%.2f) (hist:%u,%u=
,%u)",
e0c1b49f5b674c Nick Terrell 2020-09-11  1055                               =
   inr-istart, cur, ZSTD_fCost(price), ZSTD_fCost(opt[cur].price),
e0c1b49f5b674c Nick Terrell 2020-09-11  1056                               =
   opt[cur].rep[0], opt[cur].rep[1], opt[cur].rep[2]);
e0c1b49f5b674c Nick Terrell 2020-09-11  1057                  }
e0c1b49f5b674c Nick Terrell 2020-09-11  1058              }
e0c1b49f5b674c Nick Terrell 2020-09-11  1059  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1060              /* Set the repcod=
es of the current position. We must do it here
e0c1b49f5b674c Nick Terrell 2020-09-11  1061               * because we rel=
y on the repcodes of the 2nd to last sequence being
e0c1b49f5b674c Nick Terrell 2020-09-11  1062               * correct to set=
 the next chunks repcodes during the backward
e0c1b49f5b674c Nick Terrell 2020-09-11  1063               * traversal.
e0c1b49f5b674c Nick Terrell 2020-09-11  1064               */
e0c1b49f5b674c Nick Terrell 2020-09-11  1065              ZSTD_STATIC_ASSER=
T(sizeof(opt[cur].rep) =3D=3D sizeof(repcodes_t));
e0c1b49f5b674c Nick Terrell 2020-09-11  1066              assert(cur >=3D o=
pt[cur].mlen);
e0c1b49f5b674c Nick Terrell 2020-09-11  1067              if (opt[cur].mlen=
 !=3D 0) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1068                  U32 const pre=
v =3D cur - opt[cur].mlen;
e0c1b49f5b674c Nick Terrell 2020-09-11  1069                  repcodes_t ne=
wReps =3D ZSTD_updateRep(opt[prev].rep, opt[cur].off, opt[cur].litlen=3D=3D=
0);
e0c1b49f5b674c Nick Terrell 2020-09-11  1070                  ZSTD_memcpy(o=
pt[cur].rep, &newReps, sizeof(repcodes_t));
e0c1b49f5b674c Nick Terrell 2020-09-11  1071              } else {
e0c1b49f5b674c Nick Terrell 2020-09-11  1072                  ZSTD_memcpy(o=
pt[cur].rep, opt[cur - 1].rep, sizeof(repcodes_t));
e0c1b49f5b674c Nick Terrell 2020-09-11  1073              }
e0c1b49f5b674c Nick Terrell 2020-09-11  1074  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1075              /* last match mus=
t start at a minimum distance of 8 from oend */
e0c1b49f5b674c Nick Terrell 2020-09-11  1076              if (inr > ilimit)=
 continue;
e0c1b49f5b674c Nick Terrell 2020-09-11  1077  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1078              if (cur =3D=3D la=
st_pos) break;
e0c1b49f5b674c Nick Terrell 2020-09-11  1079  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1080              if ( (optLevel=3D=
=3D0) /*static_test*/
e0c1b49f5b674c Nick Terrell 2020-09-11  1081                && (opt[cur+1].=
price <=3D opt[cur].price + (BITCOST_MULTIPLIER/2)) ) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1082                  DEBUGLOG(7, "=
move to next rPos:%u : price is <=3D", cur+1);
e0c1b49f5b674c Nick Terrell 2020-09-11  1083                  continue;  /*=
 skip unpromising positions; about ~+6% speed, -0.01 ratio */
e0c1b49f5b674c Nick Terrell 2020-09-11  1084              }
e0c1b49f5b674c Nick Terrell 2020-09-11  1085  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1086              {   U32 const ll0=
 =3D (opt[cur].mlen !=3D 0);
e0c1b49f5b674c Nick Terrell 2020-09-11  1087                  U32 const lit=
len =3D (opt[cur].mlen =3D=3D 0) ? opt[cur].litlen : 0;
e0c1b49f5b674c Nick Terrell 2020-09-11  1088                  U32 const pre=
viousPrice =3D opt[cur].price;
e0c1b49f5b674c Nick Terrell 2020-09-11  1089                  U32 const bas=
ePrice =3D previousPrice + ZSTD_litLengthPrice(0, optStatePtr, optLevel);
e0c1b49f5b674c Nick Terrell 2020-09-11  1090                  U32 nbMatches=
 =3D ZSTD_BtGetAllMatches(matches, ms, &nextToUpdate3, inr, iend, dictMode,=
 opt[cur].rep, ll0, minMatch);
e0c1b49f5b674c Nick Terrell 2020-09-11  1091                  U32 matchNb;
e0c1b49f5b674c Nick Terrell 2020-09-11  1092  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1093                  ZSTD_optLdm_p=
rocessMatchCandidate(&optLdm, matches, &nbMatches,
e0c1b49f5b674c Nick Terrell 2020-09-11  1094                               =
                     (U32)(inr-istart), (U32)(iend-inr));
e0c1b49f5b674c Nick Terrell 2020-09-11  1095  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1096                  if (!nbMatche=
s) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1097                      DEBUGLOG(=
7, "rPos:%u : no match found", cur);
e0c1b49f5b674c Nick Terrell 2020-09-11  1098                      continue;
e0c1b49f5b674c Nick Terrell 2020-09-11  1099                  }
e0c1b49f5b674c Nick Terrell 2020-09-11  1100  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1101                  {   U32 const=
 maxML =3D matches[nbMatches-1].len;
e0c1b49f5b674c Nick Terrell 2020-09-11  1102                      DEBUGLOG(=
7, "cPos:%zi=3D=3DrPos:%u, found %u matches, of maxLength=3D%u",
e0c1b49f5b674c Nick Terrell 2020-09-11  1103                               =
   inr-istart, cur, nbMatches, maxML);
e0c1b49f5b674c Nick Terrell 2020-09-11  1104  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1105                      if ( (max=
ML > sufficient_len)
e0c1b49f5b674c Nick Terrell 2020-09-11  1106                        || (cur=
 + maxML >=3D ZSTD_OPT_NUM) ) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1107                          lastS=
equence.mlen =3D maxML;
e0c1b49f5b674c Nick Terrell 2020-09-11  1108                          lastS=
equence.off =3D matches[nbMatches-1].off;
e0c1b49f5b674c Nick Terrell 2020-09-11  1109                          lastS=
equence.litlen =3D litlen;
e0c1b49f5b674c Nick Terrell 2020-09-11  1110                          cur -=
=3D (opt[cur].mlen=3D=3D0) ? opt[cur].litlen : 0;  /* last sequence is actu=
ally only literals, fix cur to last match - note : may underflow, in which =
case, it's first sequence, and it's okay */
e0c1b49f5b674c Nick Terrell 2020-09-11  1111                          last_=
pos =3D cur + ZSTD_totalLen(lastSequence);
e0c1b49f5b674c Nick Terrell 2020-09-11  1112                          if (c=
ur > ZSTD_OPT_NUM) cur =3D 0;   /* underflow =3D> first match */
e0c1b49f5b674c Nick Terrell 2020-09-11  1113                          goto =
_shortestPath;
e0c1b49f5b674c Nick Terrell 2020-09-11  1114                  }   }
e0c1b49f5b674c Nick Terrell 2020-09-11  1115  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1116                  /* set prices=
 using matches found at position =3D=3D cur */
e0c1b49f5b674c Nick Terrell 2020-09-11  1117                  for (matchNb =
=3D 0; matchNb < nbMatches; matchNb++) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1118                      U32 const=
 offset =3D matches[matchNb].off;
e0c1b49f5b674c Nick Terrell 2020-09-11  1119                      U32 const=
 lastML =3D matches[matchNb].len;
e0c1b49f5b674c Nick Terrell 2020-09-11  1120                      U32 const=
 startML =3D (matchNb>0) ? matches[matchNb-1].len+1 : minMatch;
e0c1b49f5b674c Nick Terrell 2020-09-11  1121                      U32 mlen;
e0c1b49f5b674c Nick Terrell 2020-09-11  1122  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1123                      DEBUGLOG(=
7, "testing match %u =3D> offCode=3D%4u, mlen=3D%2u, llen=3D%2u",
e0c1b49f5b674c Nick Terrell 2020-09-11  1124                               =
   matchNb, matches[matchNb].off, lastML, litlen);
e0c1b49f5b674c Nick Terrell 2020-09-11  1125  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1126                      for (mlen=
 =3D lastML; mlen >=3D startML; mlen--) {  /* scan downward */
e0c1b49f5b674c Nick Terrell 2020-09-11  1127                          U32 c=
onst pos =3D cur + mlen;
e0c1b49f5b674c Nick Terrell 2020-09-11  1128                          int c=
onst price =3D basePrice + ZSTD_getMatchPrice(offset, mlen, optStatePtr, op=
tLevel);
e0c1b49f5b674c Nick Terrell 2020-09-11  1129  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1130                          if ((=
pos > last_pos) || (price < opt[pos].price)) {
e0c1b49f5b674c Nick Terrell 2020-09-11  1131                              D=
EBUGLOG(7, "rPos:%u (ml=3D%2u) =3D> new better price (%.2f<%.2f)",
e0c1b49f5b674c Nick Terrell 2020-09-11  1132                               =
           pos, mlen, ZSTD_fCost(price), ZSTD_fCost(opt[pos].price));
e0c1b49f5b674c Nick Terrell 2020-09-11  1133                              w=
hile (last_pos < pos) { opt[last_pos+1].price =3D ZSTD_MAX_PRICE; last_pos+=
+; }   /* fill empty positions */
e0c1b49f5b674c Nick Terrell 2020-09-11  1134                              o=
pt[pos].mlen =3D mlen;
e0c1b49f5b674c Nick Terrell 2020-09-11  1135                              o=
pt[pos].off =3D offset;
e0c1b49f5b674c Nick Terrell 2020-09-11  1136                              o=
pt[pos].litlen =3D litlen;
e0c1b49f5b674c Nick Terrell 2020-09-11  1137                              o=
pt[pos].price =3D price;
e0c1b49f5b674c Nick Terrell 2020-09-11  1138                          } els=
e {
e0c1b49f5b674c Nick Terrell 2020-09-11  1139                              D=
EBUGLOG(7, "rPos:%u (ml=3D%2u) =3D> new price is worse (%.2f>=3D%.2f)",
e0c1b49f5b674c Nick Terrell 2020-09-11  1140                               =
           pos, mlen, ZSTD_fCost(price), ZSTD_fCost(opt[pos].price));
e0c1b49f5b674c Nick Terrell 2020-09-11  1141                              i=
f (optLevel=3D=3D0) break;  /* early update abort; gets ~+10% speed for abo=
ut -0.01 ratio loss */
e0c1b49f5b674c Nick Terrell 2020-09-11  1142                          }
e0c1b49f5b674c Nick Terrell 2020-09-11  1143              }   }   }
e0c1b49f5b674c Nick Terrell 2020-09-11  1144          }  /* for (cur =3D 1;=
 cur <=3D last_pos; cur++) */
e0c1b49f5b674c Nick Terrell 2020-09-11  1145  =

e0c1b49f5b674c Nick Terrell 2020-09-11  1146          lastSequence =3D opt[=
last_pos];
e0c1b49f5b674c Nick Terrell 2020-09-11  1147          cur =3D last_pos > ZS=
TD_totalLen(lastSequence) ? last_pos - ZSTD_totalLen(lastSequence) : 0;  /*=
 single sequence, and it starts before `ip` */
e0c1b49f5b674c Nick Terrell 2020-09-11  1148          assert(cur < ZSTD_OPT=
_NUM);  /* control overflow*/
e0c1b49f5b674c Nick Terrell 2020-09-11  1149  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============3447614365123481061==--

