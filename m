Content-Type: multipart/mixed; boundary="===============3168377184442726304=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ogabbay:habanalabs-next 28/62] drivers/misc/habanalabs/common/command_submission.c:2121:14: warning: The left operand of '==' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Thu, 26 Aug 2021 05:30:18 +0800
Message-ID: <202108260513.S1iZaOgu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3168377184442726304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ohad Sharabi <osharabi@habana.ai>
CC: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git h=
abanalabs-next
head:   1f3192a0f941290cff0d974f6583ca72169fd118
commit: 5bf209df737fb0b7d809a04bae610cbc3f7311f7 [28/62] habanalabs: add wa=
it-for-multi-CS uAPI
:::::: branch date: 2 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-c007-20210824 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d26000=
e4cc2bc65e207a84fa26cb6e374d60aa12)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git=
/commit/?id=3D5bf209df737fb0b7d809a04bae610cbc3f7311f7
        git remote add ogabbay https://git.kernel.org/pub/scm/linux/kernel/=
git/ogabbay/linux.git
        git fetch --no-tags ogabbay habanalabs-next
        git checkout 5bf209df737fb0b7d809a04bae610cbc3f7311f7
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/net/ethernet/3com/typhoon.c:241:8: warning: Excessive padding in=
 'struct typhoon_shared' (76 padding bytes, where 12 is optimal). =

   Optimal fields order: =

   indexes, =

   zeroWord, =

   txHi, =

   iface, =

   cmd, =

   resp, =

   rxLo, =

   rxHi, =

   txLo, =

   rxBuff, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct typhoon_shared {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/net/ethernet/3com/typhoon.c:241:8: note: Excessive padding in 's=
truct typhoon_shared' (76 padding bytes, where 12 is optimal). Optimal fiel=
ds order: indexes, zeroWord, txHi, iface, cmd, resp, rxLo, rxHi, txLo, rxBu=
ff, consider reordering the fields or adding explicit padding members
   struct typhoon_shared {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/net/ethernet/3com/typhoon.c:259:8: warning: Excessive padding in=
 'struct typhoon' (124 padding bytes, where 60 is optimal). =

   Optimal fields order: =

   ioaddr, =

   tx_pdev, =

   tx_ioaddr, =

   indexes, =

   pdev, =

   dev, =

   shared, =

   shared_dma, =

   txLoRing, =

   rxLoRing, =

   rxHiRing, =

   rxBuffRing, =

   cmdRing, =

   respRing, =

   txHiRing, =

   command_lock, =

   stats_saved, =

   napi, =

   rxbuffers, =

   txlo_dma_addr, =

   offload, =

   capabilities, =

   xcvr_select, =

   wol_events, =

   awaiting_resp, =

   duplex, =

   speed, =

   card_state, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct typhoon {
   ~~~~~~~^~~~~~~~~
   drivers/net/ethernet/3com/typhoon.c:259:8: note: Excessive padding in 's=
truct typhoon' (124 padding bytes, where 60 is optimal). Optimal fields ord=
er: ioaddr, tx_pdev, tx_ioaddr, indexes, pdev, dev, shared, shared_dma, txL=
oRing, rxLoRing, rxHiRing, rxBuffRing, cmdRing, respRing, txHiRing, command=
_lock, stats_saved, napi, rxbuffers, txlo_dma_addr, offload, capabilities, =
xcvr_select, wol_events, awaiting_resp, duplex, speed, card_state, consider=
 reordering the fields or adding explicit padding members
   struct typhoon {
   ~~~~~~~^~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/net/ethernet/adaptec/starfire.c:962:46: warning: Value stored to=
 'setup_frm' is never read [clang-analyzer-deadcode.DeadStores]
                   writew(be16_to_cpu(eaddrs[0]), setup_frm); setup_frm +=
=3D 8;
                                                              ^            ~
   drivers/net/ethernet/adaptec/starfire.c:962:46: note: Value stored to 's=
etup_frm' is never read
                   writew(be16_to_cpu(eaddrs[0]), setup_frm); setup_frm +=
=3D 8;
                                                              ^            ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/net/ethernet/alacritech/slicoss.c:1525:3: warning: Value stored =
to 'data' is never read [clang-analyzer-deadcode.DeadStores]
                   data +=3D sizeof(slic_stats_strings);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/alacritech/slicoss.c:1525:3: note: Value stored to =
'data' is never read
                   data +=3D sizeof(slic_stats_strings);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/misc/habanalabs/common/command_submission.c:2121:14: warning: Th=
e left operand of '=3D=3D' is a garbage value [clang-analyzer-core.Undefine=
dBinaryOperatorResult]
                   if (status =3D=3D CS_WAIT_STATUS_BUSY)
                              ^
   drivers/misc/habanalabs/common/command_submission.c:2661:6: note: Assumi=
ng the condition is false
           if (flags & HL_WAIT_CS_FLAGS_INTERRUPT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2661:2: note: Taking=
 false branch
           if (flags & HL_WAIT_CS_FLAGS_INTERRUPT)
           ^
   drivers/misc/habanalabs/common/command_submission.c:2663:11: note: Assum=
ing the condition is true
           else if (flags & HL_WAIT_CS_FLAGS_MULTI_CS)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2663:7: note: Taking=
 true branch
           else if (flags & HL_WAIT_CS_FLAGS_MULTI_CS)
                ^
   drivers/misc/habanalabs/common/command_submission.c:2664:8: note: Callin=
g 'hl_multi_cs_wait_ioctl'
                   rc =3D hl_multi_cs_wait_ioctl(hpriv, data);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2308:6: note: Assumi=
ng field 'supports_wait_for_multi_cs' is not equal to 0
           if (!hdev->supports_wait_for_multi_cs) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2308:2: note: Taking=
 false branch
           if (!hdev->supports_wait_for_multi_cs) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:2315:6: note: Assumi=
ng 'seq_arr_len' is <=3D HL_WAIT_MULTI_CS_LIST_MAX_LEN
           if (seq_arr_len > HL_WAIT_MULTI_CS_LIST_MAX_LEN) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2315:2: note: Taking=
 false branch
           if (seq_arr_len > HL_WAIT_MULTI_CS_LIST_MAX_LEN) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:2324:6: note: Assumi=
ng 'cs_seq_arr' is non-null
           if (!cs_seq_arr)
               ^~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2324:2: note: Taking=
 false branch
           if (!cs_seq_arr)
           ^
   drivers/misc/habanalabs/common/command_submission.c:2330:6: note: Assumi=
ng the condition is false
           if (copy_from_user(cs_seq_arr, seq_arr, size_to_copy)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2330:2: note: Taking=
 false branch
           if (copy_from_user(cs_seq_arr, seq_arr, size_to_copy)) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:2338:6: note: Assumi=
ng 'fence_arr' is non-null
           if (!fence_arr) {
               ^~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2338:2: note: Taking=
 false branch
           if (!fence_arr) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:2353:7: note: Callin=
g 'hl_cs_poll_fences'
           rc =3D hl_cs_poll_fences(&mcs_data);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2087:2: note: 'statu=
s' declared without an initial value
           enum hl_cs_wait_status status;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2093:6: note: Assumi=
ng 'rc' is 0
           if (rc)
               ^~
   drivers/misc/habanalabs/common/command_submission.c:2093:2: note: Taking=
 false branch
           if (rc)
           ^
   drivers/misc/habanalabs/common/command_submission.c:2103:14: note: Assum=
ing 'i' is < 'arr_len'
           for (i =3D 0; i < arr_len; i++, fence_ptr++) {
                       ^~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2103:2: note: Loop c=
ondition is true.  Entering loop body
           for (i =3D 0; i < arr_len; i++, fence_ptr++) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:2110:8: note: Callin=
g 'hl_wait_for_fence'
                   rc =3D hl_wait_for_fence(mcs_data->ctx, seq_arr[i], fenc=
e,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2021:6: note: Callin=
g 'IS_ERR'
           if (IS_ERR(fence)) {
               ^~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning the value 1, which participate=
s in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2021:6: note: Return=
ing from 'IS_ERR'
           if (IS_ERR(fence)) {
               ^~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2021:2: note: Taking=
 true branch
           if (IS_ERR(fence)) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:2023:7: note: Assumi=
ng the condition is false
                   if (rc =3D=3D -EINVAL)
                       ^~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2023:3: note: Taking=
 false branch
                   if (rc =3D=3D -EINVAL)
                   ^
   drivers/misc/habanalabs/common/command_submission.c:2027:3: note: Return=
ing without writing to '*status'
                   return rc;
                   ^
   drivers/misc/habanalabs/common/command_submission.c:2027:3: note: Return=
ing value (loaded from 'rc'), which participates in a condition later
                   return rc;

vim +2121 drivers/misc/habanalabs/common/command_submission.c

eff6f4a0e70b7b drivers/misc/habanalabs/command_submission.c        Oded Gab=
bay  2019-02-16  2066  =

5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2067  /*
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2068   * hl_cs_poll_fences - iterate CS fences to check fo=
r CS completion
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2069   *
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2070   * @mcs_data: multi-CS internal data
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2071   *
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2072   * @return 0 on success, otherwise non 0 error code
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2073   *
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2074   * The function iterates on all CS sequence in the l=
ist and set bit in
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2075   * completion_bitmap for each completed CS.
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2076   * while iterating, the function can extracts the st=
ream map to be later
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2077   * used by the waiting function.
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2078   * this function shall be called after taking contex=
t ref
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2079   */
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2080  static int hl_cs_poll_fences(struct multi_cs_data *m=
cs_data)
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2081  {
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2082  	struct hl_fence **fence_ptr =3D mcs_data->fence_arr;
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2083  	struct hl_device *hdev =3D mcs_data->ctx->hdev;
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2084  	int i, rc, arr_len =3D mcs_data->arr_len;
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2085  	u64 *seq_arr =3D mcs_data->seq_arr;
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2086  	ktime_t max_ktime, first_cs_time;
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2087  	enum hl_cs_wait_status status;
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2088  =

5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2089  	memset(fence_ptr, 0, arr_len * sizeof(*fence_ptr));
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2090  =

5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2091  	/* get all fences under the same lock */
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2092  	rc =3D hl_ctx_get_fences(mcs_data->ctx, seq_arr, fe=
nce_ptr, arr_len);
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2093  	if (rc)
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2094  		return rc;
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2095  =

5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2096  	/*
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2097  	 * set to maximum time to verify timestamp is valid=
: if at the end
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2098  	 * this value is maintained- no timestamp was updat=
ed
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2099  	 */
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2100  	max_ktime =3D ktime_set(KTIME_SEC_MAX, 0);
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2101  	first_cs_time =3D max_ktime;
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2102  =

5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2103  	for (i =3D 0; i < arr_len; i++, fence_ptr++) {
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2104  		struct hl_fence *fence =3D *fence_ptr;
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2105  =

5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2106  		/*
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2107  		 * function won't sleep as it is called with timeo=
ut 0 (i.e.
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2108  		 * poll the fence)
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2109  		 */
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2110  		rc =3D hl_wait_for_fence(mcs_data->ctx, seq_arr[i]=
, fence,
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2111  						&status, 0, NULL);
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2112  		if (rc) {
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2113  			dev_err(hdev->dev,
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2114  				"wait_for_fence error :%d for CS seq %llu\n",
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2115  								rc, seq_arr[i]);
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2116  			break;
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2117  		}
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2118  =

5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2119  		mcs_data->stream_map |=3D fence->stream_map;
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2120  =

5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14 @2121  		if (status =3D=3D CS_WAIT_STATUS_BUSY)
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2122  			continue;
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2123  =

5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2124  		mcs_data->completion_bitmap |=3D BIT(i);
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2125  =

5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2126  		/*
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2127  		 * best effort to extract timestamp. few notes:
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2128  		 * - if even single fence is gone we cannot extrac=
t timestamp
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2129  		 *   (as fence not exist anymore)
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2130  		 * - for all completed CSs we take the earliest ti=
mestamp.
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2131  		 *   for this we have to validate that:
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2132  		 *       1. given timestamp was indeed set
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2133  		 *       2. the timestamp is earliest of all times=
tamps so far
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2134  		 */
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2135  =

5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2136  		if (status =3D=3D CS_WAIT_STATUS_GONE) {
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2137  			mcs_data->update_ts =3D false;
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2138  			mcs_data->gone_cs =3D true;
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2139  		} else if (mcs_data->update_ts &&
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2140  			(ktime_compare(fence->timestamp,
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2141  						ktime_set(0, 0)) > 0) &&
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2142  			(ktime_compare(fence->timestamp, first_cs_time) <=
 0)) {
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2143  			first_cs_time =3D fence->timestamp;
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2144  		}
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2145  	}
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2146  =

5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2147  	hl_fences_put(mcs_data->fence_arr, arr_len);
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2148  =

5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2149  	if (mcs_data->update_ts &&
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2150  			(ktime_compare(first_cs_time, max_ktime) !=3D 0))
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2151  		mcs_data->timestamp =3D ktime_to_ns(first_cs_time);
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2152  =

5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2153  	return rc;
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2154  }
5bf209df737fb0 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi 2021-06-14  2155  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3168377184442726304==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
lPZ94whws8rwK8dLPSNd+f4PD7Mn5Xg+AgA=
--===============3168377184442726304==--

