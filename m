Content-Type: multipart/mixed; boundary="===============6485340209472896636=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:kvalo/ath/pending 38/51] drivers/net/wireless/ath/ath11k/qmi.c:2355:4: warning: The expression is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Mon, 11 Apr 2022 06:32:38 +0800
Message-ID: <202204110648.wspRn8nK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6485340209472896636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://github.com/ammarfaizi2/linux-block kvalo/ath/pending
head:   942c67bb44c1573c35ecb5a9a4c894289639bde7
commit: 785fc94e65aab09b1913a34a20c88f9b41b56d6f [38/51] ath11k: Add QMI ch=
anges for WCN6750
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20411/202204110648.wspRn8nK-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 893e1c=
18b98d8bbc7b8d7d22cc2c348f65c72ad9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/785fc94e65aab09=
b1913a34a20c88f9b41b56d6f
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block kvalo/ath/pending
        git checkout 785fc94e65aab09b1913a34a20c88f9b41b56d6f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:2165:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&req, 0, sizeof(req));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:2165:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(&req, 0, sizeof(req));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:2166:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&resp, 0, sizeof(resp));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:2166:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(&resp, 0, sizeof(resp));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:2270:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&resp, 0, sizeof(resp));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:2270:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(&resp, 0, sizeof(resp));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:2307:4: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(req->data, temp, req->data_len);
                           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:2307:4: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(req->data, temp, req->data_len);
                           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath11k/qmi.c:2355:4: warning: The expression is=
 an uninitialized value. The computed value will also be garbage [clang-ana=
lyzer-core.uninitialized.Assign]
                           req->seg_id++;
                           ^
   drivers/net/wireless/ath/ath11k/qmi.c:3088:2: note: Loop condition is tr=
ue.  Entering loop body
           while (!list_empty(&qmi->event_list)) {
           ^
   drivers/net/wireless/ath/ath11k/qmi.c:3094:7: note: Assuming the conditi=
on is false
                   if (test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags))=
 {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:3094:3: note: Taking false branch
                   if (test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags))=
 {
                   ^
   drivers/net/wireless/ath/ath11k/qmi.c:3099:3: note: Control jumps to 'ca=
se ATH11K_QMI_EVENT_SERVER_ARRIVE:'  at line 3100
                   switch (event->type) {
                   ^
   drivers/net/wireless/ath/ath11k/qmi.c:3101:10: note: Calling 'ath11k_qmi=
_event_server_arrive'
                           ret =3D ath11k_qmi_event_server_arrive(qmi);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:2899:6: note: 'ret' is >=3D 0
           if (ret < 0) {
               ^~~
   drivers/net/wireless/ath/ath11k/qmi.c:2899:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/net/wireless/ath/ath11k/qmi.c:2906:6: note: 'ret' is >=3D 0
           if (ret < 0) {
               ^~~
   drivers/net/wireless/ath/ath11k/qmi.c:2906:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/net/wireless/ath/ath11k/qmi.c:2911:6: note: Assuming field 'fixe=
d_fw_mem' is true
           if (!ab->hw_params.fixed_fw_mem)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:2911:2: note: Taking false branch
           if (!ab->hw_params.fixed_fw_mem)
           ^
   drivers/net/wireless/ath/ath11k/qmi.c:2914:8: note: Calling 'ath11k_qmi_=
event_load_bdf'
           ret =3D ath11k_qmi_event_load_bdf(qmi);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:2869:6: note: 'ret' is >=3D 0
           if (ret < 0) {
               ^~~
   drivers/net/wireless/ath/ath11k/qmi.c:2869:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/net/wireless/ath/ath11k/qmi.c:2876:6: note: 'ret' is >=3D 0
           if (ret < 0) {
               ^~~
   drivers/net/wireless/ath/ath11k/qmi.c:2876:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/net/wireless/ath/ath11k/qmi.c:2881:6: note: Assuming field 'supp=
orts_regdb' is true
           if (ab->hw_params.supports_regdb)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:2881:2: note: Taking true branch
           if (ab->hw_params.supports_regdb)
           ^
   drivers/net/wireless/ath/ath11k/qmi.c:2882:3: note: Calling 'ath11k_qmi_=
load_bdf_qmi'
                   ath11k_qmi_load_bdf_qmi(ab, true);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:2384:6: note: 'regdb' is true
           if (regdb) {
               ^~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:2384:2: note: Taking true branch
           if (regdb) {
           ^
   drivers/net/wireless/ath/ath11k/qmi.c:2392:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/net/wireless/ath/ath11k/qmi.c:2392:2: note: Taking false branch
           if (ret)
           ^
   drivers/net/wireless/ath/ath11k/qmi.c:2395:6: note: 'regdb' is true
           if (regdb)
               ^~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:2395:2: note: Taking true branch
           if (regdb)
           ^
   drivers/net/wireless/ath/ath11k/qmi.c:2402:2: note: Assuming the conditi=
on is true
           ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi bdf_type %d\n", bdf_type);
           ^
   drivers/net/wireless/ath/ath11k/debug.h:63:7: note: expanded from macro =
'ath11k_dbg'
           if ((ath11k_debug_mask & dbg_mask) ||                   \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:2402:2: note: Left side of '||' is=
 true
           ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi bdf_type %d\n", bdf_type);
           ^
   drivers/net/wireless/ath/ath11k/debug.h:63:37: note: expanded from macro=
 'ath11k_dbg'
           if ((ath11k_debug_mask & dbg_mask) ||                   \
                                              ^
   drivers/net/wireless/ath/ath11k/qmi.c:2402:2: note: Loop condition is fa=
lse.  Exiting loop
           ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi bdf_type %d\n", bdf_type);
           ^
   drivers/net/wireless/ath/ath11k/debug.h:61:46: note: expanded from macro=
 'ath11k_dbg'
   #define ath11k_dbg(ar, dbg_mask, fmt, ...)                      \
                                                                   ^
   drivers/net/wireless/ath/ath11k/qmi.c:2404:12: note: Assuming '__UNIQUE_=
ID___x585' is >=3D '__UNIQUE_ID___y586'
           fw_size =3D min_t(u32, ab->hw_params.fw.board_size, bd.len);
                     ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)

vim +2355 drivers/net/wireless/ath/ath11k/qmi.c

d5c65159f28953 Kalle Valo      2019-11-23  2254  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2255  static int ath11k_qmi_load=
_file_target_mem(struct ath11k_base *ab,
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2256  					   const u8 *data, u3=
2 len, u8 type)
d5c65159f28953 Kalle Valo      2019-11-23  2257  {
d5c65159f28953 Kalle Valo      2019-11-23  2258  	struct qmi_wlanfw_bdf_dow=
nload_req_msg_v01 *req;
d5c65159f28953 Kalle Valo      2019-11-23  2259  	struct qmi_wlanfw_bdf_dow=
nload_resp_msg_v01 resp;
1ad6e4b00f29d0 Anilkumar Kolli 2021-11-02  2260  	struct qmi_txn txn;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2261  	const u8 *temp =3D data;
d5c65159f28953 Kalle Valo      2019-11-23  2262  	void __iomem *bdf_addr =
=3D NULL;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2263  	int ret;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2264  	u32 remaining =3D len;
d5c65159f28953 Kalle Valo      2019-11-23  2265  =

d5c65159f28953 Kalle Valo      2019-11-23  2266  	req =3D kzalloc(sizeof(*r=
eq), GFP_KERNEL);
d5c65159f28953 Kalle Valo      2019-11-23  2267  	if (!req)
d5c65159f28953 Kalle Valo      2019-11-23  2268  		return -ENOMEM;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2269  =

d5c65159f28953 Kalle Valo      2019-11-23  2270  	memset(&resp, 0, sizeof(r=
esp));
d5c65159f28953 Kalle Valo      2019-11-23  2271  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2272  	if (ab->bus_params.fixed_=
bdf_addr) {
c72aa32d6d1c04 Anilkumar Kolli 2021-09-28  2273  		bdf_addr =3D ioremap(ab-=
>hw_params.bdf_addr, ab->hw_params.fw.board_size);
d5c65159f28953 Kalle Valo      2019-11-23  2274  		if (!bdf_addr) {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2275  			ath11k_warn(ab, "qmi io=
remap error for bdf_addr\n");
d5c65159f28953 Kalle Valo      2019-11-23  2276  			ret =3D -EIO;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2277  			goto err_free_req;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2278  		}
d5c65159f28953 Kalle Valo      2019-11-23  2279  	}
d5c65159f28953 Kalle Valo      2019-11-23  2280  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2281  	while (remaining) {
d5c65159f28953 Kalle Valo      2019-11-23  2282  		req->valid =3D 1;
d5c65159f28953 Kalle Valo      2019-11-23  2283  		req->file_id_valid =3D 1;
d5c65159f28953 Kalle Valo      2019-11-23  2284  		req->file_id =3D ab->qmi=
.target.board_id;
d5c65159f28953 Kalle Valo      2019-11-23  2285  		req->total_size_valid =
=3D 1;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2286  		req->total_size =3D rema=
ining;
d5c65159f28953 Kalle Valo      2019-11-23  2287  		req->seg_id_valid =3D 1;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2288  		req->data_valid =3D 1;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2289  		req->bdf_type =3D type;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2290  		req->bdf_type_valid =3D =
1;
d5c65159f28953 Kalle Valo      2019-11-23  2291  		req->end_valid =3D 1;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2292  		req->end =3D 0;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2293  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2294  		if (remaining > QMI_WLAN=
FW_MAX_DATA_SIZE_V01) {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2295  			req->data_len =3D QMI_W=
LANFW_MAX_DATA_SIZE_V01;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2296  		} else {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2297  			req->data_len =3D remai=
ning;
d5c65159f28953 Kalle Valo      2019-11-23  2298  			req->end =3D 1;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2299  		}
d5c65159f28953 Kalle Valo      2019-11-23  2300  =

4ba3b05ebd0c3e Anilkumar Kolli 2021-09-28  2301  		if (ab->bus_params.fixed=
_bdf_addr ||
4ba3b05ebd0c3e Anilkumar Kolli 2021-09-28  2302  		    type =3D=3D ATH11K_Q=
MI_FILE_TYPE_EEPROM) {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2303  			req->data_valid =3D 0;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2304  			req->end =3D 1;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2305  			req->data_len =3D ATH11=
K_QMI_MAX_BDF_FILE_NAME_SIZE;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2306  		} else {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2307  			memcpy(req->data, temp,=
 req->data_len);
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2308  		}
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2309  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2310  		if (ab->bus_params.fixed=
_bdf_addr) {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2311  			if (type =3D=3D ATH11K_=
QMI_FILE_TYPE_CALDATA)
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2312  				bdf_addr +=3D ab->hw_p=
arams.fw.cal_offset;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2313  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2314  			memcpy_toio(bdf_addr, t=
emp, len);
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2315  		}
d5c65159f28953 Kalle Valo      2019-11-23  2316  =

d5c65159f28953 Kalle Valo      2019-11-23  2317  		ret =3D qmi_txn_init(&ab=
->qmi.handle, &txn,
d5c65159f28953 Kalle Valo      2019-11-23  2318  				   qmi_wlanfw_bdf_down=
load_resp_msg_v01_ei,
d5c65159f28953 Kalle Valo      2019-11-23  2319  				   &resp);
d5c65159f28953 Kalle Valo      2019-11-23  2320  		if (ret < 0)
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2321  			goto err_iounmap;
d5c65159f28953 Kalle Valo      2019-11-23  2322  =

bf458d79cfc46f Kalle Valo      2021-02-22  2323  		ath11k_dbg(ab, ATH11K_DB=
G_QMI, "qmi bdf download req fixed addr type %d\n",
bf458d79cfc46f Kalle Valo      2021-02-22  2324  			   type);
bf458d79cfc46f Kalle Valo      2021-02-22  2325  =

d5c65159f28953 Kalle Valo      2019-11-23  2326  		ret =3D qmi_send_request=
(&ab->qmi.handle, NULL, &txn,
d5c65159f28953 Kalle Valo      2019-11-23  2327  				       QMI_WLANFW_BDF_=
DOWNLOAD_REQ_V01,
d5c65159f28953 Kalle Valo      2019-11-23  2328  				       QMI_WLANFW_BDF_=
DOWNLOAD_REQ_MSG_V01_MAX_LEN,
d5c65159f28953 Kalle Valo      2019-11-23  2329  				       qmi_wlanfw_bdf_=
download_req_msg_v01_ei, req);
d5c65159f28953 Kalle Valo      2019-11-23  2330  		if (ret < 0) {
d5c65159f28953 Kalle Valo      2019-11-23  2331  			qmi_txn_cancel(&txn);
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2332  			goto err_iounmap;
d5c65159f28953 Kalle Valo      2019-11-23  2333  		}
d5c65159f28953 Kalle Valo      2019-11-23  2334  =

d5c65159f28953 Kalle Valo      2019-11-23  2335  		ret =3D qmi_txn_wait(&tx=
n, msecs_to_jiffies(ATH11K_QMI_WLANFW_TIMEOUT_MS));
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2336  		if (ret < 0) {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2337  			ath11k_warn(ab, "failed=
 to wait board file download request: %d\n",
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2338  				    ret);
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2339  			goto err_iounmap;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2340  		}
d5c65159f28953 Kalle Valo      2019-11-23  2341  =

d5c65159f28953 Kalle Valo      2019-11-23  2342  		if (resp.resp.result !=
=3D QMI_RESULT_SUCCESS_V01) {
097e9f0714555e Kalle Valo      2021-02-22  2343  			ath11k_warn(ab, "board =
file download request failed: %d %d\n",
d5c65159f28953 Kalle Valo      2019-11-23  2344  				    resp.resp.result, =
resp.resp.error);
d5c65159f28953 Kalle Valo      2019-11-23  2345  			ret =3D -EINVAL;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2346  			goto err_iounmap;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2347  		}
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2348  =

4ba3b05ebd0c3e Anilkumar Kolli 2021-09-28  2349  		if (ab->bus_params.fixed=
_bdf_addr ||
4ba3b05ebd0c3e Anilkumar Kolli 2021-09-28  2350  		    type =3D=3D ATH11K_Q=
MI_FILE_TYPE_EEPROM) {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2351  			remaining =3D 0;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2352  		} else {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2353  			remaining -=3D req->dat=
a_len;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2354  			temp +=3D req->data_len;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28 @2355  			req->seg_id++;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2356  			ath11k_dbg(ab, ATH11K_D=
BG_QMI, "qmi bdf download request remaining %i\n",
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2357  				   remaining);
d5c65159f28953 Kalle Valo      2019-11-23  2358  		}
d5c65159f28953 Kalle Valo      2019-11-23  2359  	}
d5c65159f28953 Kalle Valo      2019-11-23  2360  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2361  err_iounmap:
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2362  	if (ab->bus_params.fixed_=
bdf_addr)
d5c65159f28953 Kalle Valo      2019-11-23  2363  		iounmap(bdf_addr);
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2364  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2365  err_free_req:
d5c65159f28953 Kalle Valo      2019-11-23  2366  	kfree(req);
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2367  =

d5c65159f28953 Kalle Valo      2019-11-23  2368  	return ret;
d5c65159f28953 Kalle Valo      2019-11-23  2369  }
d5c65159f28953 Kalle Valo      2019-11-23  2370  =


:::::: The code at line 2355 was first introduced by commit
:::::: 336e7b53c82fc74d261024773a0fab43623a94fb ath11k: clean up BDF downlo=
ad functions

:::::: TO: Anilkumar Kolli <akolli@codeaurora.org>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6485340209472896636==--

